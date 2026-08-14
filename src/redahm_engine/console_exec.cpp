// Engine console command dispatch.
//
// sub_8261FDE0 is the engine's virtual Exec:
//
//   UBOOL Exec(const TCHAR* Cmd, FOutputDevice& Ar)   // r3=this, r4=Cmd, r5=Ar
//
// Identified from the UTF-16BE command literals it references -- "SHOW"
// (0x82139adc), "VIEWMODE" (0x82139e08) and "STAT" (0x820a9dd8) -- and from its
// only inbound xrefs being three vtable slots. Confirmed at runtime: the game
// dispatches "open is_paradiso" and the CPCryptoInput trigger bindings
// ("PressButton_LeftTrigger true") straight through it.
//
// It is the *top* of the chain, not the whole chain: after its own SHOW /
// VIEWMODE / STAT / screenshot / EnableCPExecComponent handling it forwards the
// command to three more native Exec implementations and then, if the gate byte
// is set, to every actor's exec component. That is why commands it has no
// literal for (OPEN, MEM, LISTTEXTURES, NXVIS, ...) still resolve.
//
// Three things live here:
//
//   1. The CPExecComponent gate. Xe-KronosInput.ini still carries the dev
//      keyboard layout (F9 AllAmmo, F11 AllWeapons, Ctrl+F11 InfiniteUFOAbility,
//      F3 playersonly...) and those commands are dispatched to per-object exec
//      components -- but only when byte_8371A8C6 is non-zero. The shipped
//      "EnableCPExecComponent" command does nothing except set that byte, so we
//      set it directly and skip the round trip.
//
//   2. A host->guest command queue. Calling Exec needs a guest-memory UTF-16BE
//      string plus a live object, so we latch `this` and a *global* Ar from a
//      real call (stack Ar pointers would dangle) and run queued commands from
//      inside the hook, where we are already on a guest thread with a valid
//      context and stack.
//
//   3. A result history. Exec returns UBOOL "somebody handled this", and that
//      is the only signal distinguishing a command that ran from one that no
//      handler in the chain recognised. The debug overlay reads the history
//      back so an unhandled button is visible instead of silently doing
//      nothing.
//
//   4. Output capture. The UBOOL is only half the answer -- OBJ LIST, GET,
//      LISTTEXTURES and MEM all put their real payload into the output device,
//      which is otherwise write-only from our side. Hooking the device's
//      Serialize while our own dispatch is in flight turns those commands into
//      data the overlay can show.

#include <rex/hook.h>

#include <algorithm>
#include <atomic>
#include <cctype>
#include <cstdint>
#include <cstring>
#include <deque>
#include <memory>
#include <mutex>
#include <string>
#include <unordered_map>
#include <utility>
#include <vector>

#include "console_exec.h"
#include "redahm_logging.h"
#include "reflection.h"

REX_EXTERN(__imp__sub_8261FDE0);
REX_EXTERN(__imp__sub_82623370);
REX_EXTERN(__imp__sub_823A4338);

namespace {

// Gate byte checked by Exec before it offers a command to any exec component.
// Asserted, because the fan-out behind it is how the Kronos cheats dispatch.
//
// A previous version held this at 0 on the theory that the engine's fan-out
// (0x82621334) walked GObjObjects without null-checking. It does not: the null
// check and the class filter both live in sub_82295518, the iterator's real
// operator++, one level below the sub_82625328 loop that reads Data[i] + 12 --
// and that read is guarded by a short-circuited `i < Num` anyway. The fan-out
// is safe, and it is also the only walk that filters to the right class, which
// a hand-rolled replacement here got wrong badly enough to report every command
// as handled by a different arbitrary object.
constexpr uint32_t kExecComponentGate = 0x8371A8C6;

// sub_82623370 is a *second* Exec on the same object, and nothing forwards to
// it. It owns LISTTEXTURES, LISTANIMSETS, ANIMSEQSTATS, SHOWHOTKISMET,
// TOGGLESTREAMINGVOLUMES, CANCELMATINEE, ABORTMATINEE and POSTPROCESS, all of
// which are unreachable through sub_8261FDE0 alone -- it chains to three other
// handlers and then to the exec components, none of which is this one.
//
// The class carries two vtables: the primary at 0x8213A630 stored at object+0,
// and an FExec interface at 0x8213A74C stored at object+0x3C whose slot 0 is
// sub_82623370. The engine calls that interface as fn(object + 0x3C, Cmd, Ar);
// sub_8261FDE0's own third chain link does exactly this to a different object
// (dword_83746300), which is where the convention is confirmed.
//
// The `this` we latch is an interior pointer -- sub_8261FDE0 reads negative
// offsets from it -- so the object base is recovered by scanning back for the
// primary vtable rather than by assuming a fixed adjustment. Both vtable
// constants must match before the call is made, so a wrong guess cannot fire.
constexpr uint32_t kExecInterfaceVTable = 0x8213A74C;
constexpr uint32_t kExecInterfaceOffset = 0x3C;

// Engine object globals sub_8261FDE0 itself dereferences. One of these is the
// most likely owner of the sub_82623370 interface; each candidate is checked
// against the vtable constant before use, so listing extras costs nothing.
constexpr uint32_t kExecObjectGlobals[] = {
    0x83746300,  // third chain link's object, called as obj+0x3C slot 0
    0x83746304, 0x837485E0, 0x83746210,
};

// sub_8261FDE0 never reaches a PlayerController -- it offers commands to three
// fixed subsystems and then to actors' exec components at actor+0x4C. The
// PlayerController-owned commands (ToggleHUD, showscores, NextWeapon,
// switchweapon, Camera, the cheats) are instead handled by sub_82623370, which
// ends in its own fan-out at 0x82624650. That is one more reason Exec2 has to
// be reachable, and the reason nothing here walks to a controller by hand.

// Guest *objects* are heap allocations, not image addresses -- the engine
// object we latch sits at ~0x417f28c0 and its viewport at ~0x427e0000. An
// image-range test here silently skipped the whole PlayerController walk.
bool IsPlausibleGuestObject(uint32_t addr) {
  return addr >= 0x00010000 && addr < 0xC0000000;
}

// Vtables and function pointers, by contrast, are always in the image.
bool IsPlausibleGuestCode(uint32_t addr) {
  return addr >= 0x82000000 && addr < 0x83000000;
}

// GLog: a pointer variable, statically initialised in the image to the global
// output device at 0x8374A928 (whose vtable 0x820DC6A4 is installed by the
// constructor at sub_823A3F78). This is the same Ar the engine passes itself --
// UGameEngine::Tick loads it into r5 at 0x827444CC before its own virtual call.
//
// It has to exist because the Ar the engine hands Exec is frequently a *stack*
// FOutputDevice: the menu path dispatches with ar=0x7018e0d0, a temporary in
// the caller's frame, which is dead by the time we would reuse it. Only the
// in-level input path passes the global. Without this fallback nothing
// dispatches until the player presses a controller button in a level.
constexpr uint32_t kGlobalLogPtr = 0x835EA030;

// sub_823A4338 is FOutputDeviceRedirector::Serialize(this, const TCHAR* V,
// EName Event). It is slot 1 of GLog's vtable (0x820DC6A4) and, more usefully,
// slot 1 is the slot it calls on every device it fans out to -- so it is the
// Serialize slot for the whole FOutputDevice hierarchy, and everything the Exec
// chain prints passes through this one function.
//
// FName::Names, the global name table: TArray<FNameEntry*>. FName::ToString
// (sub_8233E1A0) reads it as Names(Index) and takes the UTF-16BE string at
// entry+0x10. EName is an index into the same table, which is what makes the
// log category resolvable rather than a bare number.
constexpr uint32_t kNameTableData = 0x8375C1B8;
constexpr uint32_t kNameTableNum = 0x8375C1BC;
constexpr uint32_t kNameEntryString = 0x10;

// The table is a few thousand entries in this build. The bound only exists so a
// garbage Num read before the table is constructed cannot be trusted.
constexpr uint32_t kMaxPlausibleNames = 0x40000;

// Per-command cap. OBJ LIST alone is thousands of lines, and the history holds
// 64 commands; without a cap a couple of dumps would sit in host memory for the
// rest of the session.
constexpr size_t kMaxOutputLines = 512;
constexpr size_t kMaxLineChars = 4096;

// Latched from a real Exec call. `this` is a heap pointer and differs per run,
// so it must be observed rather than hardcoded.
std::atomic<uint32_t> g_exec_this{0};
std::atomic<uint32_t> g_exec_ar{0};

std::mutex g_queue_mutex;
std::deque<std::string> g_queue;

std::mutex g_history_mutex;
std::deque<RedahmConsoleEntry> g_history;
constexpr size_t kMaxHistory = 64;

// Guards against recursing into the drain when our own Exec call re-enters the
// hook, and against draining while the guest is already inside Exec.
thread_local bool t_in_dispatch = false;

constexpr int kMaxLoggedCommands = 64;
std::atomic<int> g_logged{0};

// Longest command we will marshal into guest memory. Everything the overlay
// sends is far shorter; the cap only exists so a malformed custom command
// cannot ask for an unbounded stack carve-out.
constexpr size_t kMaxCommandChars = 512;

// Guest TCHAR is UTF-16 big-endian. Commands are ASCII in practice, so fold
// anything wider to '?' rather than carrying a UTF-8 conversion in here.
std::string ReadGuestWide(const uint8_t* base, uint32_t addr, size_t max_chars = 512) {
  std::string out;
  if (!addr) {
    return out;
  }
  const uint8_t* p = base + addr;
  for (size_t i = 0; i < max_chars; ++i) {
    const uint16_t ch = static_cast<uint16_t>((p[i * 2] << 8) | p[i * 2 + 1]);
    if (ch == 0) {
      break;
    }
    out.push_back(ch < 0x80 ? static_cast<char>(ch) : '?');
  }
  return out;
}

uint32_t ReadGuestBE32(const uint8_t* base, uint32_t addr) {
  return *reinterpret_cast<const rex::be_u32*>(base + addr);
}

// EName -> "Log" / "Warning" / "Error" / ... through the global name table.
// Every step is bounds-checked because this runs on whatever thread the engine
// happened to log from, including before the table exists.
std::string ResolveEName(const uint8_t* base, uint32_t index) {
  const uint32_t num = ReadGuestBE32(base, kNameTableNum);
  if (num == 0 || num > kMaxPlausibleNames || index >= num) {
    return {};
  }
  const uint32_t data = ReadGuestBE32(base, kNameTableData);
  if (!IsPlausibleGuestObject(data)) {
    return {};
  }
  const uint32_t entry = ReadGuestBE32(base, data + index * 4);
  if (!IsPlausibleGuestObject(entry)) {
    return {};
  }
  return ReadGuestWide(base, entry + kNameEntryString, 64);
}

// Non-null only on the thread that is currently inside one of our own Exec
// calls. The game logs from several threads and we want this command's output,
// not everything that happened to be printed while it ran.
thread_local std::vector<RedahmConsoleLine>* t_capture_sink = nullptr;
thread_local bool t_capture_truncated = false;

class CaptureScope {
 public:
  explicit CaptureScope(std::vector<RedahmConsoleLine>* sink) {
    t_capture_sink = sink;
    t_capture_truncated = false;
  }
  ~CaptureScope() { t_capture_sink = nullptr; }

  bool truncated() const { return t_capture_truncated; }

  CaptureScope(const CaptureScope&) = delete;
  CaptureScope& operator=(const CaptureScope&) = delete;
};

// Serialize is called once per line and the text arrives without a trailing
// newline, but handlers that preformat a block still land here in one piece, so
// split anyway.
void CaptureSerialize(const uint8_t* base, uint32_t text_addr, uint32_t event) {
  std::vector<RedahmConsoleLine>* sink = t_capture_sink;
  if (sink == nullptr || text_addr == 0) {
    return;
  }
  if (sink->size() >= kMaxOutputLines) {
    t_capture_truncated = true;
    return;
  }

  const std::string text = ReadGuestWide(base, text_addr, kMaxLineChars);
  const std::string category = ResolveEName(base, event);

  size_t start = 0;
  for (;;) {
    if (sink->size() >= kMaxOutputLines) {
      t_capture_truncated = true;
      return;
    }
    const size_t nl = text.find('\n', start);
    const size_t end = (nl == std::string::npos) ? text.size() : nl;
    size_t trimmed = end;
    while (trimmed > start && text[trimmed - 1] == '\r') {
      --trimmed;
    }
    sink->push_back(RedahmConsoleLine{text.substr(start, trimmed - start), category});
    if (nl == std::string::npos) {
      return;
    }
    start = nl + 1;
  }
}

// An Ar in the image range is a global output device and stays valid; one on a
// guest stack belongs to the caller's frame and must not be reused later.
bool IsStableOutputDevice(uint32_t addr) {
  return addr >= 0x82000000 && addr < 0x837F0000;
}

// Resolve an output device to dispatch with: whichever global Ar we have seen
// the engine use, else GLog. GLog's pointer is baked into the image, but the
// object it points at only becomes callable once its constructor has installed
// a vtable, so require a plausible vptr before handing it to Exec.
uint32_t ResolveOutputDevice(const uint8_t* base) {
  const uint32_t latched = g_exec_ar.load(std::memory_order_relaxed);
  if (latched) {
    return latched;
  }
  const uint32_t glog = ReadGuestBE32(base, kGlobalLogPtr);
  if (!IsStableOutputDevice(glog)) {
    return 0;
  }
  const uint32_t vptr = ReadGuestBE32(base, glog);
  if (vptr < 0x82000000 || vptr >= 0x83000000) {
    return 0;
  }
  g_exec_ar.store(glog, std::memory_order_relaxed);
  RDAHM_INFO("[exec] using GLog at {:#010x} (vtable {:#010x}) as output device", glog, vptr);
  return glog;
}

// `this` for sub_82623370, or 0 if the latched object is not the class that
// owns it. Cached once resolved; the object outlives the session.
std::atomic<uint32_t> g_viewport_exec_this{0};
std::atomic<bool> g_logged_secondary_miss{false};

// Accept an address only if it really is the interface subobject: its first
// word must be the vtable whose slot 0 is sub_82623370.
bool LatchSecondaryExec(const uint8_t* base, uint32_t candidate, const char* how) {
  if (!IsPlausibleGuestObject(candidate) ||
      ReadGuestBE32(base, candidate) != kExecInterfaceVTable) {
    return false;
  }
  uint32_t expected = 0;
  if (!g_viewport_exec_this.compare_exchange_strong(expected, candidate,
                                                    std::memory_order_relaxed)) {
    return true;  // already latched
  }
  RDAHM_INFO("[exec] secondary Exec interface {:#010x} (via {})", candidate, how);
  return true;
}

uint32_t ResolveSecondaryExec(const uint8_t* base) {
  const uint32_t cached = g_viewport_exec_this.load(std::memory_order_relaxed);
  if (cached) {
    return cached;
  }

  // The object that owns sub_82623370 is not the one we latch from Exec: our
  // `this` has vtable 0x821AAF44 (slot 0 = sub_8261FDE0), a different class's
  // FExec interface. Try the engine globals that sub_8261FDE0 itself reaches
  // through, each validated against the vtable constant so a wrong guess is
  // simply rejected. The +0x3C interface offset is the one the third chain
  // link at 0x82621288 uses.
  for (const uint32_t global : kExecObjectGlobals) {
    const uint32_t obj = ReadGuestBE32(base, global);
    if (!IsPlausibleGuestObject(obj)) {
      continue;
    }
    if (LatchSecondaryExec(base, obj + kExecInterfaceOffset, "global") ||
        LatchSecondaryExec(base, obj, "global(direct)")) {
      return g_viewport_exec_this.load(std::memory_order_relaxed);
    }
  }

  if (!g_logged_secondary_miss.exchange(true, std::memory_order_relaxed)) {
    RDAHM_WARN(
        "[exec] no {:#010x} interface found yet; this={:#010x} vptr={:#010x}. "
        "LISTTEXTURES/POSTPROCESS/CANCELMATINEE stay unreachable until the game "
        "calls sub_82623370 once.",
        kExecInterfaceVTable, g_exec_this.load(std::memory_order_relaxed),
        ReadGuestBE32(base, g_exec_this.load(std::memory_order_relaxed)));
  }
  return 0;
}

std::string Trim(std::string s) {
  const auto not_space = [](unsigned char c) { return c != ' ' && c != '\t' && c != '\r' && c != '\n'; };
  s.erase(s.begin(), std::find_if(s.begin(), s.end(), not_space));
  s.erase(std::find_if(s.rbegin(), s.rend(), not_space).base(), s.end());
  return s;
}

void RecordResult(const std::string& cmd, RedahmConsoleStatus status,
                  std::vector<RedahmConsoleLine> output, bool truncated) {
  std::shared_ptr<const std::vector<RedahmConsoleLine>> shared;
  if (!output.empty()) {
    shared = std::make_shared<const std::vector<RedahmConsoleLine>>(std::move(output));
  }
  std::lock_guard<std::mutex> lock(g_history_mutex);
  g_history.push_back(RedahmConsoleEntry{cmd, status, std::move(shared), truncated});
  while (g_history.size() > kMaxHistory) {
    g_history.pop_front();
  }
}

// Run one command through Exec, reusing the current guest thread's context.
//
// Stack layout below the live sp, high address to low:
//
//   saved_r1                 <- untouched, plus a red zone the guest may still
//     [red zone]                be using for leaf-function scratch
//   buf .. buf+bytes         <- the UTF-16BE command string
//     [callee reserve]       <- back chain, LR/CR save and the parameter save
//   ctx.r1                      area that Exec writes into *our* frame
//
// The callee reserve is what makes this safe: a PPC callee stores its incoming
// register arguments into the caller's frame at small positive offsets from the
// stack pointer it was handed, so anything we want to survive the call has to
// live above that window, not immediately above the new sp.
// sub_82623370's tail (0x82624650) fans out to the local PlayerController, and
// it opens by dereferencing a chain with one unguarded branch:
//
//   r11 = *(0x837485E0); r11 = *(r11 + 0x50);
//   if (*(r11 + 0x84) > 0) r10 = **(r11 + 0x80);   // players[0]
//   else                   r10 = r29;              // can be 0 on some paths
//   r10 = *(r10 + 0x3D4);                          // no null check
//
// When the player array is empty that reads 0x3D4 off whatever r29 holds. This
// checks the same chain up front so Exec2 is only entered when its own fan-out
// has something real to walk.
// The complete set of top-level commands sub_82623370 matches before reaching
// its fan-out, taken from every string it references in
// [0x82623370, 0x82624650). Anything outside this set falls through to the
// fan-out, which crashes -- so this list is what makes calling Exec2 safe at
// all, without needing a midasm hook to cut the tail off.
//
// Sub-tokens (STREAMING, ON/OFF, SCENESHADOWS, ...) are deliberately not here;
// only the first word is matched.
bool Exec2OwnsCommand(const std::string& cmd) {
  static constexpr const char* kOwned[] = {
      "LISTTEXTURES", "LISTANIMSETS",           "ANIMSEQSTATS",  "SHOWHOTKISMET", "EXEC",
      "CANCELMATINEE", "ABORTMATINEE",          "POSTPROCESS",   "TOGGLESTREAMINGVOLUMES"};

  const size_t end = cmd.find_first_of(" \t");
  const std::string token = cmd.substr(0, end == std::string::npos ? cmd.size() : end);
  for (const char* owned : kOwned) {
    if (token.size() != std::strlen(owned)) {
      continue;
    }
    bool same = true;
    for (size_t i = 0; i < token.size(); ++i) {
      if (std::toupper(static_cast<unsigned char>(token[i])) !=
          std::toupper(static_cast<unsigned char>(owned[i]))) {
        same = false;
        break;
      }
    }
    if (same) {
      return true;
    }
  }
  return false;
}

// Direct dispatch to the local PlayerController.
//
// This replaces calling sub_82623370 (Exec2) for the commands it owns. Its
// fan-out at 0x82624650 reads a count from *(GEngine+0x50)+0x84 and iterates
// that many entries; the count was observed at 4494 and then 4530 minutes
// later, tracking the object array rather than any player list, and walking it
// faults. Whatever that array is, it is not what the fan-out assumes.
//
// The individual calls it makes are simple enough to reproduce: for the
// controller's subobjects at +0x3D4, +0x358 and +0x448 and then the controller
// itself, call ProcessConsoleExec at vtable slot 0x100 as
// fn(target, Cmd, Ar, Executor) with Executor = *(controller + 0x1EC). Getting
// the controller from reflection instead of that array is what makes it safe.
constexpr uint32_t kPlayerControllerExecutorOffset = 0x1EC;
constexpr uint32_t kProcessConsoleExecSlot = 0x100;
constexpr uint32_t kControllerSubObjectOffsets[] = {0x3D4, 0x358, 0x448};

// Does the class or any ancestor have `needle` in its name. Cached per class,
// because the actor sweep asks this about every object in the game.
bool ClassChainHas(uint32_t class_addr, const char* needle,
                   std::unordered_map<uint32_t, bool>& cache, std::mutex& cache_mutex) {
  if (!IsPlausibleGuestObject(class_addr)) {
    return false;
  }
  {
    std::lock_guard<std::mutex> lock(cache_mutex);
    auto it = cache.find(class_addr);
    if (it != cache.end()) {
      return it->second;
    }
  }
  bool found = false;
  uint32_t cls = class_addr;
  for (int depth = 0; depth < 24 && IsPlausibleGuestObject(cls); ++depth) {
    if (RedahmReadObjectName(cls).find(needle) != std::string::npos) {
      found = true;
      break;
    }
    const uint32_t super = RedahmReadU32(cls + kRedahmStructSuperOffset);
    if (super == cls) {
      break;
    }
    cls = super;
  }
  std::lock_guard<std::mutex> lock(cache_mutex);
  cache[class_addr] = found;
  return found;
}

bool ClassChainHasPlayerController(uint32_t class_addr) {
  static std::mutex m;
  static std::unordered_map<uint32_t, bool> cache;
  return ClassChainHas(class_addr, "PlayerController", cache, m);
}

bool ClassChainHasActor(uint32_t class_addr) {
  static std::mutex m;
  static std::unordered_map<uint32_t, bool> cache;
  return ClassChainHas(class_addr, "Actor", cache, m);
}

// UObject::ProcessConsoleExec through vtable slot 0x100, the same call the
// engine's own fan-outs make. Returns true if the target claimed the command.
bool OfferConsoleExec(PPCContext& __restrict ctx, uint8_t* base, uint32_t target, uint32_t cmd,
                      uint32_t ar, uint32_t executor, uint32_t call_sp) {
  if (!IsPlausibleGuestObject(target)) {
    return false;
  }
  const uint32_t vptr = RedahmReadU32(target);
  // .text runs to 0x833B8F44, so IsPlausibleGuestCode's 0x83000000 cap would
  // reject valid targets here.
  if (vptr < 0x82000000 || vptr >= 0x837F0000) {
    return false;
  }
  const uint32_t fnptr = RedahmReadU32(vptr + kProcessConsoleExecSlot);
  if (fnptr < 0x82000000 || fnptr >= 0x837F0000) {
    return false;
  }
  PPCFunc* fn = rex::runtime::ResolveIndirectFunction(fnptr);
  if (fn == nullptr) {
    return false;
  }
  ctx.r1.u32 = call_sp;
  ctx.r3.u32 = target;
  ctx.r4.u32 = cmd;
  ctx.r5.u32 = ar;
  ctx.r6.u32 = executor;
  fn(ctx, base);
  return ctx.r3.u32 != 0;
}

uint32_t FindPlayerController() {
  static uint32_t cached = 0;
  if (cached != 0 &&
      ClassChainHasPlayerController(RedahmReadU32(cached + kRedahmObjectClassOffset))) {
    return cached;
  }
  cached = 0;

  const uint32_t data = RedahmReadU32(kRedahmObjObjectsData);
  const int32_t num = static_cast<int32_t>(RedahmReadU32(kRedahmObjObjectsNum));
  if (data == 0 || num <= 0) {
    return 0;
  }
  // Newest first: the live controller is spawned long after any class default
  // object or archetype of the same type.
  for (int32_t i = num - 1; i >= 0; --i) {
    const uint32_t obj = RedahmReadU32(data + static_cast<uint32_t>(i) * 4);
    if (obj == 0) {
      continue;
    }
    if (!ClassChainHasPlayerController(RedahmReadU32(obj + kRedahmObjectClassOffset))) {
      continue;
    }
    const std::string name = RedahmReadObjectName(obj);
    if (name.empty() || name.compare(0, 9, "Default__") == 0) {
      continue;
    }
    RDAHM_INFO("[exec] player controller {:#010x} \"{}\" (GObjObjects[{}])", obj, name, i);
    cached = obj;
    return obj;
  }
  return 0;
}

bool DispatchToPlayerController(PPCContext& __restrict ctx, uint8_t* base, uint32_t cmd,
                                uint32_t ar, uint32_t call_sp) {
  const uint32_t pc = FindPlayerController();
  if (pc == 0) {
    RDAHM_WARN("[exec] no PlayerController found");
    return false;
  }
  const uint32_t executor = RedahmReadU32(pc + kPlayerControllerExecutorOffset);
  const uint32_t pc_class = RedahmReadU32(pc + kRedahmObjectClassOffset);

  const auto offer = [&](uint32_t target) {
    return OfferConsoleExec(ctx, base, target, cmd, ar, executor, call_sp);
  };

  for (const uint32_t off : kControllerSubObjectOffsets) {
    if (offer(RedahmReadU32(pc + off))) {
      RDAHM_INFO("[exec] handled by controller subobject +{:#x}", off);
      return true;
    }
  }
  if (offer(pc)) {
    return true;
  }

  // APlayerController::ProcessConsoleExec is supposed to chain to these itself,
  // but plenty of the Kronos exec functions live on them and were still coming
  // back unhandled, so they are offered explicitly. Found by property name, so
  // no extra hardcoded offsets.
  static constexpr const char* kRelated[] = {"Pawn",        "myHUD",        "CheatManager",
                                             "PlayerInput", "PlayerCamera", "PlayerReplicationInfo"};
  for (const char* prop_name : kRelated) {
    RedahmProperty prop;
    if (!RedahmFindProperty(pc_class, prop_name, prop)) {
      continue;
    }
    const uint32_t target = RedahmReadU32(pc + prop.offset);
    if (target == 0) {
      continue;
    }
    if (offer(target)) {
      RDAHM_INFO("[exec] handled by PlayerController.{}", prop_name);
      return true;
    }
    // One level further: a Pawn's Weapon / Vehicle own exec functions too.
    const uint32_t target_class = RedahmReadU32(target + kRedahmObjectClassOffset);
    static constexpr const char* kNested[] = {"Weapon", "Vehicle", "Controller", "Mesh"};
    for (const char* nested_name : kNested) {
      RedahmProperty nested;
      if (!RedahmFindProperty(target_class, nested_name, nested)) {
        continue;
      }
      const uint32_t nested_target = RedahmReadU32(target + nested.offset);
      if (nested_target != 0 && offer(nested_target)) {
        RDAHM_INFO("[exec] handled by PlayerController.{}.{}", prop_name, nested_name);
        return true;
      }
    }
  }
  return false;
}

std::string FirstToken(const std::string& s) {
  const size_t begin = s.find_first_not_of(" \t");
  if (begin == std::string::npos) {
    return {};
  }
  const size_t end = s.find_first_of(" \t", begin);
  return s.substr(begin, end == std::string::npos ? std::string::npos : end - begin);
}

bool EqualsNoCase(const std::string& a, const std::string& b) {
  if (a.size() != b.size()) {
    return false;
  }
  for (size_t i = 0; i < a.size(); ++i) {
    if (std::toupper(static_cast<unsigned char>(a[i])) !=
        std::toupper(static_cast<unsigned char>(b[i]))) {
      return false;
    }
  }
  return true;
}

bool ClassChainContains(uint32_t cls, uint32_t target) {
  for (int depth = 0; depth < 24 && IsPlausibleGuestObject(cls); ++depth) {
    if (cls == target) {
      return true;
    }
    const uint32_t super = RedahmReadU32(cls + kRedahmStructSuperOffset);
    if (super == cls) {
      break;
    }
    cls = super;
  }
  return false;
}

// Look the command up as a UFunction and dispatch to a live instance of the
// class that declares it.
//
// The blind actor sweep offers a command to 19k objects and learns nothing when
// they all decline -- which is exactly what CryptoWeaponB/X/Y did. An exec
// function is a UObject like any other, though, so the owner can simply be
// looked up: find the UFunction by name, walk its Outer to the declaring class,
// then find something of that class that is actually alive. That also turns a
// failure into a specific answer -- either the function does not exist, or it
// exists and nothing is instanced.
bool DispatchViaExecFunctionOwner(PPCContext& __restrict ctx, uint8_t* base,
                                  const std::string& cmd_text, uint32_t cmd, uint32_t ar,
                                  uint32_t call_sp) {
  const std::string token = FirstToken(cmd_text);
  if (token.empty()) {
    return false;
  }
  const uint32_t data = RedahmReadU32(kRedahmObjObjectsData);
  const int32_t num = static_cast<int32_t>(RedahmReadU32(kRedahmObjObjectsNum));
  if (data == 0 || num <= 0) {
    return false;
  }

  uint32_t func = 0;
  for (int32_t i = num - 1; i >= 0 && func == 0; --i) {
    const uint32_t obj = RedahmReadU32(data + static_cast<uint32_t>(i) * 4);
    if (obj == 0) {
      continue;
    }
    if (RedahmReadObjectName(RedahmReadU32(obj + kRedahmObjectClassOffset)) != "Function") {
      continue;
    }
    if (EqualsNoCase(RedahmReadObjectName(obj), token)) {
      func = obj;
    }
  }
  if (func == 0) {
    RDAHM_WARN("[exec] no UFunction named \"{}\" exists -- the binding in Coalesced.ini refers to "
               "a command this build does not implement",
               token);
    return false;
  }

  // A UFunction's Outer is its class, or a UState inside the class.
  uint32_t owner = RedahmReadU32(func + kRedahmObjectOuterOffset);
  for (int depth = 0; depth < 8 && IsPlausibleGuestObject(owner); ++depth) {
    if (RedahmReadObjectName(RedahmReadU32(owner + kRedahmObjectClassOffset)) == "Class") {
      break;
    }
    owner = RedahmReadU32(owner + kRedahmObjectOuterOffset);
  }
  if (!IsPlausibleGuestObject(owner)) {
    return false;
  }
  RDAHM_INFO("[exec] \"{}\" is declared on {}", token, RedahmObjectPath(owner));

  const uint32_t executor = RedahmReadU32(FindPlayerController() + kPlayerControllerExecutorOffset);
  int tried = 0;
  for (int32_t i = num - 1; i >= 0; --i) {
    const uint32_t obj = RedahmReadU32(data + static_cast<uint32_t>(i) * 4);
    if (obj == 0 || obj == func) {
      continue;
    }
    if (!ClassChainContains(RedahmReadU32(obj + kRedahmObjectClassOffset), owner)) {
      continue;
    }
    const std::string name = RedahmReadObjectName(obj);
    if (name.empty() || name.compare(0, 9, "Default__") == 0) {
      continue;
    }
    ++tried;
    if (OfferConsoleExec(ctx, base, obj, cmd, ar, executor, call_sp)) {
      RDAHM_INFO("[exec] handled by \"{}\" {:#010x}", name, obj);
      return true;
    }
  }
  RDAHM_WARN("[exec] \"{}\" exists on {} but none of its {} live instances accepted it", token,
             RedahmReadObjectName(owner), tried);
  return false;
}

// Last resort: offer the command to every live Actor.
//
// This is what the engine's exec-component fan-out does in spirit, and slot
// 0x100 is a UObject virtual, so calling it on a real Actor is well defined --
// unlike an earlier version of this file that called it on anything with a
// non-zero word at +0x4C and got a different arbitrary "handler" every time.
// Restricting to objects whose class chain contains Actor is what makes the
// result trustworthy.
bool DispatchToAllActors(PPCContext& __restrict ctx, uint8_t* base, uint32_t cmd, uint32_t ar,
                         uint32_t call_sp) {
  const uint32_t data = RedahmReadU32(kRedahmObjObjectsData);
  const int32_t num = static_cast<int32_t>(RedahmReadU32(kRedahmObjObjectsNum));
  if (data == 0 || num <= 0) {
    return false;
  }
  const uint32_t executor = RedahmReadU32(FindPlayerController() + kPlayerControllerExecutorOffset);

  int offered = 0;
  for (int32_t i = num - 1; i >= 0; --i) {
    const uint32_t obj = RedahmReadU32(data + static_cast<uint32_t>(i) * 4);
    if (obj == 0) {
      continue;
    }
    if (!ClassChainHasActor(RedahmReadU32(obj + kRedahmObjectClassOffset))) {
      continue;
    }
    const std::string name = RedahmReadObjectName(obj);
    if (name.empty() || name.compare(0, 9, "Default__") == 0) {
      continue;
    }
    ++offered;
    if (OfferConsoleExec(ctx, base, obj, cmd, ar, executor, call_sp)) {
      RDAHM_INFO("[exec] handled by actor \"{}\" {:#010x} (after {} offers)", name, obj, offered);
      return true;
    }
  }
  RDAHM_INFO("[exec] offered to {} actors, none handled it", offered);
  return false;
}

RedahmConsoleStatus RunCommand(PPCContext& __restrict ctx, uint8_t* base, const std::string& cmd,
                               std::vector<RedahmConsoleLine>& output, bool& truncated) {
  const uint32_t self = g_exec_this.load(std::memory_order_relaxed);
  const uint32_t ar = ResolveOutputDevice(base);
  if (!self || !ar) {
    RDAHM_WARN("[exec] cannot dispatch \"{}\": this={:#010x} ar={:#010x}", cmd, self, ar);
    return RedahmConsoleStatus::kNotDispatched;
  }

  // Linkage area plus parameter save area, rounded well past what any of the
  // Exec implementations in the chain need.
  constexpr uint32_t kCalleeReserve = 0x200;
  // Leave the guest's own scratch below sp alone.
  constexpr uint32_t kRedZone = 0x100;

  const uint32_t saved_r1 = ctx.r1.u32;
  const uint32_t saved_r3 = ctx.r3.u32;
  const uint64_t saved_lr = ctx.lr;
  const uint64_t saved_ctr = ctx.ctr.u64;

  const uint32_t bytes = static_cast<uint32_t>((cmd.size() + 1) * 2);
  const uint32_t buf = (saved_r1 - kRedZone - bytes) & ~15u;

  uint8_t* p = base + buf;
  for (size_t i = 0; i < cmd.size(); ++i) {
    p[i * 2] = 0;
    p[i * 2 + 1] = static_cast<uint8_t>(cmd[i]);
  }
  p[cmd.size() * 2] = 0;
  p[cmd.size() * 2 + 1] = 0;

  const uint32_t call_sp = (buf - kCalleeReserve) & ~15u;

  // The command buffer sits above call_sp by the whole callee reserve, so it
  // survives the first call intact and the second can reuse it. ParseCommand
  // advances the callee's own copy of the pointer, never ours.
  const auto call = [&](PPCFunc* fn, uint32_t self_arg) {
    ctx.r1.u32 = call_sp;
    ctx.r3.u32 = self_arg;
    ctx.r4.u32 = buf;
    ctx.r5.u32 = ar;
    fn(ctx, base);
    return ctx.r3.u32 != 0;
  };

  bool handled = false;
  const char* via = "Exec";
  {
    // Scoped so the sink is cleared before anything below can log: the capture
    // hook is global and would otherwise attribute unrelated lines to this
    // command. Both Exec attempts share one scope because a command handled by
    // the second one may still have printed from the first.
    CaptureScope capture(&output);

    // Each stage announces itself before it runs. A guest fault kills the
    // process without unwinding, so the last line in the log is the only
    // evidence of where it died -- and "dispatching X" alone was not enough to
    // tell Exec1 from Exec2.
    RDAHM_INFO("[exec] \"{}\" stage 1: Exec (this={:#010x})", cmd, self);
    handled = call(__imp__sub_8261FDE0, self);

    // Stage 1 already includes the exec-component fan-out, since the gate is
    // asserted -- the engine's own walk is class-filtered and null-safe, which
    // a hand-rolled one here was not.

    // Stage 2 is the PlayerController, reached directly rather than through
    // Exec2. Calling sub_82623370 crashes: its fan-out iterates a count from
    // *(GEngine+0x50)+0x84 that grows with the object array (4494, then 4530)
    // and is plainly not a player list. This makes the same ProcessConsoleExec
    // calls against a controller found by class instead.
    if (!handled) {
      RDAHM_INFO("[exec] \"{}\" stage 2: PlayerController", cmd);
      handled = DispatchToPlayerController(ctx, base, buf, ar, call_sp);
      if (handled) {
        via = "PlayerController";
      }
    }

    // Stage 3: sub_82623370, but only for the commands it resolves *before*
    // its broken tail. Calling it for anything else falls through to the
    // fan-out at 0x82624650 and crashes, which is why it is not simply chained.
    if (!handled && Exec2OwnsCommand(cmd)) {
      const uint32_t secondary = ResolveSecondaryExec(base);
      if (secondary != 0) {
        RDAHM_INFO("[exec] \"{}\" stage 3: Exec2 (this={:#010x})", cmd, secondary);
        handled = call(__imp__sub_82623370, secondary);
        if (handled) {
          via = "Exec2";
        }
      }
    }

    // Stage 4 resolves the command as a UFunction and goes straight to a live
    // instance of whatever declares it. Cheaper than the sweep below, and when
    // it fails it says why rather than just declining 19k times.
    if (!handled) {
      RDAHM_INFO("[exec] \"{}\" stage 4: exec-function owner", cmd);
      handled = DispatchViaExecFunctionOwner(ctx, base, cmd, buf, ar, call_sp);
      if (handled) {
        via = "ExecFunctionOwner";
      }
    }

    if (!handled) {
      RDAHM_INFO("[exec] \"{}\" stage 5: all actors", cmd);
      handled = DispatchToAllActors(ctx, base, buf, ar, call_sp);
      if (handled) {
        via = "Actor";
      }
    }

    truncated = capture.truncated();
  }

  // There is deliberately no third, hand-built step here. sub_82623370 already
  // ends in the PlayerController fan-out (0x82624650): it finds the player list
  // from the engine globals itself and offers the command to the controller's
  // +0x3D4, +0x358 and +0x448 subobjects and then the controller, each through
  // ProcessConsoleExec at vtable slot 0x100. Reproducing that walk by hand was
  // both redundant and wrong -- it passed a null Executor where the engine
  // passes *(X + 0x1EC), and dispatching AllAmmo that way faulted the guest on
  // a null read. Reaching it through Exec2 is the supported route.

  ctx.r1.u32 = saved_r1;
  ctx.r3.u32 = saved_r3;
  ctx.lr = saved_lr;
  ctx.ctr.u64 = saved_ctr;

  RDAHM_INFO("[exec] ran \"{}\" -> {}{} ({} line{}{})", cmd, handled ? "handled" : "unhandled",
             handled ? std::string(" via ") + via : std::string(), output.size(),
             output.size() == 1 ? "" : "s", truncated ? ", truncated" : "");
  return handled ? RedahmConsoleStatus::kHandled : RedahmConsoleStatus::kUnhandled;
}

}  // namespace

void RedahmDrainConsoleQueue(PPCContext& __restrict ctx, uint8_t* base) {
  if (t_in_dispatch) {
    return;
  }

  // Keep the gate asserted: it is a single byte and cheap to rewrite, which
  // also covers the game re-initialising that region.
  base[kExecComponentGate] = 1;

  // Runs every frame, so GLog is picked up as soon as its constructor has run
  // rather than waiting for a command to be queued.
  ResolveOutputDevice(base);

  for (;;) {
    std::string cmd;
    {
      std::lock_guard<std::mutex> lock(g_queue_mutex);
      if (g_queue.empty()) {
        break;
      }
      cmd = std::move(g_queue.front());
      g_queue.pop_front();
    }
    // Logged before the call, not after: a command that faults the guest never
    // reaches the completion line, so without this the crash log gives no clue
    // which command caused it.
    RDAHM_INFO("[exec] dispatching \"{}\"", cmd);

    std::vector<RedahmConsoleLine> output;
    bool truncated = false;

    t_in_dispatch = true;
    const RedahmConsoleStatus status = RunCommand(ctx, base, cmd, output, truncated);
    t_in_dispatch = false;
    RecordResult(cmd, status, std::move(output), truncated);
  }
}

// Queue a console command to run on the next drain. Safe to call from any
// thread; the command runs on a guest thread.
void RedahmQueueConsoleCommand(std::string cmd) {
  cmd = Trim(std::move(cmd));
  if (cmd.empty()) {
    return;
  }
  if (cmd.size() > kMaxCommandChars) {
    cmd.resize(kMaxCommandChars);
  }
  std::lock_guard<std::mutex> lock(g_queue_mutex);
  g_queue.push_back(std::move(cmd));
}

bool RedahmConsoleReady() {
  return g_exec_this.load(std::memory_order_relaxed) != 0 &&
         g_exec_ar.load(std::memory_order_relaxed) != 0;
}

uint32_t RedahmConsoleExecObject() { return g_exec_this.load(std::memory_order_relaxed); }

uint32_t RedahmConsoleOutputDevice() { return g_exec_ar.load(std::memory_order_relaxed); }

size_t RedahmConsoleQueueDepth() {
  std::lock_guard<std::mutex> lock(g_queue_mutex);
  return g_queue.size();
}

std::vector<RedahmConsoleEntry> RedahmConsoleHistory() {
  std::lock_guard<std::mutex> lock(g_history_mutex);
  return std::vector<RedahmConsoleEntry>(g_history.begin(), g_history.end());
}

void RedahmClearConsoleHistory() {
  std::lock_guard<std::mutex> lock(g_history_mutex);
  g_history.clear();
}

// FOutputDeviceRedirector::Serialize. Hooked unconditionally -- the whole game
// logs through here -- but does nothing unless this thread is inside one of our
// own Exec calls, and never changes what the engine goes on to do with the line.
REX_HOOK_RAW(sub_823A4338) {
  if (t_capture_sink != nullptr) {
    CaptureSerialize(base, ctx.r4.u32, ctx.r5.u32);
  }
  __imp__sub_823A4338(ctx, base);
}

// The other Exec on the object we cannot name statically. If the game ever
// dispatches through it, this is the exact `this` -- better than any derivation.
REX_HOOK_RAW(sub_82623370) {
  LatchSecondaryExec(base, ctx.r3.u32, "observed call");
  __imp__sub_82623370(ctx, base);
}

REX_HOOK_RAW(sub_8261FDE0) {
  g_exec_this.store(ctx.r3.u32, std::memory_order_relaxed);
  if (IsStableOutputDevice(ctx.r5.u32)) {
    g_exec_ar.store(ctx.r5.u32, std::memory_order_relaxed);
  }

  if (g_logged.load(std::memory_order_relaxed) < kMaxLoggedCommands) {
    g_logged.fetch_add(1, std::memory_order_relaxed);
    RDAHM_INFO("[exec] this={:#010x} ar={:#010x} cmd=\"{}\"", ctx.r3.u32, ctx.r5.u32,
               ReadGuestWide(base, ctx.r4.u32));
  }

  __imp__sub_8261FDE0(ctx, base);

  // Also drain here so a command issued mid-frame lands promptly; the per-frame
  // drain in UGameEngine::Tick is what guarantees it runs at all.
  RedahmDrainConsoleQueue(ctx, base);
}

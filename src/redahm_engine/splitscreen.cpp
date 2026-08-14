// Second local player and split-screen viewport layout.
//
// The premise of this file is that split-screen is already implemented in this
// build and simply never used. Two findings carry that claim, and both were
// read out of live code rather than inferred:
//
//   1. UGameViewportClient::Draw (sub_8261CF58) renders one view *per entry* in
//      GEngine->GamePlayers. Its main loop is at 0x8261D2B4:
//
//        lwz r11, 0x2E4(r5)      ; GamePlayers.Data
//        lwzx r18, r11, r4       ; Data[i]
//        lwz r10, 0x40(r18)      ; Player->Actor -- skipped when null
//        bl  sub_826229C0        ; ULocalPlayer::CalcSceneView
//
//      bounded by `i < 0x2E8(GEngine)` at 0x8261DB34, and the HUD/Canvas pass
//      at 0x8261E790 walks the same array a second time. Nothing about that
//      loop is conditional on a game mode or a player count.
//
//   2. ULocalPlayer::CalcSceneView (sub_826229C0) derives the view rectangle
//      from the player's own fractional Origin/Size, at 0x82622A18-0x82622B34:
//
//        if (!Actor || Size.X <= 0 || Size.Y <= 0) return NULL;
//        X     = Viewport->GetSizeX() * Origin.X;   // +0x6C
//        Y     = Viewport->GetSizeY() * Origin.Y;   // +0x70
//        SizeX = Viewport->GetSizeX() * Size.X;     // +0x74
//        SizeY = Viewport->GetSizeY() * Size.Y;     // +0x78
//
//      That is stock UE3 split-screen. Writing (0, 0.5, 1, 0.5) onto a second
//      player is the entire layout problem.
//
// What did *not* survive is the plumbing that would have created the second
// player. There is no UGameViewportClient::CreatePlayer: the only callers of
// ULocalPlayer::SpawnPlayActor (sub_826214C0) are UGameEngine::LoadMap
// (0x82742744) and the script native execSpawnPlayActor (sub_82320EA0), and a
// UTF-16BE scan of .rdata finds no DEBUGCREATEPLAYER / DEBUGREMOVEPLAYER /
// SSSWAP / SSDATUM literals -- the debug console commands were compiled out.
// So the player is constructed here, from the same primitives the engine's own
// Init uses.
//
// ---------------------------------------------------------------------------
// The construction path, and where each piece came from
// ---------------------------------------------------------------------------
// UGameEngine::Init (sub_8273D3E8) builds GEngine->GameViewport at 0x8273E014:
//
//   lwz r3, 0xB8(r21)                  ; GEngine->GameViewportClientClass
//   mr  r4, r21                        ; Outer = GEngine
//   ld  r5, var_22A0(r1)               ; FName NAME_None, one 64-bit register
//   li  r6, 0 / li r7, 0               ; Flags, Template
//   lwz r8, dword_837370C4(r28)        ; GError
//   li  r9, 0 / li r10, 0              ; SubobjectRoot, InstanceGraph
//   bl  sub_822A93E8                   ; StaticConstructObject
//   stw r3, 0x2F0(r21)                 ; GEngine->GameViewport
//
// which fixes sub_822A93E8 as StaticConstructObject with UE3's eight-parameter
// signature, and dword_837370C4 as GError.
//
// The UClass comes from dword_837490D0, the lazily-populated cache behind
// ULocalPlayer's class registration (written at 0x8230EAB4 and 0x822FA2F0).
// Reading a cached UClass pointer out of a global is a guess that fails
// silently if it is wrong, so it is checked: the object's FName is resolved
// through the reflection module and must read back as "LocalPlayer" before
// anything is constructed.
//
// Appending to GamePlayers reproduces UE3's FArray::Add rather than calling it,
// because only the Remove half is identifiable in this build -- sub_8232D180,
// whose tail is `ArrayMax = ArrayNum; Realloc(ElementSize, Alignment)` via
// sub_82294520. That pins sub_82294520 as FArray::Realloc(ElementSize,
// Alignment), which is the only guest call the append actually needs; the
// growth policy (`Num + 3*Num/8 + 32`) is UE3's and is reproduced verbatim.
//
// ULocalPlayer::ViewportClient is not read by anything on the render path, so
// its offset was never pinned statically. It is found at runtime instead, by
// scanning player 0 for a field equal to GEngine->GameViewport -- self-checking
// in the same way the class-name test is, and it costs one 112-word scan once.
//
// ---------------------------------------------------------------------------
// What this cannot promise
// ---------------------------------------------------------------------------
// SpawnPlayActor ends in UWorld::SpawnPlayActor (sub_8276F448), which calls the
// game's GameInfo::Login. That is UnrealScript living in the .u packages, not
// in the executable, so whether this game's GameInfo will admit a second player
// -- and whether it spawns a usable Crypto for it -- is not knowable from the
// binary. Every failure path here logs and rolls the array back rather than
// leaving a half-registered player behind, and the engine's own OutError string
// is captured verbatim, because that is the thing that will say why.
//
// Input needs nothing from us if a player is created: UGameViewportClient's
// per-player input routing (sub_8261C290) resolves a controller id to a player
// through sub_826CD328, which is a linear search comparing ULocalPlayer +0x60
// against the incoming id. Set the id and the engine finds the player.

#include "splitscreen.h"

#include <rex/cvar.h>
#include <rex/hook.h>
#include <rex/ppc/stack.h>

#include <algorithm>
#include <atomic>
#include <cmath>
#include <cstring>
#include <deque>
#include <iterator>
#include <mutex>
#include <string>
#include <vector>

#include "redahm_logging.h"
#include "reflection.h"

REXCVAR_DEFINE_INT32(splitscreen_layout, 0, "POTF/Splitscreen",
                     "Viewport layout for local players: 0=off, 1=horizontal, 2=vertical")
    .range(0, 2);

REXCVAR_DEFINE_BOOL(splitscreen_auto_player2, false, "POTF/Splitscreen",
                    "Create a local player for controller 1 as soon as a level is running. Off by "
                    "default: it calls the game's GameInfo::Login, which is script we cannot "
                    "inspect ahead of time.");

// CPPawn::AddDefaultInventory, found by listing the Pawn's script functions at
// runtime: parms=0, props=0, declared on CPPawn. UWorld::SpawnPlayActor builds
// the Pawn through GameInfo::Login but the game's loadout path never runs for a
// player created this way, so it has to be invoked explicitly.
REXCVAR_DEFINE_BOOL(splitscreen_auto_loadout, true, "POTF/Splitscreen",
                    "Call CPPawn::AddDefaultInventory on a newly created player, so it spawns "
                    "with its weapons instead of empty-handed.");

REXCVAR_DEFINE_DOUBLE(splitscreen_spawn_offset, 200.0, "POTF/Splitscreen",
                      "Horizontal distance in world units to offset a newly created player's "
                      "spawn, so it does not land inside another player. 0 disables.")
    .range(0.0, 4000.0);

// The observed failure was the new Crypto spawning with his feet inside the
// floor, not inside the other player -- the horizontal offset fixed it only
// because it happened to land him on clear ground. A small lift makes that
// deterministic instead of terrain-dependent: he spawns just clear of the
// surface and gravity settles him over the next few frames.
REXCVAR_DEFINE_DOUBLE(splitscreen_spawn_lift, 32.0, "POTF/Splitscreen",
                      "Vertical lift in world units applied to a new player's spawn, so it does "
                      "not land embedded in the floor. 0 disables.")
    .range(0.0, 1000.0);

// Off by default on the evidence of a clean A/B: with this on, park logs all
// its steps returning with destroyed=true and the process dies a frame or more
// later; with it off, the identical sequence minus the DestroyActor call
// survives indefinitely. So destroying the PlayerController is the fault, and
// it is not the teardown itself -- something still holds the controller
// afterwards. UE3 unregisters per-player state through UUIInteraction on
// removal and that notification is not identified in this build, which is the
// most likely thing being skipped.
//
// Left switchable rather than deleted, because it is the experiment that will
// confirm the fix once that notification is found.
// Suspected cause of the black half-screen left behind when the live view count
// drops from two back to one. Off by default until that is confirmed, because
// it changes how the whole frame is rendered, not just split-screen.
REXCVAR_DEFINE_BOOL(splitscreen_disable_tiling, false, "POTF/Splitscreen",
                    "Hold Xbox 360 predicated EDRAM tiling off. Try this if a region of the "
                    "screen stops updating after a player is added or parked.");

REXCVAR_DEFINE_BOOL(splitscreen_destroy_on_remove, false, "POTF/Splitscreen",
                    "Destroy the PlayerController when parking a local player. Known to crash a "
                    "frame later; off leaves the body standing in the level instead.");

// StaticConstructObject(UClass*, UObject* Outer, FName Name, EObjectFlags Flags,
//                       UObject* Template, FOutputDevice* Error,
//                       UObject* SubobjectRoot, FObjectInstancingGraph*)
// Name is a single 64-bit register (r5), matching FName's {Index, Number}.
REX_IMPORT(sub_822A93E8, GuestStaticConstructObject,
           uint32_t(uint32_t, uint32_t, uint64_t, uint32_t, uint32_t, uint32_t, uint32_t,
                    uint32_t));

// ULocalPlayer::SpawnPlayActor(const FString& URL, FString& OutError) -> UBOOL
REX_IMPORT(sub_826214C0, GuestSpawnPlayActor, uint32_t(uint32_t, uint32_t, uint32_t));

// FArray::Realloc(INT ElementSize, DWORD Alignment)
REX_IMPORT(sub_82294520, GuestFArrayRealloc, void(uint32_t, uint32_t, uint32_t));

// FArray::Remove(INT Index, INT Count, INT ElementSize, DWORD Alignment)
REX_IMPORT(sub_8232D180, GuestFArrayRemove,
           void(uint32_t, uint32_t, uint32_t, uint32_t, uint32_t));

// UWorld::DestroyActor(AActor* ThisActor, UBOOL bNetForce, UBOOL bShouldModifyLevel) -> UBOOL
//
// sub_8276EE70, identified from its body rather than its position: it early-outs
// on the actor's 0x8000000 flag ("already being destroyed"), sets that same flag
// near the end, detaches Base and everything in Attached, unregisters the actor
// from the level via sub_8241D2D0, and finishes through the actor's own vtable
// slots 964 and 948. 29 call sites, which is the right order for DestroyActor.
//
// Only two parameters are visibly used; the trailing two are declared and passed
// explicitly anyway, because CallFrame leaves unset registers holding garbage and
// a defaulted parameter this decompile missed would then read it.
REX_IMPORT(sub_8276EE70, GuestDestroyActor,
           uint32_t(uint32_t, uint32_t, uint32_t, uint32_t));

// UWorld::SpawnActor(UClass*, FName, const FVector& Location, const FRotator& Rotation,
//                    AActor* Template, UBOOL bNoCollisionFail, UBOOL bRemoteOwned, ...)
//
// Hooked rather than called: see SpawnOffset below.
REX_EXTERN(__imp__sub_8276E728);

namespace {

//=============================================================================
// Guest addresses and offsets
//=============================================================================

// UEngine* GEngine. Loaded by Draw, CalcSceneView and every player lookup.
constexpr uint32_t kGEngine = 0x83746300;
// UWorld* GWorld. Read by SpawnPlayActor at 0x826214DC.
constexpr uint32_t kGWorld = 0x837485E0;
// FOutputDevice* GError, arg 6 of StaticConstructObject in UGameEngine::Init.
constexpr uint32_t kGError = 0x837370C4;
// UClass* for ULocalPlayer, cached by the class registrant.
constexpr uint32_t kLocalPlayerClass = 0x837490D0;

// Xbox 360 predicated tiling, from the TILING / TILINGMODE exec handler
// (sub_823488A8). The scene is rendered once per EDRAM tile and resolved, so if
// the tile arrangement is chosen while two views exist and is not recomputed
// when the count drops back to one, the tile that belonged to the second player
// is never rendered into -- which looks exactly like a black bottom half.
//
//   TILING       toggles dword_835E5064, but only when the render width
//                (dword_835E5610) is 1280; otherwise it forces tiling off.
//   TILINGMODE n sets dword_835E4FFC to 0..4, or cycles it with no argument.
constexpr uint32_t kTilingEnabled = 0x835E5064;
constexpr uint32_t kTilingMode = 0x835E4FFC;
constexpr uint32_t kRenderWidth = 0x835E5610;

// UEngine::GamePlayers, a TArray<ULocalPlayer*>: Data, Num, Max.
constexpr uint32_t kGamePlayers = 0x2E4;
// UEngine::GameViewport, the field immediately after GamePlayers.
constexpr uint32_t kGameViewport = 0x2F0;

// ULocalPlayer. Size is 0x1C0, from the IMPLEMENT_CLASS at sub_8261BC00.
constexpr uint32_t kLpActor = 0x40;
constexpr uint32_t kLpControllerId = 0x60;
constexpr uint32_t kLpOriginX = 0x6C;
constexpr uint32_t kLpOriginY = 0x70;
constexpr uint32_t kLpSizeX = 0x74;
constexpr uint32_t kLpSizeY = 0x78;
constexpr uint32_t kSizeofLocalPlayer = 0x1C0;

// TArray<ULocalPlayer*>: 4-byte elements. Every FArray::Remove call site in
// Draw passes 8 as the alignment, so the array was allocated with it.
constexpr uint32_t kPlayerPtrSize = 4;
constexpr uint32_t kArrayAlignment = 8;

// A player list longer than this means the array header is being misread, not
// that somebody plugged in a lot of controllers.
constexpr int32_t kMaxSanePlayers = 8;

// Same stack discipline reflection.cpp's ApplyEdit uses: scratch sits above the
// callee reserve so a guest function writing its parameter save area cannot
// reach the FStrings we are passing it.
constexpr uint32_t kCalleeReserve = 0x200;
constexpr uint32_t kRedZone = 0x100;

// sizeof(FString) -- FArray {Data, Num, Max} over TCHAR.
constexpr uint32_t kSizeofFString = 12;

//=============================================================================
// Guest memory access
//=============================================================================
// Reads on the mutation path go through the raw membase because they run on a
// guest thread inside Tick, where the pointers involved were just read out of
// live engine state. Reads on the snapshot path go through the reflection
// module's validated readers instead, because the UI calls those off-thread.

uint32_t ReadU32(const uint8_t* base, uint32_t addr) {
  uint32_t v;
  std::memcpy(&v, base + addr, sizeof(v));
  return __builtin_bswap32(v);
}

void WriteU32(uint8_t* base, uint32_t addr, uint32_t value) {
  const uint32_t v = __builtin_bswap32(value);
  std::memcpy(base + addr, &v, sizeof(v));
}

float ReadF32(const uint8_t* base, uint32_t addr) {
  const uint32_t bits = ReadU32(base, addr);
  float f;
  std::memcpy(&f, &bits, sizeof(f));
  return f;
}

void WriteF32(uint8_t* base, uint32_t addr, float value) {
  uint32_t bits;
  std::memcpy(&bits, &value, sizeof(bits));
  WriteU32(base, addr, bits);
}

// FString -> host string. UTF-16BE, Num counts TCHARs including the null.
// Non-ASCII collapses to '?': this only ever renders engine error text.
std::string ReadGuestFString(const uint8_t* base, uint32_t addr) {
  const uint32_t data = ReadU32(base, addr);
  const int32_t num = static_cast<int32_t>(ReadU32(base, addr + 4));
  if (data == 0 || num <= 1 || num > 4096) {
    return {};
  }
  std::string out;
  out.reserve(static_cast<size_t>(num) - 1);
  for (int32_t i = 0; i < num - 1; ++i) {
    uint16_t ch;
    std::memcpy(&ch, base + data + static_cast<uint32_t>(i) * 2, sizeof(ch));
    ch = __builtin_bswap16(ch);
    if (ch == 0) {
      break;
    }
    out.push_back(ch < 0x20 || ch > 0x7E ? '?' : static_cast<char>(ch));
  }
  return out;
}

//=============================================================================
// Calling UnrealScript
//=============================================================================
// UObject::ProcessEvent is sub_823EECD0, identified from its body: it gates on
// Function->FunctionFlags (+140), routes through ProcessRemoteFunction on
// FUNC_Net, allocas Function->PropertiesSize (+80), memcpys ParmsSize (+158)
// worth of arguments into the frame and zeroes the rest, builds an FFrame of
// {vtable, Node, Object, Code}, walks the out-parameter list under
// FUNC_HasOutParms, calls Function->Func (+168), then copies out-params back.
//
// It is virtual, which is why searching for it by call count failed for so
// long: every eventXxx wrapper reaches it through the vtable, so it has almost
// no direct references. It sits at slot 57 of the UObject vtable -- byte offset
// 0xE4 -- and it is called through the object's own vtable here rather than as
// a direct import, so a subclass that overrides it still gets its override.
constexpr uint32_t kSlotProcessEvent = 0xE4;

// UFunction, from what ProcessEvent reads out of it.
constexpr uint32_t kFuncPropertiesSize = 0x50;  // INT
constexpr uint32_t kFuncFlags = 0x8C;           // DWORD
constexpr uint32_t kFuncParmsSize = 0x9E;       // WORD

uint32_t ReadU16(const uint8_t* base, uint32_t addr) {
  uint16_t v;
  std::memcpy(&v, base + addr, sizeof(v));
  return __builtin_bswap16(v);
}

//=============================================================================
// Pending work and reporting
//=============================================================================

struct PendingOp {
  enum class Kind { kAdd, kRemove, kCall };
  Kind kind = Kind::kAdd;
  int controller_id = 0;
  // kCall: the object to call on. Zero means "resolve this controller's Pawn
  // when the call runs" -- used when queueing a loadout for a player who is
  // being created in this same drain and whose Pawn does not exist yet.
  uint32_t target = 0;
  std::string function;
};

std::mutex g_mutex;
std::deque<PendingOp> g_queue;
std::deque<std::string> g_log;
uint32_t g_viewport_client_offset = 0xFFFFFFFFu;

void Report(std::string line) {
  RDAHM_INFO("[split] {}", line);
  std::lock_guard<std::mutex> lock(g_mutex);
  g_log.push_back(std::move(line));
  while (g_log.size() > 64) {
    g_log.pop_front();
  }
}

RedahmSplitLayout LayoutFromCVar() {
  switch (REXCVAR_GET(splitscreen_layout)) {
    case 1:
      return RedahmSplitLayout::kHorizontal;
    case 2:
      return RedahmSplitLayout::kVertical;
    default:
      return RedahmSplitLayout::kNone;
  }
}

//=============================================================================
// Layout
//=============================================================================

struct Rect {
  float x, y, w, h;
};

// CalcSceneView rejects a player whose Size is <= 0, so no branch here may
// produce a zero extent -- a player with an empty rect silently stops
// rendering rather than erroring.
Rect RectFor(RedahmSplitLayout layout, int32_t index, int32_t count) {
  if (layout == RedahmSplitLayout::kNone || count <= 1) {
    return {0.0f, 0.0f, 1.0f, 1.0f};
  }
  if (count == 2) {
    if (layout == RedahmSplitLayout::kVertical) {
      return {index == 0 ? 0.0f : 0.5f, 0.0f, 0.5f, 1.0f};
    }
    return {0.0f, index == 0 ? 0.0f : 0.5f, 1.0f, 0.5f};
  }
  // Three or four players: quadrants, reading order. A third player in a
  // 2-player layout would otherwise have nowhere to go.
  const float x = (index % 2) == 0 ? 0.0f : 0.5f;
  const float y = index < 2 ? 0.0f : 0.5f;
  return {x, y, 0.5f, 0.5f};
}

// Only players with a live Actor get a share of the screen. A parked player is
// still in GamePlayers but renders nothing -- Draw skips it on the null Actor
// check at 0x8261D2BC before CalcSceneView is even reached -- so counting it
// would hand half the screen to nobody.
void ApplyLayout(uint8_t* base, uint32_t engine, RedahmSplitLayout layout) {
  const uint32_t data = ReadU32(base, engine + kGamePlayers);
  const int32_t num = static_cast<int32_t>(ReadU32(base, engine + kGamePlayers + 4));
  if (data == 0 || num <= 0 || num > kMaxSanePlayers) {
    return;
  }
  int32_t live = 0;
  for (int32_t i = 0; i < num; ++i) {
    const uint32_t p = ReadU32(base, data + static_cast<uint32_t>(i) * 4);
    if (p != 0 && ReadU32(base, p + kLpActor) != 0) {
      ++live;
    }
  }

  // Logged only on change, so the log records every layout transition without
  // one line per frame. This is what says whether player 0 actually gets the
  // whole screen back when the other player parks.
  static int32_t last_live = -1;
  static int32_t last_layout = -1;
  const bool changed = live != last_live || static_cast<int32_t>(layout) != last_layout;
  last_live = live;
  last_layout = static_cast<int32_t>(layout);

  int32_t slot = 0;
  for (int32_t i = 0; i < num; ++i) {
    const uint32_t player = ReadU32(base, data + static_cast<uint32_t>(i) * 4);
    if (player == 0) {
      continue;
    }
    if (ReadU32(base, player + kLpActor) == 0) {
      // Belt and braces: a zero extent makes CalcSceneView bail as well, so a
      // parked player cannot render even if Draw's null-Actor check changes.
      WriteF32(base, player + kLpSizeX, 0.0f);
      WriteF32(base, player + kLpSizeY, 0.0f);
      if (changed) {
        RDAHM_INFO("[split] layout: [{}] {:#x} parked, size zeroed", i, player);
      }
      continue;
    }
    const Rect r = RectFor(layout, slot++, live);
    WriteF32(base, player + kLpOriginX, r.x);
    WriteF32(base, player + kLpOriginY, r.y);
    WriteF32(base, player + kLpSizeX, r.w);
    WriteF32(base, player + kLpSizeY, r.h);
    if (changed) {
      RDAHM_INFO("[split] layout: [{}] {:#x} origin=({}, {}) size=({}, {})  [live={} mode={}]", i,
                 player, r.x, r.y, r.w, r.h, live, last_layout);
    }
  }
}

//=============================================================================
// Player list helpers
//=============================================================================

uint32_t ObjectClass(uint32_t obj) {
  return obj == 0 ? 0 : RedahmReadU32(obj + kRedahmObjectClassOffset);
}

// Read an object-valued property by name. Goes through the reflection module so
// no field offset has to be hardcoded, which matters for the game's own CP*
// classes -- none of their layouts were derived here.
uint32_t ObjectFieldOf(uint32_t obj, uint32_t cls, const char* name) {
  RedahmProperty p;
  if (obj == 0 || cls == 0 || !RedahmFindProperty(cls, name, p)) {
    return 0;
  }
  return RedahmReadU32(obj + p.offset);
}

// Walk the class chain's Children looking for a UFunction of this name. Done
// here rather than through the engine's own field lookup (sub_8229E590) because
// that one matches any UField by name and would happily hand back a property
// that shares the name; this checks the child's own class reads as "Function".
uint32_t FindScriptFunction(uint32_t cls, const std::string& name) {
  for (uint32_t c = cls; c != 0; c = RedahmReadU32(c + kRedahmStructSuperOffset)) {
    int guard = 0;
    for (uint32_t f = RedahmReadU32(c + kRedahmStructChildrenOffset);
         f != 0 && ++guard < 4096; f = RedahmReadU32(f + kRedahmFieldNextOffset)) {
      if (RedahmReadObjectName(f) == name &&
          RedahmReadObjectName(RedahmReadU32(f + kRedahmObjectClassOffset)) == "Function") {
        return f;
      }
    }
  }
  return 0;
}

// Every UFunction the class chain declares, nearest class first.
struct ScriptFunction {
  uint32_t addr = 0;
  std::string name;
  std::string owner;
  uint32_t parms_size = 0;
  uint32_t properties_size = 0;
  uint32_t flags = 0;
};

std::vector<ScriptFunction> ListScriptFunctions(uint32_t cls) {
  std::vector<ScriptFunction> out;
  for (uint32_t c = cls; c != 0; c = RedahmReadU32(c + kRedahmStructSuperOffset)) {
    const std::string owner = RedahmReadObjectName(c);
    int guard = 0;
    for (uint32_t f = RedahmReadU32(c + kRedahmStructChildrenOffset);
         f != 0 && ++guard < 4096; f = RedahmReadU32(f + kRedahmFieldNextOffset)) {
      if (RedahmReadObjectName(RedahmReadU32(f + kRedahmObjectClassOffset)) != "Function") {
        continue;
      }
      ScriptFunction sf;
      sf.addr = f;
      sf.name = RedahmReadObjectName(f);
      sf.owner = owner;
      sf.properties_size = RedahmReadU32(f + kFuncPropertiesSize);
      // ParmsSize is a WORD at +0x9E. Only a validated 32-bit reader is
      // available off-thread, so read the aligned dword at +0x9C and keep the
      // low half -- which is the one at +0x9E, big-endian.
      sf.parms_size = RedahmReadU32(f + kFuncParmsSize - 2) & 0xFFFFu;
      sf.flags = RedahmReadU32(f + kFuncFlags);
      out.push_back(std::move(sf));
    }
    if (out.size() > 4000) {
      break;
    }
  }
  return out;
}

int32_t FindPlayerIndex(const uint8_t* base, uint32_t engine, int controller_id) {
  const uint32_t data = ReadU32(base, engine + kGamePlayers);
  const int32_t num = static_cast<int32_t>(ReadU32(base, engine + kGamePlayers + 4));
  if (data == 0 || num <= 0 || num > kMaxSanePlayers) {
    return -1;
  }
  for (int32_t i = 0; i < num; ++i) {
    const uint32_t player = ReadU32(base, data + static_cast<uint32_t>(i) * 4);
    if (player != 0 &&
        static_cast<int32_t>(ReadU32(base, player + kLpControllerId)) == controller_id) {
      return i;
    }
  }
  return -1;
}

// ULocalPlayer::ViewportClient, located by matching player 0's fields against
// GEngine->GameViewport. Cached: it cannot move between runs of the same build.
uint32_t ViewportClientOffset(const uint8_t* base, uint32_t engine) {
  if (g_viewport_client_offset != 0xFFFFFFFFu) {
    return g_viewport_client_offset;
  }
  const uint32_t viewport = ReadU32(base, engine + kGameViewport);
  const uint32_t data = ReadU32(base, engine + kGamePlayers);
  const int32_t num = static_cast<int32_t>(ReadU32(base, engine + kGamePlayers + 4));
  if (viewport == 0 || data == 0 || num <= 0) {
    return 0xFFFFFFFFu;
  }
  const uint32_t player0 = ReadU32(base, data);
  if (player0 == 0) {
    return 0xFFFFFFFFu;
  }
  for (uint32_t off = 4; off < kSizeofLocalPlayer; off += 4) {
    if (ReadU32(base, player0 + off) == viewport) {
      g_viewport_client_offset = off;
      Report("ULocalPlayer::ViewportClient found at +" + std::to_string(off));
      return off;
    }
  }
  Report("ULocalPlayer::ViewportClient not found on player 0; leaving it null on new players");
  return 0xFFFFFFFFu;
}

//=============================================================================
// Movement trace
//=============================================================================
// A static snapshot cannot tell the two remaining explanations apart, because
// both leave a Pawn sitting still with zero Velocity when nobody is touching
// the stick. Sampled over time while the stick *is* being pushed, they separate
// cleanly:
//
//   Acceleration goes nonzero, Location does not move  -> the move is being
//     computed and then rejected: collision, or physics not integrating.
//   Acceleration stays flat zero                       -> PlayerMove never runs
//     for this player, i.e. the game drives movement from something that only
//     knows about player 0.
//
// Sampled from the Tick drain so both players are read at the same instant, and
// decimated to 10Hz so a few seconds stays readable in the log.

constexpr int kTraceDecimation = 6;

// Written from the console thread, consumed on the guest thread.
std::atomic<int> g_trace_frames{0};
int g_trace_tick = 0;

struct TraceFields {
  uint32_t cls = 0;
  uint32_t location = 0;
  uint32_t velocity = 0;
  uint32_t acceleration = 0;
  bool valid = false;
};

// Offsets are per class and cached, so the sampler does not walk the property
// chain 60 times a second.
TraceFields FieldsFor(uint32_t cls) {
  static uint32_t cached_cls = 0;
  static TraceFields cached;
  if (cls != 0 && cls == cached_cls) {
    return cached;
  }
  TraceFields f;
  f.cls = cls;
  RedahmProperty p;
  if (cls != 0 && RedahmFindProperty(cls, "Location", p)) {
    f.location = p.offset;
    if (RedahmFindProperty(cls, "Velocity", p)) {
      f.velocity = p.offset;
      if (RedahmFindProperty(cls, "Acceleration", p)) {
        f.acceleration = p.offset;
        f.valid = true;
      }
    }
  }
  cached_cls = cls;
  cached = f;
  return f;
}

void SampleTrace(const uint8_t* base, uint32_t engine) {
  if (g_trace_frames.fetch_sub(1, std::memory_order_relaxed) <= 0) {
    g_trace_frames.store(0, std::memory_order_relaxed);
    return;
  }
  if ((g_trace_tick++ % kTraceDecimation) != 0) {
    return;
  }

  const uint32_t data = ReadU32(base, engine + kGamePlayers);
  const int32_t num = static_cast<int32_t>(ReadU32(base, engine + kGamePlayers + 4));
  if (data == 0 || num <= 0 || num > kMaxSanePlayers) {
    return;
  }
  for (int32_t i = 0; i < num; ++i) {
    const uint32_t lp = ReadU32(base, data + static_cast<uint32_t>(i) * 4);
    if (lp == 0) {
      continue;
    }
    const uint32_t pc = ReadU32(base, lp + kLpActor);
    const uint32_t pawn = ObjectFieldOf(pc, ObjectClass(pc), "Pawn");
    if (pawn == 0) {
      RDAHM_INFO("[trace] p{} pawn=none", i);
      continue;
    }
    const TraceFields f = FieldsFor(ObjectClass(pawn));
    if (!f.valid) {
      RDAHM_INFO("[trace] p{} pawn {:#x}: Location/Velocity/Acceleration not resolvable", i, pawn);
      continue;
    }
    RDAHM_INFO(
        "[trace] p{} loc=({:.1f}, {:.1f}, {:.1f}) vel=({:.1f}, {:.1f}, {:.1f}) "
        "acc=({:.1f}, {:.1f}, {:.1f})",
        i, ReadF32(base, pawn + f.location), ReadF32(base, pawn + f.location + 4),
        ReadF32(base, pawn + f.location + 8), ReadF32(base, pawn + f.velocity),
        ReadF32(base, pawn + f.velocity + 4), ReadF32(base, pawn + f.velocity + 8),
        ReadF32(base, pawn + f.acceleration), ReadF32(base, pawn + f.acceleration + 4),
        ReadF32(base, pawn + f.acceleration + 8));
  }
}

//=============================================================================
// Spawn offset
//=============================================================================
// Moving a Pawn after the fact is the wrong tool: a raw Location write desyncs
// the collision hash, and the native that does it properly (FarMoveActor) is
// not identified in this build -- sub_8276FAE0, the neighbour that looked like
// it, turned out to be FindSpot.
//
// So the offset is applied where the location is still just a parameter. Every
// actor Login spawns goes through UWorld::SpawnActor (sub_8276E728), whose
// third argument is `const FVector& Location` in r6. Confirmed from the call in
// UGameEngine::Tick at 0x827448C0, which builds a zero FVector on the stack at
// var_148/144/140 and passes it in r6 with r7 as the FRotator and r8-r10 as the
// Template / bNoCollisionFail / bRemoteOwned zeros the UE3 signature expects.
//
// The window is narrow on purpose: only while our own SpawnPlayActor call is on
// the stack, and only for a location that is non-zero and finite. Components
// and inventory spawn at the origin and are left alone. Every adjustment is
// logged with its before and after, so an r6 that turns out not to be the
// location is visible in one line rather than as silent corruption.

// Armed for exactly one Pawn spawn. The first version of this was armed for the
// whole SpawnPlayActor call and wrote through the caller's FVector without
// putting it back, which was wrong three times over: Login spawns dozens of
// actors, the caller reuses one FVector buffer for many of them, and the offset
// therefore accumulated -- the log showed each spawn's input being the previous
// spawn's output, walking unrelated level actors hundreds of units out of place.
//
// So now: only while our own SpawnPlayActor is in flight, only for a class that
// derives from Pawn, only once, and the caller's vector is restored the moment
// the inner call returns.
std::atomic<bool> g_spawn_offset_armed{false};
std::atomic<float> g_spawn_offset_x{0.0f};
std::atomic<float> g_spawn_offset_y{0.0f};
std::atomic<float> g_spawn_offset_z{0.0f};

bool FiniteAndNonZero(float x, float y, float z) {
  const bool finite = __builtin_isfinite(x) && __builtin_isfinite(y) && __builtin_isfinite(z);
  return finite && (x != 0.0f || y != 0.0f || z != 0.0f);
}

// Walk UField::SuperField looking for "Pawn". Bounded, so a corrupt chain
// cannot spin, and it only runs during the one-shot window.
bool ClassDerivesFromPawn(uint32_t cls) {
  uint32_t c = cls;
  for (int depth = 0; depth < 24 && c != 0; ++depth) {
    if (RedahmReadObjectName(c) == "Pawn") {
      return true;
    }
    c = RedahmReadU32(c + kRedahmStructSuperOffset);
  }
  return false;
}

}  // namespace

REX_HOOK_RAW(sub_8276E728) {
  // Saved across the inner call: r6 is volatile, so the pointer has to be kept
  // in a host local to restore through afterwards.
  uint32_t loc = 0;
  float ox = 0.0f;
  float oy = 0.0f;
  float oz = 0.0f;

  if (g_spawn_offset_armed.load(std::memory_order_relaxed) && ctx.r6.u32 != 0) {
    const uint32_t candidate = ctx.r6.u32;
    const float x = ReadF32(base, candidate);
    const float y = ReadF32(base, candidate + 4);
    const float z = ReadF32(base, candidate + 8);
    if (FiniteAndNonZero(x, y, z) && ClassDerivesFromPawn(ctx.r4.u32)) {
      loc = candidate;
      ox = x;
      oy = y;
      oz = z;
      const float nx = x + g_spawn_offset_x.load(std::memory_order_relaxed);
      const float ny = y + g_spawn_offset_y.load(std::memory_order_relaxed);
      const float nz = z + g_spawn_offset_z.load(std::memory_order_relaxed);
      WriteF32(base, loc, nx);
      WriteF32(base, loc + 4, ny);
      WriteF32(base, loc + 8, nz);
      g_spawn_offset_armed.store(false, std::memory_order_relaxed);
      RDAHM_INFO("[split] pawn spawn offset ({}, {}, {}) -> ({}, {}, {})", x, y, z, nx, ny, nz);
    }
  }

  __imp__sub_8276E728(ctx, base);

  // Hand the caller back exactly the vector it passed in. The actor is already
  // placed; leaving our value in the buffer is what corrupted everything that
  // spawned after it.
  if (loc != 0) {
    WriteF32(base, loc, ox);
    WriteF32(base, loc + 4, oy);
    WriteF32(base, loc + 8, oz);
  }
}

namespace {

//=============================================================================
// Add / remove
//=============================================================================

bool AddPlayer(PPCContext& __restrict ctx, uint8_t* base, int controller_id, std::string& detail) {
  const uint32_t engine = ReadU32(base, kGEngine);
  if (engine == 0) {
    detail = "GEngine is null";
    return false;
  }
  if (ReadU32(base, kGWorld) == 0) {
    detail = "GWorld is null -- no level is loaded yet";
    return false;
  }
  // Removal takes the entry out of GamePlayers, so normally there is nothing
  // here to find. This branch survives for the case where an entry is somehow
  // left behind with a null Actor: reusing it is strictly better than adding a
  // second entry for the same controller, which would push Num to 2 with only
  // one live player and put the frame back into a phantom split.
  const int32_t existing = FindPlayerIndex(base, engine, controller_id);
  uint32_t reuse = 0;
  if (existing >= 0) {
    reuse = ReadU32(base, ReadU32(base, engine + kGamePlayers) +
                              static_cast<uint32_t>(existing) * 4);
    if (reuse == 0 || ReadU32(base, reuse + kLpActor) != 0) {
      detail = "controller " + std::to_string(controller_id) + " already has a live player";
      return false;
    }
  }

  const int32_t num_before = static_cast<int32_t>(ReadU32(base, engine + kGamePlayers + 4));
  if (num_before < 0 || num_before >= kMaxSanePlayers) {
    detail = "GamePlayers.Num is " + std::to_string(num_before) + "; refusing to touch it";
    return false;
  }

  uint32_t cls = 0;
  uint32_t gerror = 0;
  if (reuse == 0) {
    cls = ReadU32(base, kLocalPlayerClass);
    if (cls == 0) {
      detail = "ULocalPlayer UClass cache is empty";
      return false;
    }
    // The one guess in this file that would fail silently, so it is checked
    // before anything is allocated.
    const std::string cls_name = RedahmReadObjectName(cls);
    if (cls_name != "LocalPlayer") {
      detail = "class at " + std::to_string(kLocalPlayerClass) + " resolves to \"" + cls_name +
               "\", not LocalPlayer";
      return false;
    }
    gerror = ReadU32(base, kGError);
    if (gerror == 0) {
      // Not fatal -- StaticConstructObject only dereferences it on an error
      // path -- but it means a construction failure takes the process with it.
      Report("GError is null; a construction failure will not be reported cleanly");
    }
  }

  rex::ppc::stack_guard guard(ctx);

  // Two empty FStrings: the URL SpawnPlayActor parses, and the OutError it
  // fills in. Zeroed is a valid empty FString, and SpawnPlayActor substitutes
  // the engine's empty-string literal for a zero-length URL (0x826214F8).
  const uint32_t scratch = (ctx.r1.u32 - kRedZone - kSizeofFString * 2) & ~15u;
  std::memset(base + scratch, 0, kSizeofFString * 2);
  const uint32_t url = scratch;
  const uint32_t out_error = scratch + kSizeofFString;
  ctx.r1.u32 = (scratch - kCalleeReserve) & ~15u;

  const uint32_t array = engine + kGamePlayers;
  uint32_t player = reuse;
  int32_t index = existing;

  if (reuse == 0) {
    {
      rex::CallFrame frame(ctx);
      player = GuestStaticConstructObject(frame, base, cls, engine, /*NAME_None*/ 0ull,
                                          /*Flags*/ 0u, /*Template*/ 0u, gerror,
                                          /*SubobjectRoot*/ 0u, /*InstanceGraph*/ 0u);
    }
    if (player == 0) {
      detail = "StaticConstructObject returned null";
      return false;
    }

    // FArray::Add, reproduced from UE3: bump Num, and only grow when it passes
    // Max. Realloc reads the new Max, so the store has to precede the call.
    index = num_before;
    const int32_t num_after = num_before + 1;
    WriteU32(base, array + 4, static_cast<uint32_t>(num_after));
    if (num_after > static_cast<int32_t>(ReadU32(base, array + 8))) {
      WriteU32(base, array + 8, static_cast<uint32_t>(num_after + 3 * num_after / 8 + 32));
      rex::CallFrame frame(ctx);
      GuestFArrayRealloc(frame, base, array, kPlayerPtrSize, kArrayAlignment);
    }
    const uint32_t data = ReadU32(base, array);
    if (data == 0) {
      WriteU32(base, array + 4, static_cast<uint32_t>(num_before));
      detail = "GamePlayers.Data is null after grow";
      return false;
    }
    WriteU32(base, data + static_cast<uint32_t>(index) * 4, player);
  } else {
    Report("reusing parked player at index " + std::to_string(index));
  }

  WriteU32(base, player + kLpControllerId, static_cast<uint32_t>(controller_id));
  const uint32_t vc_off = ViewportClientOffset(base, engine);
  if (vc_off != 0xFFFFFFFFu) {
    WriteU32(base, player + vc_off, ReadU32(base, engine + kGameViewport));
  }
  // Before SpawnPlayActor, so the new player never renders full-screen over
  // player 0 for the frames between the two.
  ApplyLayout(base, engine, LayoutFromCVar());

  // Offset this player's spawn away from the players already in the world, so
  // it does not land inside one of their collision cylinders. Fanned out by
  // index rather than always the same direction, so a third player does not
  // land on the second.
  const float offset = static_cast<float>(REXCVAR_GET(splitscreen_spawn_offset));
  const float lift = static_cast<float>(REXCVAR_GET(splitscreen_spawn_lift));
  if (offset > 0.0f || lift > 0.0f) {
    const float angle = 1.0471976f * static_cast<float>(index);  // 60 degrees apart
    g_spawn_offset_x.store(offset * std::cos(angle), std::memory_order_relaxed);
    g_spawn_offset_y.store(offset * std::sin(angle), std::memory_order_relaxed);
    g_spawn_offset_z.store(lift, std::memory_order_relaxed);
    g_spawn_offset_armed.store(true, std::memory_order_relaxed);
  }

  uint32_t ok = 0;
  {
    rex::CallFrame frame(ctx);
    ok = GuestSpawnPlayActor(frame, base, player, url, out_error);
  }
  g_spawn_offset_armed.store(false, std::memory_order_relaxed);
  const std::string engine_error = ReadGuestFString(base, out_error);

  if (ok == 0 || ReadU32(base, player + kLpActor) == 0) {
    if (reuse == 0) {
      // Roll the array back. The UObject itself is left to the GC: it is
      // unreferenced now, and destroying a half-initialised one by hand is a
      // worse risk than one collection cycle of garbage.
      WriteU32(base, array + 4, static_cast<uint32_t>(num_before));
    }
    // A reused player just stays parked -- it was already in the array and
    // already had a null Actor, so there is nothing to undo.
    ApplyLayout(base, engine, LayoutFromCVar());
    detail = "SpawnPlayActor failed" + (engine_error.empty() ? std::string(" (no OutError)")
                                                             : ": " + engine_error);
    return false;
  }

  // Login spawns the Pawn but never runs the game's default-inventory path for
  // it, which is why player 2 arrives with Weapon and AltWeapon both None.
  // CPPawn::AddDefaultInventory takes no parameters, so it can be called
  // directly. Queued rather than called inline so it lands on the next drain,
  // giving Login a frame to finish settling the Pawn first.
  if (REXCVAR_GET(splitscreen_auto_loadout)) {
    PendingOp loadout;
    loadout.kind = PendingOp::Kind::kCall;
    loadout.controller_id = controller_id;
    loadout.target = 0;  // resolve this controller's Pawn when it runs
    loadout.function = "AddDefaultInventory";
    std::lock_guard<std::mutex> lock(g_mutex);
    g_queue.push_back(std::move(loadout));
  }

  detail = "player " + std::to_string(index) + " at " + std::to_string(player) + ", Actor " +
           std::to_string(ReadU32(base, player + kLpActor));
  if (!engine_error.empty()) {
    detail += ", OutError: " + engine_error;
  }
  return true;
}

// Call a zero-argument UnrealScript function on an object, through the object's
// own ProcessEvent. Anything with parameters is refused rather than called with
// a zeroed buffer, because a wrong argument block is a good way to corrupt the
// object we are trying to fix.
bool CallScriptFunction(PPCContext& __restrict ctx, uint8_t* base, uint32_t obj,
                        const std::string& name, std::string& detail) {
  if (obj == 0) {
    detail = "null object";
    return false;
  }
  const uint32_t cls = RedahmReadU32(obj + kRedahmObjectClassOffset);
  const uint32_t func = FindScriptFunction(cls, name);
  if (func == 0) {
    detail = "no function \"" + name + "\" on " + RedahmClassChain(cls);
    return false;
  }
  const uint32_t parms_size = ReadU16(base, func + kFuncParmsSize);
  if (parms_size != 0) {
    detail = "\"" + name + "\" takes " + std::to_string(parms_size) +
             " bytes of parameters; only zero-argument calls are supported";
    return false;
  }

  const uint32_t vtable = ReadU32(base, obj);
  const uint32_t fnptr = ReadU32(base, vtable + kSlotProcessEvent);
  PPCFunc* fn = rex::runtime::ResolveIndirectFunction(fnptr);
  if (fn == nullptr) {
    detail = "could not resolve ProcessEvent at vtable+0xE4 (" + std::to_string(fnptr) + ")";
    return false;
  }

  rex::ppc::stack_guard guard(ctx);
  // ProcessEvent allocas its own frame and memcpys ParmsSize from ours, which
  // is zero here -- but hand it a real, zeroed buffer rather than null so a
  // miscounted ParmsSize reads defined memory instead of wherever null lands.
  const uint32_t parms = (ctx.r1.u32 - kRedZone - 64) & ~15u;
  std::memset(base + parms, 0, 64);
  ctx.r1.u32 = (parms - kCalleeReserve) & ~15u;

  RDAHM_INFO("[split] calling {}.{} (func {:#x}, ProcessEvent {:#x})", RedahmObjectPath(obj), name,
             func, fnptr);
  {
    rex::CallFrame frame(ctx);
    frame.ctx.r3.u32 = obj;
    frame.ctx.r4.u32 = func;
    frame.ctx.r5.u32 = parms;
    fn(frame.ctx, base);
  }
  detail = "called " + name;
  return true;
}

bool RemovePlayer(PPCContext& __restrict ctx, uint8_t* base, int controller_id,
                  std::string& detail) {
  const uint32_t engine = ReadU32(base, kGEngine);
  if (engine == 0) {
    detail = "GEngine is null";
    return false;
  }
  const int32_t index = FindPlayerIndex(base, engine, controller_id);
  if (index < 0) {
    detail = "no player bound to controller " + std::to_string(controller_id);
    return false;
  }
  if (index == 0) {
    detail = "refusing to remove player 0";
    return false;
  }

  const uint32_t data = ReadU32(base, engine + kGamePlayers);
  const uint32_t player = ReadU32(base, data + static_cast<uint32_t>(index) * 4);
  const uint32_t controller = player == 0 ? 0 : ReadU32(base, player + kLpActor);
  const uint32_t world = ReadU32(base, kGWorld);

  // This sequence is UE3's UGameViewportClient::RemovePlayer, in its order,
  // because the first version of it was not and that crashed a frame later:
  //
  //   if (ExPlayer->Actor) { ExPlayer->Actor->eventDestroy(); ExPlayer->Actor = NULL; }
  //   GEngine->GamePlayers.RemoveItem(ExPlayer);
  //   ExPlayer->ViewportClient = NULL;
  //
  // Two things about it are load-bearing.
  //
  // Only the PlayerController is destroyed. The earlier version destroyed the
  // Pawn first, which fires Pawn::Destroyed -> Controller::PawnDied -> this
  // game's death and respawn script, and then tore down the controller that
  // script was still running on. AController::Destroyed already destroys its
  // own Pawn, so doing it by hand was both redundant and the likely fault.
  //
  // And the destroy happens while the player is still in GamePlayers, because
  // teardown script can look a player up by controller id and must find it.
  // The player really does come out of GamePlayers.
  //
  // An earlier version "parked" it instead -- left the ULocalPlayer in the
  // array with a null Actor and a zero rect -- on the theory that pulling it
  // out was what crashed. The A/B that followed disproved that: park plus
  // DestroyActor still died, park without DestroyActor did not, and the very
  // first version of this file removed from the array without destroying
  // anything and also did not. The crash is DestroyActor, full stop.
  //
  // Parking also cost more than it bought. Draw skips a null-Actor entry so no
  // view is rendered for it, but GamePlayers.Num stays at 2, and both the
  // engine and the game test that count to decide whether they are in
  // split-screen at all. The result was player 0 holding a full-screen view
  // rect inside a frame still configured as a split, which is what left the
  // lower half black.
  RDAHM_INFO("[split] remove: player={:#x} controller={:#x} world={:#x}", player, controller,
             world);

  bool destroyed = false;
  if (controller != 0 && world != 0 && REXCVAR_GET(splitscreen_destroy_on_remove)) {
    RDAHM_INFO("[split] remove: step 1 - DestroyActor(controller)");
    rex::CallFrame frame(ctx);
    destroyed = GuestDestroyActor(frame, base, world, controller, 0u, 1u) != 0;
  }
  RDAHM_INFO("[split] remove: step 2 - clear LocalPlayer::Actor (destroyed={})", destroyed);
  if (player != 0) {
    WriteU32(base, player + kLpActor, 0);
  }
  RDAHM_INFO("[split] remove: step 3 - FArray::Remove, Num back to {}", index);
  {
    rex::CallFrame frame(ctx);
    GuestFArrayRemove(frame, base, engine + kGamePlayers, static_cast<uint32_t>(index), 1u,
                      kPlayerPtrSize, kArrayAlignment);
  }
  // ULocalPlayer::ViewportClient is deliberately left pointing at the viewport.
  //
  // A previous version cleared it here, reasoning that a removed player should
  // not hold a back-reference to a viewport that no longer lists it. That was a
  // guess with nothing behind it, and it was the only difference between this
  // path and the earlier version that removed players without crashing -- so it
  // was the cause. The ULocalPlayer outlives removal until the GC collects it,
  // and UE3 dereferences ViewportClient from the UI, the console and every
  // viewport-size query without null-checking it first. A stale-but-valid
  // pointer on an object that is about to be collected is harmless; a null one
  // is a crash waiting for the next thing that looks at it.
  RDAHM_INFO("[split] remove: step 4 - reapply layout");
  ApplyLayout(base, engine, LayoutFromCVar());
  RDAHM_INFO("[split] remove: all steps returned");

  detail = "removed index " + std::to_string(index) + "; PlayerController " +
           (controller == 0 ? "was already null"
                            : (destroyed ? "destroyed" : "left in the world"));
  return true;
}

}  // namespace

//=============================================================================
// Public API
//=============================================================================

void RedahmSetSplitLayout(RedahmSplitLayout layout) {
  REXCVAR_SET(splitscreen_layout, static_cast<int32_t>(layout));
}

RedahmSplitLayout RedahmGetSplitLayout() {
  return LayoutFromCVar();
}

void RedahmRequestAddPlayer(int controller_id) {
  std::lock_guard<std::mutex> lock(g_mutex);
  PendingOp op;
  op.kind = PendingOp::Kind::kAdd;
  op.controller_id = controller_id;
  g_queue.push_back(std::move(op));
}

void RedahmRequestRemovePlayer(int controller_id) {
  std::lock_guard<std::mutex> lock(g_mutex);
  PendingOp op;
  op.kind = PendingOp::Kind::kRemove;
  op.controller_id = controller_id;
  g_queue.push_back(std::move(op));
}

void RedahmRequestScriptCall(uint32_t object, std::string function) {
  std::lock_guard<std::mutex> lock(g_mutex);
  PendingOp op;
  op.kind = PendingOp::Kind::kCall;
  op.target = object;
  op.function = std::move(function);
  g_queue.push_back(std::move(op));
}

std::vector<std::string> RedahmSplitscreenLog() {
  std::lock_guard<std::mutex> lock(g_mutex);
  return {g_log.begin(), g_log.end()};
}

RedahmSplitscreenState RedahmSplitscreenSnapshot() {
  RedahmSplitscreenState s;
  s.layout = LayoutFromCVar();
  s.viewport_client_offset = g_viewport_client_offset;
  if (RedahmGuestBase() == nullptr) {
    return s;
  }
  s.engine = RedahmReadU32(kGEngine);
  s.world = RedahmReadU32(kGWorld);
  s.local_player_class = RedahmReadU32(kLocalPlayerClass);
  if (s.local_player_class != 0) {
    s.local_player_class_name = RedahmReadObjectName(s.local_player_class);
  }
  if (s.engine == 0) {
    return s;
  }
  s.viewport = RedahmReadU32(s.engine + kGameViewport);
  s.data = RedahmReadU32(s.engine + kGamePlayers);
  s.num = static_cast<int32_t>(RedahmReadU32(s.engine + kGamePlayers + 4));
  s.max = static_cast<int32_t>(RedahmReadU32(s.engine + kGamePlayers + 8));
  if (s.data == 0 || s.num <= 0 || s.num > kMaxSanePlayers) {
    return s;
  }
  for (int32_t i = 0; i < s.num; ++i) {
    RedahmLocalPlayer p;
    p.addr = RedahmReadU32(s.data + static_cast<uint32_t>(i) * 4);
    if (p.addr != 0) {
      p.controller_id = static_cast<int32_t>(RedahmReadU32(p.addr + kLpControllerId));
      p.actor = RedahmReadU32(p.addr + kLpActor);
      const uint32_t ox = RedahmReadU32(p.addr + kLpOriginX);
      const uint32_t oy = RedahmReadU32(p.addr + kLpOriginY);
      const uint32_t sx = RedahmReadU32(p.addr + kLpSizeX);
      const uint32_t sy = RedahmReadU32(p.addr + kLpSizeY);
      std::memcpy(&p.origin_x, &ox, 4);
      std::memcpy(&p.origin_y, &oy, 4);
      std::memcpy(&p.size_x, &sx, 4);
      std::memcpy(&p.size_y, &sy, 4);
    }
    s.players.push_back(p);
  }
  return s;
}

void RedahmDrainSplitscreen(PPCContext& __restrict ctx, uint8_t* base) {
  const uint32_t engine = ReadU32(base, kGEngine);
  if (engine == 0) {
    return;
  }

  // One line the first time the player list is readable, so a run that never
  // gets as far as adding a player still says what the engine looked like.
  static bool logged_once = false;
  if (!logged_once) {
    const int32_t num = static_cast<int32_t>(ReadU32(base, engine + kGamePlayers + 4));
    if (num > 0) {
      logged_once = true;
      Report("GEngine " + std::to_string(engine) + ", GamePlayers.Num " + std::to_string(num) +
             ", GameViewport " + std::to_string(ReadU32(base, engine + kGameViewport)));
    }
  }

  for (;;) {
    PendingOp op;
    {
      std::lock_guard<std::mutex> lock(g_mutex);
      if (g_queue.empty()) {
        break;
      }
      op = g_queue.front();
      g_queue.pop_front();
    }
    std::string detail;
    // Logged before the call: every path here runs guest code, and if one
    // faults this line is the only record of what was being attempted.
    bool ok = false;
    switch (op.kind) {
      case PendingOp::Kind::kAdd:
        RDAHM_INFO("[split] add player for controller {}", op.controller_id);
        ok = AddPlayer(ctx, base, op.controller_id, detail);
        Report("add controller " + std::to_string(op.controller_id) + " -> " +
               (ok ? "ok" : "failed") + " (" + detail + ")");
        break;
      case PendingOp::Kind::kRemove:
        RDAHM_INFO("[split] remove player for controller {}", op.controller_id);
        ok = RemovePlayer(ctx, base, op.controller_id, detail);
        Report("remove controller " + std::to_string(op.controller_id) + " -> " +
               (ok ? "ok" : "failed") + " (" + detail + ")");
        break;
      case PendingOp::Kind::kCall: {
        uint32_t target = op.target;
        if (target == 0) {
          // Deferred resolve: the player was created in an earlier drain and
          // its Pawn only exists now.
          const int32_t idx = FindPlayerIndex(base, engine, op.controller_id);
          if (idx >= 0) {
            const uint32_t lp =
                ReadU32(base, ReadU32(base, engine + kGamePlayers) + static_cast<uint32_t>(idx) * 4);
            const uint32_t pc = lp == 0 ? 0 : ReadU32(base, lp + kLpActor);
            target = ObjectFieldOf(pc, ObjectClass(pc), "Pawn");
          }
        }
        ok = CallScriptFunction(ctx, base, target, op.function, detail);
        Report("call " + op.function + " on " + std::to_string(target) + " -> " +
               (ok ? "ok" : "failed") + " (" + detail + ")");
        break;
      }
    }
  }

  if (REXCVAR_GET(splitscreen_auto_player2)) {
    // Only ever tried once per level: a GameInfo that refuses the login will
    // refuse it every frame, and retrying that at 60Hz would bury the log.
    static uint32_t last_world = 0;
    const uint32_t world = ReadU32(base, kGWorld);
    if (world != 0 && world != last_world &&
        ReadU32(base, engine + kGamePlayers + 4) == 1) {
      last_world = world;
      RedahmRequestAddPlayer(1);
    }
  }

  // Hold predicated tiling off, if asked. Re-asserted every frame rather than
  // once, because the engine picks the tiling arrangement itself and would
  // otherwise turn it back on the next time it reconfigures.
  if (REXCVAR_GET(splitscreen_disable_tiling) && ReadU32(base, kTilingEnabled) != 0) {
    WriteU32(base, kTilingEnabled, 0);
    RDAHM_INFO("[split] predicated tiling disabled (was on, mode {})", ReadU32(base, kTilingMode));
  }

  SampleTrace(base, engine);
  ApplyLayout(base, engine, LayoutFromCVar());
}

//=============================================================================
// Console commands
//=============================================================================

REXCVAR_DEFINE_COMMAND_ARGS(
    splitscreen_trace,
    [](std::string_view args) {
      int seconds = 5;
      if (!args.empty()) {
        seconds = std::atoi(std::string(args).c_str());
      }
      seconds = std::clamp(seconds, 1, 30);
      g_trace_tick = 0;
      g_trace_frames.store(seconds * 60, std::memory_order_relaxed);
      RDAHM_INFO("[trace] sampling every player's pawn for {}s -- push the stick now", seconds);
    },
    "POTF/Splitscreen",
    "Log every local player's Location/Velocity/Acceleration at 10Hz for N seconds (default 5)");

REXCVAR_DEFINE_COMMAND_ARGS(
    splitscreen_add_player,
    [](std::string_view args) {
      int id = 1;
      if (!args.empty()) {
        id = std::atoi(std::string(args).c_str());
      }
      RedahmRequestAddPlayer(id);
    },
    "POTF/Splitscreen", "Create a local player for the given controller id (default 1)");

REXCVAR_DEFINE_COMMAND_ARGS(
    splitscreen_remove_player,
    [](std::string_view args) {
      int id = 1;
      if (!args.empty()) {
        id = std::atoi(std::string(args).c_str());
      }
      RedahmRequestRemovePlayer(id);
    },
    "POTF/Splitscreen", "Remove the local player bound to the given controller id (default 1)");

namespace {

// Fields worth seeing even when they match, because agreement is itself the
// answer for some of them: two Pawns reporting the same Location every frame
// says the second one is not being integrated at all, whereas a nonzero
// Velocity next to a frozen Location says it is being integrated and blocked.
constexpr const char* kPawnKeyFields[] = {
    "Location",     "Rotation",  "Velocity",      "Acceleration", "Physics",
    "PhysicsVolume", "Base",     "bCollideWorld", "bBlockActors", "bCollideActors",
    "Controller",   "bHidden",   "DrivenVehicle", "Health",       "bHardAttach",
};

constexpr const char* kControllerKeyFields[] = {
    "Pawn",       "Player",        "PlayerReplicationInfo", "bIsPlayer",  "bFrozen",
    "ViewTarget", "PlayerCamera",  "myHUD",                 "PlayerInput", "Role",
    "RemoteRole", "bCheatFlying",  "StateName",
};

std::string ValueOf(uint32_t obj, uint32_t cls, const char* name) {
  RedahmProperty p;
  if (!RedahmFindProperty(cls, name, p)) {
    return "<no such property>";
  }
  return RedahmFormatPropertyValue(p, obj, 0);
}

void ReportPair(const char* label, uint32_t a, uint32_t b, const char* const* fields,
                size_t field_count) {
  if (a == 0 || b == 0) {
    RDAHM_INFO("[split] {}: p0={:#x} p1={:#x} -- one side is null, nothing to compare", label, a,
               b);
    return;
  }
  const uint32_t ca = ObjectClass(a);
  const uint32_t cb = ObjectClass(b);
  RDAHM_INFO("[split] {} p0 {:#x} {} [{}]", label, a, RedahmObjectPath(a), RedahmClassChain(ca));
  RDAHM_INFO("[split] {} p1 {:#x} {} [{}]", label, b, RedahmObjectPath(b), RedahmClassChain(cb));
  if (ca != cb) {
    RDAHM_INFO("[split] {}: classes differ -- that alone may be the bug", label);
  }

  for (size_t i = 0; i < field_count; ++i) {
    const char* name = fields[i];
    const std::string va = ValueOf(a, ca, name);
    const std::string vb = ValueOf(b, cb, name);
    RDAHM_INFO("[split]   {:<24} p0={:<28} p1={}{}", name, va, vb, va == vb ? "" : "   <-- differs");
  }

  // Everything else the class declares, differences only. The key-field list
  // above is a guess at what matters; this is the part that does not depend on
  // the guess being right.
  int shown = 0;
  for (const RedahmProperty& p : RedahmEnumerateProperties(ca)) {
    bool is_key = false;
    for (size_t i = 0; i < field_count; ++i) {
      if (p.name == fields[i]) {
        is_key = true;
        break;
      }
    }
    if (is_key) {
      continue;
    }
    RedahmProperty pb;
    if (!RedahmFindProperty(cb, p.name.c_str(), pb)) {
      continue;
    }
    const std::string va = RedahmFormatPropertyValue(p, a, 0);
    const std::string vb = RedahmFormatPropertyValue(pb, b, 0);
    if (va == vb) {
      continue;
    }
    if (++shown > 120) {
      RDAHM_INFO("[split]   ... more differences suppressed");
      break;
    }
    RDAHM_INFO("[split]   {:<24} p0={:<28} p1={}", p.name, va, vb);
  }
  if (shown == 0) {
    RDAHM_INFO("[split]   (no other property differs)");
  }
}

}  // namespace

namespace {

// Resolve a console-friendly target name to a guest object.
//   pawn0 / pawn1 / ...   the Pawn of that local player
//   pc0 / pc1 / ...       that local player's PlayerController
//   cheat0 / cheat1 / ... that player's CheatManager
//   0x1234abcd            a literal object address
uint32_t ResolveTarget(std::string_view spec) {
  if (spec.size() > 2 && spec[0] == '0' && (spec[1] == 'x' || spec[1] == 'X')) {
    return static_cast<uint32_t>(std::strtoul(std::string(spec).c_str(), nullptr, 16));
  }
  size_t prefix = 0;
  const char* field = nullptr;
  if (spec.rfind("pawn", 0) == 0) {
    prefix = 4;
    field = "Pawn";
  } else if (spec.rfind("cheat", 0) == 0) {
    prefix = 5;
    field = "CheatManager";
  } else if (spec.rfind("pc", 0) == 0) {
    prefix = 2;
  } else {
    return 0;
  }

  const int idx = std::atoi(std::string(spec.substr(prefix)).c_str());
  const RedahmSplitscreenState s = RedahmSplitscreenSnapshot();
  if (idx < 0 || static_cast<size_t>(idx) >= s.players.size()) {
    return 0;
  }
  const uint32_t pc = s.players[static_cast<size_t>(idx)].actor;
  if (field == nullptr) {
    return pc;
  }
  return ObjectFieldOf(pc, ObjectClass(pc), field);
}

// Split "target rest..." into the two halves, tolerating the leading and
// trailing whitespace the console leaves on arguments -- the exec log shows
// commands arriving as e.g. `PressButton_A true ` with a trailing space.
std::pair<std::string, std::string> SplitArgs(std::string_view args) {
  const size_t begin = args.find_first_not_of(" \t");
  if (begin == std::string_view::npos) {
    return {std::string(), std::string()};
  }
  const size_t end = args.find_last_not_of(" \t");
  args = args.substr(begin, end - begin + 1);

  const size_t sp = args.find_first_of(" \t");
  if (sp == std::string_view::npos) {
    return {std::string(args), std::string()};
  }
  const size_t rest = args.find_first_not_of(" \t", sp);
  return {std::string(args.substr(0, sp)),
          rest == std::string_view::npos ? std::string() : std::string(args.substr(rest))};
}

}  // namespace

REXCVAR_DEFINE_COMMAND_ARGS(
    splitscreen_list_functions,
    [](std::string_view args) {
      RedahmResetReadCache();
      // Not a structured binding: the comma inside [a, b] is not protected from
      // the preprocessor, and this whole lambda is a macro argument.
      const auto parts = SplitArgs(args);
      const std::string& filter = parts.second;
      // Defaults to player 1's Pawn, so the bare command does the useful thing
      // and the result does not depend on whether arguments arrived.
      const std::string target = parts.first.empty() ? std::string("pawn1") : parts.first;
      RDAHM_INFO("[split] list_functions: raw args=\"{}\" target=\"{}\" filter=\"{}\"", args,
                 target, filter);
      const uint32_t obj = ResolveTarget(target);
      if (obj == 0) {
        RDAHM_INFO(
            "[split] could not resolve \"{}\" -- expected pawn0|pc0|pawn1|pc1 or 0xADDR, and the "
            "player must exist",
            target);
        return;
      }
      const uint32_t cls = ObjectClass(obj);
      RDAHM_INFO("[split] {} {:#x} [{}]", RedahmObjectPath(obj), obj, RedahmClassChain(cls));
      int shown = 0;
      for (const ScriptFunction& f : ListScriptFunctions(cls)) {
        if (!filter.empty() && f.name.find(filter) == std::string::npos) {
          continue;
        }
        RDAHM_INFO("[split]   {:<40} parms={:<5} props={:<5} flags={:#x}  ({})", f.name,
                   f.parms_size, f.properties_size, f.flags, f.owner);
        if (++shown >= 400) {
          RDAHM_INFO("[split]   ... truncated");
          break;
        }
      }
      RDAHM_INFO("[split] {} function(s) listed", shown);
    },
    "POTF/Splitscreen",
    "List the UnrealScript functions on a target's class chain, optionally filtered by substring");

REXCVAR_DEFINE_COMMAND_ARGS(
    splitscreen_call,
    [](std::string_view args) {
      const auto parts = SplitArgs(args);
      const std::string& function = parts.second;
      const uint32_t obj = ResolveTarget(parts.first);
      if (obj == 0 || function.empty()) {
        RDAHM_INFO("[split] usage: splitscreen_call <pawn0|pc0|pawn1|pc1|0xADDR> <FunctionName>");
        return;
      }
      RedahmRequestScriptCall(obj, function);
    },
    "POTF/Splitscreen",
    "Call a zero-argument UnrealScript function on a target, via its own ProcessEvent");

REXCVAR_DEFINE_COMMAND(
    splitscreen_list_cheats,
    []() {
      RedahmResetReadCache();
      // Zero-argument on purpose: argument passing to these lambdas is still
      // unproven, and this needs to work regardless.
      const uint32_t obj = ResolveTarget("cheat1");
      if (obj == 0) {
        RDAHM_INFO("[split] player 1 has no CheatManager (is player 2 spawned?)");
        return;
      }
      const uint32_t cls = ObjectClass(obj);
      RDAHM_INFO("[split] {} {:#x} [{}]", RedahmObjectPath(obj), obj, RedahmClassChain(cls));
      int shown = 0;
      for (const ScriptFunction& f : ListScriptFunctions(cls)) {
        // Only the ones we could actually invoke.
        if (f.parms_size != 0) {
          continue;
        }
        RDAHM_INFO("[split]   {:<40} props={:<5} flags={:#x}  ({})", f.name, f.properties_size,
                   f.flags, f.owner);
        if (++shown >= 300) {
          RDAHM_INFO("[split]   ... truncated");
          break;
        }
      }
      RDAHM_INFO("[split] {} zero-argument cheat function(s) on player 1's CheatManager", shown);
    },
    "POTF/Splitscreen",
    "List the zero-argument functions on player 1's CheatManager (AllWeapons, AllAmmo, ...)");

REXCVAR_DEFINE_COMMAND(
    splitscreen_give_weapons,
    []() {
      const RedahmSplitscreenState s = RedahmSplitscreenSnapshot();
      int queued = 0;
      // Player 0 is skipped: it got its loadout from the game's own start path
      // and running it again would hand it a duplicate set.
      RedahmResetReadCache();
      for (size_t i = 1; i < s.players.size(); ++i) {
        const uint32_t pc = s.players[i].actor;
        if (pc == 0) {
          continue;
        }
        const uint32_t pawn = ObjectFieldOf(pc, ObjectClass(pc), "Pawn");
        if (pawn == 0) {
          continue;
        }
        RedahmRequestScriptCall(pawn, "AddDefaultInventory");
        ++queued;
      }
      RDAHM_INFO("[split] queued AddDefaultInventory for {} player(s)", queued);
    },
    "POTF/Splitscreen", "Give every local player after the first its default weapons");

REXCVAR_DEFINE_COMMAND(
    splitscreen_diff_players,
    []() {
      RedahmResetReadCache();
      const RedahmSplitscreenState s = RedahmSplitscreenSnapshot();
      if (s.players.size() < 2) {
        RDAHM_INFO("[split] need two local players to diff; have {}", s.players.size());
        return;
      }
      const uint32_t pc0 = s.players[0].actor;
      const uint32_t pc1 = s.players[1].actor;
      ReportPair("PlayerController", pc0, pc1, kControllerKeyFields,
                 std::size(kControllerKeyFields));

      const uint32_t pawn0 = ObjectFieldOf(pc0, ObjectClass(pc0), "Pawn");
      const uint32_t pawn1 = ObjectFieldOf(pc1, ObjectClass(pc1), "Pawn");
      ReportPair("Pawn", pawn0, pawn1, kPawnKeyFields, std::size(kPawnKeyFields));
    },
    "POTF/Splitscreen",
    "Compare player 0 and player 1's PlayerController and Pawn field by field");

REXCVAR_DEFINE_COMMAND(
    splitscreen_dump,
    []() {
      const RedahmSplitscreenState s = RedahmSplitscreenSnapshot();
      RDAHM_INFO("[split] GEngine={:#x} GWorld={:#x} GameViewport={:#x}", s.engine, s.world,
                 s.viewport);
      RDAHM_INFO("[split] LocalPlayer UClass={:#x} (\"{}\")", s.local_player_class,
                 s.local_player_class_name);
      RDAHM_INFO("[split] GamePlayers Data={:#x} Num={} Max={}", s.data, s.num, s.max);
      RDAHM_INFO("[split] tiling enabled={} mode={} render width={}", RedahmReadU32(kTilingEnabled),
                 RedahmReadU32(kTilingMode), RedahmReadU32(kRenderWidth));
      for (size_t i = 0; i < s.players.size(); ++i) {
        const auto& p = s.players[i];
        RDAHM_INFO("[split]   [{}] {:#x} controller={} Actor={:#x} origin=({}, {}) size=({}, {})",
                   i, p.addr, p.controller_id, p.actor, p.origin_x, p.origin_y, p.size_x, p.size_y);
      }
    },
    "POTF/Splitscreen", "Log GEngine's local player list and each player's viewport rect");

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
// Two things live here:
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

#include <rex/hook.h>

#include <atomic>
#include <cstdint>
#include <deque>
#include <mutex>
#include <string>

#include "redahm_logging.h"

REX_EXTERN(__imp__sub_8261FDE0);

namespace {

// Gate byte checked by Exec before it offers a command to any exec component.
constexpr uint32_t kExecComponentGate = 0x8371A8C6;

// Latched from a real Exec call. `this` is a heap pointer and differs per run,
// so it must be observed rather than hardcoded.
std::atomic<uint32_t> g_exec_this{0};
std::atomic<uint32_t> g_exec_ar{0};

std::mutex g_queue_mutex;
std::deque<std::string> g_queue;

// Guards against recursing into the drain when our own Exec call re-enters the
// hook, and against draining while the guest is already inside Exec.
thread_local bool t_in_dispatch = false;

constexpr int kMaxLoggedCommands = 64;
std::atomic<int> g_logged{0};

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

// An Ar in the image range is a global output device and stays valid; one on a
// guest stack belongs to the caller's frame and must not be reused later.
bool IsStableOutputDevice(uint32_t addr) {
  return addr >= 0x82000000 && addr < 0x837F0000;
}

// Run one command through Exec, reusing the current guest thread's context.
// The scratch buffer for the command string is carved below the live stack
// pointer and the pointer is moved below it, so the callee's own frame cannot
// overlap it.
void RunCommand(PPCContext& __restrict ctx, uint8_t* base, const std::string& cmd) {
  const uint32_t self = g_exec_this.load(std::memory_order_relaxed);
  const uint32_t ar = g_exec_ar.load(std::memory_order_relaxed);
  if (!self || !ar) {
    return;
  }

  const uint32_t saved_r1 = ctx.r1.u32;
  const uint32_t saved_r3 = ctx.r3.u32;
  const uint64_t saved_lr = ctx.lr;
  const uint64_t saved_ctr = ctx.ctr.u64;

  const uint32_t bytes = static_cast<uint32_t>((cmd.size() + 1) * 2);
  const uint32_t buf = (saved_r1 - bytes - 64) & ~15u;

  uint8_t* p = base + buf;
  for (size_t i = 0; i < cmd.size(); ++i) {
    p[i * 2] = 0;
    p[i * 2 + 1] = static_cast<uint8_t>(cmd[i]);
  }
  p[cmd.size() * 2] = 0;
  p[cmd.size() * 2 + 1] = 0;

  ctx.r1.u32 = buf - 64;
  ctx.r3.u32 = self;
  ctx.r4.u32 = buf;
  ctx.r5.u32 = ar;

  __imp__sub_8261FDE0(ctx, base);

  const uint32_t handled = ctx.r3.u32;

  ctx.r1.u32 = saved_r1;
  ctx.r3.u32 = saved_r3;
  ctx.lr = saved_lr;
  ctx.ctr.u64 = saved_ctr;

  RDAHM_INFO("[exec] ran \"{}\" -> {}", cmd, handled ? "handled" : "unhandled");
}

}  // namespace

void RedahmDrainConsoleQueue(PPCContext& __restrict ctx, uint8_t* base) {
  if (t_in_dispatch) {
    return;
  }

  // Keep the gate asserted: it is a single byte and cheap to rewrite, which
  // also covers the game re-initialising that region.
  base[kExecComponentGate] = 1;

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
    t_in_dispatch = true;
    RunCommand(ctx, base, cmd);
    t_in_dispatch = false;
  }
}

// Queue a console command to run on the next drain. Safe to call from any
// thread; the command runs on a guest thread.
void RedahmQueueConsoleCommand(std::string cmd) {
  if (cmd.empty()) {
    return;
  }
  std::lock_guard<std::mutex> lock(g_queue_mutex);
  g_queue.push_back(std::move(cmd));
}

bool RedahmConsoleReady() { return g_exec_this.load(std::memory_order_relaxed) != 0; }

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

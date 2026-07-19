// 60 FPS unlock for Destroy All Humans! Path of the Furon (Unreal Engine 3).
//
// The title runs a stock UE3 variable-delta loop: FEngineLoop measures the
// frame's DeltaSeconds from the CPU timebase (appCycles, guest sub_82BEA278)
// and passes it to UGameEngine::Tick(FLOAT DeltaSeconds) (guest sub_82743F40).
// Gameplay/physics are therefore delta-timed, not fixed-stepped.
//
// The 30 FPS lock is the engine's frame-rate smoothing. Each iteration the
// launch loop asks UGameEngine::GetMaxTickRate() for the target rate and
// sleeps to hold it. That virtual is guest sub_82743E38: it smooths the
// frametime, converts to FPS, clamps to the viewport min/max and quantizes
// the result to the tiers 30 / 25 / 20 / 15 (top tier = 30.0f). It returns
// the cap in f1; a return of 0.0 is UE3's convention for "no cap".
//
// Because the simulation consumes the real measured delta, lifting this cap
// lets the loop run at 60 with correct motion speed. We defer to the original
// (so its internal smoothing state stays consistent) and only raise a cap it
// actually asked for -- never introducing one where the engine wanted none.
//
// Caveats still worth watching at runtime: any UE3 DeltaSeconds clamp in the
// launch loop, gameplay/anim timers authored for 30 Hz, and whether the host
// present path actually paces at 60 Hz. See the F1 FPS overlay to confirm.

#include <rex/hook.h>

#include <atomic>
#include <chrono>
#include <functional>
#include <thread>

#include "redahm_logging.h"

// Actual VdSwap present count, incremented in hooks.cpp's Hook_VdSwap_FrameTick.
extern std::atomic<uint32_t> g_vdswap_presents;
// Hash of the thread that issues presents (set in Hook_VdSwap_FrameTick).
extern std::atomic<size_t> g_present_tid;

namespace {
// Target frame-rate cap. 60.0 to double the shipped 30 FPS ceiling.
constexpr double kTargetFps = 60.0;
}  // namespace

REX_EXTERN(__imp__sub_82743E38);
REX_EXTERN(__imp__sub_82743F40);
REX_EXTERN(__imp__sub_82E83588);
REX_EXTERN(__imp__sub_82E694E0);

// D3D device create. sub_823912F0 builds a D3DPRESENT_PARAMETERS with
// PresentationInterval = D3DPRESENT_INTERVAL_TWO (2) whenever vsync is on,
// which flips the front buffer every 2nd vblank => a hard 30 fps display cap
// (the game thread already ticks at 60 via the GetMaxTickRate hook above).
// The params pointer is arg 5 (r7); PresentationInterval sits at +0x34 in the
// standard Xbox 360 D3DPRESENT_PARAMETERS layout. Rewrite INTERVAL_TWO ->
// INTERVAL_ONE so the flip happens every vblank = 60 fps. Leave INTERVAL_ONE
// and INTERVAL_IMMEDIATE (0x80000000, vsync off) untouched.
REX_HOOK_RAW(sub_82E694E0) {
  const uint32_t params = ctx.r7.u32;
  if (params) {
    auto* present_interval = reinterpret_cast<rex::be_u32*>(base + params + 0x34);
    if (*present_interval == 2u) {
      *present_interval = 1u;
      RDAHM_INFO("[fps] present interval D3DPRESENT_INTERVAL_TWO -> ONE (60fps unlock)");
    }
  }
  __imp__sub_82E694E0(ctx, base);
}

// Guest return address (caller) of the most recent VdSwap/present, so we can
// tell which code path is issuing the ~30/s flips.
static std::atomic<uint32_t> g_last_swap_lr{0};

// D3DDevice swap (issues VdSwap). Record who called it.
REX_HOOK_RAW(sub_82E83588) {
  g_last_swap_lr.store(static_cast<uint32_t>(ctx.lr), std::memory_order_relaxed);
  __imp__sub_82E83588(ctx, base);
}

// UGameEngine::GetMaxTickRate() -> FLOAT (returned in f1)
REX_HOOK_RAW(sub_82743E38) {
  __imp__sub_82743E38(ctx, base);

  // 0.0 means the engine wants an uncapped frame; leave that untouched so we
  // only ever loosen the limiter, never tighten it. Any real cap (30/25/20/15)
  // is lifted to our target.
  if (ctx.f1.f64 > 0.0 && ctx.f1.f64 < kTargetFps) {
    ctx.f1.f64 = kTargetFps;
  }
}

// UGameEngine::Tick(FLOAT DeltaSeconds) -- exactly one call per rendered frame.
// This is the authoritative frame counter, and ctx.f1 (DeltaSeconds) tells us
// what frame time the simulation actually believes it is running at:
//   ~0.0333 => sim thinks 30 fps,  ~0.0167 => sim thinks 60 fps.
REX_HOOK_RAW(sub_82743F40) {
  const double delta_seconds = ctx.f1.f64;

  static std::atomic<uint32_t> frames{0};
  static std::atomic<double> delta_sum{0.0};
  const uint32_t n = frames.fetch_add(1) + 1;
  delta_sum.store(delta_sum.load() + delta_seconds);

  using clock = std::chrono::steady_clock;
  static clock::time_point last = clock::now();
  const auto now = clock::now();
  if (now - last >= std::chrono::seconds(1)) {
    last = now;
    const double avg_delta = delta_sum.load() / (n ? n : 1);
    const uint32_t presents = g_vdswap_presents.exchange(0, std::memory_order_relaxed);
    const size_t tick_tid = std::hash<std::thread::id>{}(std::this_thread::get_id());
    const size_t present_tid = g_present_tid.load(std::memory_order_relaxed);
    RDAHM_INFO(
        "[fps] Tick frames/s={} present/s={} avg_delta={:.4f}s (sim~{:.1f}fps) same_thread={} "
        "swap_caller_lr={:#010x}",
        n, presents, avg_delta, avg_delta > 0.0 ? 1.0 / avg_delta : 0.0,
        present_tid != 0 && present_tid == tick_tid,
        g_last_swap_lr.load(std::memory_order_relaxed));
    frames.store(0);
    delta_sum.store(0.0);
  }

  __imp__sub_82743F40(ctx, base);
}

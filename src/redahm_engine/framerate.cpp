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
REX_HOOK_RAW(sub_82743F40) {
  __imp__sub_82743F40(ctx, base);
}
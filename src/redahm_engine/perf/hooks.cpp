#include "redahm_engine/overlays/fps_overlay.h"
#include "redahm_engine/gpu/core/frame_cost.h"
#include "redahm_engine/settings/graphics_settings.h"
#include <rex/hook.h>
#include <cstdint>
#include <cstring>
#include "generated/redahm_init.h"
#include "redahm_engine/redahm_logging.h"
#include <algorithm>
#include <atomic>
#include <bit>
#include <chrono>
#include <functional>
#include <thread>
#include <rex/cvar.h>
#include <rex/system/kernel_state.h>
#include <rex/system/xmemory.h>
#include <rex/types.h>

REXCVAR_DEFINE_BOOL(disable_motion_blur, false, "POTF/Graphics", "Disable camera/object motion blur (UMotionBlurEffect)");

FpsOverlayDialog* g_fps_overlay = nullptr;

std::atomic<uint32_t> g_vdswap_presents{0};

std::atomic<size_t> g_present_tid{0};

// GMalloc (dword_837370D8) is UE3's FMallocThreadSafeProxy: Malloc, Realloc
// and Free (sub_82297318, sub_82297378, sub_822973E0) each take the critical
// section at proxy+12 around the real allocator. It is initialised with no
// spin count, and the runtime's RtlEnterCriticalSection only spins as many
// times as the section's header says (byte 1, in units of 256), so every
// collision between the game and render threads became a host
// WaitForSingleObject and the matching RtlLeaveCriticalSection a SetEvent:
// about 14% of both threads in Shen Long. UE3's PC build gives its critical
// sections a spin count of 4000; the same is written here once GMalloc is up.
namespace {

constexpr u32 kGMalloc = 0x837370D8;
constexpr u32 kThreadSafeProxyMalloc = 0x82297318;
constexpr u32 kVtableMallocSlot = 12;
constexpr u32 kProxyCriticalSection = 12;
constexpr uint8_t kEventSynchronizationObject = 1;
constexpr uint8_t kMallocSpinCountDiv256 = 16;

void RaiseMallocLockSpinCount() {
    static bool done = false;
    if (done)
        return;
    auto* memory = REX_KERNEL_MEMORY();
    const u32 proxy = *memory->TranslateVirtual<be_u32*>(kGMalloc);
    if (!proxy)
        return;
    const u32 vtable = *memory->TranslateVirtual<be_u32*>(proxy);
    if (!vtable || *memory->TranslateVirtual<be_u32*>(vtable + kVtableMallocSlot) !=
                       kThreadSafeProxyMalloc)
        return;
    auto* header = memory->TranslateVirtual<uint8_t*>(proxy + kProxyCriticalSection);
    if (header[0] != kEventSynchronizationObject)
        return;
    header[1] = kMallocSpinCountDiv256;
    done = true;
    RDAHM_INFO("[malloc] GMalloc lock at {:08X} now spins {} times before waiting",
               proxy + kProxyCriticalSection, kMallocSpinCountDiv256 * 256);
}

}  // namespace

void Hook_VdSwap_FrameTick() {
    RaiseMallocLockSpinCount();
    static std::atomic<bool> cfg_logged{false};
    if (!cfg_logged.exchange(true)) {
        RDAHM_INFO("[cfg] disable_motion_blur={}", REXCVAR_GET(disable_motion_blur));
    }
    redahm::graphics_settings::ApplyPerFrame();
    g_vdswap_presents.fetch_add(1, std::memory_order_relaxed);
    g_present_tid.store(std::hash<std::thread::id>{}(std::this_thread::get_id()),
                        std::memory_order_relaxed);
    if (g_fps_overlay)
        g_fps_overlay->RecordFrame();
}

// Canvas vertices: sub_828A7A40 is FBatchedElements::AddVertex (batch,
// &Position, &UV, &Color, HitProxyId), appending a 48-byte FSimpleElementVertex
// to the TArray at batch+48 and returning its index. Its TArray add
// (sub_82294AC0, slack mode 2) only rounds the count up to a multiple of 4, so
// text drawn through FCanvas::DrawTile (sub_8242BFA0, 4 vertices per glyph)
// reallocates the whole array for nearly every glyph. Past the small-block
// pool FMallocXenon::Realloc (sub_82298130) takes fresh pages, copies and
// frees the old ones on every call, and on the host that went through
// NtAllocateVirtualMemory: 25-50% of the render thread in game, and frames of
// 40-50 ms. The array is grown by half its size instead before each add, so
// the original finds room and only bumps the count.
namespace {

struct GuestArray {
  be_u32 data;
  rex::be<i32> num;
  rex::be<i32> max;
};

constexpr u32 kBatchedVerticesOffset = 48;
constexpr u32 kSimpleElementVertexSize = 48;
constexpr u32 kSimpleElementVertexAlignment = 8;
// Below this the pool allocator is cheap and the original slack is kept.
constexpr i32 kGeometricGrowthFrom = 64;

}  // namespace

// sub_82294520 reallocates a TArray's data to max * element size.
REX_IMPORT(__imp__sub_82294520, ReallocGuestArray, void(u32, u32, u32));
REX_IMPORT(__imp__sub_828A7A40, BatchedElementsAddVertex, u32(u32, u32, u32, u32, u32));

// Logged every 10 s so a run shows whether the hook is doing the work.
struct AddVertexStats {
  u64 calls = 0;
  u64 grown = 0;       // geometric grows done here
  u64 small_grows = 0; // grows left to the original (below kGeometricGrowthFrom)
  i32 largest = 0;
  std::chrono::steady_clock::time_point next_log{};
};
AddVertexStats g_add_vertex_stats;

u32 BatchedElementsAddVertex_hook(u32 batch, u32 position, u32 uv, u32 color, u32 hit_proxy) {
  auto* array = REX_KERNEL_MEMORY()->TranslateVirtual<GuestArray*>(batch + kBatchedVerticesOffset);
  const i32 num = array->num;
  const i32 max = array->max;
  auto& stats = g_add_vertex_stats;
  ++stats.calls;
  stats.largest = std::max(stats.largest, num + 1);
  if (num + 1 > max) {
    if (num >= kGeometricGrowthFrom) {
      array->max = (num + num / 2 + 3) & ~3;
      ReallocGuestArray(batch + kBatchedVerticesOffset, kSimpleElementVertexSize,
                        kSimpleElementVertexAlignment);
      ++stats.grown;
    } else {
      ++stats.small_grows;
    }
  }
  if ((stats.calls & 0xFFF) == 0) {
    const auto now = std::chrono::steady_clock::now();
    if (now >= stats.next_log) {
      RDAHM_INFO("[canvas] AddVertex: {} calls, {} geometric grows, {} small grows, largest "
                 "batch {} vertices",
                 stats.calls, stats.grown, stats.small_grows, stats.largest);
      stats = {};
      stats.next_log = now + std::chrono::seconds(10);
    }
  }
  return BatchedElementsAddVertex(batch, position, uv, color, hit_proxy);
}
REX_HOOK(sub_828A7A40, BatchedElementsAddVertex_hook);

// Spike log timings (redahm_gpu's LogDrawStatsLocked prints them for any frame
// over 25 ms). The title's game and render threads wait for each other by
// polling with SleepEx (sub_82E67BA0): FRenderCommandFence::Wait
// (sub_822B4BF8) at the end of every game tick, the render command ring when it
// is full (sub_823661A0), and the render thread's command loop when it is
// empty. Time a thread spends in SleepEx is therefore time spent waiting on the
// other one.
namespace {

thread_local u64 t_guest_sleep_ns = 0;

u64 NowNs() {
    return u64(std::chrono::duration_cast<std::chrono::nanoseconds>(
                   std::chrono::steady_clock::now().time_since_epoch())
                   .count());
}

}  // namespace

namespace redahm::gpu::cost {

u64 TakeGuestSleepNs() {
    const u64 slept = t_guest_sleep_ns;
    t_guest_sleep_ns = 0;
    return slept;
}

}  // namespace redahm::gpu::cost

REX_HOOK_RAW(sub_82E67BA0) {
    const u64 start = NowNs();
    __imp__sub_82E67BA0(ctx, base);
    t_guest_sleep_ns += NowNs() - start;
}

// sub_82292EA0 is FEngineLoop::Tick, one game thread frame.
REX_HOOK_RAW(sub_82292EA0) {
    const u64 start = NowNs();
    const u64 slept_before = t_guest_sleep_ns;
    __imp__sub_82292EA0(ctx, base);
    auto& guest = redahm::gpu::cost::Guest();
    guest.game_tick_ns.store(NowNs() - start, std::memory_order_relaxed);
    guest.game_tick_sleep_ns.store(t_guest_sleep_ns - slept_before, std::memory_order_relaxed);
}

// Frame limiter: sub_82743E38 is UGameEngine::GetMaxTickRate (GEngine vtable
// +284), which appUpdateTimeAndHandleMaxTickRate (sub_822913F8) sleeps and
// spins to. With frame smoothing on it clamps the averaged rate to
// MinSmoothedFrameRate..MaxSmoothedFrameRate (18..32 in Coalesced.ini) and then
// snaps it down to 30, 25, 20 or 15; the 30 is the constant flt_835FC83C,
// which is why raising MaxSmoothedFrameRate never lifted the cap. Returning 0
// turns the limiter off; the renderer paces presents to redahm_frame_cap.
REX_HOOK_RAW(sub_82743E38) {
    (void)base;
    ctx.f1.f64 = 0.0;
}

// Motion blur: UMotionBlurEffect::CreateSceneProxy (0x8276D060) returns null so
// the post-process chain builds no motion-blur proxy. TOML uses return_on_true.
bool DisableMotionBlur(PPCRegister& r3) {
    if (!REXCVAR_GET(disable_motion_blur))
        return false;
    r3.u64 = 0;
    return true;
}

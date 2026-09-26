#include "present/present.h"

#include <algorithm>
#include <atomic>
#include <chrono>
#include <cstring>
#include <mutex>
#include <thread>

#if defined(_WIN32)
#include <windows.h>
#endif

#include <SDL3/SDL_video.h>
#include <plume_render_interface.h>

#include "core/frame_cost.h"
#include "core/log.h"
#include "core/settings.h"
#include "draw/draw.h"
#include "render/gpu_thread.h"
#include "render/host.h"
#include "render/host_pipelines.h"
#include "resources/resources.h"

namespace redahm::gpu {

namespace {

OverlayDrawHook g_overlay_hook;
std::atomic<u64> g_frames{0};
std::atomic<bool> g_guest_presented{false};
std::atomic<bool> g_in_overlay{false};

struct BackBuffer {
  plume::RenderTexture* texture = nullptr;
  plume::RenderFramebuffer* framebuffer = nullptr;
  u32 width = 0;
  u32 height = 0;
};

//------------------------------------------------------------------------------
// Frame rate cap
//------------------------------------------------------------------------------

// The title's own limiter (UE3's frame smoothing, which snapped to 30) is off,
// so guest presents are paced here to redahm_frame_cap. The game thread
// follows: UE3 lets it run only a frame ahead of the render thread.
using LimiterClock = std::chrono::steady_clock;
LimiterClock::time_point g_next_present{};

// Spun rather than slept, since timer wakeups are late by up to this much.
constexpr auto kLimiterSpin = std::chrono::microseconds(500);

double DisplayRefreshRate() {
  // The presenting thread and the FPS overlay both ask.
  static std::mutex mutex;
  static double rate = 60.0;
  static LimiterClock::time_point next_query{};
  std::lock_guard lock(mutex);
  const auto now = LimiterClock::now();
  if (now < next_query)
    return rate;
  next_query = now + std::chrono::seconds(2);
  int count = 0;
  SDL_Window** windows = SDL_GetWindows(&count);
  SDL_Window* window = (windows && count > 0) ? windows[0] : nullptr;
  SDL_free(windows);
  if (window) {
    const SDL_DisplayMode* mode = SDL_GetCurrentDisplayMode(SDL_GetDisplayForWindow(window));
    if (mode && mode->refresh_rate > 0.0f)
      rate = mode->refresh_rate;
  }
  return rate;
}

void SleepUntil(LimiterClock::time_point deadline) {
#if defined(_WIN32)
#if !defined(CREATE_WAITABLE_TIMER_HIGH_RESOLUTION)
#define CREATE_WAITABLE_TIMER_HIGH_RESOLUTION 0x00000002
#endif
  static HANDLE timer = [] {
    HANDLE t = CreateWaitableTimerExW(nullptr, nullptr, CREATE_WAITABLE_TIMER_HIGH_RESOLUTION,
                                      TIMER_ALL_ACCESS);
    return t ? t : CreateWaitableTimerExW(nullptr, nullptr, 0, TIMER_ALL_ACCESS);
  }();
  const auto remaining = deadline - LimiterClock::now();
  if (timer && remaining > kLimiterSpin) {
    LARGE_INTEGER due;
    due.QuadPart =
        -std::chrono::duration_cast<std::chrono::nanoseconds>(remaining - kLimiterSpin).count() /
        100;
    if (SetWaitableTimerEx(timer, &due, 0, nullptr, nullptr, nullptr, 0))
      WaitForSingleObject(timer, INFINITE);
  }
#else
  std::this_thread::sleep_until(deadline - kLimiterSpin);
#endif
  while (LimiterClock::now() < deadline)
    std::this_thread::yield();
}

void LimitFrameRate() {
  const u32 cap = settings::FrameCap();
  // Uncapped: only vsync, when on, holds presents back.
  if (cap == settings::kFrameCapOff) {
    g_next_present = {};
    return;
  }
  const double refresh = DisplayRefreshRate();
  const double rate = cap != settings::kFrameCapDisplay ? double(cap) : refresh;
  // Vsync already holds presents to the refresh rate.
  if (settings::Vsync() && rate >= refresh - 0.5) {
    g_next_present = {};
    return;
  }
  const auto period = std::chrono::duration_cast<LimiterClock::duration>(
      std::chrono::duration<double>(1.0 / rate));
  const auto now = LimiterClock::now();
  // First frame, or a frame that ran over a whole period: start again from now
  // instead of rushing the following frames to catch up.
  if (g_next_present == LimiterClock::time_point{} || now > g_next_present + period) {
    g_next_present = now + period;
    return;
  }
  SleepUntil(g_next_present);
  g_next_present += period;
}

// The swap chain image is acquired on the submit thread after this frame is
// recorded, so the present pass names the stand-ins the replay swaps it in
// for, at the size the submit thread last built the swap chain at.
BackBuffer PresentTarget() {
  auto& h = Host();
  BackBuffer back;
  back.texture = DeferredCommandList::BackBufferTexture();
  back.framebuffer = const_cast<plume::RenderFramebuffer*>(DeferredCommandList::BackBufferFramebuffer());
  back.width = h.swap_width.load(std::memory_order_acquire);
  back.height = h.swap_height.load(std::memory_order_acquire);
  return back;
}

void BeginPresentPassLocked(plume::RenderCommandList* list, const BackBuffer& back) {
  list->barriers(plume::RenderBarrierStage::GRAPHICS,
                 plume::RenderTextureBarrier(back.texture, plume::RenderTextureLayout::COLOR_WRITE));
  list->setFramebuffer(back.framebuffer);
  list->clearColor(0, plume::RenderColor(0.0f, 0.0f, 0.0f, 1.0f));
}

void DrawOverlayLocked(plume::RenderCommandList* list, const BackBuffer& back) {
  if (!g_overlay_hook)
    return;
  plume::RenderViewport viewport(0.0f, 0.0f, float(back.width), float(back.height));
  list->setViewports(&viewport, 1);
  plume::RenderRect scissor(0, 0, i32(back.width), i32(back.height));
  list->setScissors(&scissor, 1);
  g_in_overlay.store(true, std::memory_order_release);
  g_overlay_hook(list, back.framebuffer, back.width, back.height);
  g_in_overlay.store(false, std::memory_order_release);
  // The overlay may have bound anything; put the shared layout back.
  BindSharedLayoutLocked(list);
}

// Ends the present pass and hands the frame to the submit thread, which
// acquires the image, replays, submits and presents.
void FinishFrameLocked(plume::RenderCommandList* list, const BackBuffer& back) {
  list->setFramebuffer(nullptr);
  list->barriers(plume::RenderBarrierStage::GRAPHICS,
                 plume::RenderTextureBarrier(back.texture, plume::RenderTextureLayout::PRESENT));
  SubmitFrameLocked(true);
  InvalidateDrawBindingsLocked();
}

struct PresentPacket {
  u32 front_buffer_va = 0;
  u32 front_words[6] = {};
  SwapTiming timing;
};

void PresentFrameLocked(const PresentPacket& packet);

void RunPresent(const u8* payload, u32 /*size*/) {
  PresentPacket packet;
  std::memcpy(&packet, payload, sizeof(packet));
  PresentFrameLocked(packet);
}

}  // namespace

void SetOverlayDrawHook(OverlayDrawHook hook) {
  std::lock_guard lock(Host().mutex);
  g_overlay_hook = std::move(hook);
}

// The render thread waits here until the GPU thread has presented the frame,
// as it waited for its own present before: the next frame starts no earlier
// than it did, and only the draws still queued behind the render thread are
// waited for.
void PresentFrame(u32 front_buffer_va) {
  auto& h = Host();
  if (h.shutting_down.load(std::memory_order_acquire))
    return;
  LimitFrameRate();
  PresentPacket packet;
  packet.front_buffer_va = front_buffer_va;
  ReadTextureWords(front_buffer_va, packet.front_words);
  packet.timing.swap = cost::Clock::now();
  packet.timing.render_sleep_ns = cost::TakeGuestSleepNs();
  const u64 number = gpu_thread::Queue(RunPresent, packet);
  const auto wait_start = cost::Clock::now();
  gpu_thread::WaitFor(number);
  cost::Recording().wait_ns.fetch_add(
      u64(std::chrono::duration_cast<std::chrono::nanoseconds>(cost::Clock::now() - wait_start)
              .count()),
      std::memory_order_relaxed);
}

namespace {

void PresentFrameLocked(const PresentPacket& packet) {
  auto& h = Host();
  if (!h.ready || h.shutting_down.load(std::memory_order_acquire))
    return;
  g_guest_presented.store(true, std::memory_order_relaxed);
  LogDrawStatsLocked(packet.timing);

  plume::RenderCommandList* list = OpenCommandListLocked();
  if (!list)
    return;

  // The front buffer is a resolve destination; preparing it only transitions it.
  const u32 front_buffer_va = packet.front_buffer_va;
  HostTexture* front = GetTextureLocked(front_buffer_va, packet.front_words);
  if (front)
    PrepareTextureForSamplingLocked(*front, list);
  else
    GPU_WARN_LIMITED(4, "Swap front buffer {:08X} has no host texture", front_buffer_va);

  const BackBuffer back = PresentTarget();
  if (!back.width || !back.height) {
    // No swap chain area (minimized): still turn the frame over so the guest's
    // work does not pile up in one recording.
    SubmitFrameLocked(false);
    InvalidateDrawBindingsLocked();
    TickResourcesLocked(g_frames.fetch_add(1, std::memory_order_relaxed) + 1);
    return;
  }
  list = OpenPresentListLocked();
  BeginPresentPassLocked(list, back);

  if (front && front->slot != kInvalidSlot && front->width && front->height) {
    u32 fit_width = back.width;
    u32 fit_height = back.height;
    if (!settings::StretchOutput()) {
      const double source_aspect = double(front->width) / double(front->height);
      const double target_aspect = double(back.width) / double(std::max(back.height, u32(1)));
      if (target_aspect > source_aspect)
        fit_width = u32(double(back.height) * source_aspect + 0.5);
      else
        fit_height = u32(double(back.width) / source_aspect + 0.5);
    }
    const i32 offset_x = i32(back.width - fit_width) / 2;
    const i32 offset_y = i32(back.height - fit_height) / 2;
    plume::RenderViewport viewport{float(offset_x), float(offset_y), float(fit_width),
                                   float(fit_height)};
    list->setViewports(&viewport, 1);
    plume::RenderRect scissor(offset_x, offset_y, offset_x + i32(fit_width),
                              offset_y + i32(fit_height));
    list->setScissors(&scissor, 1);
    list->setPipeline(PresentPipelineLocked());
    HostPushConstants constants;
    constants.texture_slot = front->slot;
    constants.sampler_slot = kLinearClampSamplerSlot;
    constants.values[0] = 1.0f;
    constants.values[1] = 1.0f;
    SetHostPushConstantsLocked(list, constants);
    list->drawInstanced(3, 1, 0, 0);
  }

  DrawOverlayLocked(list, back);
  FinishFrameLocked(list, back);

  TickResourcesLocked(g_frames.fetch_add(1, std::memory_order_relaxed) + 1);
}

}  // namespace

void PresentOverlayFrame() {
  auto& h = Host();
  if (h.shutting_down.load(std::memory_order_acquire) ||
      g_guest_presented.load(std::memory_order_relaxed)) {
    return;
  }
  std::lock_guard lock(h.mutex);
  if (!h.ready)
    return;
  const BackBuffer back = PresentTarget();
  if (!back.width || !back.height || !OpenCommandListLocked())
    return;
  plume::RenderCommandList* list = OpenPresentListLocked();
  BeginPresentPassLocked(list, back);
  DrawOverlayLocked(list, back);
  FinishFrameLocked(list, back);
}

bool InOverlayDraw() {
  return g_in_overlay.load(std::memory_order_acquire);
}

u64 PresentedFrames() {
  return g_frames.load(std::memory_order_relaxed);
}

double FrameRateTarget() {
  const double refresh = DisplayRefreshRate();
  const u32 cap = settings::FrameCap();
  if (cap == settings::kFrameCapOff)
    return settings::Vsync() ? refresh : 0.0;
  const double rate = cap != settings::kFrameCapDisplay ? double(cap) : refresh;
  return settings::Vsync() ? std::min(rate, refresh) : rate;
}

}  // namespace redahm::gpu

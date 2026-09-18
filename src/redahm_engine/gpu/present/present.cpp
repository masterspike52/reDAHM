#include "present/present.h"

#include <algorithm>
#include <atomic>
#include <mutex>

#include <plume_render_interface.h>

#include "core/log.h"
#include "core/settings.h"
#include "draw/draw.h"
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
  u32 index = 0;
  plume::RenderTexture* texture = nullptr;
  plume::RenderFramebuffer* framebuffer = nullptr;
  u32 width = 0;
  u32 height = 0;
};

bool AcquireBackBufferLocked(BackBuffer& out) {
  auto& h = Host();
  const bool resize = h.resize_requested.exchange(false, std::memory_order_acq_rel);
  if (resize || h.swap_chain->needsResize() || h.swap_framebuffers.empty())
    ResizeSwapChainLocked();
  if (h.swap_framebuffers.empty())
    return false;

  FrameSlot& slot = h.frames[h.frame];
  if (!h.swap_chain->acquireTexture(slot.acquire_semaphore.get(), &out.index)) {
    if (!ResizeSwapChainLocked() ||
        !h.swap_chain->acquireTexture(slot.acquire_semaphore.get(), &out.index)) {
      return false;
    }
  }
  if (out.index >= h.swap_framebuffers.size())
    return false;
  out.texture = h.swap_chain->getTexture(out.index);
  out.framebuffer = h.swap_framebuffers[out.index].get();
  out.width = h.swap_chain->getWidth();
  out.height = h.swap_chain->getHeight();
  return true;
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

void FinishFrameLocked(plume::RenderCommandList* list, const BackBuffer& back) {
  auto& h = Host();
  list->setFramebuffer(nullptr);
  list->barriers(plume::RenderBarrierStage::GRAPHICS,
                 plume::RenderTextureBarrier(back.texture, plume::RenderTextureLayout::PRESENT));

  const u32 slot_index = h.frame;
  plume::RenderCommandSemaphore* waits[] = {h.frames[slot_index].acquire_semaphore.get()};
  plume::RenderCommandSemaphore* signals[] = {h.render_semaphores[back.index].get()};
  SubmitFrameLocked(waits, 1, signals, 1);

  h.swap_chain->setVsyncEnabled(settings::Vsync());
  if (!h.swap_chain->present(back.index, signals, 1))
    h.resize_requested.store(true, std::memory_order_release);

  InvalidateDrawBindingsLocked();
}

}  // namespace

void SetOverlayDrawHook(OverlayDrawHook hook) {
  std::lock_guard lock(Host().mutex);
  g_overlay_hook = std::move(hook);
}

void PresentFrame(u32 front_buffer_va) {
  auto& h = Host();
  if (h.shutting_down.load(std::memory_order_acquire))
    return;
  std::lock_guard lock(h.mutex);
  if (!h.ready || h.shutting_down.load(std::memory_order_acquire))
    return;
  g_guest_presented.store(true, std::memory_order_relaxed);
  LogDrawStatsLocked();

  plume::RenderCommandList* list = OpenCommandListLocked();
  if (!list)
    return;

  // The front buffer is a resolve destination; preparing it only transitions it.
  HostTexture* front = GetTextureLocked(front_buffer_va);
  if (front)
    PrepareTextureForSamplingLocked(*front, list);
  else
    GPU_WARN_LIMITED(4, "Swap front buffer {:08X} has no host texture", front_buffer_va);

  BackBuffer back;
  if (!AcquireBackBufferLocked(back)) {
    // No back buffer (minimized): still turn the frame over so the guest's
    // work does not pile up in one list.
    SubmitFrameLocked(nullptr, 0, nullptr, 0);
    InvalidateDrawBindingsLocked();
    TickResourcesLocked(g_frames.fetch_add(1, std::memory_order_relaxed) + 1);
    return;
  }
  // The resize above may have flushed the list.
  list = OpenCommandListLocked();
  if (!list)
    return;

  list->barriers(plume::RenderBarrierStage::GRAPHICS,
                 plume::RenderTextureBarrier(back.texture, plume::RenderTextureLayout::COLOR_WRITE));
  list->setFramebuffer(back.framebuffer);
  list->clearColor(0, plume::RenderColor(0.0f, 0.0f, 0.0f, 1.0f));

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

void PresentOverlayFrame() {
  auto& h = Host();
  if (h.shutting_down.load(std::memory_order_acquire) ||
      g_guest_presented.load(std::memory_order_relaxed)) {
    return;
  }
  std::lock_guard lock(h.mutex);
  if (!h.ready)
    return;
  BackBuffer back;
  if (!AcquireBackBufferLocked(back))
    return;
  plume::RenderCommandList* list = OpenCommandListLocked();
  if (!list)
    return;
  list->barriers(plume::RenderBarrierStage::GRAPHICS,
                 plume::RenderTextureBarrier(back.texture, plume::RenderTextureLayout::COLOR_WRITE));
  list->setFramebuffer(back.framebuffer);
  list->clearColor(0, plume::RenderColor(0.0f, 0.0f, 0.0f, 1.0f));
  DrawOverlayLocked(list, back);
  FinishFrameLocked(list, back);
}

bool InOverlayDraw() {
  return g_in_overlay.load(std::memory_order_acquire);
}

u64 PresentedFrames() {
  return g_frames.load(std::memory_order_relaxed);
}

}  // namespace redahm::gpu

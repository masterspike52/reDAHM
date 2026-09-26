#pragma once

// End of frame: the guest front buffer onto the swap chain, the ImGui overlay
// on top, present, then the frame ring advances.

#include <functional>

#include <rex/types.h>

namespace plume {
struct RenderCommandList;
struct RenderFramebuffer;
}  // namespace plume

namespace redahm::gpu {

// Records the overlay onto the bound back buffer. Called with Host().mutex
// held, from the GPU thread or the overlay-only present.
using OverlayDrawHook = std::function<void(plume::RenderCommandList* list,
                                           plume::RenderFramebuffer* framebuffer, u32 width,
                                           u32 height)>;

void SetOverlayDrawHook(OverlayDrawHook hook);

// D3DDevice_Swap. front_buffer_va is the resolved guest front buffer texture.
// Queues the present for the GPU thread and waits until it has run.
void PresentFrame(u32 front_buffer_va);

// Overlay-only present for before the guest has a device (path setup).
// Does nothing once the guest presents.
void PresentOverlayFrame();

u64 PresentedFrames();

// Frames per second presents are paced to: redahm_frame_cap, or the display's
// refresh rate for "display", held to the refresh rate while vsync is on. 0
// when nothing paces them (cap off, vsync off).
double FrameRateTarget();

// True on the presenting thread's overlay callback, while it holds
// Host().mutex on the drawer's behalf.
bool InOverlayDraw();

}  // namespace redahm::gpu

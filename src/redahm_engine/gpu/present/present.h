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
// held, from the thread presenting.
using OverlayDrawHook = std::function<void(plume::RenderCommandList* list,
                                           plume::RenderFramebuffer* framebuffer, u32 width,
                                           u32 height)>;

void SetOverlayDrawHook(OverlayDrawHook hook);

// D3DDevice_Swap. front_buffer_va is the resolved guest front buffer texture.
void PresentFrame(u32 front_buffer_va);

// Overlay-only present for before the guest has a device (path setup).
// Does nothing once the guest presents.
void PresentOverlayFrame();

u64 PresentedFrames();

// True on the presenting thread's overlay callback, while it holds
// Host().mutex on the drawer's behalf.
bool InOverlayDraw();

}  // namespace redahm::gpu

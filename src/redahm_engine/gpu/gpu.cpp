#include "gpu.h"

#include <plume_render_interface.h>
#include <rex/ui/imgui_drawer.h>
#include <rex/ui/windowed_app_context.h>

#include "core/log.h"
#include "overlay/imgui_drawer.h"
#include "present/present.h"
#include "render/host.h"

namespace redahm::gpu {

bool Initialize(rex::ui::Window* window) {
  return CreateHostDevice(window);
}

void InstallOverlay(rex::ui::WindowedAppContext& app_context, rex::ui::ImGuiDrawer* drawer) {
  if (!drawer)
    return;
  SetOverlayDrawHook([&app_context, drawer](plume::RenderCommandList* list,
                                             plume::RenderFramebuffer* framebuffer, u32 width,
                                             u32 height) {
    // The UI thread runs shutdown and stops pumping; waiting on it here would
    // hold the renderer lock forever.
    if (Host().shutting_down.load(std::memory_order_acquire) || !drawer->HasDialogs())
      return;
    app_context.CallInUIThreadSynchronous([drawer, list, framebuffer, width, height] {
      OverlayDrawContext context(width, height, list, framebuffer);
      drawer->Draw(context);
    });
  });
}

std::unique_ptr<rex::ui::ImmediateDrawer> CreateOverlayDrawer() {
  return std::make_unique<OverlayDrawer>();
}

void PresentOverlayOnly() {
  PresentOverlayFrame();
}

void OnWindowResized() {
  RequestResize();
}

void Shutdown() {
  ShutdownHost();
}

}  // namespace redahm::gpu

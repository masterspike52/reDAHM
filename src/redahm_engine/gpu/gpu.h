#pragma once

// The renderer's surface for the app: bring-up, the overlay drawer and the
// window events it cares about. Everything else is reached through the D3D
// hooks under hooks/.

#include <functional>
#include <memory>

namespace rex::ui {
class ImGuiDrawer;
class ImmediateDrawer;
class Window;
class WindowedAppContext;
}  // namespace rex::ui

namespace redahm::gpu {

// Creates the plume device and swap chain against the window. Safe to call
// again; returns the first result.
bool Initialize(rex::ui::Window* window);

// Routes the ImGui overlay into every presented frame. Present runs on a
// guest thread and ImGui is UI-thread only, so the draw is marshalled there
// while the presenting thread waits.
void InstallOverlay(rex::ui::WindowedAppContext& app_context, rex::ui::ImGuiDrawer* drawer);

std::unique_ptr<rex::ui::ImmediateDrawer> CreateOverlayDrawer();

// Presents only the overlay; for UI shown before the guest renders.
void PresentOverlayOnly();

void OnWindowResized();

void Shutdown();

}  // namespace redahm::gpu

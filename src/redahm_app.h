// redahm - ReXGlue Recompiled Project
//
// This file is yours to edit. 'rexglue migrate' will NOT overwrite it.
// Customize your app by overriding virtual hooks from rex::ReXApp.

#pragma once

#include <atomic>
#include <chrono>
#include <thread>

#include <rex/rex_app.h>
#include "redahm_engine/crash_reporter.h"
#include "redahm_engine/graphics_menu.h"
#include "redahm_engine/mod_loader.h"
#include "redahm_engine/path_setup_wizard.h"
#include <rex/runtime.h>
#include "redahm_engine/gpu/gpu.h"
#include "redahm_engine/overlays/redahm_logging_overlay.h"
#include "redahm_engine/overlays/fps_overlay.h"

class RedahmApp : public rex::ReXApp {
 public:
  using rex::ReXApp::ReXApp;

  static std::unique_ptr<rex::ui::WindowedApp> Create(
      rex::ui::WindowedAppContext& ctx) {
    return std::unique_ptr<RedahmApp>(new RedahmApp(ctx, "redahm",
        PPCImageConfig));
  }

  ~RedahmApp() override { StopOverlayPump(); }

  // The plume renderer in src/redahm_engine/gpu owns presentation: no SDK GPU
  // plugin, detached ImGui drawer.
  void OnPreSetup(rex::RuntimeConfig& config) override {
      config.graphics = nullptr;
      config.gpu_plugin.clear();
  }

  std::unique_ptr<rex::ui::ImmediateDrawer> OnCreateImmediateDrawer() override {
      return redahm::gpu::CreateOverlayDrawer();
  }

  void OnCreateDialogs(rex::ui::ImGuiDrawer* drawer) override {
      drawer->AddDialog(new REDAHMLogOverlayDialog(drawer));
      path_wizard_ = new PathSetupWizard(drawer);
      drawer->AddDialog(path_wizard_);
      auto* fps = new FpsOverlayDialog(drawer);
      drawer->AddDialog(fps);
      g_fps_overlay = fps;
  }

  // The config the SDK loads (redahm.toml beside the exe); the GRAPHICS page
  // in the Options menu saves there.
  void OnConfigurePaths(rex::PathConfig& paths) override {
      // The earliest hook the app gets; setup from here on can throw.
      redahm::crash::InstallTerminateHandler();
      redahm::graphics_menu::SetConfigPath(paths.config_path);
      redahm::mods::SetConfigPath(paths.config_path);
  }

  // game: is mounted by now and the title hasn't run: put the enabled mods in
  // front of it.
  void OnPostSetup() override {
      redahm::mods::Install(runtime());
  }

  std::optional<rex::PathConfig> OnFinalizePaths(
      const rex::PathConfig& defaults,
      std::function<void(rex::PathConfig)> resume) override
  {
      if (!path_wizard_) {
          RDAHM_ERROR("Path wizard was never created (no overlay drawer); falling back to "
                      "default paths without prompting");
          return defaults;
      }
      // The wizard needs frames before the guest renders any.
      if (!StartRenderer())
          return defaults;
      const bool resolved = path_wizard_->Init(
          GetName(), defaults, [this, resume](rex::PathConfig paths) {
              // The wizard completes from inside an overlay frame, which holds
              // the renderer lock; bring the runtime up after it returns.
              app_context().CallInUIThreadDeferred([this, resume, paths] {
                  StopOverlayPump();
                  resume(paths);
              });
          });
      if (!resolved)
          StartOverlayPump();
      return std::nullopt;
  }

  void OnPreLaunchModule() override {
      redahm::crash::InstallCrashReporter();
      StartRenderer();
  }

  void OnWindowPixelSizeChanged(uint32_t pixel_width, uint32_t pixel_height) override {
      (void)pixel_width;
      (void)pixel_height;
      redahm::gpu::OnWindowResized();
  }

  void OnShutdown() override {
      StopOverlayPump();
      redahm::gpu::Shutdown();
  }

private:
    bool StartRenderer() {
        if (renderer_started_)
            return true;
        if (!redahm::gpu::Initialize(window())) {
            RDAHM_ERROR("Renderer initialization failed");
            return false;
        }
        redahm::gpu::InstallOverlay(app_context(), imgui_drawer());
        renderer_started_ = true;
        return true;
    }

    // Ticks come from a helper thread: a UI thread tick that re-queues itself
    // would starve window events.
    void StartOverlayPump() {
        StopOverlayPump();
        pump_stop_.store(false);
        pump_thread_ = std::thread([this] {
            while (!pump_stop_.load()) {
                if (!pump_pending_.exchange(true)) {
                    app_context().CallInUIThreadDeferred([this] {
                        redahm::gpu::PresentOverlayOnly();
                        pump_pending_.store(false);
                    });
                }
                std::this_thread::sleep_for(std::chrono::milliseconds(16));
            }
        });
    }

    void StopOverlayPump() {
        pump_stop_.store(true);
        if (pump_thread_.joinable() && pump_thread_.get_id() != std::this_thread::get_id())
            pump_thread_.join();
    }

    PathSetupWizard* path_wizard_ = nullptr;
    bool renderer_started_ = false;
    std::thread pump_thread_;
    std::atomic<bool> pump_stop_{true};
    std::atomic<bool> pump_pending_{false};
};

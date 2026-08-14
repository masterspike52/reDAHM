
// redahm - ReXGlue Recompiled Project
//
// This file is yours to edit. 'rexglue migrate' will NOT overwrite it.
// Customize your app by overriding virtual hooks from rex::ReXApp.

#pragma once

#include <rex/rex_app.h>
#include "redahm_engine/path_setup_wizard.h"
#include <rex/runtime.h>
#include "redahm_engine/overlays/redahm_logging_overlay.h"
#include "redahm_engine/audio/xaudio2_audio_system.h"
#include "redahm_engine/overlays/fps_overlay.h"
#include "redahm_engine/overlays/debug_command_overlay.h"
#include "redahm_engine/overlays/object_browser_overlay.h"

class RedahmApp : public rex::ReXApp {
 public:
  using rex::ReXApp::ReXApp;

  static std::unique_ptr<rex::ui::WindowedApp> Create(
      rex::ui::WindowedAppContext& ctx) {
    return std::unique_ptr<RedahmApp>(new RedahmApp(ctx, "redahm",
        PPCImageConfig));
  }


  void OnPreSetup(rex::RuntimeConfig& config) override {
      config.audio_factory = [](rex::runtime::FunctionDispatcher* fd) {
          return xaudio2::XAudio2AudioSystem::Create(fd);
          };
  }


  void OnCreateDialogs(rex::ui::ImGuiDrawer* drawer) override {
      drawer->AddDialog(new REDAHMLogOverlayDialog(drawer));
      drawer->AddDialog(new DebugCommandOverlayDialog(drawer));
      drawer->AddDialog(new ObjectBrowserDialog(drawer));
      path_wizard_ = new PathSetupWizard(drawer);
      drawer->AddDialog(path_wizard_);
      auto* fps = new FpsOverlayDialog(drawer);
      drawer->AddDialog(fps);
      g_fps_overlay = fps;
  }
  std::optional<rex::PathConfig> OnFinalizePaths(
      const rex::PathConfig& defaults,
      std::function<void(rex::PathConfig)> resume) override
  {
      // OnCreateDialogs only runs once the overlays exist, and those are only
      // built when there is a presenter (a GPU plugin) or an app-supplied
      // immediate drawer. With neither, there is no wizard to drive, so
      // resolve from the defaults rather than dereference a null dialog.
      if (!path_wizard_) {
          RDAHM_ERROR("Path wizard was never created (no GPU plugin loaded, so no "
                      "overlays); falling back to default paths without prompting");
          return defaults;
      }
      path_wizard_->Init(GetName(), defaults, [resume](rex::PathConfig resolved) {
          resume(resolved);
          });
      return std::nullopt;
  }

private:
    PathSetupWizard* path_wizard_ = nullptr;
};


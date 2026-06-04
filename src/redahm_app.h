
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
      path_wizard_ = new PathSetupWizard(drawer);
      drawer->AddDialog(path_wizard_);
  }
  std::optional<rex::PathConfig> OnFinalizePaths(
      const rex::PathConfig& defaults,
      std::function<void(rex::PathConfig)> resume) override
  {
      path_wizard_->Init(app_name_, defaults, [resume](rex::PathConfig resolved) {
          resume(resolved);
          });
      return std::nullopt;
  }

private:
    std::string      app_name_;
    PathSetupWizard* path_wizard_ = nullptr;
};


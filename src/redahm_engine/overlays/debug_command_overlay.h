// Debug command overlay -- F5.
//
// Buttons queue guest console commands through console_exec.cpp. The view
// modes and show flags are stock engine commands handled by Exec itself; the
// cheats are the game's own and route through the exec components, which is why
// console_exec.cpp asserts the CPExecComponent gate.
//
// Command names come from the UTF-16BE table next to the dispatcher at
// 0x82139a00, and from the dev keyboard layout still present in
// Xe-KronosInput.ini's [Engine.PlayerInput].

#pragma once

#include <rex/ui/imgui_dialog.h>
#include <rex/ui/keybinds.h>

#include <cstdio>

#include "imgui.h"
#include "redahm_engine/console_exec.h"

class DebugCommandOverlayDialog : public rex::ui::ImGuiDialog {
 public:
  explicit DebugCommandOverlayDialog(rex::ui::ImGuiDrawer* drawer)
      : rex::ui::ImGuiDialog(drawer) {
    rex::ui::RegisterBind("bind_debug_commands", "F5", "Toggle debug command overlay",
        [this] { visible_ = !visible_; });
  }

  ~DebugCommandOverlayDialog() { rex::ui::UnregisterBind("bind_debug_commands"); }

  void OnDraw(ImGuiIO& io) override {
    if (!visible_) {
      return;
    }

    ImGui::SetNextWindowSize(ImVec2(420.0f, 0.0f), ImGuiCond_FirstUseEver);
    ImGui::SetNextWindowPos(ImVec2(40.0f, 60.0f), ImGuiCond_FirstUseEver);

    if (ImGui::Begin("Debug Commands", &visible_)) {
      if (!RedahmConsoleReady()) {
        ImGui::TextColored(ImVec4(1.0f, 0.6f, 0.2f, 1.0f),
                           "Waiting for the first engine Exec call...");
        ImGui::TextWrapped(
            "Commands are queued now and run as soon as the game dispatches "
            "once. Load into a level if this persists.");
        ImGui::Separator();
      }

      if (ImGui::CollapsingHeader("View modes", ImGuiTreeNodeFlags_DefaultOpen)) {
        Command("Lit", "VIEWMODE LIT");
        ImGui::SameLine();
        Command("Unlit", "VIEWMODE UNLIT");
        ImGui::SameLine();
        Command("Wireframe", "VIEWMODE WIREFRAME");
        Command("Lighting only", "VIEWMODE LIGHTINGONLY");
        ImGui::SameLine();
        Command("Light complexity", "VIEWMODE LIGHTCOMPLEXITY");
      }

      if (ImGui::CollapsingHeader("Show flags")) {
        Command("Bounds", "SHOW BOUNDS");
        ImGui::SameLine();
        Command("Collision", "SHOW COLLISION");
        ImGui::SameLine();
        Command("Paths", "SHOW PATHS");
        Command("Nav nodes", "SHOW NAVNODES");
        ImGui::SameLine();
        Command("Particles", "SHOW PARTICLES");
        ImGui::SameLine();
        Command("Bones", "SHOW BONES");
        Command("Post process", "SHOW POSTPROCESS");
        ImGui::SameLine();
        Command("Decals", "SHOW DECALS");
        ImGui::SameLine();
        Command("Fog", "SHOW FOG");
      }

      if (ImGui::CollapsingHeader("Stats")) {
        Command("FPS", "STAT FPS");
        ImGui::SameLine();
        Command("Levels", "STAT LEVELS");
        ImGui::SameLine();
        Command("None", "STAT NONE");
        Command("List textures", "LISTTEXTURES");
        ImGui::SameLine();
        Command("Anim seq stats", "ANIMSEQSTATS");
      }

      if (ImGui::CollapsingHeader("Cheats", ImGuiTreeNodeFlags_DefaultOpen)) {
        ImGui::TextDisabled("Routed through the exec components.");
        Command("All weapons", "AllWeapons true");
        ImGui::SameLine();
        Command("All ammo", "AllAmmo");
        Command("Infinite UFO ability", "InfiniteUFOAbility");
        ImGui::SameLine();
        Command("Spawn human", "SpawnNextHuman");
        Command("Freeze AI", "playersonly");
        ImGui::SameLine();
        Command("Toggle HUD", "ToggleHUD");
      }

      ImGui::Separator();
      ImGui::TextUnformatted("Custom command");
      ImGui::SetNextItemWidth(-70.0f);
      const bool submitted = ImGui::InputText("##custom", custom_, sizeof(custom_),
                                              ImGuiInputTextFlags_EnterReturnsTrue);
      ImGui::SameLine();
      if ((ImGui::Button("Run") || submitted) && custom_[0] != '\0') {
        RedahmQueueConsoleCommand(custom_);
        std::snprintf(last_, sizeof(last_), "%s", custom_);
      }

      if (last_[0] != '\0') {
        ImGui::TextDisabled("Last sent: %s", last_);
      }
    }
    ImGui::End();
  }

 private:
  void Command(const char* label, const char* cmd) {
    if (ImGui::Button(label)) {
      RedahmQueueConsoleCommand(cmd);
      std::snprintf(last_, sizeof(last_), "%s", cmd);
    }
  }

  bool visible_ = false;
  char custom_[192] = {};
  char last_[192] = {};
};

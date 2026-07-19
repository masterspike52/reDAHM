#pragma once
#include <rex/ui/imgui_dialog.h>
#include <rex/ui/keybinds.h>
#include "imgui.h"
#include <chrono>

class FpsOverlayDialog : public rex::ui::ImGuiDialog {
public:
    explicit FpsOverlayDialog(rex::ui::ImGuiDrawer* drawer)
        : rex::ui::ImGuiDialog(drawer) {
        rex::ui::RegisterBind("bind_fps_overlay", "F1", "Toggle FPS overlay", [this] {
            visible_ = !visible_;
            });
    }

    ~FpsOverlayDialog() {
        rex::ui::UnregisterBind("bind_fps_overlay");
    }

    void RecordFrame() {
        auto now = std::chrono::high_resolution_clock::now();
        float dt = std::chrono::duration<float>(now - last_frame_time_).count();
        last_frame_time_ = now;

        if (dt <= 0.0f || dt > 1.0f) return;

        frame_times_[frame_index_] = dt;
        frame_index_ = (frame_index_ + 1) % kSmoothFrames;

        float sum = 0.0f;
        for (float t : frame_times_) sum += t;
        fps_ = kSmoothFrames / sum;
    }

    void OnDraw(ImGuiIO& io) override {
        if (!visible_) return;

        ImGui::SetNextWindowPos(ImVec2(10.0f, 10.0f));
        ImGui::SetNextWindowBgAlpha(0.0f);
        ImGui::SetNextWindowSize(ImVec2(400.0f, 0.0f));
        ImGui::PushStyleColor(ImGuiCol_Border, IM_COL32(0, 0, 0, 0));

        ImGuiWindowFlags flags =
            ImGuiWindowFlags_NoDecoration |
            ImGuiWindowFlags_NoInputs |
            ImGuiWindowFlags_NoMove |
            ImGuiWindowFlags_NoSavedSettings |
            ImGuiWindowFlags_NoBringToFrontOnFocus;

        if (ImGui::Begin("##fps_overlay", nullptr, flags)) {
            ImDrawList* dl = ImGui::GetWindowDrawList();
            ImU32 shadow = IM_COL32(0, 0, 0, 255);

            ImU32 fpsColor = IM_COL32(0, 255, 128, 255);

            char buf[32];
            snprintf(buf, sizeof(buf), "FPS: %.1f", fps_);
            DrawBoldText(dl, ImGui::GetCursorScreenPos(), shadow, fpsColor, buf);
            ImGui::Dummy(ImVec2(0.0f, ImGui::GetTextLineHeight()));
        }
        ImGui::End();
        ImGui::PopStyleColor();
    }

private:
    static constexpr int kSmoothFrames = 30;

    bool  visible_ = false;
    float fps_ = 0.0f;
    float frame_times_[kSmoothFrames] = {};
    int   frame_index_ = 0;

    std::chrono::high_resolution_clock::time_point last_frame_time_
        = std::chrono::high_resolution_clock::now();

    static void DrawBoldText(ImDrawList* dl, ImVec2 pos, ImU32 shadow, ImU32 color, const char* text) {
        dl->AddText(ImVec2(pos.x - 1, pos.y - 1), shadow, text);
        dl->AddText(ImVec2(pos.x + 1, pos.y - 1), shadow, text);
        dl->AddText(ImVec2(pos.x - 1, pos.y + 1), shadow, text);
        dl->AddText(ImVec2(pos.x + 1, pos.y + 1), shadow, text);
        dl->AddText(ImVec2(pos.x + 1, pos.y), shadow, text);
        dl->AddText(pos, color, text);
    }
};

extern FpsOverlayDialog* g_fps_overlay;
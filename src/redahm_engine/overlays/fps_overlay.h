#pragma once
#include <rex/ui/imgui_dialog.h>
#include <rex/ui/keybinds.h>
#include "imgui.h"
#include "redahm_engine/gpu/present/present.h"
#include <algorithm>
#include <array>
#include <chrono>
#include <cstdio>

// F1 frame counter: a dark card with the frame rate coloured against the
// target (redahm_frame_cap, or the display's refresh rate), the frame time,
// the 1% low and a graph of recent frame times, so hitches stand out.
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
        auto now = std::chrono::steady_clock::now();
        float dt = std::chrono::duration<float>(now - last_frame_time_).count();
        last_frame_time_ = now;

        if (dt <= 0.0f || dt > 1.0f) return;

        frame_times_[frame_index_] = dt;
        frame_index_ = (frame_index_ + 1) % kHistory;
        frame_count_ = std::min(frame_count_ + 1, kHistory);
    }

    void OnDraw(ImGuiIO& io) override {
        if (!visible_ || frame_count_ == 0) return;

        const Stats stats = ComputeStats();
        const float target_fps = float(redahm::gpu::FrameRateTarget());
        const float target_ms = target_fps > 0.0f ? 1000.0f / target_fps : 16.667f;

        // Sized for 1080p and scaled with the output, so it stays legible at 4k.
        const float ui = std::clamp(io.DisplaySize.y / 1080.0f, 1.0f, 3.0f);
        ImFont* font = ImGui::GetFont();
        const float base = ImGui::GetFontSize() * ui;
        const float big = base * 2.6f;
        const float pad = 10.0f * ui;
        const float width = 230.0f * ui;
        const float graph_h = 42.0f * ui;
        const float height = pad + big + 4.0f * ui + base + 8.0f * ui + graph_h + pad;

        ImGui::SetNextWindowPos(ImVec2(12.0f * ui, 12.0f * ui));
        ImGui::SetNextWindowSize(ImVec2(width, height));
        const ImGuiWindowFlags flags =
            ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_NoInputs |
            ImGuiWindowFlags_NoMove | ImGuiWindowFlags_NoSavedSettings |
            ImGuiWindowFlags_NoBringToFrontOnFocus | ImGuiWindowFlags_NoBackground;
        ImGui::PushStyleVar(ImGuiStyleVar_WindowBorderSize, 0.0f);
        if (ImGui::Begin("##fps_overlay", nullptr, flags)) {
            ImDrawList* dl = ImGui::GetWindowDrawList();
            const ImVec2 origin = ImGui::GetWindowPos();
            const ImVec2 end(origin.x + width, origin.y + height);
            const float rounding = 8.0f * ui;
            const ImU32 accent = StatusColor(stats.fps, target_fps);

            // Card, hairline border and a status stripe down the left edge.
            dl->AddRectFilled(origin, end, IM_COL32(12, 14, 20, 205), rounding);
            dl->AddRect(origin, end, IM_COL32(255, 255, 255, 28), rounding, 0, 1.0f);
            dl->AddRectFilled(origin, ImVec2(origin.x + 4.0f * ui, end.y), accent, rounding,
                              ImDrawFlags_RoundCornersLeft);

            const float x = origin.x + pad + 6.0f * ui;
            float y = origin.y + pad;

            // Frame rate, large, then its unit and the target beside it.
            char fps_text[16];
            snprintf(fps_text, sizeof(fps_text), "%.0f", stats.fps);
            ShadowText(dl, font, big, ImVec2(x, y), accent, fps_text);
            const float fps_w = font->CalcTextSizeA(big, FLT_MAX, 0.0f, fps_text).x;
            const float unit_x = x + fps_w + 6.0f * ui;
            ShadowText(dl, font, base, ImVec2(unit_x, y + big - base * 2.25f),
                       IM_COL32(235, 238, 245, 255), "FPS");
            char target_text[24];
            if (target_fps > 0.0f)
                snprintf(target_text, sizeof(target_text), "target %.0f", target_fps);
            else
                snprintf(target_text, sizeof(target_text), "uncapped");
            ShadowText(dl, font, base, ImVec2(unit_x, y + big - base * 1.15f),
                       IM_COL32(150, 156, 170, 255), target_text);
            y += big + 4.0f * ui;

            // Frame time and 1% low.
            char detail[48];
            snprintf(detail, sizeof(detail), "%.1f ms", stats.frame_ms);
            ShadowText(dl, font, base, ImVec2(x, y), IM_COL32(235, 238, 245, 255), detail);
            snprintf(detail, sizeof(detail), "1%% low %.0f", stats.low_fps);
            const float low_w = font->CalcTextSizeA(base, FLT_MAX, 0.0f, detail).x;
            ShadowText(dl, font, base, ImVec2(end.x - pad - low_w, y),
                       StatusColor(stats.low_fps, target_fps), detail);
            y += base + 8.0f * ui;

            DrawGraph(dl, ImVec2(x, y), ImVec2(end.x - pad, y + graph_h), target_ms, target_fps, ui);
        }
        ImGui::End();
        ImGui::PopStyleVar();
    }

private:
    // Two seconds at 120 fps.
    static constexpr int kHistory = 240;
    // The headline rate averages this many frames (about half a second at 60).
    static constexpr int kAverageFrames = 30;

    struct Stats {
        float fps = 0.0f;
        float frame_ms = 0.0f;
        float low_fps = 0.0f;
    };

    bool visible_ = false;
    std::array<float, kHistory> frame_times_ = {};
    int frame_index_ = 0;
    int frame_count_ = 0;
    std::chrono::steady_clock::time_point last_frame_time_ = std::chrono::steady_clock::now();

    // The i-th most recent frame time, 0 being the latest.
    float Recent(int i) const {
        return frame_times_[(frame_index_ - 1 - i + kHistory) % kHistory];
    }

    Stats ComputeStats() const {
        Stats stats;
        const int average_n = std::min(frame_count_, kAverageFrames);
        float sum = 0.0f;
        for (int i = 0; i < average_n; ++i) sum += Recent(i);
        stats.frame_ms = sum / average_n * 1000.0f;
        stats.fps = sum > 0.0f ? average_n / sum : 0.0f;

        // 1% low: the frame rate of the slowest 1% of recent frames.
        std::array<float, kHistory> sorted;
        for (int i = 0; i < frame_count_; ++i) sorted[i] = Recent(i);
        const int slow = std::max(1, frame_count_ / 100);
        std::partial_sort(sorted.begin(), sorted.begin() + slow, sorted.begin() + frame_count_,
                          std::greater<float>());
        float slow_sum = 0.0f;
        for (int i = 0; i < slow; ++i) slow_sum += sorted[i];
        stats.low_fps = slow_sum > 0.0f ? slow / slow_sum : 0.0f;
        return stats;
    }

    static ImU32 StatusColor(float fps, float target) {
        if (target <= 0.0f || fps >= target * 0.95f) return IM_COL32(88, 224, 128, 255);
        if (fps >= target * 0.75f) return IM_COL32(255, 196, 64, 255);
        return IM_COL32(255, 92, 92, 255);
    }

    void DrawGraph(ImDrawList* dl, ImVec2 min, ImVec2 max, float target_ms, float target_fps,
                   float ui) const {
        const float w = max.x - min.x;
        const float h = max.y - min.y;
        dl->AddRectFilled(min, max, IM_COL32(255, 255, 255, 10), 4.0f * ui);

        // Twice the target frame time fills the graph; longer frames clip.
        const float scale_ms = target_ms * 2.0f;
        const int bars = std::min(frame_count_, kHistory / 2);
        const float bar_w = w / float(kHistory / 2);
        for (int i = 0; i < bars; ++i) {
            const float ms = Recent(i) * 1000.0f;
            const float bar_h = std::min(ms / scale_ms, 1.0f) * h;
            const float bx = max.x - (i + 1) * bar_w;
            const ImU32 color = (StatusColor(1000.0f / ms, target_fps) & 0x00FFFFFF) | 0xC8000000;
            dl->AddRectFilled(ImVec2(bx, max.y - bar_h), ImVec2(bx + bar_w * 0.8f, max.y), color);
        }

        // The target frame time.
        const float target_y = max.y - 0.5f * h;
        for (float dx = 0.0f; dx < w; dx += 8.0f * ui)
            dl->AddLine(ImVec2(min.x + dx, target_y), ImVec2(min.x + std::min(dx + 4.0f * ui, w), target_y),
                        IM_COL32(255, 255, 255, 90), 1.0f);
    }

    static void ShadowText(ImDrawList* dl, ImFont* font, float size, ImVec2 pos, ImU32 color,
                           const char* text) {
        dl->AddText(font, size, ImVec2(pos.x + 1.0f, pos.y + 1.0f), IM_COL32(0, 0, 0, 200), text);
        dl->AddText(font, size, pos, color, text);
    }
};

extern FpsOverlayDialog* g_fps_overlay;

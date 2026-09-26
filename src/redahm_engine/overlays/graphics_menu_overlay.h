#pragma once
#include <rex/cvar.h>
#include <rex/ui/imgui_dialog.h>
#include "imgui.h"
#include "redahm_engine/settings/graphics_menu.h"
#include <algorithm>
#include <cctype>
#include <string>
#include <vector>

// The panel behind GRAPHICS in the game's Options menu: one row per graphics
// setting, driven by the pad (up/down picks a row, left/right or A changes it,
// B goes back), the keyboard (arrows, Enter, Escape) or the mouse. Changes
// apply as they are made and are saved to the config when the panel closes.
class GraphicsMenuDialog : public rex::ui::ImGuiDialog {
public:
    explicit GraphicsMenuDialog(rex::ui::ImGuiDrawer* drawer)
        : rex::ui::ImGuiDialog(drawer) {
        // What the running game was started with, so rows that only take
        // effect on a restart can say when they have been changed.
        for (Row& row : rows_)
            row.boot_value = Lowercase(rex::cvar::GetFlagByName(row.cvar));
    }

    void OnDraw(ImGuiIO& io) override {
        namespace menu = redahm::graphics_menu;
        if (!menu::IsOpen()) {
            was_open_ = false;
            return;
        }
        if (!was_open_) {
            was_open_ = true;
            selected_ = 0;
        }

        HandleInput(menu::TakePresses());
        if (!menu::IsOpen())
            return;

        const float ui = std::clamp(io.DisplaySize.y / 1080.0f, 1.0f, 3.0f);
        ImFont* font = ImGui::GetFont();
        const float text = ImGui::GetFontSize() * ui * 1.35f;
        const float title = text * 1.8f;
        const float small = text * 0.8f;
        const float pad = 28.0f * ui;
        const float row_h = text + 18.0f * ui;
        const float width = std::min(760.0f * ui, io.DisplaySize.x - 32.0f);
        const float height = pad + title + 20.0f * ui + row_h * float(rows_.size()) + 16.0f * ui +
                             small * 2.0f + 14.0f * ui + pad;
        const ImVec2 origin((io.DisplaySize.x - width) * 0.5f, (io.DisplaySize.y - height) * 0.5f);
        const ImVec2 end(origin.x + width, origin.y + height);

        ImGui::SetNextWindowPos(ImVec2(0.0f, 0.0f));
        ImGui::SetNextWindowSize(io.DisplaySize);
        const ImGuiWindowFlags flags =
            ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_NoMove |
            ImGuiWindowFlags_NoSavedSettings | ImGuiWindowFlags_NoBackground |
            ImGuiWindowFlags_NoFocusOnAppearing;
        ImGui::PushStyleVar(ImGuiStyleVar_WindowBorderSize, 0.0f);
        ImGui::PushStyleVar(ImGuiStyleVar_WindowPadding, ImVec2(0.0f, 0.0f));
        if (ImGui::Begin("##graphics_menu", nullptr, flags)) {
            ImDrawList* dl = ImGui::GetWindowDrawList();
            const float rounding = 10.0f * ui;

            // Dim the game's menu behind, then the panel.
            dl->AddRectFilled(ImVec2(0.0f, 0.0f), io.DisplaySize, IM_COL32(0, 0, 0, 150));
            dl->AddRectFilled(origin, end, IM_COL32(10, 14, 20, 236), rounding);
            dl->AddRect(origin, end, (kAccent & 0x00FFFFFF) | 0x70000000, rounding, 0, 1.5f * ui);

            float y = origin.y + pad;
            const float x = origin.x + pad;
            const float right = end.x - pad;
            ShadowText(dl, font, title, ImVec2(x, y), kAccent, "GRAPHICS");
            y += title + 8.0f * ui;
            dl->AddRectFilled(ImVec2(x, y), ImVec2(right, y + 2.0f * ui), (kAccent & 0x00FFFFFF) | 0x60000000);
            y += 12.0f * ui;

            bool restart_pending = false;
            for (size_t i = 0; i < rows_.size(); ++i) {
                Row& row = rows_[i];
                const ImVec2 row_min(x - 10.0f * ui, y);
                const ImVec2 row_max(right + 10.0f * ui, y + row_h);
                const bool selected = int(i) == selected_;
                const std::string current = Lowercase(rex::cvar::GetFlagByName(row.cvar));
                const int option = FindOption(row, current);
                const bool needs_restart = row.restart && current != row.boot_value;
                restart_pending |= needs_restart;

                // Mouse: hovering picks the row, the arrows step it, a click
                // elsewhere on the row steps forward.
                ImGui::SetCursorScreenPos(row_min);
                ImGui::PushID(int(i));
                const bool clicked = ImGui::InvisibleButton("##row", ImVec2(row_max.x - row_min.x, row_h));
                const bool hovered = ImGui::IsItemHovered();
                ImGui::PopID();
                if (hovered && io.MouseDelta.x * io.MouseDelta.x + io.MouseDelta.y * io.MouseDelta.y > 0.0f)
                    selected_ = int(i);

                if (selected)
                    dl->AddRectFilled(row_min, row_max, (kAccent & 0x00FFFFFF) | 0x30000000, 6.0f * ui);
                if (selected)
                    dl->AddRectFilled(row_min, ImVec2(row_min.x + 4.0f * ui, row_max.y), kAccent, 6.0f * ui,
                                      ImDrawFlags_RoundCornersLeft);

                const float text_y = y + (row_h - text) * 0.5f;
                const ImU32 label_color = selected ? IM_COL32(255, 255, 255, 255) : IM_COL32(200, 206, 216, 255);
                ShadowText(dl, font, text, ImVec2(x + 8.0f * ui, text_y), label_color, row.label);
                if (needs_restart) {
                    const float label_w = font->CalcTextSizeA(text, FLT_MAX, 0.0f, row.label).x;
                    ShadowText(dl, font, small, ImVec2(x + 8.0f * ui + label_w + 12.0f * ui, text_y + (text - small) * 0.6f),
                               kRestartColor, "RESTART");
                }

                // Value, framed by arrows that show which way it can still go.
                const std::string value = option >= 0 ? row.options[option].label : current;
                const float value_w = font->CalcTextSizeA(text, FLT_MAX, 0.0f, value.c_str()).x;
                const float arrow_w = font->CalcTextSizeA(text, FLT_MAX, 0.0f, ">").x;
                const float slot_w = 220.0f * ui;
                const float slot_min = right - slot_w;
                const float value_x = slot_min + (slot_w - value_w) * 0.5f;
                const ImU32 value_color = selected ? kAccent : IM_COL32(235, 238, 245, 255);
                ShadowText(dl, font, text, ImVec2(value_x, text_y), value_color, value.c_str());
                const bool can_left = option > 0;
                const bool can_right = option < int(row.options.size()) - 1;
                const ImU32 arrow_on = selected ? IM_COL32(255, 255, 255, 230) : IM_COL32(170, 176, 188, 200);
                const ImU32 arrow_off = IM_COL32(120, 124, 134, 90);
                ShadowText(dl, font, text, ImVec2(slot_min, text_y), can_left ? arrow_on : arrow_off, "<");
                ShadowText(dl, font, text, ImVec2(right - arrow_w, text_y), can_right ? arrow_on : arrow_off, ">");

                if (clicked) {
                    selected_ = int(i);
                    const float mx = io.MousePos.x;
                    if (mx >= slot_min - 8.0f * ui && mx <= slot_min + arrow_w + 12.0f * ui)
                        Step(row, -1, false);
                    else
                        Step(row, +1, mx < slot_min);
                }
                y += row_h;
            }

            // Button hints, and what still needs a restart.
            y += 16.0f * ui;
            ShadowText(dl, font, small, ImVec2(x, y), IM_COL32(170, 176, 188, 255),
                       "Up/Down  Select        Left/Right or A  Change        B  Back");
            y += small + 8.0f * ui;
            if (restart_pending)
                ShadowText(dl, font, small, ImVec2(x, y), kRestartColor,
                           "Settings marked RESTART take effect the next time the game starts.");
        }
        ImGui::End();
        ImGui::PopStyleVar(2);
    }

private:
    struct Option {
        const char* label;
        const char* value;
    };

    struct Row {
        const char* label;
        const char* cvar;
        std::vector<Option> options;
        // Takes effect only when the game next starts.
        bool restart;
        std::string boot_value;
    };

    static constexpr ImU32 kAccent = IM_COL32(120, 232, 96, 255);
    static constexpr ImU32 kRestartColor = IM_COL32(255, 196, 64, 255);

    std::vector<Row> rows_ = {
        {"Resolution", "redahm_resolution",
         {{"480p", "480p"}, {"720p", "720p"}, {"1080p", "1080p"}, {"1440p", "1440p"}, {"4K", "4k"}},
         true},
        {"Frame Rate Cap", "redahm_frame_cap",
         {{"30", "30"}, {"60", "60"}, {"75", "75"}, {"90", "90"}, {"120", "120"}, {"144", "144"},
          {"Display", "display"}, {"Off", "off"}},
         false},
        {"V-Sync", "redahm_vsync", {{"Off", "false"}, {"On", "true"}}, false},
        {"Anisotropic Filtering", "redahm_anisotropy",
         {{"Off", "off"}, {"2x", "2x"}, {"4x", "4x"}, {"8x", "8x"}, {"16x", "16x"}},
         false},
        {"Display Mode", "fullscreen", {{"Windowed", "false"}, {"Fullscreen", "true"}}, false},
        {"Picture", "redahm_stretch_output", {{"Letterbox", "false"}, {"Stretch", "true"}}, false},
        {"Motion Blur", "disable_motion_blur", {{"On", "false"}, {"Off", "true"}}, true},
        {"Graphics API", "redahm_gpu_api", {{"Direct3D 12", "d3d12"}, {"Vulkan", "vulkan"}}, true},
    };

    int selected_ = 0;
    bool was_open_ = false;

    static std::string Lowercase(std::string value) {
        for (char& c : value)
            c = static_cast<char>(std::tolower(static_cast<unsigned char>(c)));
        return value;
    }

    static int FindOption(const Row& row, const std::string& current) {
        for (size_t i = 0; i < row.options.size(); ++i) {
            if (current == row.options[i].value)
                return int(i);
        }
        return -1;
    }

    // Moves the row's value one option along; A and a click wrap around at
    // the end, the arrows stop there.
    static void Step(Row& row, int direction, bool wrap) {
        const int count = int(row.options.size());
        const int current = FindOption(row, Lowercase(rex::cvar::GetFlagByName(row.cvar)));
        int next = current < 0 ? 0 : current + direction;
        if (wrap)
            next = (next % count + count) % count;
        else
            next = std::clamp(next, 0, count - 1);
        if (next != current)
            rex::cvar::SetFlagByName(row.cvar, row.options[next].value);
    }

    void HandleInput(u32 presses) {
        namespace menu = redahm::graphics_menu;
        if (ImGui::IsKeyPressed(ImGuiKey_UpArrow)) presses |= menu::kUp;
        if (ImGui::IsKeyPressed(ImGuiKey_DownArrow)) presses |= menu::kDown;
        if (ImGui::IsKeyPressed(ImGuiKey_LeftArrow)) presses |= menu::kLeft;
        if (ImGui::IsKeyPressed(ImGuiKey_RightArrow)) presses |= menu::kRight;
        if (ImGui::IsKeyPressed(ImGuiKey_Enter, false) || ImGui::IsKeyPressed(ImGuiKey_KeypadEnter, false))
            presses |= menu::kAccept;
        if (ImGui::IsKeyPressed(ImGuiKey_Escape, false) || ImGui::IsKeyPressed(ImGuiKey_Backspace, false))
            presses |= menu::kBack;

        const int count = int(rows_.size());
        if (presses & menu::kUp)
            selected_ = (selected_ + count - 1) % count;
        if (presses & menu::kDown)
            selected_ = (selected_ + 1) % count;
        Row& row = rows_[selected_];
        if (presses & menu::kLeft)
            Step(row, -1, false);
        if (presses & menu::kRight)
            Step(row, +1, false);
        if (presses & menu::kAccept)
            Step(row, +1, true);
        if (presses & menu::kBack)
            menu::Close();
    }

    static void ShadowText(ImDrawList* dl, ImFont* font, float size, ImVec2 pos, ImU32 color,
                           const char* text) {
        dl->AddText(font, size, ImVec2(pos.x + 1.5f, pos.y + 1.5f), IM_COL32(0, 0, 0, 200), text);
        dl->AddText(font, size, pos, color, text);
    }
};

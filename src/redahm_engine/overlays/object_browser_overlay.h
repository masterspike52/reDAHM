#pragma once

#include <rex/ui/imgui_dialog.h>
#include <rex/ui/keybinds.h>

#include <algorithm>
#include <cctype>
#include <cstdio>
#include <cstring>
#include <string>
#include <unordered_set>
#include <vector>

#include "imgui.h"
#include "redahm_engine/redahm_logging.h"
#include "redahm_engine/reflection.h"

// Live view of GObjObjects. Reads guest memory directly -- no console command,
// no guest call -- which is what makes it work at all here: this build has
// FOutputDevice::Logf compiled out, so the engine's own OBJ LIST prints nothing.
//
// The snapshot itself is taken on a guest thread from the per-frame drain; this
// dialog only ever renders it, and holds the shared_ptr for the frame so a
// concurrent refresh cannot free the vector mid-draw.
class ObjectBrowserDialog : public rex::ui::ImGuiDialog {
 public:
  explicit ObjectBrowserDialog(rex::ui::ImGuiDrawer* drawer) : rex::ui::ImGuiDialog(drawer) {
    rex::ui::RegisterBind("bind_object_browser", "F6", "Toggle object browser",
                          [this] { visible_ = !visible_; });
  }

  ~ObjectBrowserDialog() { rex::ui::UnregisterBind("bind_object_browser"); }

  void OnDraw(ImGuiIO& io) override {
    (void)io;
    if (!visible_) {
      return;
    }

    // This thread reads guest memory across frames, so drop the page-validity
    // cache each frame rather than trusting an entry taken while the guest was
    // in a different state.
    RedahmResetReadCache();

    ImGui::SetNextWindowSize(ImVec2(880.0f, 620.0f), ImGuiCond_FirstUseEver);
    ImGui::SetNextWindowPos(ImVec2(120.0f, 80.0f), ImGuiCond_FirstUseEver);

    if (ImGui::Begin("Object Browser", &visible_)) {
      auto snapshot = RedahmObjects();
      DrawToolbar(snapshot.get());

      if (!snapshot) {
        ImGui::TextWrapped(
            "No snapshot yet. Press Refresh -- the walk runs on the next engine tick, so the "
            "game has to be running (not paused at a load screen).");
        ImGui::End();
        return;
      }

      UpdateView(*snapshot);
      RebuildFilterIfNeeded(*snapshot);
      // After the filter, since the filtered list is what gets boxed.
      DrawWorldHighlights(io, *snapshot);
      LogBoxStatusIfChanged();

      ImGui::Separator();
      DrawHighlightBar();
      const float detail_h = 240.0f;
      ImGui::BeginChild("##list", ImVec2(0.0f, -detail_h), false);
      DrawList(*snapshot);
      ImGui::EndChild();

      ImGui::Separator();
      DrawDetail(*snapshot);
    }
    ImGui::End();
  }

 private:
  void DrawToolbar(const RedahmObjectSnapshot* snapshot) {
    const bool pending = RedahmObjectRefreshPending();
    ImGui::BeginDisabled(pending);
    if (ImGui::Button("Refresh")) {
      RedahmRequestObjectRefresh();
    }
    ImGui::EndDisabled();

    if (pending) {
      ImGui::SameLine();
      ImGui::TextColored(ImVec4(0.9f, 0.8f, 0.4f, 1.0f), "walking on next tick...");
    }

    ImGui::SameLine();
    ImGui::Checkbox("Auto", &auto_refresh_);
    if (auto_refresh_ && !pending) {
      // Cheap throttle: the walk is tens of thousands of guest reads and runs
      // inside UGameEngine::Tick, so it must not fire every frame.
      if (++auto_countdown_ > 180) {
        auto_countdown_ = 0;
        RedahmRequestObjectRefresh();
      }
    }

    if (snapshot != nullptr) {
      ImGui::SameLine();
      if (snapshot->objects.empty()) {
        ImGui::TextColored(ImVec4(0.9f, 0.5f, 0.4f, 1.0f),
                           "GObjObjects empty (Data %08X, Num %d)", snapshot->data_ptr,
                           snapshot->array_num);
      } else {
        ImGui::TextDisabled("#%llu | %zu objects, %d null slots | Data %08X | GNames %d",
                            static_cast<unsigned long long>(snapshot->sequence),
                            snapshot->objects.size(), snapshot->null_slots, snapshot->data_ptr,
                            snapshot->names_num);
      }
    }

    ImGui::SetNextItemWidth(220.0f);
    ImGui::InputTextWithHint("##name", "Filter name...", name_filter_, sizeof(name_filter_));
    ImGui::SameLine();
    ImGui::SetNextItemWidth(220.0f);
    ImGui::InputTextWithHint("##class", "Filter class...", class_filter_, sizeof(class_filter_));
    ImGui::SameLine();
    if (ImGui::Button("Clear")) {
      name_filter_[0] = '\0';
      class_filter_[0] = '\0';
    }
  }

  // The selected object, found once per selection rather than per use. Several
  // places wanted it every frame and each did its own linear scan of ~135k
  // entries, which is most of what the browser was costing the frame.
  const RedahmObject* SelectedObject(const RedahmObjectSnapshot& snapshot) {
    if (selected_addr_ == 0) {
      return nullptr;
    }
    if (sel_cache_seq_ != snapshot.sequence || sel_cache_addr_ != selected_addr_) {
      sel_cache_seq_ = snapshot.sequence;
      sel_cache_addr_ = selected_addr_;
      sel_cache_index_ = kNoIndex;
      for (size_t i = 0; i < snapshot.objects.size(); ++i) {
        if (snapshot.objects[i].addr == selected_addr_) {
          sel_cache_index_ = i;
          break;
        }
      }
      // Path and class chain walk Outer/SuperField and resolve a name at each
      // step; recomputing them every frame was pure waste.
      if (sel_cache_index_ != kNoIndex) {
        const RedahmObject& o = snapshot.objects[sel_cache_index_];
        sel_path_ = RedahmObjectPath(o.addr);
        sel_chain_ = RedahmClassChain(o.class_addr);
      } else {
        sel_path_.clear();
        sel_chain_.clear();
      }
    }
    return sel_cache_index_ == kNoIndex ? nullptr : &snapshot.objects[sel_cache_index_];
  }

  // Resolve the camera. The scan over every object only runs once per
  // snapshot; after that only the camera's own transform is re-read.
  void UpdateView(const RedahmObjectSnapshot& snapshot) {
    if (view_sequence_ != snapshot.sequence || camera_override_ != view_override_used_) {
      view_sequence_ = snapshot.sequence;
      view_override_used_ = camera_override_;
      view_ = RedahmFindView(snapshot, camera_override_);
      view_source_ = view_.source_addr;
    } else {
      view_ = RedahmFindView(snapshot, view_source_ ? view_source_ : camera_override_);
    }
  }

  // Draw a box around everything the list is currently showing, so the filter
  // is the selection tool: narrow the list to CPCivilianPawn and every civilian
  // in view is boxed. The selected row is drawn brighter and labelled.
  void DrawWorldHighlights(ImGuiIO& io, const RedahmObjectSnapshot& snapshot) {
    if (!show_boxes_ || !view_.valid) {
      return;
    }
    const float w = io.DisplaySize.x;
    const float h = io.DisplaySize.y;

    boxes_drawn_ = 0;
    // Projecting the whole object list every frame is not viable, so a wide
    // list only highlights the selection and says so. Filtering is what makes
    // the world view useful, and it is cheap once the list is narrow.
    const bool list_is_narrow = filtered_.size() <= static_cast<size_t>(max_boxes_);
    if (list_is_narrow) {
      for (size_t idx : filtered_) {
        if (boxes_drawn_ >= max_boxes_) {
          break;
        }
        const RedahmObject& o = snapshot.objects[idx];
        if (o.addr == selected_addr_) {
          continue;  // drawn last, on top
        }
        if (DrawBoxFor(o, w, h, false)) {
          ++boxes_drawn_;
        }
      }
    }

    // The selection, plus a reason when it draws nothing. "I selected something
    // and no box appeared" has several causes -- most objects in the list are
    // not actors and have no position at all -- and they are indistinguishable
    // without saying which one applies.
    sel_box_status_.clear();
    const RedahmObject* sel = SelectedObject(snapshot);
    if (sel == nullptr) {
      sel_box_status_ = "nothing selected";
      return;
    }
    RedahmBounds bounds;
    if (!RedahmObjectBounds(sel->addr, sel->class_addr, bounds)) {
      sel_box_status_ = "selected object has no Location -- not a positioned actor";
      return;
    }
    float px = 0.0f;
    float py = 0.0f;
    float depth = 0.0f;
    if (!RedahmProjectToScreen(view_, bounds.center, w, h, px, py, depth)) {
      sel_box_status_ = "selected object is behind the camera";
      return;
    }
    if (px < -400.0f || py < -400.0f || px > w + 400.0f || py > h + 400.0f) {
      char buf[160];
      std::snprintf(buf, sizeof(buf), "selected object is off screen (%.0f m away)",
                    depth / 100.0f);
      sel_box_status_ = buf;
      return;
    }
    if (DrawBoxFor(*sel, w, h, true)) {
      ++boxes_drawn_;
      char buf[192];
      std::snprintf(buf, sizeof(buf), "boxed at %.0f m, extent %.0f/%.0f/%.0f (%s)", depth / 100.0f,
                    bounds.extent.x, bounds.extent.y, bounds.extent.z,
                    bounds.measured ? bounds.source : "default size");
      sel_box_status_ = buf;
    } else {
      sel_box_status_ = "box drawn nothing -- every corner projected behind the camera";
    }
  }

  // Logged only when it changes, so the reason a selection did or did not get a
  // box is in the log without spamming it every frame.
  void LogBoxStatusIfChanged() {
    if (sel_box_status_ == last_logged_box_status_) {
      return;
    }
    last_logged_box_status_ = sel_box_status_;
    RDAHM_INFO("[box] selection {:#010x}: {}", selected_addr_, sel_box_status_);
  }

  // One object's box. Returns false when it is behind the camera or has no
  // position at all, so the caller can count what actually got drawn.
  bool DrawBoxFor(const RedahmObject& o, float w, float h, bool emphasized) {
    RedahmBounds bounds;
    if (!RedahmObjectBounds(o.addr, o.class_addr, bounds)) {
      return false;
    }
    float px = 0.0f;
    float py = 0.0f;
    float depth = 0.0f;
    if (!RedahmProjectToScreen(view_, bounds.center, w, h, px, py, depth)) {
      return false;
    }
    if (px < -400.0f || py < -400.0f || px > w + 400.0f || py > h + 400.0f) {
      return false;  // comfortably off screen
    }

    auto* dl = ImGui::GetForegroundDrawList();
    const ImU32 col = emphasized ? IM_COL32(90, 230, 140, 235) : IM_COL32(90, 170, 230, 130);
    const float thickness = emphasized ? 1.8f : 1.0f;

    // A corner behind the camera cannot be projected, so any edge touching one
    // is dropped rather than drawn to a garbage point.
    ImVec2 corner[8];
    bool ok[8];
    for (int i = 0; i < 8; ++i) {
      const RedahmVec3 p{bounds.center.x + ((i & 1) ? bounds.extent.x : -bounds.extent.x),
                         bounds.center.y + ((i & 2) ? bounds.extent.y : -bounds.extent.y),
                         bounds.center.z + ((i & 4) ? bounds.extent.z : -bounds.extent.z)};
      float cx = 0.0f;
      float cy = 0.0f;
      float cd = 0.0f;
      ok[i] = RedahmProjectToScreen(view_, p, w, h, cx, cy, cd);
      corner[i] = ImVec2(cx, cy);
    }
    static constexpr int kEdges[12][2] = {{0, 1}, {1, 3}, {3, 2}, {2, 0}, {4, 5}, {5, 7},
                                          {7, 6}, {6, 4}, {0, 4}, {1, 5}, {2, 6}, {3, 7}};
    for (const auto& e : kEdges) {
      if (ok[e[0]] && ok[e[1]]) {
        dl->AddLine(corner[e[0]], corner[e[1]], col, thickness);
      }
    }

    if (emphasized || show_all_labels_) {
      char label[256];
      std::snprintf(label, sizeof(label), "%s%s  %.0fm%s", o.name.c_str(),
                    emphasized ? "" : "", depth / 100.0f,
                    bounds.measured ? "" : "  (no size)");
      dl->AddText(ImVec2(px + 8.0f, py - 6.0f), col, label);
    }
    return true;
  }

  void DrawHighlightBar() {
    ImGui::Checkbox("World boxes", &show_boxes_);
    ImGui::SameLine();
    ImGui::Checkbox("Labels", &show_all_labels_);
    ImGui::SameLine();
    ImGui::SetNextItemWidth(120.0f);
    ImGui::SliderInt("max", &max_boxes_, 1, 500);
    ImGui::SameLine();
    if (ImGui::SmallButton("Camera = selected")) {
      camera_override_ = selected_addr_;
    }
    if (camera_override_ != 0) {
      ImGui::SameLine();
      if (ImGui::SmallButton("Auto camera")) {
        camera_override_ = 0;
      }
    }

    if (!view_.valid) {
      ImGui::TextColored(ImVec4(0.9f, 0.6f, 0.3f, 1.0f),
                         "No camera found -- nothing can be drawn in world. Select the view "
                         "camera in the list and press \"Camera = selected\".");
      return;
    }
    if (!sel_box_status_.empty()) {
      ImGui::TextColored(ImVec4(0.9f, 0.8f, 0.4f, 1.0f), "%s", sel_box_status_.c_str());
      ImGui::SameLine();
    }
    if (filtered_.size() > static_cast<size_t>(max_boxes_)) {
      ImGui::TextDisabled("| %zu rows listed: only the selection is boxed (limit %d)",
                          filtered_.size(), max_boxes_);
    } else {
      ImGui::TextDisabled("| %d boxed | view %s via %s", boxes_drawn_,
                          view_.source_class.c_str(), view_.via);
    }
  }

  static bool ContainsNoCase(const std::string& haystack, const char* needle) {
    if (needle[0] == '\0') {
      return true;
    }
    const size_t nlen = std::strlen(needle);
    if (nlen > haystack.size()) {
      return false;
    }
    for (size_t i = 0; i + nlen <= haystack.size(); ++i) {
      size_t j = 0;
      for (; j < nlen; ++j) {
        const int a = std::tolower(static_cast<unsigned char>(haystack[i + j]));
        const int b = std::tolower(static_cast<unsigned char>(needle[j]));
        if (a != b) {
          break;
        }
      }
      if (j == nlen) {
        return true;
      }
    }
    return false;
  }

  // The filtered index list is rebuilt only when the snapshot or a filter
  // changes -- matching 40k names per frame would show up in the frame time.
  void RebuildFilterIfNeeded(const RedahmObjectSnapshot& snapshot) {
    const bool dirty = snapshot.sequence != filtered_sequence_ ||
                       std::strcmp(name_filter_, cached_name_filter_) != 0 ||
                       std::strcmp(class_filter_, cached_class_filter_) != 0;
    if (!dirty) {
      return;
    }
    filtered_sequence_ = snapshot.sequence;
    std::snprintf(cached_name_filter_, sizeof(cached_name_filter_), "%s", name_filter_);
    std::snprintf(cached_class_filter_, sizeof(cached_class_filter_), "%s", class_filter_);

    filtered_.clear();
    filtered_.reserve(snapshot.objects.size());
    for (size_t i = 0; i < snapshot.objects.size(); ++i) {
      const RedahmObject& o = snapshot.objects[i];
      if (!ContainsNoCase(o.name, name_filter_)) {
        continue;
      }
      if (!ContainsNoCase(o.class_name, class_filter_)) {
        continue;
      }
      filtered_.push_back(i);
    }
  }

  void DrawList(const RedahmObjectSnapshot& snapshot) {
    ImGui::TextDisabled("%zu shown", filtered_.size());

    constexpr ImGuiTableFlags kFlags = ImGuiTableFlags_RowBg | ImGuiTableFlags_Borders |
                                       ImGuiTableFlags_ScrollY | ImGuiTableFlags_Resizable;
    if (!ImGui::BeginTable("##objects", 4, kFlags)) {
      return;
    }
    ImGui::TableSetupScrollFreeze(0, 1);
    ImGui::TableSetupColumn("Name", ImGuiTableColumnFlags_WidthStretch);
    ImGui::TableSetupColumn("Class", ImGuiTableColumnFlags_WidthStretch);
    ImGui::TableSetupColumn("Address", ImGuiTableColumnFlags_WidthFixed, 90.0f);
    ImGui::TableSetupColumn("Idx", ImGuiTableColumnFlags_WidthFixed, 70.0f);
    ImGui::TableHeadersRow();

    ImGuiListClipper clipper;
    clipper.Begin(static_cast<int>(filtered_.size()));
    // A picked row is almost never in the clipper's visible window, so it has
    // to be forced in before it can be scrolled to.
    if (scroll_to_selected_) {
      for (size_t i = 0; i < filtered_.size(); ++i) {
        if (snapshot.objects[filtered_[i]].addr == selected_addr_) {
          clipper.IncludeItemByIndex(static_cast<int>(i));
          break;
        }
      }
    }
    while (clipper.Step()) {
      for (int row = clipper.DisplayStart; row < clipper.DisplayEnd; ++row) {
        const RedahmObject& o = snapshot.objects[filtered_[static_cast<size_t>(row)]];
        ImGui::TableNextRow();
        ImGui::PushID(static_cast<int>(o.addr));

        if (scroll_to_selected_ && o.addr == selected_addr_) {
          scroll_to_selected_ = false;
          ImGui::SetScrollHereY(0.5f);
        }

        ImGui::TableSetColumnIndex(0);
        // An unresolved name means the GNames walk failed for that index, which
        // is worth seeing rather than rendering as a blank row.
        const bool unresolved = o.name.empty();
        if (unresolved) {
          ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.9f, 0.5f, 0.4f, 1.0f));
        }
        if (ImGui::Selectable(unresolved ? "<unresolved>" : o.name.c_str(),
                              selected_addr_ == o.addr, ImGuiSelectableFlags_SpanAllColumns)) {
          selected_addr_ = o.addr;
        }
        if (unresolved) {
          ImGui::PopStyleColor();
        }

        ImGui::TableSetColumnIndex(1);
        ImGui::TextUnformatted(o.class_name.empty() ? "?" : o.class_name.c_str());
        ImGui::TableSetColumnIndex(2);
        ImGui::Text("%08X", o.addr);
        ImGui::TableSetColumnIndex(3);
        ImGui::Text("%d", o.index);

        ImGui::PopID();
      }
    }
    ImGui::EndTable();
  }

  // Classification for the raw header dump. This is the part that tells us what
  // the unlabelled fields are: Class at +0x3C is known, so it acts as a control
  // for the "obj" tag, and any other offset tagged "obj" across most objects is
  // a candidate for Outer or ObjectArchetype.
  const char* Classify(const RedahmObjectSnapshot& snapshot, uint32_t value) {
    if (value == 0) {
      return "";
    }
    if (AddrSet(snapshot).count(value) != 0) {
      return "obj";
    }
    if (value >= 0x82000000 && value < 0x83400000) {
      return "image";
    }
    if (value >= 0x00010000 && value < 0xC0000000) {
      return "ptr?";
    }
    return "";
  }

  const std::unordered_set<uint32_t>& AddrSet(const RedahmObjectSnapshot& snapshot) {
    if (addr_set_sequence_ != snapshot.sequence) {
      addr_set_sequence_ = snapshot.sequence;
      addr_set_.clear();
      addr_set_.reserve(snapshot.objects.size() * 2);
      for (const auto& o : snapshot.objects) {
        addr_set_.insert(o.addr);
      }
    }
    return addr_set_;
  }

  void DrawDetail(const RedahmObjectSnapshot& snapshot) {
    const RedahmObject* sel = SelectedObject(snapshot);
    if (sel == nullptr) {
      ImGui::TextDisabled("Select an object to inspect its header.");
      return;
    }

    // Cached with the selection: both of these walk chains and resolve a name
    // per link, which is not something to redo sixty times a second.
    ImGui::Text("%s", sel_path_.c_str());
    ImGui::SameLine();
    ImGui::TextDisabled("| addr %08X | GObjObjects[%d]", sel->addr, sel->index);
    ImGui::TextDisabled("%s", sel_chain_.c_str());

    if (ImGui::BeginTabBar("##detail")) {
      if (ImGui::BeginTabItem("Properties")) {
        DrawProperties(*sel);
        ImGui::EndTabItem();
      }
      if (ImGui::BeginTabItem("Header")) {
        DrawHeaderDump(snapshot, *sel);
        ImGui::EndTabItem();
      }
      if (ImGui::BeginTabItem("Layout probe")) {
        DrawProbe(snapshot);
        ImGui::EndTabItem();
      }
      ImGui::EndTabBar();
    }
  }

  // Values are re-read from guest memory every frame, so this is a live view of
  // the object rather than a snapshot of it.
  void DrawProperties(const RedahmObject& sel) {
    if (props_for_class_ != sel.class_addr) {
      props_for_class_ = sel.class_addr;
      props_ = RedahmEnumerateProperties(sel.class_addr);
      prop_filter_dirty_ = true;
    }
    if (props_.empty()) {
      ImGui::TextDisabled("No properties found on this class.");
      return;
    }

    ImGui::SetNextItemWidth(240.0f);
    if (ImGui::InputTextWithHint("##propfilter", "Filter name / type / class...", prop_filter_,
                                 sizeof(prop_filter_))) {
      prop_filter_dirty_ = true;
    }
    ImGui::SameLine();
    if (ImGui::Button("Clear##props")) {
      prop_filter_[0] = '\0';
      prop_filter_dirty_ = true;
    }
    ImGui::SameLine();

    // Matched against the declaring class and the property type as well as the
    // name, so "Float" narrows to the floats and "Actor" to what Actor declared.
    if (prop_filter_dirty_) {
      prop_filter_dirty_ = false;
      prop_filtered_.clear();
      prop_filtered_.reserve(props_.size());
      for (size_t i = 0; i < props_.size(); ++i) {
        const RedahmProperty& p = props_[i];
        if (ContainsNoCase(p.name, prop_filter_) || ContainsNoCase(p.type, prop_filter_) ||
            ContainsNoCase(p.owner, prop_filter_)) {
          prop_filtered_.push_back(i);
        }
      }
    }

    if (prop_filtered_.size() == props_.size()) {
      ImGui::TextDisabled("%zu properties (live values)", props_.size());
    } else {
      ImGui::TextDisabled("%zu of %zu properties", prop_filtered_.size(), props_.size());
    }
    ImGui::SameLine();
    ImGui::Checkbox("PostEditChange", &post_edit_change_);
    if (ImGui::IsItemHovered()) {
      ImGui::SetTooltip(
          "Call PreEditChange/PostEditChange around the write, the way SET does and SETNOPEC "
          "does not. Without it the field changes but the engine never reacts -- a material "
          "will not rebuild, a component will not reattach.");
    }
    ImGui::SameLine();
    ImGui::TextDisabled("| click a value to edit");

    const auto edits = RedahmPropertyEditLog();
    if (!edits.empty()) {
      const RedahmEditRecord& last = edits.back();
      ImGui::SameLine();
      ImGui::TextColored(last.ok ? ImVec4(0.4f, 0.9f, 0.4f, 1.0f) : ImVec4(0.9f, 0.4f, 0.4f, 1.0f),
                         "| %s = %s (%s)", last.target.c_str(), last.value.c_str(),
                         last.detail.c_str());
    }

    constexpr ImGuiTableFlags kFlags =
        ImGuiTableFlags_RowBg | ImGuiTableFlags_Borders | ImGuiTableFlags_ScrollY |
        ImGuiTableFlags_Resizable;
    if (!ImGui::BeginTable("##props", 5, kFlags, ImVec2(0.0f, 0.0f))) {
      return;
    }
    ImGui::TableSetupScrollFreeze(0, 1);
    ImGui::TableSetupColumn("Name", ImGuiTableColumnFlags_WidthStretch);
    ImGui::TableSetupColumn("Value", ImGuiTableColumnFlags_WidthStretch);
    ImGui::TableSetupColumn("Type", ImGuiTableColumnFlags_WidthFixed, 130.0f);
    ImGui::TableSetupColumn("Off", ImGuiTableColumnFlags_WidthFixed, 55.0f);
    ImGui::TableSetupColumn("From", ImGuiTableColumnFlags_WidthFixed, 110.0f);
    ImGui::TableHeadersRow();

    ImGuiListClipper clipper;
    clipper.Begin(static_cast<int>(prop_filtered_.size()));
    while (clipper.Step()) {
      for (int row = clipper.DisplayStart; row < clipper.DisplayEnd; ++row) {
        const RedahmProperty& p = props_[prop_filtered_[static_cast<size_t>(row)]];
        ImGui::TableNextRow();
        ImGui::TableSetColumnIndex(0);
        if (p.array_dim > 1) {
          ImGui::Text("%s[%d]", p.name.c_str(), p.array_dim);
        } else {
          ImGui::TextUnformatted(p.name.c_str());
        }
        ImGui::TableSetColumnIndex(1);
        ImGui::PushID(static_cast<int>(p.addr));
        if (editing_prop_ == p.addr) {
          ImGui::SetNextItemWidth(-1.0f);
          if (!p.options.empty()) {
            DrawOptionCombo(sel, p, p.options);
          } else if (p.type == "ObjectProperty" || p.type == "ClassProperty" ||
                     p.type == "ComponentProperty") {
            DrawObjectCombo(sel, p);
          } else {
            if (editing_first_frame_) {
              ImGui::SetKeyboardFocusHere();
              editing_first_frame_ = false;
            }
            const bool submitted =
                ImGui::InputText("##edit", edit_buf_, sizeof(edit_buf_),
                                 ImGuiInputTextFlags_EnterReturnsTrue |
                                     ImGuiInputTextFlags_AutoSelectAll);
            if (submitted) {
              RedahmQueuePropertyEdit(sel.addr, p.addr, edit_buf_, post_edit_change_);
              editing_prop_ = 0;
            } else if (ImGui::IsKeyPressed(ImGuiKey_Escape)) {
              editing_prop_ = 0;
            }
          }
        } else {
          const std::string value = RedahmFormatPropertyValue(p, sel.addr);
          if (ImGui::Selectable(value.c_str(), false, ImGuiSelectableFlags_AllowDoubleClick)) {
            editing_prop_ = p.addr;
            editing_first_frame_ = true;
            std::snprintf(edit_buf_, sizeof(edit_buf_), "%s", value.c_str());
          }
        }
        ImGui::PopID();
        ImGui::TableSetColumnIndex(2);
        // The struct name doubles as the check on kRedahmStructPropStructOffset,
        // which was reasoned from layout rather than read out of a function.
        if (p.struct_name.empty()) {
          ImGui::TextDisabled("%s", p.type.c_str());
        } else {
          ImGui::TextDisabled("Struct<%s>", p.struct_name.c_str());
        }
        ImGui::TableSetColumnIndex(3);
        ImGui::TextDisabled("+%X", p.offset);
        ImGui::TableSetColumnIndex(4);
        ImGui::TextDisabled("%s", p.owner.c_str());
      }
    }
    ImGui::EndTable();
  }

  // Fixed set of values: bool, or an enum's tag list. Each entry is already
  // valid ImportText, so the selection is written back verbatim.
  void DrawOptionCombo(const RedahmObject& sel, const RedahmProperty& p,
                       const std::vector<std::string>& options) {
    const std::string current = RedahmFormatPropertyValue(p, sel.addr);
    if (!ImGui::BeginCombo("##opt", current.c_str())) {
      return;
    }
    for (const auto& opt : options) {
      if (ImGui::Selectable(opt.c_str(), opt == current)) {
        RedahmQueuePropertyEdit(sel.addr, p.addr, opt, post_edit_change_);
        editing_prop_ = 0;
      }
    }
    ImGui::EndCombo();
  }

  // Object references: everything in the world that could legally be assigned,
  // which means scanning the object list against the property's PropertyClass.
  // Built once per property rather than per frame, and filterable because some
  // classes have thousands of instances.
  void DrawObjectCombo(const RedahmObject& sel, const RedahmProperty& p) {
    const std::string current = RedahmFormatPropertyValue(p, sel.addr);
    if (!ImGui::BeginCombo("##objopt", current.c_str())) {
      return;
    }
    if (obj_options_for_ != p.addr) {
      obj_options_for_ = p.addr;
      obj_options_filter_[0] = '\0';
      auto snapshot = RedahmObjects();
      obj_options_ = snapshot ? RedahmObjectOptionsFor(*snapshot, p.addr) : decltype(obj_options_){};
    }

    ImGui::SetNextItemWidth(-1.0f);
    ImGui::InputTextWithHint("##objfilter", "Filter...", obj_options_filter_,
                             sizeof(obj_options_filter_));
    ImGui::Separator();
    int shown = 0;
    for (const auto& opt : obj_options_) {
      if (!ContainsNoCase(opt.path, obj_options_filter_)) {
        continue;
      }
      if (++shown > 200) {
        ImGui::TextDisabled("...more, narrow the filter");
        break;
      }
      if (ImGui::Selectable(opt.path.c_str(), opt.path == current)) {
        RedahmQueuePropertyEdit(sel.addr, p.addr, opt.path, post_edit_change_);
        editing_prop_ = 0;
      }
    }
    if (obj_options_.size() <= 1) {
      ImGui::TextDisabled("nothing assignable found of this property's class");
    }
    ImGui::EndCombo();
  }

  void DrawHeaderDump(const RedahmObjectSnapshot& snapshot, const RedahmObject& sel) {
    constexpr size_t kDwords = 0x18;  // 0x00 .. 0x5C
    const std::vector<uint32_t> words = RedahmReadDwords(sel.addr, kDwords);

    constexpr ImGuiTableFlags kFlags =
        ImGuiTableFlags_RowBg | ImGuiTableFlags_Borders | ImGuiTableFlags_ScrollY;
    if (!ImGui::BeginTable("##hdr", 4, kFlags, ImVec2(0.0f, 0.0f))) {
      return;
    }
    ImGui::TableSetupScrollFreeze(0, 1);
    ImGui::TableSetupColumn("Off", ImGuiTableColumnFlags_WidthFixed, 50.0f);
    ImGui::TableSetupColumn("Value", ImGuiTableColumnFlags_WidthFixed, 90.0f);
    ImGui::TableSetupColumn("Kind", ImGuiTableColumnFlags_WidthFixed, 60.0f);
    ImGui::TableSetupColumn("Note", ImGuiTableColumnFlags_WidthStretch);
    ImGui::TableHeadersRow();

    for (size_t i = 0; i < words.size(); ++i) {
      const uint32_t off = static_cast<uint32_t>(i * 4);
      const uint32_t v = words[i];
      ImGui::TableNextRow();
      ImGui::TableSetColumnIndex(0);
      ImGui::Text("+%02X", off);
      ImGui::TableSetColumnIndex(1);
      ImGui::Text("%08X", v);
      ImGui::TableSetColumnIndex(2);
      ImGui::TextUnformatted(Classify(snapshot, v));
      ImGui::TableSetColumnIndex(3);

      if (off == kRedahmObjectNameOffset) {
        ImGui::TextColored(ImVec4(0.5f, 0.9f, 0.6f, 1.0f), "Name.Index -> \"%s\"",
                           RedahmResolveFName(v, 0).c_str());
      } else if (off == kRedahmObjectNameOffset + 4) {
        ImGui::TextColored(ImVec4(0.5f, 0.9f, 0.6f, 1.0f), "Name.Number");
      } else if (off == kRedahmObjectClassOffset) {
        ImGui::TextColored(ImVec4(0.5f, 0.9f, 0.6f, 1.0f), "Class -> %s",
                           RedahmReadObjectName(v).c_str());
      } else if (off == kRedahmObjectOuterOffset) {
        ImGui::TextColored(ImVec4(0.5f, 0.9f, 0.6f, 1.0f), "Outer -> %s",
                           RedahmReadObjectName(v).c_str());
      } else if (off == kRedahmStructSuperOffset) {
        // Only a superclass link when the object is a UStruct; on anything else
        // this is whatever UObject keeps there, so it is labelled as a guess.
        ImGui::TextDisabled("SuperStruct (if UStruct) -> %s", RedahmReadObjectName(v).c_str());
      } else if (off == 0) {
        ImGui::TextDisabled("vtable");
      } else {
        // Anything that resolves as both a pointer-to-object and a readable
        // name is almost certainly Outer or ObjectArchetype.
        const std::string as_obj = RedahmReadObjectName(v);
        if (!as_obj.empty()) {
          ImGui::Text("as object -> \"%s\"", as_obj.c_str());
        } else {
          const std::string as_name = RedahmResolveFName(v, 0);
          if (!as_name.empty() && v < 0x40000) {
            ImGui::TextDisabled("as FName -> \"%s\"", as_name.c_str());
          }
        }
      }
    }
    ImGui::EndTable();
  }

  void DrawProbe(const RedahmObjectSnapshot& snapshot) {
    ImGui::TextWrapped(
        "How often the dword at each header offset is the address of another live object, "
        "sampled across the snapshot. +3C is Class and is the control: it should read ~100%%. "
        "Any other offset scoring high is a candidate for Outer / ObjectArchetype.");

    if (probe_sequence_ != snapshot.sequence) {
      probe_sequence_ = snapshot.sequence;
      probe_ = RedahmProbeObjectFields(snapshot, 0x5C, 2000);
    }

    constexpr ImGuiTableFlags kFlags =
        ImGuiTableFlags_RowBg | ImGuiTableFlags_Borders | ImGuiTableFlags_ScrollY;
    if (!ImGui::BeginTable("##probe", 4, kFlags, ImVec2(0.0f, 0.0f))) {
      return;
    }
    ImGui::TableSetupScrollFreeze(0, 1);
    ImGui::TableSetupColumn("Off", ImGuiTableColumnFlags_WidthFixed, 50.0f);
    ImGui::TableSetupColumn("-> object", ImGuiTableColumnFlags_WidthFixed, 110.0f);
    ImGui::TableSetupColumn("-> image", ImGuiTableColumnFlags_WidthFixed, 110.0f);
    ImGui::TableSetupColumn("non-zero", ImGuiTableColumnFlags_WidthStretch);
    ImGui::TableHeadersRow();

    for (const auto& p : probe_) {
      const float pct =
          p.samples > 0 ? (100.0f * static_cast<float>(p.object_hits) / static_cast<float>(p.samples))
                        : 0.0f;
      ImGui::TableNextRow();
      ImGui::TableSetColumnIndex(0);
      ImGui::Text("+%02X", p.offset);
      ImGui::TableSetColumnIndex(1);
      if (pct >= 50.0f) {
        ImGui::TextColored(ImVec4(0.5f, 0.9f, 0.6f, 1.0f), "%d (%.0f%%)", p.object_hits, pct);
      } else {
        ImGui::Text("%d (%.0f%%)", p.object_hits, pct);
      }
      ImGui::TableSetColumnIndex(2);
      ImGui::Text("%d", p.code_hits);
      ImGui::TableSetColumnIndex(3);
      ImGui::Text("%d / %d", p.nonzero, p.samples);
    }
    ImGui::EndTable();
  }

  bool visible_ = false;
  bool auto_refresh_ = false;
  int auto_countdown_ = 0;

  char name_filter_[128] = {};
  char class_filter_[128] = {};
  char cached_name_filter_[128] = {};
  char cached_class_filter_[128] = {};

  uint32_t selected_addr_ = 0;

  std::vector<size_t> filtered_;
  uint64_t filtered_sequence_ = 0;

  std::unordered_set<uint32_t> addr_set_;
  uint64_t addr_set_sequence_ = 0;

  std::vector<RedahmFieldProbe> probe_;
  uint64_t probe_sequence_ = 0;

  // Cached per class, not per object: the field list is a property of the type.
  std::vector<RedahmProperty> props_;
  uint32_t props_for_class_ = 0;

  char prop_filter_[128] = {};
  std::vector<size_t> prop_filtered_;
  bool prop_filter_dirty_ = true;

  std::vector<RedahmObjectOption> obj_options_;
  uint32_t obj_options_for_ = 0;
  char obj_options_filter_[96] = {};

  uint32_t editing_prop_ = 0;
  bool editing_first_frame_ = false;
  bool post_edit_change_ = true;
  char edit_buf_[256] = {};

  bool show_boxes_ = true;
  bool show_all_labels_ = false;
  int max_boxes_ = 200;
  int boxes_drawn_ = 0;
  std::string sel_box_status_;
  std::string last_logged_box_status_;
  bool scroll_to_selected_ = false;

  static constexpr size_t kNoIndex = static_cast<size_t>(-1);
  size_t sel_cache_index_ = kNoIndex;
  uint32_t sel_cache_addr_ = 0;
  uint64_t sel_cache_seq_ = 0;
  std::string sel_path_;
  std::string sel_chain_;

  RedahmViewInfo view_;
  uint64_t view_sequence_ = 0;
  uint32_t view_source_ = 0;
  uint32_t camera_override_ = 0;
  uint32_t view_override_used_ = 0;
};

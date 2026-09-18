#pragma once

// ImmediateDrawer for the SDK's ImGui overlays in detached mode. It records
// into the frame's command list from inside the present overlay callback, so
// every drawing call happens while the presenting thread holds Host().mutex.

#include <memory>

#include <rex/types.h>
#include <rex/ui/immediate_drawer.h>
#include <rex/ui/presenter.h>

namespace plume {
struct RenderCommandList;
struct RenderFramebuffer;
struct RenderTexture;
struct RenderTextureView;
}  // namespace plume

namespace redahm::gpu {

class OverlayDrawContext final : public rex::ui::AppUIDrawContext {
 public:
  OverlayDrawContext(u32 width, u32 height, plume::RenderCommandList* list,
                     plume::RenderFramebuffer* framebuffer)
      : rex::ui::AppUIDrawContext(width, height), list_(list), framebuffer_(framebuffer) {}

  plume::RenderCommandList* list() const { return list_; }
  plume::RenderFramebuffer* framebuffer() const { return framebuffer_; }

 private:
  plume::RenderCommandList* list_;
  plume::RenderFramebuffer* framebuffer_;
};

class OverlayTexture final : public rex::ui::ImmediateTexture {
 public:
  OverlayTexture(u32 width, u32 height, u32 slot, u32 sampler_slot,
                 std::unique_ptr<plume::RenderTexture> texture,
                 std::unique_ptr<plume::RenderTextureView> view);
  ~OverlayTexture() override;

  u32 slot() const { return slot_; }
  u32 sampler_slot() const { return sampler_slot_; }

 private:
  u32 slot_;
  u32 sampler_slot_;
  std::unique_ptr<plume::RenderTexture> texture_;
  std::unique_ptr<plume::RenderTextureView> view_;
};

class OverlayDrawer final : public rex::ui::ImmediateDrawer {
 public:
  OverlayDrawer();
  ~OverlayDrawer() override;

  // nullptr until the renderer is up and a frame is recording; ImGuiDrawer
  // retries on its next draw.
  std::unique_ptr<rex::ui::ImmediateTexture> CreateTexture(u32 width, u32 height,
                                                           rex::ui::ImmediateTextureFilter filter,
                                                           bool is_repeated,
                                                           const u8* data) override;
  void Begin(rex::ui::UIDrawContext& context, float coordinate_width,
             float coordinate_height) override;
  void BeginDrawBatch(const rex::ui::ImmediateDrawBatch& batch) override;
  void Draw(const rex::ui::ImmediateDraw& draw) override;
  void EndDrawBatch() override;
  void End() override;

 private:
  bool EnsureWhiteTexture();

  plume::RenderCommandList* list_ = nullptr;
  bool batch_open_ = false;
  std::unique_ptr<OverlayTexture> white_;
};

}  // namespace redahm::gpu

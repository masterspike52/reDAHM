#include "overlay/imgui_drawer.h"

#include <cstring>
#include <mutex>
#include <vector>

#include <plume_render_interface.h>

#include "core/log.h"
#include "present/present.h"
#include "render/host.h"
#include "render/host_pipelines.h"
#include "render/upload_heap.h"

namespace redahm::gpu {

namespace {

const plume::RenderInputSlot kImGuiSlot(0, sizeof(rex::ui::ImmediateVertex));

// Uploads RGBA8 pixels into a new sampled texture. Needs Host().mutex and an
// open list.
bool UploadRgba8Locked(u32 width, u32 height, const u8* rgba,
                       std::unique_ptr<plume::RenderTexture>& texture_out,
                       std::unique_ptr<plume::RenderTextureView>& view_out, u32& slot_out) {
  auto& h = Host();
  if (!h.ready || !h.list_open)
    return false;
  plume::RenderCommandList* list = h.frames[h.frame].list.get();

  plume::RenderTextureDesc desc;
  desc.dimension = plume::RenderTextureDimension::TEXTURE_2D;
  desc.width = width;
  desc.height = height;
  desc.depth = 1;
  desc.mipLevels = 1;
  desc.arraySize = 1;
  desc.format = plume::RenderFormat::R8G8B8A8_UNORM;
  desc.committed = true;
  auto texture = CreateTexture(desc, "overlay");
  if (!texture)
    return false;
  plume::RenderTextureViewDesc view_desc;
  view_desc.format = desc.format;
  view_desc.dimension = plume::RenderTextureViewDimension::TEXTURE_2D;
  view_desc.mipLevels = 1;
  auto view = texture->createTextureView(view_desc);
  if (!view)
    return false;

  const u32 row_bytes = width * 4;
  const u32 row_pitch = (row_bytes + 255) & ~u32(255);
  UploadAllocation staging = UploadAllocateLocked(row_pitch * height, 512);
  if (!staging)
    return false;
  for (u32 y = 0; y < height; ++y) {
    u8* row = staging.data + y * row_pitch;
    std::memcpy(row, rgba + y * row_bytes, row_bytes);
    std::memset(row + row_bytes, 0, row_pitch - row_bytes);
  }

  const u32 slot = AllocateTextureSlotLocked();
  if (slot == kInvalidSlot)
    return false;
  SetTextureSlotLocked(slot, texture.get(), view.get());

  list->barriers(plume::RenderBarrierStage::COPY,
                 plume::RenderTextureBarrier(texture.get(), plume::RenderTextureLayout::COPY_DEST));
  list->copyTextureRegion(plume::RenderTextureCopyLocation::Subresource(texture.get(), 0),
                          plume::RenderTextureCopyLocation::PlacedFootprint(
                              staging.buffer, desc.format, width, height, 1, row_pitch / 4,
                              staging.offset));
  list->barriers(plume::RenderBarrierStage::GRAPHICS,
                 plume::RenderTextureBarrier(texture.get(), plume::RenderTextureLayout::SHADER_READ));

  texture_out = std::move(texture);
  view_out = std::move(view);
  slot_out = slot;
  return true;
}

}  // namespace

OverlayTexture::OverlayTexture(u32 width, u32 height, u32 slot, u32 sampler_slot,
                               std::unique_ptr<plume::RenderTexture> texture,
                               std::unique_ptr<plume::RenderTextureView> view)
    : rex::ui::ImmediateTexture(width, height),
      slot_(slot),
      sampler_slot_(sampler_slot),
      texture_(std::move(texture)),
      view_(std::move(view)) {}

OverlayTexture::~OverlayTexture() {
  auto retire = [this] {
    RetireTextureSlotLocked(slot_, plume::RenderTextureViewDimension::TEXTURE_2D);
    RetireLocked(std::move(view_));
    RetireLocked(std::move(texture_));
  };
  if (InOverlayDraw()) {
    retire();
    return;
  }
  // Outside a frame the lock may be held by a present waiting on this very
  // thread; never block on it. A texture that cannot be retired is leaked.
  std::unique_lock lock(Host().mutex, std::try_to_lock);
  if (lock.owns_lock()) {
    retire();
  } else {
    texture_.release();
    view_.release();
  }
}

OverlayDrawer::OverlayDrawer() = default;
OverlayDrawer::~OverlayDrawer() = default;

std::unique_ptr<rex::ui::ImmediateTexture> OverlayDrawer::CreateTexture(
    u32 width, u32 height, rex::ui::ImmediateTextureFilter filter, bool is_repeated,
    const u8* data) {
  (void)is_repeated;
  if (!InOverlayDraw() || !data || !width || !height)
    return nullptr;
  std::unique_ptr<plume::RenderTexture> texture;
  std::unique_ptr<plume::RenderTextureView> view;
  u32 slot = kInvalidSlot;
  if (!UploadRgba8Locked(width, height, data, texture, view, slot))
    return nullptr;
  const u32 sampler_slot = filter == rex::ui::ImmediateTextureFilter::kNearest
                               ? kPointClampSamplerSlot
                               : kLinearClampSamplerSlot;
  return std::make_unique<OverlayTexture>(width, height, slot, sampler_slot, std::move(texture),
                                          std::move(view));
}

bool OverlayDrawer::EnsureWhiteTexture() {
  if (white_)
    return true;
  static const u8 kWhite[4] = {0xFF, 0xFF, 0xFF, 0xFF};
  std::unique_ptr<plume::RenderTexture> texture;
  std::unique_ptr<plume::RenderTextureView> view;
  u32 slot = kInvalidSlot;
  if (!UploadRgba8Locked(1, 1, kWhite, texture, view, slot))
    return false;
  white_ = std::make_unique<OverlayTexture>(1, 1, slot, kPointClampSamplerSlot,
                                            std::move(texture), std::move(view));
  return true;
}

void OverlayDrawer::Begin(rex::ui::UIDrawContext& context, float coordinate_width,
                          float coordinate_height) {
  rex::ui::ImmediateDrawer::Begin(context, coordinate_width, coordinate_height);
  list_ = nullptr;
  batch_open_ = false;
  if (!InOverlayDraw() || !EnsureWhiteTexture())
    return;
  plume::RenderPipeline* pipeline = ImGuiPipelineLocked();
  if (!pipeline)
    return;

  auto& overlay_context = static_cast<OverlayDrawContext&>(context);
  list_ = overlay_context.list();
  list_->setFramebuffer(overlay_context.framebuffer());
  plume::RenderViewport viewport(0.0f, 0.0f, float(context.render_target_width()),
                                 float(context.render_target_height()));
  list_->setViewports(&viewport, 1);
  list_->setPipeline(pipeline);
}

void OverlayDrawer::BeginDrawBatch(const rex::ui::ImmediateDrawBatch& batch) {
  batch_open_ = false;
  if (!list_ || batch.vertex_count <= 0)
    return;
  UploadAllocation vertices = UploadBytesLocked(
      batch.vertices, u32(sizeof(rex::ui::ImmediateVertex)) * u32(batch.vertex_count));
  if (!vertices)
    return;
  const plume::RenderVertexBufferView vertex_view(vertices.ref(), vertices.size);
  list_->setVertexBuffers(0, &vertex_view, 1, &kImGuiSlot);
  if (batch.indices && batch.index_count > 0) {
    UploadAllocation indices =
        UploadBytesLocked(batch.indices, u32(sizeof(u16)) * u32(batch.index_count), 4);
    if (!indices)
      return;
    const plume::RenderIndexBufferView index_view(indices.ref(), indices.size,
                                                  plume::RenderFormat::R16_UINT);
    list_->setIndexBuffer(&index_view);
  }
  batch_open_ = true;
}

void OverlayDrawer::Draw(const rex::ui::ImmediateDraw& draw) {
  if (!list_ || !batch_open_ || draw.count <= 0)
    return;
  u32 left, top, width, height;
  if (!ScissorToRenderTarget(draw, left, top, width, height))
    return;
  plume::RenderRect scissor(i32(left), i32(top), i32(left + width), i32(top + height));
  list_->setScissors(&scissor, 1);

  HostPushConstants constants;
  constants.texture_slot = white_->slot();
  constants.sampler_slot = white_->sampler_slot();
  if (draw.texture) {
    auto* texture = static_cast<OverlayTexture*>(draw.texture);
    constants.texture_slot = texture->slot();
    constants.sampler_slot = texture->sampler_slot();
  }
  constants.values[0] = 2.0f / coordinate_space_width();
  constants.values[1] = -2.0f / coordinate_space_height();
  constants.values[2] = -1.0f;
  constants.values[3] = 1.0f;
  SetHostPushConstantsLocked(list_, constants);

  list_->drawIndexedInstanced(u32(draw.count), 1, u32(draw.index_offset), draw.base_vertex, 0);
}

void OverlayDrawer::EndDrawBatch() {
  batch_open_ = false;
}

void OverlayDrawer::End() {
  list_ = nullptr;
  rex::ui::ImmediateDrawer::End();
}

}  // namespace redahm::gpu

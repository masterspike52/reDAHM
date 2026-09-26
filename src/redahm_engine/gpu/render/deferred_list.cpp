#include "render/deferred_list.h"

#include <cstring>
#include <new>
#include <type_traits>

#include "core/log.h"

namespace redahm::gpu {

namespace {

alignas(16) u8 g_back_framebuffer_tag;
alignas(16) u8 g_back_texture_tag;

constexpr size_t kAlign = 8;

constexpr size_t AlignUp(size_t value) {
  return (value + kAlign - 1) & ~(kAlign - 1);
}

static_assert(std::is_trivially_copyable_v<plume::RenderBufferBarrier>);
static_assert(std::is_trivially_copyable_v<plume::RenderTextureBarrier>);
static_assert(std::is_trivially_copyable_v<plume::RenderVertexBufferView>);
static_assert(std::is_trivially_copyable_v<plume::RenderInputSlot>);
static_assert(std::is_trivially_copyable_v<plume::RenderIndexBufferView>);
static_assert(std::is_trivially_copyable_v<plume::RenderViewport>);
static_assert(std::is_trivially_copyable_v<plume::RenderRect>);
static_assert(std::is_trivially_copyable_v<plume::RenderTextureCopyLocation>);
static_assert(std::is_trivially_copyable_v<plume::RenderBox>);
static_assert(std::is_trivially_copyable_v<plume::RenderColor>);

struct BarriersCmd {
  plume::RenderBarrierStages stages;
  u32 buffer_count;
  u32 texture_count;
};
struct DrawCmd {
  u32 vertex_count, instance_count, start_vertex, start_instance;
};
struct DrawIndexedCmd {
  u32 index_count, instance_count, start_index;
  i32 base_vertex;
  u32 start_instance;
};
struct PipelineCmd {
  const plume::RenderPipeline* pipeline;
};
struct LayoutCmd {
  const plume::RenderPipelineLayout* layout;
};
struct PushConstantsCmd {
  u32 range_index, offset, size;
};
struct DescriptorSetCmd {
  plume::RenderDescriptorSet* set;
  u32 index;
};
struct RootDescriptorCmd {
  plume::RenderBufferReference buffer;
  u32 index;
};
struct IndexBufferCmd {
  plume::RenderIndexBufferView view;
  bool null_view;
};
struct VertexBuffersCmd {
  u32 start_slot, count;
  bool has_slots;
};
struct CountCmd {
  u32 count;
};
struct FramebufferCmd {
  const plume::RenderFramebuffer* framebuffer;
};
struct DepthBiasCmd {
  float bias, clamp, slope;
};
struct ClearColorCmd {
  plume::RenderColor color;
  u32 attachment, rect_count;
};
struct ClearDepthCmd {
  float depth;
  u32 stencil, rect_count;
  bool clear_depth, clear_stencil;
};
struct CopyBufferRegionCmd {
  plume::RenderBufferReference dst, src;
  u64 size;
};
struct CopyTextureRegionCmd {
  plume::RenderTextureCopyLocation dst, src;
  u32 x, y, z;
  bool has_box;
  plume::RenderBox box;
};
struct CopyBufferCmd {
  const plume::RenderBuffer* dst;
  const plume::RenderBuffer* src;
};
struct CopyTextureCmd {
  const plume::RenderTexture* dst;
  const plume::RenderTexture* src;
};
struct NativeCmd {
  DeferredCommandList::NativeFn fn;
  u32 a;
  u32 b;
};

template <typename T>
const T* After(const void* payload, size_t payload_size) {
  return reinterpret_cast<const T*>(static_cast<const u8*>(payload) + AlignUp(payload_size));
}

}  // namespace

enum class DeferredCommandList::Op : u16 {
  kBarriers,
  kDraw,
  kDrawIndexed,
  kPipeline,
  kGraphicsLayout,
  kGraphicsPushConstants,
  kGraphicsDescriptorSet,
  kGraphicsRootDescriptor,
  kIndexBuffer,
  kVertexBuffers,
  kViewports,
  kScissors,
  kFramebuffer,
  kDepthBias,
  kClearColor,
  kClearDepthStencil,
  kCopyBufferRegion,
  kCopyTextureRegion,
  kCopyBuffer,
  kCopyTexture,
  kDiscardTexture,
  kNative,
};

struct DeferredCommandList::Header {
  Op op;
  u16 reserved;
  u32 size;  // header, payload and trailing arrays, aligned
};

const plume::RenderFramebuffer* DeferredCommandList::BackBufferFramebuffer() {
  return reinterpret_cast<const plume::RenderFramebuffer*>(&g_back_framebuffer_tag);
}

plume::RenderTexture* DeferredCommandList::BackBufferTexture() {
  return reinterpret_cast<plume::RenderTexture*>(&g_back_texture_tag);
}

template <typename Payload>
Payload* DeferredCommandList::Push(Op op, size_t extra) {
  static_assert(std::is_trivially_copyable_v<Payload>);
  static_assert(sizeof(Header) == kAlign);
  const size_t size = sizeof(Header) + AlignUp(sizeof(Payload)) + AlignUp(extra);
  const size_t at = data_.size();
  data_.resize(at + size);
  auto* header = reinterpret_cast<Header*>(data_.data() + at);
  header->op = op;
  header->reserved = 0;
  header->size = u32(size);
  return new (data_.data() + at + sizeof(Header)) Payload{};
}

void DeferredCommandList::Unsupported(const char* name) {
  GPU_ERROR("DeferredCommandList::{} is not supported; the call was dropped", name);
}

void DeferredCommandList::begin() {
  data_.clear();
}

void DeferredCommandList::end() {}

void DeferredCommandList::barriers(plume::RenderBarrierStages stages,
                                   const plume::RenderBufferBarrier* bufferBarriers,
                                   uint32_t bufferBarriersCount,
                                   const plume::RenderTextureBarrier* textureBarriers,
                                   uint32_t textureBarriersCount) {
  if (!bufferBarriers)
    bufferBarriersCount = 0;
  if (!textureBarriers)
    textureBarriersCount = 0;
  const size_t buffer_bytes = sizeof(plume::RenderBufferBarrier) * bufferBarriersCount;
  const size_t texture_bytes = sizeof(plume::RenderTextureBarrier) * textureBarriersCount;
  auto* cmd = Push<BarriersCmd>(Op::kBarriers, AlignUp(buffer_bytes) + texture_bytes);
  cmd->stages = stages;
  cmd->buffer_count = bufferBarriersCount;
  cmd->texture_count = textureBarriersCount;
  u8* arrays = reinterpret_cast<u8*>(cmd) + AlignUp(sizeof(BarriersCmd));
  if (buffer_bytes)
    std::memcpy(arrays, bufferBarriers, buffer_bytes);
  if (texture_bytes)
    std::memcpy(arrays + AlignUp(buffer_bytes), textureBarriers, texture_bytes);
}

void DeferredCommandList::dispatch(uint32_t, uint32_t, uint32_t) {
  Unsupported("dispatch");
}

void DeferredCommandList::traceRays(uint32_t, uint32_t, uint32_t, plume::RenderBufferReference,
                                    const plume::RenderShaderBindingGroupsInfo&) {
  Unsupported("traceRays");
}

void DeferredCommandList::drawInstanced(uint32_t vertexCountPerInstance, uint32_t instanceCount,
                                        uint32_t startVertexLocation,
                                        uint32_t startInstanceLocation) {
  *Push<DrawCmd>(Op::kDraw) = {vertexCountPerInstance, instanceCount, startVertexLocation,
                               startInstanceLocation};
}

void DeferredCommandList::drawIndexedInstanced(uint32_t indexCountPerInstance,
                                               uint32_t instanceCount, uint32_t startIndexLocation,
                                               int32_t baseVertexLocation,
                                               uint32_t startInstanceLocation) {
  *Push<DrawIndexedCmd>(Op::kDrawIndexed) = {indexCountPerInstance, instanceCount,
                                             startIndexLocation, baseVertexLocation,
                                             startInstanceLocation};
}

void DeferredCommandList::setPipeline(const plume::RenderPipeline* pipeline) {
  Push<PipelineCmd>(Op::kPipeline)->pipeline = pipeline;
}

void DeferredCommandList::setComputePipelineLayout(const plume::RenderPipelineLayout*) {
  Unsupported("setComputePipelineLayout");
}

void DeferredCommandList::setComputePushConstants(uint32_t, const void*, uint32_t, uint32_t) {
  Unsupported("setComputePushConstants");
}

void DeferredCommandList::setComputeDescriptorSet(plume::RenderDescriptorSet*, uint32_t) {
  Unsupported("setComputeDescriptorSet");
}

void DeferredCommandList::setGraphicsPipelineLayout(const plume::RenderPipelineLayout* pipelineLayout) {
  Push<LayoutCmd>(Op::kGraphicsLayout)->layout = pipelineLayout;
}

void DeferredCommandList::setGraphicsPushConstants(uint32_t rangeIndex, const void* data,
                                                   uint32_t offset, uint32_t size) {
  // size 0 means "the rest of the range", which only the backend knows.
  if (!data || size == 0) {
    Unsupported("setGraphicsPushConstants without a size");
    return;
  }
  auto* cmd = Push<PushConstantsCmd>(Op::kGraphicsPushConstants, size);
  *cmd = {rangeIndex, offset, size};
  std::memcpy(reinterpret_cast<u8*>(cmd) + AlignUp(sizeof(PushConstantsCmd)), data, size);
}

void DeferredCommandList::setGraphicsDescriptorSet(plume::RenderDescriptorSet* descriptorSet,
                                                   uint32_t setIndex) {
  *Push<DescriptorSetCmd>(Op::kGraphicsDescriptorSet) = {descriptorSet, setIndex};
}

void DeferredCommandList::setGraphicsRootDescriptor(plume::RenderBufferReference bufferReference,
                                                    uint32_t rootDescriptorIndex) {
  *Push<RootDescriptorCmd>(Op::kGraphicsRootDescriptor) = {bufferReference, rootDescriptorIndex};
}

void DeferredCommandList::setRaytracingPipelineLayout(const plume::RenderPipelineLayout*) {
  Unsupported("setRaytracingPipelineLayout");
}

void DeferredCommandList::setRaytracingPushConstants(uint32_t, const void*, uint32_t, uint32_t) {
  Unsupported("setRaytracingPushConstants");
}

void DeferredCommandList::setRaytracingDescriptorSet(plume::RenderDescriptorSet*, uint32_t) {
  Unsupported("setRaytracingDescriptorSet");
}

void DeferredCommandList::setIndexBuffer(const plume::RenderIndexBufferView* view) {
  auto* cmd = Push<IndexBufferCmd>(Op::kIndexBuffer);
  cmd->null_view = view == nullptr;
  if (view)
    cmd->view = *view;
}

void DeferredCommandList::setVertexBuffers(uint32_t startSlot,
                                           const plume::RenderVertexBufferView* views,
                                           uint32_t viewCount,
                                           const plume::RenderInputSlot* inputSlots) {
  if (!views)
    viewCount = 0;
  const size_t view_bytes = sizeof(plume::RenderVertexBufferView) * viewCount;
  const size_t slot_bytes = inputSlots ? sizeof(plume::RenderInputSlot) * viewCount : 0;
  auto* cmd = Push<VertexBuffersCmd>(Op::kVertexBuffers, AlignUp(view_bytes) + slot_bytes);
  *cmd = {startSlot, viewCount, inputSlots != nullptr};
  u8* arrays = reinterpret_cast<u8*>(cmd) + AlignUp(sizeof(VertexBuffersCmd));
  if (view_bytes)
    std::memcpy(arrays, views, view_bytes);
  if (slot_bytes)
    std::memcpy(arrays + AlignUp(view_bytes), inputSlots, slot_bytes);
}

void DeferredCommandList::setViewports(const plume::RenderViewport* viewports, uint32_t count) {
  if (!viewports)
    count = 0;
  auto* cmd = Push<CountCmd>(Op::kViewports, sizeof(plume::RenderViewport) * count);
  cmd->count = count;
  if (count) {
    std::memcpy(reinterpret_cast<u8*>(cmd) + AlignUp(sizeof(CountCmd)), viewports,
                sizeof(plume::RenderViewport) * count);
  }
}

void DeferredCommandList::setScissors(const plume::RenderRect* scissorRects, uint32_t count) {
  if (!scissorRects)
    count = 0;
  auto* cmd = Push<CountCmd>(Op::kScissors, sizeof(plume::RenderRect) * count);
  cmd->count = count;
  if (count) {
    std::memcpy(reinterpret_cast<u8*>(cmd) + AlignUp(sizeof(CountCmd)), scissorRects,
                sizeof(plume::RenderRect) * count);
  }
}

void DeferredCommandList::setFramebuffer(const plume::RenderFramebuffer* framebuffer) {
  Push<FramebufferCmd>(Op::kFramebuffer)->framebuffer = framebuffer;
}

void DeferredCommandList::setDepthBias(float depthBias, float depthBiasClamp,
                                       float slopeScaledDepthBias) {
  *Push<DepthBiasCmd>(Op::kDepthBias) = {depthBias, depthBiasClamp, slopeScaledDepthBias};
}

void DeferredCommandList::clearColor(uint32_t attachmentIndex, plume::RenderColor colorValue,
                                     const plume::RenderRect* clearRects,
                                     uint32_t clearRectsCount) {
  if (!clearRects)
    clearRectsCount = 0;
  auto* cmd = Push<ClearColorCmd>(Op::kClearColor, sizeof(plume::RenderRect) * clearRectsCount);
  cmd->color = colorValue;
  cmd->attachment = attachmentIndex;
  cmd->rect_count = clearRectsCount;
  if (clearRectsCount) {
    std::memcpy(reinterpret_cast<u8*>(cmd) + AlignUp(sizeof(ClearColorCmd)), clearRects,
                sizeof(plume::RenderRect) * clearRectsCount);
  }
}

void DeferredCommandList::clearDepthStencil(bool clearDepth, bool clearStencil, float depthValue,
                                            uint32_t stencilValue,
                                            const plume::RenderRect* clearRects,
                                            uint32_t clearRectsCount) {
  if (!clearRects)
    clearRectsCount = 0;
  auto* cmd =
      Push<ClearDepthCmd>(Op::kClearDepthStencil, sizeof(plume::RenderRect) * clearRectsCount);
  *cmd = {depthValue, stencilValue, clearRectsCount, clearDepth, clearStencil};
  if (clearRectsCount) {
    std::memcpy(reinterpret_cast<u8*>(cmd) + AlignUp(sizeof(ClearDepthCmd)), clearRects,
                sizeof(plume::RenderRect) * clearRectsCount);
  }
}

void DeferredCommandList::copyBufferRegion(plume::RenderBufferReference dstBuffer,
                                           plume::RenderBufferReference srcBuffer, uint64_t size) {
  *Push<CopyBufferRegionCmd>(Op::kCopyBufferRegion) = {dstBuffer, srcBuffer, size};
}

void DeferredCommandList::copyTextureRegion(const plume::RenderTextureCopyLocation& dstLocation,
                                            const plume::RenderTextureCopyLocation& srcLocation,
                                            uint32_t dstX, uint32_t dstY, uint32_t dstZ,
                                            const plume::RenderBox* srcBox) {
  auto* cmd = Push<CopyTextureRegionCmd>(Op::kCopyTextureRegion);
  cmd->dst = dstLocation;
  cmd->src = srcLocation;
  cmd->x = dstX;
  cmd->y = dstY;
  cmd->z = dstZ;
  cmd->has_box = srcBox != nullptr;
  if (srcBox)
    cmd->box = *srcBox;
}

void DeferredCommandList::copyBuffer(const plume::RenderBuffer* dstBuffer,
                                     const plume::RenderBuffer* srcBuffer) {
  *Push<CopyBufferCmd>(Op::kCopyBuffer) = {dstBuffer, srcBuffer};
}

void DeferredCommandList::copyTexture(const plume::RenderTexture* dstTexture,
                                      const plume::RenderTexture* srcTexture) {
  *Push<CopyTextureCmd>(Op::kCopyTexture) = {dstTexture, srcTexture};
}

void DeferredCommandList::resolveTexture(const plume::RenderTexture*, const plume::RenderTexture*) {
  Unsupported("resolveTexture");
}

void DeferredCommandList::resolveTextureRegion(const plume::RenderTexture*, uint32_t, uint32_t,
                                               const plume::RenderTexture*,
                                               const plume::RenderRect*, plume::RenderResolveMode) {
  Unsupported("resolveTextureRegion");
}

void DeferredCommandList::buildBottomLevelAS(const plume::RenderAccelerationStructure*,
                                             plume::RenderBufferReference,
                                             const plume::RenderBottomLevelASBuildInfo&) {
  Unsupported("buildBottomLevelAS");
}

void DeferredCommandList::buildTopLevelAS(const plume::RenderAccelerationStructure*,
                                          plume::RenderBufferReference,
                                          plume::RenderBufferReference,
                                          const plume::RenderTopLevelASBuildInfo&) {
  Unsupported("buildTopLevelAS");
}

void DeferredCommandList::discardTexture(const plume::RenderTexture* texture) {
  *Push<CopyTextureCmd>(Op::kDiscardTexture) = {texture, nullptr};
}

void DeferredCommandList::Native(NativeFn fn, u32 a, u32 b) {
  *Push<NativeCmd>(Op::kNative) = {fn, a, b};
}

void DeferredCommandList::resetQueryPool(const plume::RenderQueryPool*, uint32_t, uint32_t) {
  Unsupported("resetQueryPool");
}

void DeferredCommandList::writeTimestamp(const plume::RenderQueryPool*, uint32_t) {
  Unsupported("writeTimestamp");
}

void DeferredCommandList::Replay(plume::RenderCommandList* list,
                                 const plume::RenderFramebuffer* back_framebuffer,
                                 plume::RenderTexture* back_texture) const {
  std::vector<plume::RenderTextureBarrier> texture_barriers;
  const u8* at = data_.data();
  const u8* end = at + data_.size();
  while (at < end) {
    const auto* header = reinterpret_cast<const Header*>(at);
    const void* payload = at + sizeof(Header);
    switch (header->op) {
      case Op::kBarriers: {
        const auto* cmd = static_cast<const BarriersCmd*>(payload);
        const auto* buffers = After<plume::RenderBufferBarrier>(cmd, sizeof(BarriersCmd));
        const auto* textures = reinterpret_cast<const plume::RenderTextureBarrier*>(
            reinterpret_cast<const u8*>(buffers) +
            AlignUp(sizeof(plume::RenderBufferBarrier) * cmd->buffer_count));
        texture_barriers.assign(textures, textures + cmd->texture_count);
        for (auto& barrier : texture_barriers) {
          if (barrier.texture == BackBufferTexture())
            barrier.texture = back_texture;
        }
        list->barriers(cmd->stages, cmd->buffer_count ? buffers : nullptr, cmd->buffer_count,
                       texture_barriers.empty() ? nullptr : texture_barriers.data(),
                       u32(texture_barriers.size()));
        break;
      }
      case Op::kDraw: {
        const auto* cmd = static_cast<const DrawCmd*>(payload);
        list->drawInstanced(cmd->vertex_count, cmd->instance_count, cmd->start_vertex,
                            cmd->start_instance);
        break;
      }
      case Op::kDrawIndexed: {
        const auto* cmd = static_cast<const DrawIndexedCmd*>(payload);
        list->drawIndexedInstanced(cmd->index_count, cmd->instance_count, cmd->start_index,
                                   cmd->base_vertex, cmd->start_instance);
        break;
      }
      case Op::kPipeline:
        list->setPipeline(static_cast<const PipelineCmd*>(payload)->pipeline);
        break;
      case Op::kGraphicsLayout:
        list->setGraphicsPipelineLayout(static_cast<const LayoutCmd*>(payload)->layout);
        break;
      case Op::kGraphicsPushConstants: {
        const auto* cmd = static_cast<const PushConstantsCmd*>(payload);
        list->setGraphicsPushConstants(cmd->range_index, After<u8>(cmd, sizeof(PushConstantsCmd)),
                                       cmd->offset, cmd->size);
        break;
      }
      case Op::kGraphicsDescriptorSet: {
        const auto* cmd = static_cast<const DescriptorSetCmd*>(payload);
        list->setGraphicsDescriptorSet(cmd->set, cmd->index);
        break;
      }
      case Op::kGraphicsRootDescriptor: {
        const auto* cmd = static_cast<const RootDescriptorCmd*>(payload);
        list->setGraphicsRootDescriptor(cmd->buffer, cmd->index);
        break;
      }
      case Op::kIndexBuffer: {
        const auto* cmd = static_cast<const IndexBufferCmd*>(payload);
        list->setIndexBuffer(cmd->null_view ? nullptr : &cmd->view);
        break;
      }
      case Op::kVertexBuffers: {
        const auto* cmd = static_cast<const VertexBuffersCmd*>(payload);
        const auto* views = After<plume::RenderVertexBufferView>(cmd, sizeof(VertexBuffersCmd));
        const auto* slots = reinterpret_cast<const plume::RenderInputSlot*>(
            reinterpret_cast<const u8*>(views) +
            AlignUp(sizeof(plume::RenderVertexBufferView) * cmd->count));
        list->setVertexBuffers(cmd->start_slot, cmd->count ? views : nullptr, cmd->count,
                               cmd->has_slots ? slots : nullptr);
        break;
      }
      case Op::kViewports: {
        const auto* cmd = static_cast<const CountCmd*>(payload);
        list->setViewports(After<plume::RenderViewport>(cmd, sizeof(CountCmd)), cmd->count);
        break;
      }
      case Op::kScissors: {
        const auto* cmd = static_cast<const CountCmd*>(payload);
        list->setScissors(After<plume::RenderRect>(cmd, sizeof(CountCmd)), cmd->count);
        break;
      }
      case Op::kFramebuffer: {
        const auto* framebuffer = static_cast<const FramebufferCmd*>(payload)->framebuffer;
        list->setFramebuffer(framebuffer == BackBufferFramebuffer() ? back_framebuffer : framebuffer);
        break;
      }
      case Op::kDepthBias: {
        const auto* cmd = static_cast<const DepthBiasCmd*>(payload);
        list->setDepthBias(cmd->bias, cmd->clamp, cmd->slope);
        break;
      }
      case Op::kClearColor: {
        const auto* cmd = static_cast<const ClearColorCmd*>(payload);
        list->clearColor(cmd->attachment, cmd->color,
                         cmd->rect_count ? After<plume::RenderRect>(cmd, sizeof(ClearColorCmd))
                                         : nullptr,
                         cmd->rect_count);
        break;
      }
      case Op::kClearDepthStencil: {
        const auto* cmd = static_cast<const ClearDepthCmd*>(payload);
        list->clearDepthStencil(
            cmd->clear_depth, cmd->clear_stencil, cmd->depth, cmd->stencil,
            cmd->rect_count ? After<plume::RenderRect>(cmd, sizeof(ClearDepthCmd)) : nullptr,
            cmd->rect_count);
        break;
      }
      case Op::kCopyBufferRegion: {
        const auto* cmd = static_cast<const CopyBufferRegionCmd*>(payload);
        list->copyBufferRegion(cmd->dst, cmd->src, cmd->size);
        break;
      }
      case Op::kCopyTextureRegion: {
        const auto* cmd = static_cast<const CopyTextureRegionCmd*>(payload);
        list->copyTextureRegion(cmd->dst, cmd->src, cmd->x, cmd->y, cmd->z,
                                cmd->has_box ? &cmd->box : nullptr);
        break;
      }
      case Op::kCopyBuffer: {
        const auto* cmd = static_cast<const CopyBufferCmd*>(payload);
        list->copyBuffer(cmd->dst, cmd->src);
        break;
      }
      case Op::kCopyTexture: {
        const auto* cmd = static_cast<const CopyTextureCmd*>(payload);
        list->copyTexture(cmd->dst, cmd->src);
        break;
      }
      case Op::kDiscardTexture:
        list->discardTexture(static_cast<const CopyTextureCmd*>(payload)->dst);
        break;
      case Op::kNative: {
        const auto* cmd = static_cast<const NativeCmd*>(payload);
        cmd->fn(list, cmd->a, cmd->b);
        break;
      }
    }
    at += header->size;
  }
}

}  // namespace redahm::gpu

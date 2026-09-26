#pragma once

// A plume command list that only records. The draw path, resolves, clears and
// the overlay record into one on the title's render thread, as before; the
// submit thread (host.cpp) replays it onto a real command list, submits it and
// presents. Recording copies every argument, so nothing the caller points at
// has to outlive the call. The objects named (textures, buffers, pipelines,
// framebuffers) must live until the replay has been submitted and its fence
// has passed, which the frame ring's deferred retirement already guarantees.
//
// The present pass draws into the swap chain image before the submit thread
// has acquired it, so it names BackBufferFramebuffer() and
// BackBufferTexture() instead; Replay substitutes the acquired image.

#include <vector>

#include <plume_render_interface.h>
#include <rex/types.h>

namespace redahm::gpu {

class DeferredCommandList final : public plume::RenderCommandList {
 public:
  // Stand-ins for the frame's swap chain image. Never dereferenced.
  static const plume::RenderFramebuffer* BackBufferFramebuffer();
  static plume::RenderTexture* BackBufferTexture();

  bool Empty() const { return data_.empty(); }

  // Records a call made on the real command list at replay, for backend work
  // plume has no call for (D3D12 occlusion queries).
  using NativeFn = void (*)(plume::RenderCommandList* list, u32 a, u32 b);
  void Native(NativeFn fn, u32 a, u32 b);

  // Plays the recording onto `list` (open, recording), with the swap chain
  // image substituted for the stand-ins.
  void Replay(plume::RenderCommandList* list, const plume::RenderFramebuffer* back_framebuffer,
              plume::RenderTexture* back_texture) const;

  // The base class's convenience overloads, which the overrides would hide.
  using plume::RenderCommandList::barriers;
  using plume::RenderCommandList::setViewports;
  using plume::RenderCommandList::setScissors;

  // plume::RenderCommandList. begin() clears the recording; end() is a no-op.
  void begin() override;
  void end() override;
  void barriers(plume::RenderBarrierStages stages, const plume::RenderBufferBarrier* bufferBarriers,
                uint32_t bufferBarriersCount, const plume::RenderTextureBarrier* textureBarriers,
                uint32_t textureBarriersCount) override;
  void dispatch(uint32_t, uint32_t, uint32_t) override;
  void traceRays(uint32_t, uint32_t, uint32_t, plume::RenderBufferReference,
                 const plume::RenderShaderBindingGroupsInfo&) override;
  void drawInstanced(uint32_t vertexCountPerInstance, uint32_t instanceCount,
                     uint32_t startVertexLocation, uint32_t startInstanceLocation) override;
  void drawIndexedInstanced(uint32_t indexCountPerInstance, uint32_t instanceCount,
                            uint32_t startIndexLocation, int32_t baseVertexLocation,
                            uint32_t startInstanceLocation) override;
  void setPipeline(const plume::RenderPipeline* pipeline) override;
  void setComputePipelineLayout(const plume::RenderPipelineLayout*) override;
  void setComputePushConstants(uint32_t, const void*, uint32_t, uint32_t) override;
  void setComputeDescriptorSet(plume::RenderDescriptorSet*, uint32_t) override;
  void setGraphicsPipelineLayout(const plume::RenderPipelineLayout* pipelineLayout) override;
  void setGraphicsPushConstants(uint32_t rangeIndex, const void* data, uint32_t offset,
                                uint32_t size) override;
  void setGraphicsDescriptorSet(plume::RenderDescriptorSet* descriptorSet,
                                uint32_t setIndex) override;
  void setGraphicsRootDescriptor(plume::RenderBufferReference bufferReference,
                                 uint32_t rootDescriptorIndex) override;
  void setRaytracingPipelineLayout(const plume::RenderPipelineLayout*) override;
  void setRaytracingPushConstants(uint32_t, const void*, uint32_t, uint32_t) override;
  void setRaytracingDescriptorSet(plume::RenderDescriptorSet*, uint32_t) override;
  void setIndexBuffer(const plume::RenderIndexBufferView* view) override;
  void setVertexBuffers(uint32_t startSlot, const plume::RenderVertexBufferView* views,
                        uint32_t viewCount, const plume::RenderInputSlot* inputSlots) override;
  void setViewports(const plume::RenderViewport* viewports, uint32_t count) override;
  void setScissors(const plume::RenderRect* scissorRects, uint32_t count) override;
  void setFramebuffer(const plume::RenderFramebuffer* framebuffer) override;
  void setDepthBias(float depthBias, float depthBiasClamp, float slopeScaledDepthBias) override;
  void clearColor(uint32_t attachmentIndex, plume::RenderColor colorValue,
                  const plume::RenderRect* clearRects, uint32_t clearRectsCount) override;
  void clearDepthStencil(bool clearDepth, bool clearStencil, float depthValue,
                         uint32_t stencilValue, const plume::RenderRect* clearRects,
                         uint32_t clearRectsCount) override;
  void copyBufferRegion(plume::RenderBufferReference dstBuffer,
                        plume::RenderBufferReference srcBuffer, uint64_t size) override;
  void copyTextureRegion(const plume::RenderTextureCopyLocation& dstLocation,
                         const plume::RenderTextureCopyLocation& srcLocation, uint32_t dstX,
                         uint32_t dstY, uint32_t dstZ, const plume::RenderBox* srcBox) override;
  void copyBuffer(const plume::RenderBuffer* dstBuffer, const plume::RenderBuffer* srcBuffer) override;
  void copyTexture(const plume::RenderTexture* dstTexture,
                   const plume::RenderTexture* srcTexture) override;
  void resolveTexture(const plume::RenderTexture*, const plume::RenderTexture*) override;
  void resolveTextureRegion(const plume::RenderTexture*, uint32_t, uint32_t,
                            const plume::RenderTexture*, const plume::RenderRect*,
                            plume::RenderResolveMode) override;
  void buildBottomLevelAS(const plume::RenderAccelerationStructure*, plume::RenderBufferReference,
                          const plume::RenderBottomLevelASBuildInfo&) override;
  void buildTopLevelAS(const plume::RenderAccelerationStructure*, plume::RenderBufferReference,
                       plume::RenderBufferReference, const plume::RenderTopLevelASBuildInfo&) override;
  void discardTexture(const plume::RenderTexture* texture) override;
  void resetQueryPool(const plume::RenderQueryPool*, uint32_t, uint32_t) override;
  void writeTimestamp(const plume::RenderQueryPool*, uint32_t) override;

 private:
  enum class Op : u16;
  struct Header;

  // Appends a command with room for `extra` bytes after its payload.
  template <typename Payload>
  Payload* Push(Op op, size_t extra = 0);
  void Unsupported(const char* name);

  std::vector<u8> data_;
};

}  // namespace redahm::gpu

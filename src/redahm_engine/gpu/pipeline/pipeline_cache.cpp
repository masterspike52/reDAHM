#include "pipeline/pipeline_cache.h"

#include <memory>
#include <unordered_map>
#include <vector>

#include <xxhash.h>

#include "core/log.h"
#include "render/host.h"
#include "shaders/guest_shaders.h"
#include "shaders/vertex_declaration.h"

namespace redahm::gpu {

namespace {

struct PipelineKeyHash {
  size_t operator()(const PipelineKey& key) const { return XXH3_64bits(&key, sizeof(key)); }
};

std::unordered_map<PipelineKey, std::unique_ptr<plume::RenderPipeline>, PipelineKeyHash>
    g_pipelines;

plume::RenderStencilFaceDesc UnpackStencilFace(const u8 ops[4]) {
  plume::RenderStencilFaceDesc face;
  face.failOp = static_cast<plume::RenderStencilOp>(ops[0]);
  face.depthFailOp = static_cast<plume::RenderStencilOp>(ops[1]);
  face.passOp = static_cast<plume::RenderStencilOp>(ops[2]);
  face.compareFunction = static_cast<plume::RenderComparisonFunction>(ops[3]);
  return face;
}

}  // namespace

plume::RenderPipeline* GetPipelineLocked(const PipelineKey& key) {
  if (auto it = g_pipelines.find(key); it != g_pipelines.end())
    return it->second.get();

  auto& h = Host();
  plume::RenderShader* vertex_shader = GetHostShader(key.vertex_shader, key.spec_constants);
  plume::RenderShader* pixel_shader =
      key.pixel_shader ? GetHostShader(key.pixel_shader, key.spec_constants) : nullptr;
  if (!vertex_shader || (key.pixel_shader && !pixel_shader) || !key.declaration) {
    g_pipelines.emplace(key, nullptr);
    return nullptr;
  }

  plume::RenderGraphicsPipelineDesc desc;
  desc.pipelineLayout = h.pipeline_layout.get();
  desc.vertexShader = vertex_shader;
  desc.pixelShader = pixel_shader;
  desc.primitiveTopology = static_cast<plume::RenderPrimitiveTopology>(key.topology);
  desc.cullMode = static_cast<plume::RenderCullMode>(key.cull_mode);
  desc.frontFace = static_cast<plume::RenderFrontFace>(key.front_face);
  desc.depthClipEnabled = true;

  desc.renderTargetCount = key.render_target_count;
  for (u32 i = 0; i < key.render_target_count; ++i) {
    desc.renderTargetFormat[i] = static_cast<plume::RenderFormat>(key.render_target_formats[i]);
    const auto& packed = key.blend[i];
    auto& blend = desc.renderTargetBlend[i];
    blend.blendEnabled = packed[0] != 0;
    blend.srcBlend = static_cast<plume::RenderBlend>(packed[1]);
    blend.dstBlend = static_cast<plume::RenderBlend>(packed[2]);
    blend.blendOp = static_cast<plume::RenderBlendOperation>(packed[3]);
    blend.srcBlendAlpha = static_cast<plume::RenderBlend>(packed[4]);
    blend.dstBlendAlpha = static_cast<plume::RenderBlend>(packed[5]);
    blend.blendOpAlpha = static_cast<plume::RenderBlendOperation>(packed[6]);
    blend.renderTargetWriteMask = packed[7];
  }

  desc.depthTargetFormat = static_cast<plume::RenderFormat>(key.depth_format);
  desc.depthEnabled = key.depth_enable != 0;
  desc.depthWriteEnabled = key.depth_write != 0;
  desc.depthFunction = static_cast<plume::RenderComparisonFunction>(key.depth_func);
  desc.depthBias = key.depth_bias;
  desc.slopeScaledDepthBias = key.slope_scaled_depth_bias;
  desc.stencilEnabled = key.stencil_enable != 0;
  desc.stencilReadMask = key.stencil_read_mask;
  desc.stencilWriteMask = key.stencil_write_mask;
  desc.stencilReference = key.stencil_ref;
  desc.stencilFrontFace = UnpackStencilFace(key.stencil_front);
  desc.stencilBackFace = UnpackStencilFace(key.stencil_back);

  std::vector<plume::RenderInputSlot> slots;
  const HostVertexDeclaration& declaration = *key.declaration;
  for (u32 stream = 0; stream < d3d::kMaxStreams; ++stream) {
    if (stream == kZeroStream)
      continue;
    if (declaration.streams[stream])
      slots.emplace_back(stream, key.vertex_strides[stream]);
  }
  slots.emplace_back(kZeroStream, 16, plume::RenderInputSlotClassification::PER_INSTANCE_DATA);
  desc.inputSlots = slots.data();
  desc.inputSlotsCount = u32(slots.size());
  desc.inputElements = declaration.input_elements.data();
  desc.inputElementsCount = u32(declaration.input_elements.size());

  plume::RenderSpecConstant spec_constant(0, key.spec_constants);
  if (h.vulkan) {
    desc.specConstants = &spec_constant;
    desc.specConstantsCount = 1;
  }

  auto pipeline = CreateGraphicsPipeline(desc, "guest");
  if (!pipeline) {
    GPU_WARN_LIMITED(32, "Pipeline creation failed (VS {:016X}, PS {:016X})",
                     key.vertex_shader->hash, key.pixel_shader ? key.pixel_shader->hash : 0);
  }
  auto* raw = pipeline.get();
  g_pipelines.emplace(key, std::move(pipeline));
  return raw;
}

}  // namespace redahm::gpu

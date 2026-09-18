#include "render/host_pipelines.h"

#include <cstring>
#include <memory>
#include <unordered_map>

#include <rex/ui/immediate_drawer.h>

#include "core/log.h"

#if defined(_WIN32)
#include "hlsl/bink_ps.dxil.h"
#include "hlsl/fullscreen_vs.dxil.h"
#include "hlsl/imgui_ps.dxil.h"
#include "hlsl/imgui_vs.dxil.h"
#include "hlsl/present_ps.dxil.h"
#include "hlsl/resolve_color_ps.dxil.h"
#include "hlsl/resolve_depth_ps.dxil.h"
#endif
#include "hlsl/bink_ps.spirv.h"
#include "hlsl/fullscreen_vs.spirv.h"
#include "hlsl/imgui_ps.spirv.h"
#include "hlsl/imgui_vs.spirv.h"
#include "hlsl/present_ps.spirv.h"
#include "hlsl/resolve_color_ps.spirv.h"
#include "hlsl/resolve_depth_ps.spirv.h"

namespace redahm::gpu {

namespace {

struct ShaderBlob {
  const char* name;
  const unsigned char* dxil;
  size_t dxil_size;
  const unsigned char* spirv;
  size_t spirv_size;
};

#if defined(_WIN32)
#define REDAHM_HOST_SHADER(name) {#name, g_##name##_dxil, sizeof(g_##name##_dxil), g_##name##_spirv, sizeof(g_##name##_spirv)}
#else
#define REDAHM_HOST_SHADER(name) {#name, nullptr, 0, g_##name##_spirv, sizeof(g_##name##_spirv)}
#endif

const ShaderBlob kShaderBlobs[] = {
    REDAHM_HOST_SHADER(fullscreen_vs),    REDAHM_HOST_SHADER(present_ps),
    REDAHM_HOST_SHADER(resolve_color_ps), REDAHM_HOST_SHADER(resolve_depth_ps),
    REDAHM_HOST_SHADER(imgui_vs),         REDAHM_HOST_SHADER(imgui_ps),
    REDAHM_HOST_SHADER(bink_ps),
};

#undef REDAHM_HOST_SHADER

struct PipelineState {
  std::unique_ptr<plume::RenderShader> fullscreen_vs;
  std::unique_ptr<plume::RenderShader> present_ps;
  std::unique_ptr<plume::RenderShader> resolve_color_ps;
  std::unique_ptr<plume::RenderShader> resolve_depth_ps;
  std::unique_ptr<plume::RenderShader> imgui_vs;
  std::unique_ptr<plume::RenderShader> imgui_ps;
  std::unique_ptr<plume::RenderShader> bink_ps;
  std::unique_ptr<plume::RenderPipeline> present;
  std::unique_ptr<plume::RenderPipeline> imgui;
  std::unordered_map<plume::RenderFormat, std::unique_ptr<plume::RenderPipeline>> resolve_color;
  std::unordered_map<plume::RenderFormat, std::unique_ptr<plume::RenderPipeline>> resolve_depth;
  std::unordered_map<plume::RenderFormat, std::unique_ptr<plume::RenderPipeline>> bink;
};

PipelineState g_pipelines;

plume::RenderGraphicsPipelineDesc FullscreenDesc(const plume::RenderShader* pixel_shader,
                                                 plume::RenderFormat format) {
  plume::RenderGraphicsPipelineDesc desc;
  desc.pipelineLayout = Host().pipeline_layout.get();
  desc.vertexShader = g_pipelines.fullscreen_vs.get();
  desc.pixelShader = pixel_shader;
  desc.depthFunction = plume::RenderComparisonFunction::ALWAYS;
  desc.primitiveTopology = plume::RenderPrimitiveTopology::TRIANGLE_LIST;
  desc.cullMode = plume::RenderCullMode::NONE;
  desc.renderTargetCount = 1;
  desc.renderTargetFormat[0] = format;
  desc.renderTargetBlend[0] = plume::RenderBlendDesc::Copy();
  return desc;
}

// Fullscreen pipelines created on first use per destination format.
plume::RenderPipeline* FullscreenPipelineLocked(
    std::unordered_map<plume::RenderFormat, std::unique_ptr<plume::RenderPipeline>>& cache,
    const plume::RenderGraphicsPipelineDesc& desc, plume::RenderFormat format, const char* tag) {
  auto it = cache.find(format);
  if (it != cache.end())
    return it->second.get();
  auto pipeline = CreateGraphicsPipeline(desc, tag);
  auto* raw = pipeline.get();
  cache.emplace(format, std::move(pipeline));
  return raw;
}

}  // namespace

std::unique_ptr<plume::RenderShader> CreateHostShader(const char* name) {
  auto& h = Host();
  for (const auto& blob : kShaderBlobs) {
    if (std::strcmp(blob.name, name) != 0)
      continue;
    if (h.vulkan)
      return h.device->createShader(blob.spirv, blob.spirv_size, "main",
                                    plume::RenderShaderFormat::SPIRV);
    return h.device->createShader(blob.dxil, blob.dxil_size, "main",
                                  plume::RenderShaderFormat::DXIL);
  }
  return nullptr;
}

bool InitHostPipelinesLocked() {
  g_pipelines.fullscreen_vs = CreateHostShader("fullscreen_vs");
  g_pipelines.present_ps = CreateHostShader("present_ps");
  g_pipelines.resolve_color_ps = CreateHostShader("resolve_color_ps");
  g_pipelines.resolve_depth_ps = CreateHostShader("resolve_depth_ps");
  g_pipelines.imgui_vs = CreateHostShader("imgui_vs");
  g_pipelines.imgui_ps = CreateHostShader("imgui_ps");
  g_pipelines.bink_ps = CreateHostShader("bink_ps");
  if (!g_pipelines.fullscreen_vs || !g_pipelines.present_ps || !g_pipelines.resolve_color_ps ||
      !g_pipelines.resolve_depth_ps || !g_pipelines.imgui_vs || !g_pipelines.imgui_ps ||
      !g_pipelines.bink_ps) {
    GPU_ERROR("Failed to create the renderer's own shaders");
    return false;
  }

  g_pipelines.present = CreateGraphicsPipeline(
      FullscreenDesc(g_pipelines.present_ps.get(), plume::RenderFormat::B8G8R8A8_UNORM), "present");
  if (!g_pipelines.present)
    return false;

  // ImmediateVertex: position float2 @0, uv float2 @8, color RGBA8 @16.
  static const plume::RenderInputSlot imgui_slot(0, sizeof(rex::ui::ImmediateVertex));
  static const plume::RenderInputElement imgui_elements[] = {
      plume::RenderInputElement("POSITION", 0, 0, plume::RenderFormat::R32G32_FLOAT, 0, 0),
      plume::RenderInputElement("TEXCOORD", 0, 1, plume::RenderFormat::R32G32_FLOAT, 0, 8),
      plume::RenderInputElement("COLOR", 0, 2, plume::RenderFormat::R8G8B8A8_UNORM, 0, 16),
  };
  plume::RenderGraphicsPipelineDesc imgui_desc;
  imgui_desc.pipelineLayout = Host().pipeline_layout.get();
  imgui_desc.vertexShader = g_pipelines.imgui_vs.get();
  imgui_desc.pixelShader = g_pipelines.imgui_ps.get();
  imgui_desc.depthFunction = plume::RenderComparisonFunction::ALWAYS;
  imgui_desc.primitiveTopology = plume::RenderPrimitiveTopology::TRIANGLE_LIST;
  imgui_desc.cullMode = plume::RenderCullMode::NONE;
  imgui_desc.renderTargetCount = 1;
  imgui_desc.renderTargetFormat[0] = plume::RenderFormat::B8G8R8A8_UNORM;
  imgui_desc.renderTargetBlend[0] = plume::RenderBlendDesc::AlphaBlend();
  imgui_desc.inputSlots = &imgui_slot;
  imgui_desc.inputSlotsCount = 1;
  imgui_desc.inputElements = imgui_elements;
  imgui_desc.inputElementsCount = 3;
  g_pipelines.imgui = CreateGraphicsPipeline(imgui_desc, "imgui");
  return g_pipelines.imgui != nullptr;
}

plume::RenderPipeline* PresentPipelineLocked() {
  return g_pipelines.present.get();
}

plume::RenderPipeline* ImGuiPipelineLocked() {
  return g_pipelines.imgui.get();
}

plume::RenderPipeline* ResolveColorPipelineLocked(plume::RenderFormat destination_format) {
  return FullscreenPipelineLocked(
      g_pipelines.resolve_color,
      FullscreenDesc(g_pipelines.resolve_color_ps.get(), destination_format), destination_format,
      "resolve-color");
}

plume::RenderPipeline* ResolveDepthPipelineLocked(plume::RenderFormat destination_format) {
  return FullscreenPipelineLocked(
      g_pipelines.resolve_depth,
      FullscreenDesc(g_pipelines.resolve_depth_ps.get(), destination_format), destination_format,
      "resolve-depth");
}

plume::RenderPipeline* BinkPipelineLocked(plume::RenderFormat target_format) {
  // Bink blends SRCALPHA / INVSRCALPHA while fading, and when the movie has
  // an alpha plane; an opaque frame blends to the same result.
  plume::RenderGraphicsPipelineDesc desc =
      FullscreenDesc(g_pipelines.bink_ps.get(), target_format);
  desc.renderTargetBlend[0] = plume::RenderBlendDesc::AlphaBlend();
  return FullscreenPipelineLocked(g_pipelines.bink, desc, target_format, "bink");
}

void SetHostPushConstantsLocked(plume::RenderCommandList* list, const HostPushConstants& constants) {
  if (Host().vulkan)
    list->setGraphicsPushConstants(0, &constants, kGuestPushConstantsSize, kHostPushConstantsSize);
  else
    list->setGraphicsPushConstants(0, &constants, 0, kHostPushConstantsSize);
}

}  // namespace redahm::gpu

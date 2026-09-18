#pragma once

// Pipelines built from the renderer's own HLSL: the present blit, the
// Resolve copies, the Bink movie conversion and the ImGui overlay. All of them
// use the shared layout.

#include <plume_render_interface.h>
#include <rex/types.h>

#include "render/host.h"

namespace redahm::gpu {

bool InitHostPipelinesLocked();

plume::RenderPipeline* PresentPipelineLocked();
plume::RenderPipeline* ImGuiPipelineLocked();

// Keyed by the destination format: D3D12 bakes the render target format into
// the pipeline, and resolve destinations come in many.
plume::RenderPipeline* ResolveColorPipelineLocked(plume::RenderFormat destination_format);
plume::RenderPipeline* ResolveDepthPipelineLocked(plume::RenderFormat destination_format);

// BinkDrawFrame's YUV to RGB pass, alpha blended into a color target.
plume::RenderPipeline* BinkPipelineLocked(plume::RenderFormat target_format);

void SetHostPushConstantsLocked(plume::RenderCommandList* list, const HostPushConstants& constants);

// Loads a renderer shader blob for the active backend.
std::unique_ptr<plume::RenderShader> CreateHostShader(const char* name);

}  // namespace redahm::gpu

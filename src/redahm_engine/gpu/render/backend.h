#pragma once

// The few places the renderer has to look through plume at the backend
// objects. Kept to one TU so the D3D12 and Vulkan headers stay contained.

#include <memory>
#include <string>

#include <plume_render_interface.h>

namespace redahm::gpu::backend {

std::unique_ptr<plume::RenderInterface> CreateInterface(bool vulkan);

bool IsNull(const plume::RenderBuffer* buffer, bool vulkan);
bool IsNull(const plume::RenderTexture* texture, bool vulkan);
bool IsNull(const plume::RenderPipeline* pipeline, bool vulkan);

std::string Describe(plume::RenderDevice* device, bool vulkan);

}  // namespace redahm::gpu::backend

#pragma once

// The few places the renderer has to look through plume at the backend
// objects. Kept to one TU so the D3D12 and Vulkan headers stay contained.

#include <memory>
#include <string>

#include <plume_render_interface.h>
#include <rex/types.h>

namespace redahm::gpu::backend {

std::unique_ptr<plume::RenderInterface> CreateInterface(bool vulkan);

bool IsNull(const plume::RenderBuffer* buffer, bool vulkan);
bool IsNull(const plume::RenderTexture* texture, bool vulkan);
bool IsNull(const plume::RenderPipeline* pipeline, bool vulkan);

std::string Describe(plume::RenderDevice* device, bool vulkan);

// D3D12 occlusion queries, which plume has no calls for: one query heap, a
// readback buffer holding each query's u64 sample count at its index, and a
// fence the submit thread signals once a recording's queries are resolved.
// CreateOcclusionQueries returns false on Vulkan or failure, and the rest
// must not be called then.
bool CreateOcclusionQueries(plume::RenderDevice* device, u32 count);
// DeferredCommandList::NativeFn shapes, run on the real command list.
void BeginOcclusionQuery(plume::RenderCommandList* list, u32 index, u32 unused);
void EndOcclusionQuery(plume::RenderCommandList* list, u32 index, u32 unused);
void ResolveOcclusionQueries(plume::RenderCommandList* list, u32 first, u32 count);
void SignalOcclusionFence(plume::RenderCommandQueue* queue, u64 value);
u64 CompletedOcclusionFence();
// The readback buffer, mapped for the process lifetime.
const u64* OcclusionResults();

}  // namespace redahm::gpu::backend

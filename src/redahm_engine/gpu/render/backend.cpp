#include "render/backend.h"

#include <format>

#if defined(_WIN32)
#include <plume_d3d12.h>
#endif
#include <plume_vulkan.h>

namespace plume {
#if defined(_WIN32)
extern std::unique_ptr<RenderInterface> CreateD3D12Interface();
#endif
extern std::unique_ptr<RenderInterface> CreateVulkanInterface();
}  // namespace plume

namespace redahm::gpu::backend {

std::unique_ptr<plume::RenderInterface> CreateInterface(bool vulkan) {
#if defined(_WIN32)
  if (!vulkan)
    return plume::CreateD3D12Interface();
#endif
  return plume::CreateVulkanInterface();
}

bool IsNull(const plume::RenderBuffer* buffer, bool vulkan) {
  if (!buffer)
    return true;
#if defined(_WIN32)
  if (!vulkan)
    return static_cast<const plume::D3D12Buffer*>(buffer)->d3d == nullptr;
#endif
  return static_cast<const plume::VulkanBuffer*>(buffer)->vk == VK_NULL_HANDLE;
}

bool IsNull(const plume::RenderTexture* texture, bool vulkan) {
  if (!texture)
    return true;
#if defined(_WIN32)
  if (!vulkan)
    return static_cast<const plume::D3D12Texture*>(texture)->d3d == nullptr;
#endif
  return static_cast<const plume::VulkanTexture*>(texture)->vk == VK_NULL_HANDLE;
}

bool IsNull(const plume::RenderPipeline* pipeline, bool vulkan) {
  if (!pipeline)
    return true;
#if defined(_WIN32)
  if (!vulkan)
    return static_cast<const plume::D3D12GraphicsPipeline*>(pipeline)->d3d == nullptr;
#endif
  return static_cast<const plume::VulkanGraphicsPipeline*>(pipeline)->vk == VK_NULL_HANDLE;
}

std::string Describe(plume::RenderDevice* device, bool vulkan) {
  if (!device)
    return {};
  const auto& description = device->getDescription();
#if defined(_WIN32)
  if (!vulkan)
    return std::format("D3D12 on {}", description.name);
#endif
  auto* vk_device = static_cast<plume::VulkanDevice*>(device);
  const uint32_t v = vk_device->physicalDeviceProperties.apiVersion;
  return std::format("Vulkan {}.{}.{} on {}", VK_API_VERSION_MAJOR(v), VK_API_VERSION_MINOR(v),
                     VK_API_VERSION_PATCH(v), description.name);
}

#if defined(_WIN32)
namespace {

struct OcclusionObjects {
  ID3D12QueryHeap* heap = nullptr;
  std::unique_ptr<plume::RenderBuffer> readback;
  const u64* results = nullptr;
  ID3D12Fence* fence = nullptr;
};
OcclusionObjects g_occlusion;

ID3D12GraphicsCommandList* NativeList(plume::RenderCommandList* list) {
  return static_cast<plume::D3D12CommandList*>(list)->d3d;
}

}  // namespace

bool CreateOcclusionQueries(plume::RenderDevice* device, u32 count) {
  ID3D12Device8* d3d = static_cast<plume::D3D12Device*>(device)->d3d;
  D3D12_QUERY_HEAP_DESC heap_desc = {};
  heap_desc.Type = D3D12_QUERY_HEAP_TYPE_OCCLUSION;
  heap_desc.Count = count;
  if (FAILED(d3d->CreateQueryHeap(&heap_desc, IID_PPV_ARGS(&g_occlusion.heap))))
    return false;
  g_occlusion.readback =
      device->createBuffer(plume::RenderBufferDesc::ReadbackBuffer(u64(count) * sizeof(u64)));
  if (!g_occlusion.readback || IsNull(g_occlusion.readback.get(), false))
    return false;
  g_occlusion.results = static_cast<const u64*>(g_occlusion.readback->map());
  if (!g_occlusion.results)
    return false;
  return SUCCEEDED(d3d->CreateFence(0, D3D12_FENCE_FLAG_NONE, IID_PPV_ARGS(&g_occlusion.fence)));
}

void BeginOcclusionQuery(plume::RenderCommandList* list, u32 index, u32) {
  NativeList(list)->BeginQuery(g_occlusion.heap, D3D12_QUERY_TYPE_OCCLUSION, index);
}

void EndOcclusionQuery(plume::RenderCommandList* list, u32 index, u32) {
  NativeList(list)->EndQuery(g_occlusion.heap, D3D12_QUERY_TYPE_OCCLUSION, index);
}

void ResolveOcclusionQueries(plume::RenderCommandList* list, u32 first, u32 count) {
  NativeList(list)->ResolveQueryData(
      g_occlusion.heap, D3D12_QUERY_TYPE_OCCLUSION, first, count,
      static_cast<plume::D3D12Buffer*>(g_occlusion.readback.get())->d3d, u64(first) * sizeof(u64));
}

void SignalOcclusionFence(plume::RenderCommandQueue* queue, u64 value) {
  static_cast<plume::D3D12CommandQueue*>(queue)->d3d->Signal(g_occlusion.fence, value);
}

u64 CompletedOcclusionFence() {
  return g_occlusion.fence->GetCompletedValue();
}

const u64* OcclusionResults() {
  return g_occlusion.results;
}
#else
bool CreateOcclusionQueries(plume::RenderDevice*, u32) {
  return false;
}
void BeginOcclusionQuery(plume::RenderCommandList*, u32, u32) {}
void EndOcclusionQuery(plume::RenderCommandList*, u32, u32) {}
void ResolveOcclusionQueries(plume::RenderCommandList*, u32, u32) {}
void SignalOcclusionFence(plume::RenderCommandQueue*, u64) {}
u64 CompletedOcclusionFence() {
  return 0;
}
const u64* OcclusionResults() {
  return nullptr;
}
#endif

}  // namespace redahm::gpu::backend

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

}  // namespace redahm::gpu::backend

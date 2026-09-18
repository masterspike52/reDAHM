#include "resources/sampler_cache.h"

#include <cstring>
#include <memory>
#include <unordered_map>

#include <plume_render_interface.h>
#include <rex/graphics/xenos.h>

#include "core/log.h"
#include "core/settings.h"
#include "render/host.h"

namespace redahm::gpu {

namespace {

namespace xenos = rex::graphics::xenos;

struct CachedSampler {
  std::unique_ptr<plume::RenderSampler> sampler;
  u32 slot = kInvalidSlot;
};

std::unordered_map<u64, CachedSampler> g_samplers;

plume::RenderTextureAddressMode ConvertClamp(xenos::ClampMode mode) {
  using A = plume::RenderTextureAddressMode;
  switch (mode) {
    case xenos::ClampMode::kRepeat:
      return A::WRAP;
    case xenos::ClampMode::kMirroredRepeat:
      return A::MIRROR;
    case xenos::ClampMode::kClampToEdge:
    case xenos::ClampMode::kClampToHalfway:
      return A::CLAMP;
    case xenos::ClampMode::kMirrorClampToEdge:
    case xenos::ClampMode::kMirrorClampToHalfway:
    case xenos::ClampMode::kMirrorClampToBorder:
      return A::MIRROR_ONCE;
    case xenos::ClampMode::kClampToBorder:
      return A::BORDER;
  }
  return A::CLAMP;
}

}  // namespace

u32 GetSamplerSlotLocked(const u32 fetch_dwords[6], bool is_3d) {
  xenos::xe_gpu_texture_fetch_t fetch;
  std::memcpy(&fetch, fetch_dwords, sizeof(fetch));

  const bool mag_point = fetch.mag_filter == xenos::TextureFilter::kPoint;
  const bool min_point = fetch.min_filter == xenos::TextureFilter::kPoint;
  const bool mip_point = fetch.mip_filter == xenos::TextureFilter::kPoint;
  const bool mip_base_only = fetch.mip_filter == xenos::TextureFilter::kBaseMap;
  const i32 aniso = settings::Anisotropy();
  const bool use_aniso = aniso > 1 && !mag_point && !min_point && !mip_point;
  const auto border = fetch.border_color == xenos::BorderColor::k_ABGR_White
                          ? plume::RenderBorderColor::OPAQUE_WHITE
                          : plume::RenderBorderColor::TRANSPARENT_BLACK;
  const auto clamp_x = ConvertClamp(fetch.clamp_x);
  const auto clamp_y = ConvertClamp(fetch.clamp_y);
  const auto clamp_z = is_3d ? ConvertClamp(fetch.clamp_z) : plume::RenderTextureAddressMode::CLAMP;

  const u64 key = u64(clamp_x) | (u64(clamp_y) << 4) | (u64(clamp_z) << 8) |
                  (u64(mag_point) << 12) | (u64(min_point) << 13) | (u64(mip_point) << 14) |
                  (u64(mip_base_only) << 15) | (u64(border) << 16) |
                  (u64(use_aniso ? aniso : 0) << 20);
  if (auto it = g_samplers.find(key); it != g_samplers.end())
    return it->second.slot;

  plume::RenderSamplerDesc desc;
  desc.addressU = clamp_x;
  desc.addressV = clamp_y;
  desc.addressW = clamp_z;
  desc.magFilter = mag_point ? plume::RenderFilter::NEAREST : plume::RenderFilter::LINEAR;
  desc.minFilter = min_point ? plume::RenderFilter::NEAREST : plume::RenderFilter::LINEAR;
  desc.mipmapMode = mip_point ? plume::RenderMipmapMode::NEAREST : plume::RenderMipmapMode::LINEAR;
  if (mip_base_only)
    desc.maxLOD = 0.0f;
  desc.anisotropyEnabled = use_aniso;
  desc.maxAnisotropy = use_aniso ? u32(aniso) : 1;
  desc.borderColor = border;

  const u32 slot = AllocateSamplerSlotLocked();
  if (slot == kInvalidSlot) {
    GPU_WARN_LIMITED(4, "Bindless sampler heap is full");
    return kLinearClampSamplerSlot;
  }
  CachedSampler cached;
  cached.sampler = Host().device->createSampler(desc);
  cached.slot = slot;
  Host().sampler_set->setSampler(slot, cached.sampler.get());
  g_samplers.emplace(key, std::move(cached));
  return slot;
}

}  // namespace redahm::gpu

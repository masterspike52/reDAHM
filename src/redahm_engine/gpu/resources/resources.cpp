#include "resources/resources.h"

#include <algorithm>
#include <array>
#include <bit>
#include <cmath>
#include <cstring>
#include <mutex>
#include <unordered_set>
#include <vector>

#include <rex/graphics/pipeline/texture/conversion.h>
#include <rex/graphics/pipeline/texture/info.h>
#include <rex/graphics/pipeline/texture/util.h>
#include <rex/graphics/xenos.h>
#include <rex/memory/utils.h>
#include <xxhash.h>

#include "core/guest_memory.h"
#include "core/log.h"
#include "core/settings.h"
#include "d3d/d3d_device.h"
#include "d3d/d3d_formats.h"
#include "render/upload_heap.h"

namespace redahm::gpu {

namespace {

namespace xe = rex::graphics::xenos;
namespace texture_util = rex::graphics::texture_util;
namespace conversion = rex::graphics::texture_conversion;
using rex::graphics::FormatInfo;

// Textures the title stopped binding without destroying them (XG headers over
// memory UE3 frees itself) are dropped after this many presented frames.
constexpr u64 kEvictAfterFrames = 60 * 60;

// Presented frames between memory log lines.
constexpr u64 kMemoryLogInterval = 600;
// A runaway has to show as a rising plateau in the log, not only as a later
// out-of-memory failure, so every new 128 MiB high-water mark is a warning.
constexpr u64 kMemoryWatermarkStep = 128ull << 20;
// D3D12 places each committed resource on a 64 KiB boundary.
constexpr u64 kResourcePlacement = 64 * 1024;

std::unordered_map<u32, std::unique_ptr<HostTexture>> g_textures;  // texture headers
std::unordered_map<u32, std::unique_ptr<HostTexture>> g_surfaces;  // CreateSurface
std::unordered_map<u32, std::unique_ptr<HostBuffer>> g_buffers;
u64 g_frame = 0;
u64 g_memory_watermark = kMemoryWatermarkStep;

std::mutex g_dirty_mutex;
std::unordered_set<u32> g_dirty_textures;
std::unordered_set<u32> g_dirty_buffers;

bool TakeDirty(std::unordered_set<u32>& set, u32 va) {
  std::lock_guard lock(g_dirty_mutex);
  return set.erase(va) != 0;
}

//------------------------------------------------------------------------------
// Framebuffers
//------------------------------------------------------------------------------

struct FramebufferKey {
  std::array<const HostTexture*, 5> textures{};
  bool operator==(const FramebufferKey&) const = default;
};

struct FramebufferKeyHash {
  size_t operator()(const FramebufferKey& key) const {
    return XXH3_64bits(key.textures.data(), sizeof(key.textures));
  }
};

std::unordered_map<FramebufferKey, std::unique_ptr<plume::RenderFramebuffer>, FramebufferKeyHash>
    g_framebuffers;

void DropFramebuffersUsingLocked(const HostTexture* texture) {
  for (auto it = g_framebuffers.begin(); it != g_framebuffers.end();) {
    if (std::find(it->first.textures.begin(), it->first.textures.end(), texture) !=
        it->first.textures.end()) {
      RetireLocked(std::move(it->second));
      it = g_framebuffers.erase(it);
    } else {
      ++it;
    }
  }
}

void ReleaseTextureLocked(HostTexture& texture) {
  DropFramebuffersUsingLocked(&texture);
  for (auto& [key, framebuffer] : texture.target_framebuffers)
    RetireLocked(std::move(framebuffer));
  for (auto& [key, view] : texture.target_views)
    RetireLocked(std::move(view));
  texture.target_framebuffers.clear();
  texture.target_views.clear();
  RetireTextureSlotLocked(texture.slot, texture.view_dimension);
  texture.slot = kInvalidSlot;
  RetireLocked(std::move(texture.view));
  RetireLocked(std::move(texture.texture));
}

//------------------------------------------------------------------------------
// Textures
//------------------------------------------------------------------------------

// sRGB to linear over 8-bit values, for gamma textures the backend has no sRGB
// format for. The sampler would do this on the Xenos; without it they read too
// bright.
const u8* GammaToLinearTable() {
  static const std::array<u8, 256> table = [] {
    std::array<u8, 256> values{};
    for (u32 i = 0; i < 256; ++i) {
      const double encoded = double(i) / 255.0;
      const double linear = encoded <= 0.04045 ? encoded / 12.92
                                               : std::pow((encoded + 0.055) / 1.055, 2.4);
      values[i] = u8(std::lround(linear * 255.0));
    }
    return values;
  }();
  return table.data();
}

// Which stored components the swizzle routes to red, green or blue. Alpha is
// never gamma encoded, so it must not be converted.
u32 GammaComponentMask(u32 swizzle, u32 components) {
  u32 mask = 0;
  for (u32 output = 0; output < 3; ++output) {
    const u32 source = (swizzle >> (output * 3)) & 7;
    if (source < components)
      mask |= 1u << source;
  }
  return mask;
}

xe::xe_gpu_texture_fetch_t ToFetch(const u32 words[6]) {
  xe::xe_gpu_texture_fetch_t fetch;
  std::memcpy(&fetch, words, sizeof(fetch));
  return fetch;
}

plume::RenderSwizzle ToPlumeSwizzle(u32 component, u32 host_channels) {
  using S = plume::RenderSwizzle;
  switch (component) {
    case 4: return S::ZERO;
    case 5: return S::ONE;
    default:
      break;
  }
  // Xenos replicates the last stored component of one- and two-channel
  // formats into the missing ones before applying the swizzle.
  const u32 clamped = std::min(component, host_channels - 1);
  static const S kChannels[] = {S::R, S::G, S::B, S::A};
  return kChannels[clamped];
}

u32 HostChannelCount(plume::RenderFormat format) {
  using F = plume::RenderFormat;
  switch (format) {
    case F::R8_UNORM:
    case F::R16_UNORM:
    case F::R16_FLOAT:
    case F::R32_FLOAT:
    case F::BC4_UNORM:
      return 1;
    case F::R8G8_UNORM:
    case F::R16G16_UNORM:
    case F::R16G16_FLOAT:
    case F::R32G32_FLOAT:
    case F::BC5_UNORM:
      return 2;
    default:
      return 4;
  }
}

// The swizzle in the texture's D3DFORMAT, applied by the view.
plume::RenderComponentMapping ComponentMapping(u32 swizzle, plume::RenderFormat format) {
  const u32 channels = HostChannelCount(format);
  return plume::RenderComponentMapping(ToPlumeSwizzle(swizzle & 7, channels),
                                       ToPlumeSwizzle((swizzle >> 3) & 7, channels),
                                       ToPlumeSwizzle((swizzle >> 6) & 7, channels),
                                       ToPlumeSwizzle((swizzle >> 9) & 7, channels));
}

u32 Log2Floor(u32 value) {
  return value ? 31 - std::countl_zero(value) : 0;
}

bool CreateTextureObjectsLocked(HostTexture& t, plume::RenderTextureDimension dimension,
                                const plume::RenderComponentMapping& mapping, bool committed) {
  plume::RenderTextureDesc desc;
  desc.dimension = dimension;
  desc.width = t.width;
  desc.height = t.height;
  desc.depth = dimension == plume::RenderTextureDimension::TEXTURE_3D ? t.depth_or_slices : 1;
  desc.mipLevels = t.mip_levels;
  desc.arraySize = t.array_size;
  desc.format = t.format;
  desc.committed = committed;
  if (t.view_dimension == plume::RenderTextureViewDimension::TEXTURE_CUBE)
    desc.flags |= plume::RenderTextureFlag::CUBE;
  if (t.depth)
    desc.flags |= plume::RenderTextureFlag::DEPTH_TARGET;
  else if (t.render_target_capable)
    desc.flags |= plume::RenderTextureFlag::RENDER_TARGET;
  t.texture = CreateTexture(desc, t.surface ? "guest-surface" : "guest-texture");
  if (!t.texture)
    return false;

  plume::RenderTextureViewDesc view_desc;
  view_desc.format = t.format;
  view_desc.dimension = t.view_dimension;
  view_desc.mipLevels = t.mip_levels;
  view_desc.componentMapping = mapping;
  t.view = t.texture->createTextureView(view_desc);
  if (!t.view)
    return false;
  t.slot = AllocateTextureSlotLocked();
  SetTextureSlotLocked(t.slot, t.texture.get(), t.view.get());
  return true;
}

std::unique_ptr<HostTexture> BuildTextureLocked(u32 texture_va, const u32 words[6]) {
  const xe::xe_gpu_texture_fetch_t fetch = ToFetch(words);
  if (fetch.type != xe::FetchConstantType::kTexture)
    return nullptr;

  u32 width_minus_1, height_minus_1, depth_or_array_minus_1;
  u32 base_page, mip_page, mip_min, mip_max;
  texture_util::GetSubresourcesFromFetchConstant(fetch, &width_minus_1, &height_minus_1,
                                                 &depth_or_array_minus_1, &base_page, &mip_page,
                                                 &mip_min, &mip_max);

  auto t = std::make_unique<HostTexture>();
  t->guest_va = texture_va;
  std::memcpy(t->signature, words, sizeof(t->signature));
  t->d3d_format = u32(fetch.format);
  const d3d::HostFormat host = d3d::ConvertTextureFormat(t->d3d_format);
  if (host.format == plume::RenderFormat::UNKNOWN)
    return nullptr;
  t->format = host.format;
  // TextureSign::kGamma marks sRGB-encoded colour the Xenos sampler linearises
  // on read. Without it every gamma texture samples too bright.
  if (fetch.sign_x == xe::TextureSign::kGamma) {
    const plume::RenderFormat srgb = d3d::ToSrgbFormat(host.format);
    if (srgb != plume::RenderFormat::UNKNOWN) {
      t->format = srgb;
    }
  }
  t->depth = false;  // depth textures sample as R32_FLOAT
  t->width = width_minus_1 + 1;
  t->height = height_minus_1 + 1;

  // Block formats need whole blocks on the host.
  const FormatInfo* info = FormatInfo::Get(static_cast<xe::TextureFormat>(fetch.format));
  t->width = (t->width + info->block_width - 1) / info->block_width * info->block_width;
  t->height = (t->height + info->block_height - 1) / info->block_height * info->block_height;

  plume::RenderTextureDimension dimension = plume::RenderTextureDimension::TEXTURE_2D;
  switch (fetch.dimension) {
    case xe::DataDimension::k3D:
      dimension = plume::RenderTextureDimension::TEXTURE_3D;
      t->depth_or_slices = depth_or_array_minus_1 + 1;
      t->view_dimension = plume::RenderTextureViewDimension::TEXTURE_3D;
      break;
    case xe::DataDimension::kCube:
      t->array_size = 6;
      t->view_dimension = plume::RenderTextureViewDimension::TEXTURE_CUBE;
      break;
    default:
      t->view_dimension = plume::RenderTextureViewDimension::TEXTURE_2D;
      break;
  }
  const u32 largest = std::max({t->width, t->height, t->depth_or_slices});
  t->mip_levels = std::clamp<u32>(mip_max + 1, 1, Log2Floor(largest) + 1);
  t->render_target_capable = d3d::IsRenderTargetCapable(t->format) && !host.block_compressed &&
                             fetch.dimension != xe::DataDimension::k3D;
  t->render_only = host.render_only;
  if (host.render_only)
    t->needs_upload = false;

  if (!CreateTextureObjectsLocked(*t, dimension, ComponentMapping(fetch.swizzle, t->format),
                                  t->render_target_capable)) {
    return nullptr;
  }
  return t;
}

// Guest texels to the host texture: each block is copied out of its tiled
// position and byte swapped per the texture's endianness.
bool UploadTextureLocked(HostTexture& t, plume::RenderCommandList* list) {
  const xe::xe_gpu_texture_fetch_t fetch = ToFetch(t.signature);
  const auto guest_format = static_cast<xe::TextureFormat>(fetch.format);
  const FormatInfo* info = FormatInfo::Get(guest_format);
  const d3d::HostFormat host = d3d::ConvertTextureFormat(t.d3d_format);
  const u32 block_w = info->block_width;
  const u32 block_h = info->block_height;
  const u32 block_bytes = info->bytes_per_block();
  const u32 block_bytes_log2 = Log2Floor(block_bytes);
  const bool is_3d = fetch.dimension == xe::DataDimension::k3D;
  const bool tiled = fetch.tiled != 0;
  const u32 host_texel_bytes = plume::RenderFormatSize(host.format);
  // Texels are copied as they are stored, so a guest block (one BCn block or
  // one texel) must be exactly one host block.
  (void)host;
  if (host_texel_bytes != block_bytes) {
    GPU_WARN_LIMITED(8, "Texture {:08X}: guest block of {} bytes has no host twin", t.guest_va,
                     block_bytes);
    return false;
  }

  // Gamma textures the backend has no sRGB format for are linearised here
  // instead, so they do not sample too bright.
  const bool convert_gamma = fetch.sign_x == xe::TextureSign::kGamma && !host.block_compressed &&
                             d3d::ToSrgbFormat(host.format) == plume::RenderFormat::UNKNOWN;
  const u32 gamma_mask =
      convert_gamma ? GammaComponentMask(fetch.swizzle, block_bytes) : 0;

  u32 width_minus_1, height_minus_1, depth_or_array_minus_1;
  u32 base_page, mip_page, mip_min, mip_max;
  texture_util::GetSubresourcesFromFetchConstant(fetch, &width_minus_1, &height_minus_1,
                                                 &depth_or_array_minus_1, &base_page, &mip_page,
                                                 &mip_min, &mip_max);
  const u32 width = width_minus_1 + 1;
  const u32 height = height_minus_1 + 1;
  const u32 slices = is_3d ? t.depth_or_slices : t.array_size;

  const texture_util::TextureGuestLayout layout = texture_util::GetGuestTextureLayout(
      fetch.dimension, fetch.pitch, width, height, slices, tiled, guest_format,
      fetch.packed_mips != 0, base_page != 0, t.mip_levels - 1);

  TransitionTextureLocked(t, list, plume::RenderTextureLayout::COPY_DEST);

  for (u32 level = 0; level < t.mip_levels; ++level) {
    const bool is_base = level == 0;
    const u32 page = is_base ? base_page : mip_page;
    if (!page)
      continue;
    const bool packed = layout.packed_level != UINT32_MAX && level >= layout.packed_level;
    const u32 stored = layout.packed_level == 0 ? 0 : std::min(level, layout.packed_level);
    const auto& level_layout = is_base ? layout.base : layout.mips[stored];
    // The page number above is masked to physical memory (fetch.base_address &
    // 0x1FFFF), which throws away the window the title addressed the texture
    // through. UE3 puts a 0xA window address in the fetch constant while Bink
    // puts a 0xE one, and the two windows map to different host pages, so the
    // address has to come from the unmasked field.
    u32 level_address = (is_base ? u32(fetch.base_address) : u32(fetch.mip_address)) << 12;
    if (!is_base)
      level_address += layout.mip_offsets_bytes[stored];

    u32 pack_x = 0, pack_y = 0, pack_z = 0;
    if (packed) {
      texture_util::GetPackedMipOffset(width, height, is_3d ? t.depth_or_slices : 1, guest_format,
                                       level, pack_x, pack_y, pack_z);
    }

    const u32 level_w = std::max(width >> level, u32(1));
    const u32 level_h = std::max(height >> level, u32(1));
    const u32 level_d = is_3d ? std::max(t.depth_or_slices >> level, u32(1)) : 1;
    const u32 blocks_w = (level_w + block_w - 1) / block_w;
    const u32 blocks_h = (level_h + block_h - 1) / block_h;
    const u32 row_bytes = blocks_w * block_bytes;
    const u32 row_pitch = (row_bytes + 255) & ~u32(255);
    const u32 row_width_texels = (row_pitch / block_bytes) * block_w;
    const u32 pitch_blocks = level_layout.row_pitch_bytes / block_bytes;
    const u32 face_count = is_3d ? 1 : t.array_size;

    for (u32 face = 0; face < face_count; ++face) {
      const u8* guest = mem::AtGpuAddress(level_address + face * level_layout.array_slice_stride_bytes);
      if (!guest)
        continue;
      const u32 staging_bytes = row_pitch * blocks_h * level_d;
      UploadAllocation staging = UploadAllocateLocked(staging_bytes, 512);
      if (!staging)
        return false;
      std::memset(staging.data, 0, staging_bytes);

      for (u32 z = 0; z < level_d; ++z) {
        for (u32 y = 0; y < blocks_h; ++y) {
          u8* dst_row = staging.data + (z * blocks_h + y) * row_pitch;
          for (u32 x = 0; x < blocks_w; ++x) {
            const i32 gx = i32(x + pack_x), gy = i32(y + pack_y), gz = i32(z + pack_z);
            i32 offset;
            if (tiled) {
              offset = is_3d ? texture_util::GetTiledOffset3D(gx, gy, gz, pitch_blocks,
                                                              level_layout.z_slice_stride_block_rows,
                                                              block_bytes_log2)
                             : texture_util::GetTiledOffset2D(gx, gy, pitch_blocks, block_bytes_log2);
            } else {
              offset = i32((u32(gz) * level_layout.z_slice_stride_block_rows + u32(gy)) *
                               level_layout.row_pitch_bytes +
                           u32(gx) * block_bytes);
            }
            if (offset < 0)
              continue;
            conversion::CopySwapBlock(fetch.endianness, dst_row + x * block_bytes, guest + offset,
                                      block_bytes);
          }
        }
      }

      if (convert_gamma) {
        const u8* table = GammaToLinearTable();
        for (u32 row = 0; row < blocks_h * level_d; ++row) {
          u8* texels = staging.data + size_t(row) * row_pitch;
          for (u32 x = 0; x < blocks_w; ++x) {
            u8* texel = texels + size_t(x) * block_bytes;
            for (u32 component = 0; component < block_bytes; ++component) {
              if (gamma_mask & (1u << component))
                texel[component] = table[texel[component]];
            }
          }
        }
      }

      list->copyTextureRegion(
          plume::RenderTextureCopyLocation::Subresource(t.texture.get(), level, face),
          plume::RenderTextureCopyLocation::PlacedFootprint(staging.buffer, t.format,
                                                            blocks_w * block_w, blocks_h * block_h,
                                                            level_d, row_width_texels,
                                                            staging.offset));
    }
  }
  return true;
}

//------------------------------------------------------------------------------
// Memory accounting
//------------------------------------------------------------------------------

u64 RoundToPlacement(u64 bytes) {
  return (bytes + kResourcePlacement - 1) & ~(kResourcePlacement - 1);
}

// Device bytes a host texture occupies, before placement rounding.
u64 TextureBytes(const HostTexture& t) {
  const u32 block = std::max(plume::RenderFormatBlockWidth(t.format), 1u);
  const u32 block_bytes = plume::RenderFormatSize(t.format);
  u64 bytes = 0;
  for (u32 level = 0; level < t.mip_levels; ++level) {
    const u64 w = (std::max(t.width >> level, 1u) + block - 1) / block;
    const u64 h = (std::max(t.height >> level, 1u) + block - 1) / block;
    const u64 d = std::max(t.depth_or_slices >> level, 1u);
    bytes += w * h * d * block_bytes;
  }
  return bytes * t.array_size;
}

void LogMemoryLocked() {
  u64 system_buffer_bytes = 0, device_buffer_bytes = 0;
  u32 system_buffers = 0, device_buffers = 0;
  for (const auto& [va, b] : g_buffers) {
    if (!b->buffer)
      continue;
    const u64 bytes = RoundToPlacement(b->size);
    if (b->heap == plume::RenderHeapType::GPU_UPLOAD) {
      device_buffer_bytes += bytes;
      ++device_buffers;
    } else {
      system_buffer_bytes += bytes;
      ++system_buffers;
    }
  }
  u64 texture_bytes = 0, surface_bytes = 0;
  for (const auto& [va, t] : g_textures) {
    if (t->texture)
      texture_bytes += RoundToPlacement(TextureBytes(*t));
  }
  for (const auto& [va, t] : g_surfaces) {
    if (t->texture)
      surface_bytes += RoundToPlacement(TextureBytes(*t));
  }
  const u64 upload_bytes = UploadHeapBytesLocked();
  // System memory the renderer holds: UPLOAD buffers and the upload heap.
  const u64 system_bytes = system_buffer_bytes + upload_bytes;
  GPU_INFO("Host memory: system {} MiB (upload heap {} MiB, {} UPLOAD buffers {} MiB); device "
           "{} GPU_UPLOAD buffers {} MiB, {} textures {} MiB, {} surfaces {} MiB",
           system_bytes >> 20, upload_bytes >> 20, system_buffers, system_buffer_bytes >> 20,
           device_buffers, device_buffer_bytes >> 20, g_textures.size(), texture_bytes >> 20,
           g_surfaces.size(), surface_bytes >> 20);
  if (system_bytes > g_memory_watermark) {
    g_memory_watermark = (system_bytes / kMemoryWatermarkStep + 1) * kMemoryWatermarkStep;
    GPU_WARN("Renderer system memory high-water: {} MiB", system_bytes >> 20);
  }
}

}  // namespace

//------------------------------------------------------------------------------
// Public texture API
//------------------------------------------------------------------------------

HostTexture* RegisterSurfaceLocked(u32 surface_va, u32 width, u32 height, u32 d3d_format) {
  if (auto it = g_surfaces.find(surface_va); it != g_surfaces.end()) {
    ReleaseTextureLocked(*it->second);
    g_surfaces.erase(it);
  }
  auto t = std::make_unique<HostTexture>();
  t->guest_va = surface_va;
  t->d3d_format = d3d_format;
  t->surface = true;
  t->width = width;
  t->height = height;
  t->format = d3d::ConvertSurfaceFormat(d3d_format);
  t->depth = t->format == d3d::kDepthStencilFormat;
  t->render_target_capable = true;
  t->needs_upload = false;
  if (!CreateTextureObjectsLocked(*t, plume::RenderTextureDimension::TEXTURE_2D, {}, true))
    return nullptr;
  GPU_DEBUG("Surface {:08X}: {}x{} D3DFORMAT {:08X}", surface_va, width, height, d3d_format);
  auto* raw = t.get();
  g_surfaces[surface_va] = std::move(t);
  return raw;
}

HostTexture* FindSurfaceLocked(u32 surface_va) {
  auto it = g_surfaces.find(surface_va);
  return it != g_surfaces.end() ? it->second.get() : nullptr;
}

bool GrowSurfaceLocked(HostTexture& surface, u32 width, u32 height) {
  if (!surface.surface || (width <= surface.width && height <= surface.height))
    return false;
  const u32 old_width = surface.width;
  const u32 old_height = surface.height;
  ReleaseTextureLocked(surface);
  surface.width = std::max(width, old_width);
  surface.height = std::max(height, old_height);
  surface.layout = plume::RenderTextureLayout::UNKNOWN;
  if (!CreateTextureObjectsLocked(surface, plume::RenderTextureDimension::TEXTURE_2D, {}, true)) {
    GPU_ERROR("Surface {:08X}: growing {}x{} to {}x{} failed", surface.guest_va, old_width,
              old_height, surface.width, surface.height);
    return false;
  }
  GPU_INFO("Surface {:08X}: {}x{} grown to the tiled {}x{}", surface.guest_va, old_width,
           old_height, surface.width, surface.height);
  return true;
}

HostTexture* GetTextureLocked(u32 texture_va) {
  if (!texture_va)
    return nullptr;
  if (HostTexture* surface = FindSurfaceLocked(texture_va))
    return surface;
  auto* header = mem::At<d3d::BaseTexture>(texture_va);
  if (!header)
    return nullptr;
  u32 words[6];
  for (u32 i = 0; i < 6; ++i)
    words[i] = header->format[i];

  HostTexture* t = nullptr;
  if (auto it = g_textures.find(texture_va); it != g_textures.end()) {
    if (std::memcmp(it->second->signature, words, sizeof(words)) == 0) {
      t = it->second.get();
    } else {
      ReleaseTextureLocked(*it->second);
      g_textures.erase(it);
      TakeDirty(g_dirty_textures, texture_va);
    }
  }
  if (!t) {
    auto built = BuildTextureLocked(texture_va, words);
    if (!built)
      return nullptr;
    t = built.get();
    g_textures[texture_va] = std::move(built);
  }
  if (TakeDirty(g_dirty_textures, texture_va) && !t->render_only) {
    t->needs_upload = true;
    t->gpu_written = false;
  }
  t->last_bound_frame = g_frame;
  return t;
}

void TransitionTextureLocked(HostTexture& texture, plume::RenderCommandList* list,
                             plume::RenderTextureLayout layout) {
  if (texture.layout == layout || !texture.texture)
    return;
  const plume::RenderBarrierStages stage = layout == plume::RenderTextureLayout::COPY_DEST
                                               ? plume::RenderBarrierStage::COPY
                                               : plume::RenderBarrierStage::GRAPHICS;
  list->barriers(stage, plume::RenderTextureBarrier(texture.texture.get(), layout));
  texture.layout = layout;
}

void PrepareTextureForSamplingLocked(HostTexture& texture, plume::RenderCommandList* list) {
  if (texture.needs_upload && !texture.surface && !texture.gpu_written && !texture.render_only) {
    if (UploadTextureLocked(texture, list))
      texture.needs_upload = false;
  }
  TransitionTextureLocked(texture, list, plume::RenderTextureLayout::SHADER_READ);
}

// A resolve renders into the texture, so its texels end up in host channel
// order rather than the guest's. The fetch swizzle describes the guest layout
// and must not be applied on top of that, or the resolve's output comes back
// with its channels permuted (0x60A on A8R8G8B8 swaps red and blue).
void DropGuestSwizzleLocked(HostTexture& t) {
  if (t.identity_view || !t.texture)
    return;
  plume::RenderTextureViewDesc desc;
  desc.format = t.format;
  desc.dimension = t.view_dimension;
  desc.mipLevels = t.mip_levels;
  auto view = t.texture->createTextureView(desc);
  if (!view)
    return;
  t.identity_view = true;
  RetireLocked(std::move(t.view));
  t.view = std::move(view);
  if (t.slot != kInvalidSlot)
    SetTextureSlotLocked(t.slot, t.texture.get(), t.view.get());
}

plume::RenderFramebuffer* GetTextureTargetLocked(HostTexture& t, u32 level, u32 face) {
  if (!t.render_target_capable || t.surface || level >= t.mip_levels || face >= t.array_size)
    return nullptr;
  t.gpu_written = true;
  t.needs_upload = false;
  DropGuestSwizzleLocked(t);
  const u32 key = level | (face << 8);
  if (auto it = t.target_framebuffers.find(key); it != t.target_framebuffers.end())
    return it->second.get();

  plume::RenderTextureViewDesc view_desc;
  view_desc.format = t.format;
  view_desc.dimension = plume::RenderTextureViewDimension::TEXTURE_2D;
  view_desc.mipSlice = level;
  view_desc.mipLevels = 1;
  view_desc.arrayIndex = face;
  view_desc.arraySize = 1;
  auto view = t.texture->createTextureView(view_desc);
  if (!view)
    return nullptr;
  const plume::RenderTexture* attachments[] = {t.texture.get()};
  const plume::RenderTextureView* attachment_views[] = {view.get()};
  plume::RenderFramebufferDesc desc;
  desc.colorAttachments = attachments;
  desc.colorAttachmentViews = attachment_views;
  desc.colorAttachmentsCount = 1;
  auto framebuffer = Host().device->createFramebuffer(desc);
  if (!framebuffer)
    return nullptr;
  auto* raw = framebuffer.get();
  t.target_views[key] = std::move(view);
  t.target_framebuffers[key] = std::move(framebuffer);
  return raw;
}

plume::RenderFramebuffer* GetSurfaceFramebufferLocked(HostTexture* const* colors, u32 color_count,
                                                      HostTexture* depth) {
  FramebufferKey key;
  for (u32 i = 0; i < color_count && i < 4; ++i)
    key.textures[i] = colors[i];
  key.textures[4] = depth;
  if (auto it = g_framebuffers.find(key); it != g_framebuffers.end())
    return it->second.get();

  const plume::RenderTexture* attachments[4] = {};
  u32 count = 0;
  for (u32 i = 0; i < color_count && i < 4; ++i)
    attachments[count++] = colors[i]->texture.get();
  plume::RenderFramebufferDesc desc;
  desc.colorAttachments = count ? attachments : nullptr;
  desc.colorAttachmentsCount = count;
  desc.depthAttachment = depth ? depth->texture.get() : nullptr;
  auto framebuffer = Host().device->createFramebuffer(desc);
  if (!framebuffer) {
    GPU_ERROR("Framebuffer creation failed ({} color targets, depth {})", count, depth != nullptr);
    return nullptr;
  }
  auto* raw = framebuffer.get();
  g_framebuffers.emplace(key, std::move(framebuffer));
  return raw;
}

//------------------------------------------------------------------------------
// Buffers
//------------------------------------------------------------------------------

namespace {

HostBuffer* GetBufferLocked(u32 buffer_va, bool index) {
  if (!buffer_va)
    return nullptr;
  u32 address = 0, size = 0;
  bool index32 = false;
  if (index) {
    auto* header = mem::At<d3d::IndexBuffer>(buffer_va);
    if (!header)
      return nullptr;
    address = header->address;
    size = header->size;
    index32 = (u32(header->resource.common) & d3d::kCommonIndex32) != 0;
  } else {
    auto* header = mem::At<d3d::VertexBuffer>(buffer_va);
    if (!header)
      return nullptr;
    address = u32(header->address) & ~u32(3);
    size = u32(header->size) & 0x03FFFFFC;
  }
  if (!address || !size)
    return nullptr;

  HostBuffer* b = nullptr;
  if (auto it = g_buffers.find(buffer_va); it != g_buffers.end()) {
    b = it->second.get();
    if (b->index != index || b->guest_address != address || b->size != size ||
        b->index32 != index32) {
      RetireLocked(std::move(b->buffer));
      b->needs_upload = true;
    }
  } else {
    auto created = std::make_unique<HostBuffer>();
    b = created.get();
    g_buffers[buffer_va] = std::move(created);
  }
  b->guest_va = buffer_va;
  b->index = index;
  b->index32 = index32;
  b->guest_address = address;
  b->size = size;
  if (TakeDirty(g_dirty_buffers, buffer_va))
    b->needs_upload = true;
  b->last_bound_frame = g_frame;
  return b;
}

// Where a buffer's next copy lives. As in reblue, static geometry goes to
// GPU_UPLOAD (device memory the CPU writes directly, so no system memory copy
// and no PCIe read per fetch) and anything the title rewrites stays in UPLOAD,
// since CPU writes into device memory are slow on some discrete GPUs.
plume::RenderHeapType BufferHeapLocked(const HostBuffer& b) {
  const bool gpu_upload = Host().device->getCapabilities().gpuUploadHeap &&
                          settings::GeometryGpuUpload();
  return gpu_upload && b.uploads == 0 ? plume::RenderHeapType::GPU_UPLOAD
                                      : plume::RenderHeapType::UPLOAD;
}

std::unique_ptr<plume::RenderBuffer> CreateGeometryBuffer(bool index, u64 size,
                                                          plume::RenderHeapType heap) {
  return CreateBuffer(index ? plume::RenderBufferDesc::IndexBuffer(size, heap)
                            : plume::RenderBufferDesc::VertexBuffer(size, heap),
                      index ? "guest-ib" : "guest-vb");
}

}  // namespace

HostBuffer* GetVertexBufferLocked(u32 buffer_va) {
  return GetBufferLocked(buffer_va, false);
}

HostBuffer* GetIndexBufferLocked(u32 buffer_va) {
  return GetBufferLocked(buffer_va, true);
}

bool PrepareBufferLocked(HostBuffer& b) {
  if (!b.needs_upload && b.buffer)
    return true;
  const u8* guest = mem::AtGpuAddress(b.guest_address);
  if (!guest)
    return false;
  // A fresh buffer per upload: the previous one may still be read by a frame
  // in flight.
  RetireLocked(std::move(b.buffer));
  const u64 aligned = (u64(b.size) + 0xFFF) & ~u64(0xFFF);
  b.heap = BufferHeapLocked(b);
  b.buffer = CreateGeometryBuffer(b.index, aligned, b.heap);
  if (!b.buffer && b.heap != plume::RenderHeapType::UPLOAD) {
    b.heap = plume::RenderHeapType::UPLOAD;
    b.buffer = CreateGeometryBuffer(b.index, aligned, b.heap);
  }
  if (!b.buffer)
    return false;
  auto* mapped = static_cast<u8*>(b.buffer->map());
  if (!mapped) {
    RetireLocked(std::move(b.buffer));
    return false;
  }
  // Vertex data swaps per word; indices per index.
  if (b.index && !b.index32) {
    rex::memory::copy_and_swap(reinterpret_cast<u16*>(mapped), reinterpret_cast<const u16*>(guest),
                               b.size / 2);
  } else {
    rex::memory::copy_and_swap(reinterpret_cast<u32*>(mapped), reinterpret_cast<const u32*>(guest),
                               b.size / 4);
  }
  b.buffer->unmap();
  b.needs_upload = false;
  ++b.uploads;
  return true;
}

//------------------------------------------------------------------------------
// Lifetime
//------------------------------------------------------------------------------

void MarkTextureDirty(u32 texture_va) {
  if (!texture_va)
    return;
  std::lock_guard lock(g_dirty_mutex);
  g_dirty_textures.insert(texture_va);
}

void MarkBufferDirty(u32 buffer_va) {
  if (!buffer_va)
    return;
  std::lock_guard lock(g_dirty_mutex);
  g_dirty_buffers.insert(buffer_va);
}

void DestroyResourceLocked(u32 resource_va) {
  if (auto it = g_textures.find(resource_va); it != g_textures.end()) {
    ReleaseTextureLocked(*it->second);
    g_textures.erase(it);
  }
  if (auto it = g_surfaces.find(resource_va); it != g_surfaces.end()) {
    ReleaseTextureLocked(*it->second);
    g_surfaces.erase(it);
  }
  if (auto it = g_buffers.find(resource_va); it != g_buffers.end()) {
    RetireLocked(std::move(it->second->buffer));
    g_buffers.erase(it);
  }
  std::lock_guard lock(g_dirty_mutex);
  g_dirty_textures.erase(resource_va);
  g_dirty_buffers.erase(resource_va);
}

void TickResourcesLocked(u64 frame) {
  g_frame = frame;
  if (frame % kMemoryLogInterval == 0)
    LogMemoryLocked();
  if (frame % 120 != 0)
    return;
  for (auto it = g_textures.begin(); it != g_textures.end();) {
    if (frame - it->second->last_bound_frame > kEvictAfterFrames) {
      ReleaseTextureLocked(*it->second);
      it = g_textures.erase(it);
    } else {
      ++it;
    }
  }
  for (auto it = g_buffers.begin(); it != g_buffers.end();) {
    if (frame - it->second->last_bound_frame > kEvictAfterFrames) {
      RetireLocked(std::move(it->second->buffer));
      it = g_buffers.erase(it);
    } else {
      ++it;
    }
  }
}

}  // namespace redahm::gpu

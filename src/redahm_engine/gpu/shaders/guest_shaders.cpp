#include "shaders/guest_shaders.h"

#include <algorithm>
#include <atomic>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <string_view>
#include <vector>

#include <smolv.h>
#include <xxhash.h>
#include <zstd.h>

#include "core/log.h"
#include "core/settings.h"
#include "render/host.h"
#include "shaders/dxc_link.h"
#include "shaders/shader_cache.h"

#if defined(_WIN32)
#include "hlsl/water_ps.dxil.h"
#endif
#include "hlsl/water_ps.spirv.h"

namespace redahm::gpu {

// A hand-written replacement for one guest shader (shaders/hlsl/overrides),
// compiled without spec constants.
struct ShaderOverride {
  u64 hash;
  const u8* dxil;
  size_t dxil_size;
  const u8* spirv;
  size_t spirv_size;
  bool screen_reflections;
};

namespace {

const ShaderOverride kOverrides[] = {
    // The pool water: no black dashes, and screen-space reflections
    // (water_ps.hlsl).
    {0x55CDEE52F6BAB335,
#if defined(_WIN32)
     g_water_ps_dxil, sizeof(g_water_ps_dxil),
#else
     nullptr, 0,
#endif
     g_water_ps_spirv, sizeof(g_water_ps_spirv), true},
};

const ShaderOverride* FindOverride(u64 hash) {
  for (const auto& entry : kOverrides) {
    if (entry.hash == hash)
      return &entry;
  }
  return nullptr;
}

// Head of the Xenos shader container (XenosRecomp shader.h).
struct ShaderContainerHeader {
  be_u32 flags;
  be_u32 virtual_size;
  be_u32 physical_size;
  be_u32 field_c;
  be_u32 constant_table_offset;
};

// D3DXSHADER_CONSTANTTABLE behind its size word (XenosRecomp constant_table.h).
struct ConstantTable {
  be_u32 size;
  be_u32 creator;
  be_u32 version;
  be_u32 constants;
  be_u32 constant_info;
  be_u32 flags;
  be_u32 target;
};

// D3DXSHADER_CONSTANTINFO.
struct ConstantInfo {
  be_u32 name;
  be_u16 register_set;
  be_u16 register_index;
  be_u16 register_count;
  be_u16 reserved;
  be_u32 type_info;
  be_u32 default_value;
};
static_assert(sizeof(ConstantInfo) == 20);

constexpr u16 kRegisterSetFloat4 = 2;

std::mutex g_mutex;
std::unordered_map<u32, GuestShader*> g_objects;
// One GuestShader per hash, including hashes the cache lacks.
std::unordered_map<u64, std::unique_ptr<GuestShader>> g_shaders;
// Vertex shader object -> the declaration D3DVertexShader_Bind bound it to.
std::unordered_map<u32, u32> g_bound_declarations;
std::atomic<u64> g_generation{0};
// Bumped whenever g_objects or g_bound_declarations change.
std::atomic<u64> g_object_changes{0};

ShaderCacheEntry* FindCacheEntry(u64 hash) {
  auto* end = g_shaderCacheEntries + g_shaderCacheEntryCount;
  auto* it = std::lower_bound(g_shaderCacheEntries, end, hash,
                              [](const ShaderCacheEntry& lhs, u64 rhs) { return lhs.hash < rhs; });
  return (it != end && it->hash == hash) ? it : nullptr;
}

// The first register of a named constant of `register_set` in the container's
// constant table, or -1. The table lives in the header part, so everything is
// bounds checked against `size`.
i32 FindConstant(const u8* container, u32 size, std::string_view name, u16 register_set) {
  const auto* header = reinterpret_cast<const ShaderContainerHeader*>(container);
  if (size < sizeof(ShaderContainerHeader))
    return -1;
  const u32 table_offset = header->constant_table_offset;
  if (!table_offset || u64(table_offset) + 4 + sizeof(ConstantTable) > size)
    return -1;
  const u8* table_data = container + table_offset + 4;
  const u32 table_size = size - table_offset - 4;
  const auto* table = reinterpret_cast<const ConstantTable*>(table_data);
  const u32 count = table->constants;
  const u32 info_offset = table->constant_info;
  if (u64(info_offset) + u64(count) * sizeof(ConstantInfo) > table_size)
    return -1;
  const auto* infos = reinterpret_cast<const ConstantInfo*>(table_data + info_offset);
  for (u32 i = 0; i < count; ++i) {
    const ConstantInfo& info = infos[i];
    const u32 name_offset = info.name;
    if (u16(info.register_set) != register_set || name_offset >= table_size)
      continue;
    const char* text = reinterpret_cast<const char*>(table_data + name_offset);
    const size_t length = strnlen(text, table_size - name_offset);
    if (std::string_view(text, length) == name)
      return i32(u16(info.register_index));
  }
  return -1;
}

i32 FindFloat4Constant(const u8* container, u32 size, std::string_view name) {
  return FindConstant(container, size, name, kRegisterSetFloat4);
}

constexpr u16 kRegisterSetSampler = 3;
constexpr u32 kFloat4Registers = 256;
constexpr u32 kAllSamplers = 0xFFFF;

// Fills float4_register_count and sampler_mask from the container's constant
// table. Leaves the everything-used defaults when there is no usable table.
void ReadConstantUsage(const u8* container, u32 size, GuestShader& shader) {
  const auto* header = reinterpret_cast<const ShaderContainerHeader*>(container);
  if (size < sizeof(ShaderContainerHeader))
    return;
  const u32 table_offset = header->constant_table_offset;
  if (!table_offset || u64(table_offset) + 4 + sizeof(ConstantTable) > size)
    return;
  const u8* table_data = container + table_offset + 4;
  const u32 table_size = size - table_offset - 4;
  const auto* table = reinterpret_cast<const ConstantTable*>(table_data);
  const u32 count = table->constants;
  const u32 info_offset = table->constant_info;
  if (u64(info_offset) + u64(count) * sizeof(ConstantInfo) > table_size)
    return;
  const auto* infos = reinterpret_cast<const ConstantInfo*>(table_data + info_offset);
  u32 float4_end = 0;
  u32 samplers = 0;
  for (u32 i = 0; i < count; ++i) {
    const u32 first = u16(infos[i].register_index);
    const u32 end = first + u16(infos[i].register_count);
    switch (u16(infos[i].register_set)) {
      case kRegisterSetFloat4:
        float4_end = std::max(float4_end, end);
        break;
      case kRegisterSetSampler:
        for (u32 s = first; s < end && s < 32; ++s)
          samplers |= 1u << s;
        break;
      default:
        break;
    }
  }
  shader.float4_register_count = std::min(float4_end, kFloat4Registers);
  shader.sampler_mask = shader.pixel ? (samplers & kAllSamplers) : (samplers ? kAllSamplers : 0);
}

#if defined(_WIN32)
std::once_flag g_dxil_once;
std::unique_ptr<u8[]> g_dxil_cache;

const u8* DxilCache() {
  std::call_once(g_dxil_once, [] {
    if (g_dxilCacheDecompressedSize == 0)
      return;
    auto buffer = std::make_unique<u8[]>(g_dxilCacheDecompressedSize);
    const size_t n = ZSTD_decompress(buffer.get(), g_dxilCacheDecompressedSize,
                                     g_compressedDxilCache, g_dxilCacheCompressedSize);
    if (ZSTD_isError(n) || n != g_dxilCacheDecompressedSize) {
      GPU_ERROR("DXIL shader cache decompression failed");
      return;
    }
    g_dxil_cache = std::move(buffer);
  });
  return g_dxil_cache.get();
}
#endif

// The title compiles a few shaders at runtime with D3DXCompileShader (Bink's
// YUV conversion, the depth restore pass), so no asset dump contains them.
// Writing the containers out lets the next shader cache build pick them up.
void DumpRuntimeShader(u64 hash, const u8* function, u32 length, bool pixel) {
  const std::string dir = settings::RuntimeShaderDir();
  if (dir.empty())
    return;
  std::error_code error;
  std::filesystem::create_directories(dir, error);
  const auto path = std::filesystem::path(dir) /
                    fmt::format("{}_{:016x}.bin", pixel ? "ps" : "vs", hash);
  if (std::filesystem::exists(path, error))
    return;
  std::ofstream file(path, std::ios::binary);
  file.write(reinterpret_cast<const char*>(function), length);
  if (file)
    GPU_INFO("Wrote runtime shader {} for the next shader cache build", path.string());
}

std::once_flag g_spirv_once;
std::unique_ptr<u8[]> g_spirv_cache;

const u8* SpirvCache() {
  std::call_once(g_spirv_once, [] {
    if (g_spirvCacheDecompressedSize == 0)
      return;
    auto buffer = std::make_unique<u8[]>(g_spirvCacheDecompressedSize);
    const size_t n = ZSTD_decompress(buffer.get(), g_spirvCacheDecompressedSize,
                                     g_compressedSpirvCache, g_spirvCacheCompressedSize);
    if (ZSTD_isError(n) || n != g_spirvCacheDecompressedSize) {
      GPU_ERROR("SPIR-V shader cache decompression failed");
      return;
    }
    g_spirv_cache = std::move(buffer);
  });
  return g_spirv_cache.get();
}

}  // namespace

GuestShader* RegisterGuestShader(u32 shader_va, const u8* header_part, const u8* microcode,
                                 bool pixel) {
  if (!shader_va || !header_part)
    return nullptr;
  const auto* header = reinterpret_cast<const ShaderContainerHeader*>(header_part);
  const u32 header_size = header->virtual_size;
  const u32 microcode_size = header->physical_size;
  const u32 length = header_size + microcode_size;
  if (header_size < sizeof(ShaderContainerHeader) || length > 0x100000 ||
      (microcode_size && !microcode)) {
    return nullptr;
  }
  std::vector<u8> container(length);
  std::memcpy(container.data(), header_part, header_size);
  if (microcode_size)
    std::memcpy(container.data() + header_size, microcode, microcode_size);
  const u8* function = container.data();
  const u64 hash = XXH3_64bits(function, length);

  std::lock_guard lock(g_mutex);
  auto& shader = g_shaders[hash];
  if (!shader) {
    shader = std::make_unique<GuestShader>();
    shader->hash = hash;
    shader->pixel = pixel;
    ReadConstantUsage(function, header_size, *shader);
    if (pixel) {
      // UE3's post-process and shadow shaders the graphics settings reach into
      // (see GuestShader).
      shader->bloom_scale_register = FindFloat4Constant(function, header_size, "BloomScale");
      shader->blur_clamp_register = FindFloat4Constant(function, header_size, "MinMaxBlurClamp");
      shader->distortion_apply =
          FindConstant(function, header_size, "AccumulatedDistortionTexture",
                       kRegisterSetSampler) >= 0;
      shader->shadow_projection =
          FindFloat4Constant(function, header_size, "ShadowModulateColor") >= 0;
    } else {
      shader->vertices_per_instance_register =
          FindFloat4Constant(function, header_size, "NumVerticesPerInstance");
      shader->view_projection_register =
          FindFloat4Constant(function, header_size, "ViewProjectionMatrix");
      shader->camera_position_register =
          FindFloat4Constant(function, header_size, "CameraPosition");
    }
    if (ShaderCacheEntry* entry = FindCacheEntry(hash)) {
      shader->entry = entry;
      shader->spec_constants_mask = entry->specConstantsMask;
      entry->guestShader = shader.get();
      if ((shader->override = FindOverride(hash))) {
        shader->spec_constants_mask = 0;
        shader->screen_reflections = shader->override->screen_reflections;
        GPU_INFO("{} shader {:016X} replaced", pixel ? "Pixel" : "Vertex", hash);
      }
    } else {
      GPU_WARN("{} shader {:016X} ({} bytes) is not in the shader cache",
               pixel ? "Pixel" : "Vertex", hash, length);
      DumpRuntimeShader(hash, function, length, pixel);
    }
    g_generation.fetch_add(1, std::memory_order_release);
  }
  g_objects[shader_va] = shader.get();
  // A new shader at a reused address starts unbound.
  g_bound_declarations.erase(shader_va);
  g_object_changes.fetch_add(1, std::memory_order_release);
  return shader.get();
}

u64 GuestShaderObjectChanges() {
  return g_object_changes.load(std::memory_order_acquire);
}

GuestShader* FindGuestShader(u32 shader_va) {
  if (!shader_va)
    return nullptr;
  std::lock_guard lock(g_mutex);
  auto it = g_objects.find(shader_va);
  return it != g_objects.end() ? it->second : nullptr;
}

GuestShader* FindGuestShaderByHash(u64 hash) {
  std::lock_guard lock(g_mutex);
  auto it = g_shaders.find(hash);
  return it != g_shaders.end() && it->second->entry ? it->second.get() : nullptr;
}

u64 GuestShaderGeneration() {
  return g_generation.load(std::memory_order_acquire);
}

void UnregisterGuestShader(u32 shader_va) {
  std::lock_guard lock(g_mutex);
  g_objects.erase(shader_va);
  g_bound_declarations.erase(shader_va);
  g_object_changes.fetch_add(1, std::memory_order_release);
}

void BindVertexShaderDeclaration(u32 shader_va, u32 declaration_va) {
  if (!shader_va)
    return;
  std::lock_guard lock(g_mutex);
  if (declaration_va)
    g_bound_declarations[shader_va] = declaration_va;
  else
    g_bound_declarations.erase(shader_va);
  g_object_changes.fetch_add(1, std::memory_order_release);
}

u32 FindBoundVertexDeclaration(u32 shader_va) {
  if (!shader_va)
    return 0;
  std::lock_guard lock(g_mutex);
  auto it = g_bound_declarations.find(shader_va);
  return it != g_bound_declarations.end() ? it->second : 0;
}

plume::RenderShader* GetHostShader(GuestShader* shader, u32 spec_constants) {
  if (!shader || !shader->entry)
    return nullptr;
  auto& h = Host();
  if (!h.device)
    return nullptr;
  const ShaderCacheEntry* entry = shader->entry;
  std::lock_guard lock(shader->mutex);

  if (const ShaderOverride* replacement = shader->override) {
    if (!shader->shader) {
      if (h.vulkan) {
        shader->shader = h.device->createShader(replacement->spirv, replacement->spirv_size,
                                                "main", plume::RenderShaderFormat::SPIRV);
      } else if (replacement->dxil) {
        shader->shader = h.device->createShader(replacement->dxil, replacement->dxil_size, "main",
                                                plume::RenderShaderFormat::DXIL);
      }
    }
    return shader->shader.get();
  }

  if (h.vulkan) {
    // One module for every value; g_SpecConstants is specialization constant
    // 0, supplied per pipeline.
    if (shader->shader)
      return shader->shader.get();
    const u8* cache = SpirvCache();
    if (!cache || entry->spirvSize == 0)
      return nullptr;
    const u8* smol = cache + entry->spirvOffset;
    std::vector<u8> spirv(smolv::GetDecodedBufferSize(smol, entry->spirvSize));
    if (spirv.empty() || !smolv::Decode(smol, entry->spirvSize, spirv.data(), spirv.size())) {
      GPU_ERROR("SPIR-V decode failed for shader {:016X}", entry->hash);
      return nullptr;
    }
    shader->shader =
        h.device->createShader(spirv.data(), spirv.size(), "main", plume::RenderShaderFormat::SPIRV);
    return shader->shader.get();
  }

#if defined(_WIN32)
  const u8* cache = DxilCache();
  if (!cache || entry->dxilSize == 0)
    return nullptr;
  if (entry->specConstantsMask == 0) {
    if (!shader->shader) {
      shader->shader = h.device->createShader(cache + entry->dxilOffset, entry->dxilSize, "main",
                                              plume::RenderShaderFormat::DXIL);
    }
    return shader->shader.get();
  }

  const u32 masked = spec_constants & entry->specConstantsMask;
  if (auto it = shader->linked.find(masked); it != shader->linked.end())
    return it->second.get();
  std::vector<uint8_t> linked =
      LinkSpecConstants(cache + entry->dxilOffset, entry->dxilSize, shader->pixel, masked);
  std::unique_ptr<plume::RenderShader> host_shader;
  if (!linked.empty()) {
    host_shader = h.device->createShader(linked.data(), linked.size(), "main",
                                         plume::RenderShaderFormat::DXIL);
  }
  // A failed link is remembered as null so it is not retried every draw.
  auto* raw = host_shader.get();
  shader->linked.emplace(masked, std::move(host_shader));
  return raw;
#else
  return nullptr;
#endif
}

}  // namespace redahm::gpu

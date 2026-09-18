#include "shaders/guest_shaders.h"

#include <algorithm>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <vector>

#include <smolv.h>
#include <xxhash.h>
#include <zstd.h>

#include "core/log.h"
#include "core/settings.h"
#include "render/host.h"
#include "shaders/dxc_link.h"
#include "shaders/shader_cache.h"

namespace redahm::gpu {

namespace {

// Head of the Xenos shader container (XenosRecomp shader.h).
struct ShaderContainerHeader {
  be_u32 flags;
  be_u32 virtual_size;
  be_u32 physical_size;
};

std::mutex g_mutex;
std::unordered_map<u32, GuestShader*> g_objects;
// One GuestShader per hash, including hashes the cache lacks.
std::unordered_map<u64, std::unique_ptr<GuestShader>> g_shaders;
// Vertex shader object -> the declaration D3DVertexShader_Bind bound it to.
std::unordered_map<u32, u32> g_bound_declarations;

ShaderCacheEntry* FindCacheEntry(u64 hash) {
  auto* end = g_shaderCacheEntries + g_shaderCacheEntryCount;
  auto* it = std::lower_bound(g_shaderCacheEntries, end, hash,
                              [](const ShaderCacheEntry& lhs, u64 rhs) { return lhs.hash < rhs; });
  return (it != end && it->hash == hash) ? it : nullptr;
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
    if (ShaderCacheEntry* entry = FindCacheEntry(hash)) {
      shader->entry = entry;
      shader->spec_constants_mask = entry->specConstantsMask;
      entry->guestShader = shader.get();
    } else {
      GPU_WARN("{} shader {:016X} ({} bytes) is not in the shader cache",
               pixel ? "Pixel" : "Vertex", hash, length);
      DumpRuntimeShader(hash, function, length, pixel);
    }
  }
  g_objects[shader_va] = shader.get();
  // A new shader at a reused address starts unbound.
  g_bound_declarations.erase(shader_va);
  return shader.get();
}

GuestShader* FindGuestShader(u32 shader_va) {
  if (!shader_va)
    return nullptr;
  std::lock_guard lock(g_mutex);
  auto it = g_objects.find(shader_va);
  return it != g_objects.end() ? it->second : nullptr;
}

void UnregisterGuestShader(u32 shader_va) {
  std::lock_guard lock(g_mutex);
  g_objects.erase(shader_va);
  g_bound_declarations.erase(shader_va);
}

void BindVertexShaderDeclaration(u32 shader_va, u32 declaration_va) {
  if (!shader_va)
    return;
  std::lock_guard lock(g_mutex);
  if (declaration_va)
    g_bound_declarations[shader_va] = declaration_va;
  else
    g_bound_declarations.erase(shader_va);
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

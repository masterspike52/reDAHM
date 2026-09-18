#pragma once

// Symbols XenosRecomp emits into the generated shader_cache.cpp. The generated
// file includes this header by bare name and refers to everything unqualified,
// so it stays in the global namespace with the emitter's field order.

#include <cstddef>
#include <cstdint>

namespace redahm::gpu {
struct GuestShader;
}

struct ShaderCacheEntry {
  const uint64_t hash;
  const uint32_t dxilOffset;
  const uint32_t dxilSize;
  const uint32_t spirvOffset;
  const uint32_t spirvSize;
  const uint32_t specConstantsMask;
  redahm::gpu::GuestShader* guestShader;
};

// Sorted by hash.
extern ShaderCacheEntry g_shaderCacheEntries[];
extern const size_t g_shaderCacheEntryCount;

// zstd compressed concatenation of the DXIL blobs.
extern const uint8_t g_compressedDxilCache[];
extern const size_t g_dxilCacheCompressedSize;
extern const size_t g_dxilCacheDecompressedSize;

// zstd compressed concatenation of the smol-v encoded SPIR-V modules.
extern const uint8_t g_compressedSpirvCache[];
extern const size_t g_spirvCacheCompressedSize;
extern const size_t g_spirvCacheDecompressedSize;

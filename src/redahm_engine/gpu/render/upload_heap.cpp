#include "render/upload_heap.h"

#include <cstring>
#include <memory>
#include <vector>

#include "core/log.h"
#include "render/host.h"

namespace redahm::gpu {

namespace {

// Chunks live in system memory for the whole session, one list per frame slot,
// so their size sets the floor of the upload footprint. 16 MiB as in reblue; a
// busy frame adds chunks rather than every frame paying for the peak.
constexpr u32 kChunkSize = 16 * 1024 * 1024;

struct Chunk {
  std::unique_ptr<plume::RenderBuffer> buffer;
  u8* mapped = nullptr;
  u64 device_address = 0;
  u32 size = 0;
  u32 used = 0;
};

struct SlotChunks {
  std::vector<Chunk> chunks;
  size_t current = 0;
};

SlotChunks g_slots[kFrameCount];

bool CreateChunk(Chunk& chunk, u32 size) {
  const plume::RenderBufferFlags flags =
      plume::RenderBufferFlag::CONSTANT | plume::RenderBufferFlag::VERTEX |
      plume::RenderBufferFlag::INDEX | plume::RenderBufferFlag::DEVICE_ADDRESSABLE;
  chunk.buffer = CreateBuffer(plume::RenderBufferDesc::UploadBuffer(size, flags), "upload-chunk");
  if (!chunk.buffer)
    return false;
  chunk.mapped = static_cast<u8*>(chunk.buffer->map());
  if (!chunk.mapped) {
    chunk.buffer.reset();
    return false;
  }
  chunk.device_address = chunk.buffer->getDeviceAddress();
  chunk.size = size;
  chunk.used = 0;
  return true;
}

}  // namespace

UploadAllocation UploadAllocateLocked(u32 size, u32 alignment) {
  if (size == 0)
    return {};
  SlotChunks& slot = g_slots[CurrentFrameSlot()];

  for (; slot.current < slot.chunks.size(); ++slot.current) {
    Chunk& chunk = slot.chunks[slot.current];
    const u32 offset = (chunk.used + alignment - 1) & ~(alignment - 1);
    if (u64(offset) + size <= chunk.size) {
      chunk.used = offset + size;
      UploadAllocation allocation;
      allocation.data = chunk.mapped + offset;
      allocation.buffer = chunk.buffer.get();
      allocation.offset = offset;
      allocation.device_address = chunk.device_address + offset;
      allocation.size = size;
      return allocation;
    }
  }

  // Oversized requests (large texture levels) get a chunk of their own that
  // is kept for reuse like the rest.
  Chunk chunk;
  const u32 chunk_size = size > kChunkSize ? ((size + 0xFFFF) & ~u32(0xFFFF)) : kChunkSize;
  if (!CreateChunk(chunk, chunk_size)) {
    GPU_ERROR("Upload heap allocation of {} bytes failed", size);
    return {};
  }
  chunk.used = size;
  slot.chunks.push_back(std::move(chunk));
  slot.current = slot.chunks.size() - 1;
  Chunk& created = slot.chunks.back();
  UploadAllocation allocation;
  allocation.data = created.mapped;
  allocation.buffer = created.buffer.get();
  allocation.offset = 0;
  allocation.device_address = created.device_address;
  allocation.size = size;
  return allocation;
}

UploadAllocation UploadBytesLocked(const void* data, u32 size, u32 alignment) {
  UploadAllocation allocation = UploadAllocateLocked(size, alignment);
  if (allocation && data)
    std::memcpy(allocation.data, data, size);
  return allocation;
}

void ResetUploadSlotLocked(u32 slot) {
  SlotChunks& chunks = g_slots[slot];
  // Drop the dedicated oversized chunks so a single huge texture load does
  // not pin its staging memory for the rest of the session.
  std::erase_if(chunks.chunks, [](const Chunk& chunk) { return chunk.size > kChunkSize; });
  for (auto& chunk : chunks.chunks)
    chunk.used = 0;
  chunks.current = 0;
}

u64 UploadHeapBytesLocked() {
  u64 bytes = 0;
  for (const auto& slot : g_slots) {
    for (const auto& chunk : slot.chunks)
      bytes += chunk.size;
  }
  return bytes;
}

}  // namespace redahm::gpu

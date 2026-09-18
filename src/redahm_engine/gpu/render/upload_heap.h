#pragma once

// Per-frame upload memory: constant buffers, immediate-mode vertices and
// indices, converted streams and texture staging. Each frame slot owns its
// chunks and rewinds them only after that slot's fence has signalled.

#include <plume_render_interface.h>
#include <rex/types.h>

namespace redahm::gpu {

struct UploadAllocation {
  u8* data = nullptr;
  plume::RenderBuffer* buffer = nullptr;
  u64 offset = 0;
  u64 device_address = 0;
  u32 size = 0;

  explicit operator bool() const { return data != nullptr; }
  plume::RenderBufferReference ref() const { return plume::RenderBufferReference(buffer, offset); }
};

// alignment must be a power of two. Constant buffers need 256.
UploadAllocation UploadAllocateLocked(u32 size, u32 alignment = 16);

UploadAllocation UploadBytesLocked(const void* data, u32 size, u32 alignment = 16);

// Called by the frame ring once the slot's fence has been awaited.
void ResetUploadSlotLocked(u32 slot);

// Bytes held by every slot's chunks, for the memory log.
u64 UploadHeapBytesLocked();

}  // namespace redahm::gpu

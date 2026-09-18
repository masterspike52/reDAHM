#pragma once

#include <cstring>

#include <rex/system/kernel_state.h>
#include <rex/system/xmemory.h>
#include <rex/types.h>

namespace redahm::gpu::mem {

inline rex::memory::Memory* Memory() {
  return REX_KERNEL_MEMORY();
}

// Host pointer for a guest virtual address. The memory stays big-endian.
template <typename T>
inline T* At(u32 va) {
  if (!va)
    return nullptr;
  return Memory()->TranslateVirtual<T*>(va);
}

template <typename T>
inline T Load(u32 va) {
  auto* p = At<rex::be<T>>(va);
  return p ? static_cast<T>(*p) : T{};
}

template <typename T>
inline void Store(u32 va, T value) {
  if (auto* p = At<rex::be<T>>(va))
    *p = value;
}

// Addresses in GPU fetch constants and buffer headers are the virtual address
// of physical memory (the 0xA/0xC/0xE windows), or a raw physical address when
// a title built the header by hand.
//
// Both forms have to go through TranslateVirtual. Where the host's allocation
// granularity is coarser than 4KB (64KB on Windows, 16KB on macOS arm64) the
// physical heaps are mapped at a 0x1000-byte offset that the mapping API rounds
// away; TranslateVirtual adds it back from the heap, TranslatePhysical does not
// and lands 0x1000 bytes short of the title's own view of the same memory. A
// raw physical address is therefore read through the 0xE window rather than the
// physical view.
inline u8* AtGpuAddress(u32 address) {
  if (!address)
    return nullptr;
  if (address < 0x20000000)
    return Memory()->TranslateVirtual<u8*>(0xE0000000u | address);
  return Memory()->TranslateVirtual<u8*>(address);
}

inline u32 Alloc(u32 size, u32 alignment = 0x20) {
  u32 va = Memory()->SystemHeapAlloc(size, alignment);
  if (va)
    Memory()->Zero(va, size);
  return va;
}

inline void Free(u32 va) {
  if (va)
    Memory()->SystemHeapFree(va);
}

}  // namespace redahm::gpu::mem

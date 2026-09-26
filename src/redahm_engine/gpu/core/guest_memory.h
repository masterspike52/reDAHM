#pragma once

#include <cstring>

#include <rex/ppc/func.h>
#include <rex/system/kernel_state.h>
#include <rex/system/xmemory.h>
#include <rex/types.h>

namespace redahm::gpu::mem {

inline rex::memory::Memory* Memory() {
  return REX_KERNEL_MEMORY();
}

// The host base of the guest address space. A plain global rather than a
// function-local static: the guard of a local static is a thread-local epoch
// check on every call, and this is on every guest read.
inline u8* g_base = nullptr;

inline u8* Base() {
  u8* base = g_base;
  if (!base) [[unlikely]]
    base = g_base = Memory()->virtual_membase();
  return base;
}

// Host pointer for a guest virtual address, the way the recompiled code
// computes it (REX_RAW_ADDR in the generated pch): the base plus the address,
// plus the 0x1000 the physical heaps sit at in the 0xE window where the host
// maps memory in 64 KB granules. Memory::TranslateVirtual gives the same
// answer through the kernel state and a heap lookup, which made every guest
// read here several times slower than the recompiled code's own.
template <typename T>
inline T* At(u32 va) {
  if (!va)
    return nullptr;
#if defined(_WIN32)
  const u32 offset = va >= 0xE0000000u ? 0x1000u : 0u;
#else
  const u32 offset = 0;
#endif
  return reinterpret_cast<T*>(Base() + va + offset);
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
// A guest function's host implementation, remembered per address: the
// runtime's ResolveIndirectFunction was half the cost of every call the
// native code makes back into the game. Functions never move, so entries
// never go stale. Each thread keeps its own, so no entry is ever shared.
inline PPCFunc* ResolveFunction(u32 guest_address) {
  struct Entry {
    u32 guest_address = 0;
    PPCFunc* fn = nullptr;
  };
  constexpr u32 kEntries = 1024;
  thread_local Entry entries[kEntries];
  Entry& entry = entries[(guest_address >> 2) & (kEntries - 1)];
  if (entry.guest_address == guest_address && entry.fn)
    return entry.fn;
  PPCFunc* fn = rex::runtime::ResolveIndirectFunction(guest_address);
  if (fn)
    entry = {guest_address, fn};
  return fn;
}

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

// UE3 scene rendering helpers, run natively.
//
// Small functions the render thread's scene walk calls often enough that the
// recompiled code's cost per instruction (every load swapped and every value
// through the register context) shows up in traces of the city. Each does
// exactly what the original does, down to the guest memory it writes.

#include <bit>
#include <cstdint>
#include <cstring>

#include <rex/hook.h>
#include <rex/ppc/func.h>
#include <rex/types.h>

#include "generated/redahm_init.h"
#include "redahm_engine/gpu/core/guest_memory.h"

namespace {

namespace mem = redahm::gpu::mem;

u32 LoadU(const u8* p) {
  u32 value;
  std::memcpy(&value, p, 4);
  return std::byteswap(value);
}

void StoreU(u8* p, u32 value) {
  value = std::byteswap(value);
  std::memcpy(p, &value, 4);
}

}  // namespace

// sub_823A3938, TConstSetBitIterator's constructor (this, TBitArray {data,
// num bits}): clears the bits past the array's end in its last word, then
// finds the first set bit. The draw list walkers start one over the view's
// static mesh visibility map for every drawing policy, scanning the map's
// leading zero words each time. Iterator: {current bit mask, word index, data,
// word's first bit index, word count, remaining bits of the word, bit index}.
REX_HOOK_RAW(sub_823A3938) {
  u8* it = mem::At<u8>(ctx.r3.u32);
  const u8* array = mem::At<u8>(ctx.r4.u32);
  const u32 data = LoadU(array);
  const int32_t num = int32_t(LoadU(array + 4));
  const int32_t words = (num + 31) / 32;
  StoreU(it + 0x00, 0);
  StoreU(it + 0x04, u32(-1));
  StoreU(it + 0x08, data);
  StoreU(it + 0x0C, u32(-32));
  StoreU(it + 0x10, u32(words));
  StoreU(it + 0x14, 0);
  StoreU(it + 0x18, 0);
  u8* bits = mem::At<u8>(data);
  if (words) {
    const u32 shift = u32(words * 32 - num) & 63;
    const u32 mask = shift >= 32 ? 0 : 0xFFFFFFFFu >> shift;
    u8* last = bits + size_t(words) * 4 - 4;
    StoreU(last, LoadU(last) & mask);
  }
  int32_t index = -1;
  int32_t first_bit = -32;
  u32 word = 0;
  for (;;) {
    ++index;
    first_bit += 32;
    if (index > words - 1) {
      StoreU(it + 0x04, u32(index));
      StoreU(it + 0x0C, u32(first_bit));
      StoreU(it + 0x14, 0);
      return;
    }
    word = LoadU(bits + size_t(index) * 4);
    if (word)
      break;
  }
  const u32 lowest = word & ~(word - 1);
  StoreU(it + 0x00, lowest);
  StoreU(it + 0x04, u32(index));
  StoreU(it + 0x0C, u32(first_bit));
  StoreU(it + 0x14, word);
  StoreU(it + 0x18, u32(first_bit - int32_t(std::countl_zero(lowest)) + 31));
}

// Kynapse path data unloading without the stale entry wait.
//
// Each city tile's KynapseHierPathdataObj unloads its AI navigation data as
// the garbage collector destroys it (sub_82B8B7E8 -> sub_82B8BB08), through
// sub_82BF97C0 (Kynapse slot, path data id, wait). That looks the id's entry up
// in the slot's list once, asks for the unload and then pumps the slot
// (sub_82BF8DA8) until that entry's state reads 0. Removing an entry compacts
// the list, so once any entry ahead of it goes (or it goes itself) the saved
// pointer lands on another tile's loaded entry, whose state stays 5: the game
// hangs for good. Stock streaming rarely has enough tiles loaded to line that
// up; with the draw distance raised, the loading screen after a world's tiles
// are torn down (the first mission leaving the casino, travelling, reloading)
// hung on it every time.
//
// The same steps run here, with the entry found by id again before every look
// at its state, so the wait ends when the id's entry is gone or reaches the
// state it waits for.

#include <rex/hook.h>
#include <rex/ppc/func.h>
#include <rex/types.h>

#include "generated/redahm_init.h"
#include "redahm_engine/gpu/core/guest_memory.h"

REX_EXTERN(sub_82C1CFF0);
REX_EXTERN(sub_82BF8DA8);
REX_EXTERN(sub_82BF3598);

namespace {

namespace mem = redahm::gpu::mem;

// The slot: its state (6 once running) and its path data list.
constexpr u32 kSlotState = 0x2B0;
constexpr u32 kSlotRunning = 6;
constexpr u32 kSlotList = 0x34;
// An entry: its state (5 loaded, 0 gone) and its "unload once loaded" flag.
constexpr u32 kEntryState = 0x10;
constexpr u32 kEntryLoaded = 5;
constexpr u32 kEntryUnloadWhenLoaded = 9;

constexpr u32 kGuestFrame = 0x100;

// sub_82C1CFF0 (list, id): the id's entry, or 0.
u32 FindEntry(PPCContext& ctx, u8* base, u32 slot, u32 id) {
  ctx.r3.u64 = mem::Load<u32>(slot + kSlotList);
  ctx.r4.u64 = id;
  sub_82C1CFF0(ctx, base);
  return ctx.r3.u32;
}

void Pump(PPCContext& ctx, u8* base, u32 slot) {
  ctx.r3.u64 = slot;
  sub_82BF8DA8(ctx, base);
}

int32_t EntryState(u32 entry) {
  return mem::Load<int32_t>(entry + kEntryState);
}

}  // namespace

// sub_82BF97C0 (slot, id, wait): unloads the id's path data, waiting for it to
// go when asked. Returns 0 when the slot is not running, else 1.
REX_HOOK_RAW(sub_82BF97C0) {
  const u32 slot = ctx.r3.u32;
  const u32 id = ctx.r4.u32;
  const bool wait = (ctx.r5.u32 & 0xFF) != 0;
  if (mem::Load<u32>(slot + kSlotState) != kSlotRunning) {
    ctx.r3.u64 = 0;
    return;
  }
  const u32 caller_stack = ctx.r1.u32;
  ctx.r1.u64 = caller_stack - kGuestFrame;
  mem::Store<u32>(ctx.r1.u32, caller_stack);

  u32 entry = FindEntry(ctx, base, slot, id);
  if (entry && EntryState(entry) < int32_t(kEntryLoaded)) {
    if (!wait) {
      mem::At<u8>(entry)[kEntryUnloadWhenLoaded] = 1;
      entry = 0;
    } else {
      // Still loading: let it finish first.
      for (;;) {
        entry = FindEntry(ctx, base, slot, id);
        if (!entry || EntryState(entry) == 0 || EntryState(entry) == int32_t(kEntryLoaded))
          break;
        Pump(ctx, base, slot);
      }
    }
  }
  if (entry) {
    mem::At<u8>(entry)[kEntryUnloadWhenLoaded] = 0;
    if (EntryState(entry) == int32_t(kEntryLoaded)) {
      ctx.r3.u64 = slot;
      ctx.r4.u64 = entry;
      sub_82BF3598(ctx, base);
      while (wait) {
        entry = FindEntry(ctx, base, slot, id);
        if (!entry || EntryState(entry) == 0)
          break;
        Pump(ctx, base, slot);
      }
    }
  }
  ctx.r1.u64 = caller_stack;
  ctx.r3.u64 = 1;
}

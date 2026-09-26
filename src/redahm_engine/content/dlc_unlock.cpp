// sets the dlc unlock path to true due to needing xbox live to actually unlock the dlc which we dont have access to

#include <rex/hook.h>

#include <cstdint>

// Original recompiled implementations.
REX_EXTERN(__imp__sub_82B1E6A0);
REX_EXTERN(__imp__sub_82B47838);

// sub_82B47838 enumerates the DLC packages and asks the content-availability
// lookup, sub_82B1E6A0, whether each is licensed; its only direct call to the
// lookup is that check (0x82B47C30). The enumeration is marked on its thread
// and the lookup answers "licensed" while it runs. This used to match the
// caller's return address in ctx.lr instead, which the recompiler no longer
// maintains with skip_lr.
static thread_local int t_dlc_enumeration_depth = 0;

REX_HOOK_RAW(sub_82B47838) {
  ++t_dlc_enumeration_depth;
  __imp__sub_82B47838(ctx, base);
  --t_dlc_enumeration_depth;
}

REX_HOOK_RAW(sub_82B1E6A0) {
  // Run the real lookup so all side effects / other callers are untouched.
  __imp__sub_82B1E6A0(ctx, base);

  // Only inside the DLC enumeration: report the package as licensed so it
  // takes the "content available" branch instead of "Detected locked content".
  // The generated code performs its own `cmplwi cr6, r3, 0` afterwards, so
  // forcing r3 nonzero is sufficient.
  if (t_dlc_enumeration_depth > 0) {
    ctx.r3.u64 = 1;
  }
}

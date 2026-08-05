// sets the dlc unlock path to true due to needing xbox live to actually unlock the dlc which we dont have access to

#include <rex/hook.h>

#include <cstdint>

// Original recompiled implementation of the content-availability lookup.
REX_EXTERN(__imp__sub_82B1E6A0);

// Guest return address of the licensing check inside sub_82B47838. The
// recompiler emits `ctx.lr = 0x82B47C34;` right before `sub_82B1E6A0(ctx, base);`.
static constexpr uint32_t kDlcEnumGateReturnAddr = 0x82B47C34;

REX_HOOK_RAW(sub_82B1E6A0) {
  const uint32_t caller_lr = static_cast<uint32_t>(ctx.lr);

  // Run the real lookup so all side effects / other callers are untouched.
  __imp__sub_82B1E6A0(ctx, base);

  // Only for the DLC enumeration gate: report the package as licensed so it
  // takes the "content available" branch instead of "Detected locked content".
  // The generated code performs its own `cmplwi cr6, r3, 0` afterwards, so
  // forcing r3 nonzero is sufficient.
  if (caller_lr == kDlcEnumGateReturnAddr) {
    ctx.r3.u64 = 1;
  }
}

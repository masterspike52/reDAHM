// The saucer's stealth fades its pilot along with it.
//
// CPVehicle_UFO.ToggleStealth fades its driver out when stealth comes on and
// back in when it goes off, through FadeActor (sub_829E39A8, native: ufo,
// bFade, actor, f1 time), which hands the actor's meshes to the fade manager
// (sub_828B0520: manager, component, f1 from, f2 to, f3 time). The saucer
// itself fades out, takes its stealth material and fades back in as the
// shimmer, and the reverse when stealth ends.
//
// The fade manager only takes components whose MeshComponent bSupportsFading
// is set, bit 31 of the word at +692, and checks it only when a fade starts.
// The saucer's meshes and every attachment have it; Crypto's does not
// (Default__CryptoPawn.WPawnSkeletalMeshComponent cooks bSupportsFading=False),
// so his jetpack and Zap-O-Matic faded and he stayed in his seat. While the
// saucer fades someone other than itself, each component the manager is handed
// is let in, its bit put back as soon as the fade has started, so nothing but
// the saucer's stealth can fade him.

#include <rex/hook.h>
#include <rex/types.h>

#include "generated/redahm_init.h"
#include "redahm_engine/gpu/core/guest_memory.h"

REX_EXTERN(__imp__sub_829E39A8);
REX_EXTERN(__imp__sub_828B0520);

namespace {

namespace mem = redahm::gpu::mem;

constexpr u32 kMeshComponentFlags = 692;
constexpr u32 kSupportsFading = 0x80000000u;

// Set while the saucer is fading an actor other than itself. Game thread only.
bool g_fading_driver = false;

}  // namespace

// sub_828B0520 (manager, component, f1 from, f2 to, f3 time).
REX_HOOK_RAW(sub_828B0520) {
  const u32 component = ctx.r4.u32;
  const bool let_in = g_fading_driver && component;
  u32 flags = 0;
  if (let_in) {
    flags = mem::Load<u32>(component + kMeshComponentFlags);
    mem::Store<u32>(component + kMeshComponentFlags, flags | kSupportsFading);
  }
  __imp__sub_828B0520(ctx, base);
  if (let_in) {
    const u32 now = mem::Load<u32>(component + kMeshComponentFlags);
    mem::Store<u32>(component + kMeshComponentFlags,
                    (now & ~kSupportsFading) | (flags & kSupportsFading));
  }
}

// sub_829E39A8 (ufo, bFade, actor, f1 time).
REX_HOOK_RAW(sub_829E39A8) {
  const u32 ufo = ctx.r3.u32;
  const u32 actor = ctx.r5.u32;
  g_fading_driver = actor && actor != ufo;
  __imp__sub_829E39A8(ctx, base);
  g_fading_driver = false;
}

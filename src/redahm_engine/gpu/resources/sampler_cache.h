#pragma once

#include <rex/types.h>

namespace redahm::gpu {

// Bindless sampler slot for the sampler state in a device fetch constant (the
// six dwords, host order). The SetSamplerState_* setters stay the title's own
// code and write their bits there. allow_anisotropy lets redahm_anisotropy
// upgrade the sampler; pass false for textures the GPU wrote. Needs
// Host().mutex.
u32 GetSamplerSlotLocked(const u32 fetch[6], bool is_3d, bool allow_anisotropy);

}  // namespace redahm::gpu

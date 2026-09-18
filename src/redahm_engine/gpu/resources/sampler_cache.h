#pragma once

#include <rex/types.h>

namespace redahm::gpu {

// Bindless sampler slot for the sampler state in a device fetch constant (the
// six dwords, host order). The SetSamplerState_* setters stay the title's own
// code and write their bits there. Needs Host().mutex.
u32 GetSamplerSlotLocked(const u32 fetch[6], bool is_3d);

}  // namespace redahm::gpu

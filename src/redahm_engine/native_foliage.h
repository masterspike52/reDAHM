#pragma once

#include <rex/ppc/func.h>
#include <rex/types.h>

namespace redahm::native_foliage {

// FFoliageSceneProxy::DrawDynamicElements (sub_8267FF98) run natively, on the
// caller's context: r3 proxy, r4 primitive draw interface, r5 view.
void DrawFoliageProxy(PPCContext& ctx, u8* base);

}  // namespace redahm::native_foliage

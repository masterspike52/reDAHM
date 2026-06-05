#include <rex/hook.h>
#include "redahm_logging.h"

bool skip_loadingbik()
{
	return true;
}


REX_HOOK_RAW(sub_833B9708) {
    uint32_t a1 = ctx.r3.u32;
    uint32_t a2 = ctx.r4.u32;

    bool is_open_handle = (a2 & 0x4000000) != 0;

    if (is_open_handle) {
        RDAHM_INFO("loading <embedded bik> from offset 0x{:08X} ...", a1);
    }
    else {
        const char* filename = a1
            ? reinterpret_cast<const char*>(base + a1)
            : "<null>";
        RDAHM_INFO("loading {} from 0x{:08X} ...", filename, a1);
    }

    __imp__sub_833B9708(ctx, base);

    RDAHM_INFO("done, returned 0x{:08X}", ctx.r3.u32);
}

REX_HOOK_RAW(sub_833BE510) {
    uint32_t* a1 = reinterpret_cast<uint32_t*>(base + ctx.r3.u32);

    RDAHM_INFO("sub_833BE510: running bink worker synchronously");

    // Keep processing work items until shutdown signal or no more work
    while (*a1 == 1) {
        if (a1[6]) {
            // call sub_833BE388 synchronously
            __imp__sub_833BE388(ctx, base);
        }
        // briefly yield to avoid spinning
        break;
    }

    ctx.r3.u32 = 0;
}
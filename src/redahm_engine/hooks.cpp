#include "redahm_engine/overlays/fps_overlay.h"
#include <rex/hook.h>
#include <cstdint>
#include <cstring>
#include "generated/redahm_init.h"
#include "redahm_logging.h"
#include <atomic>
#include <bit>
#include <functional>
#include <thread>
#include <rex/cvar.h>

REXCVAR_DEFINE_BOOL(disable_motion_blur, false, "POTF/Graphics", "Disable camera/object motion blur (UMotionBlurEffect)");

FpsOverlayDialog* g_fps_overlay = nullptr;

std::atomic<uint32_t> g_vdswap_presents{0};

std::atomic<size_t> g_present_tid{0};

void Hook_VdSwap_FrameTick() {
    static std::atomic<bool> cfg_logged{false};
    if (!cfg_logged.exchange(true)) {
        RDAHM_INFO("[cfg] disable_motion_blur={} disable_draw_distance_cull={}",
                   REXCVAR_GET(disable_motion_blur), REXCVAR_GET(disable_draw_distance_cull));
    }
    g_vdswap_presents.fetch_add(1, std::memory_order_relaxed);
    g_present_tid.store(std::hash<std::thread::id>{}(std::this_thread::get_id()),
                        std::memory_order_relaxed);
    if (g_fps_overlay)
        g_fps_overlay->RecordFrame();
}

// Motion blur: UMotionBlurEffect::CreateSceneProxy (0x8276D060) returns null so
// the post-process chain builds no motion-blur proxy. TOML uses return_on_true.
bool DisableMotionBlur(PPCRegister& r3) {
    if (!REXCVAR_GET(disable_motion_blur))
        return false;
    r3.u64 = 0;
    return true;
}

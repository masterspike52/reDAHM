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

// MidASM_HOOKS

FpsOverlayDialog* g_fps_overlay = nullptr;

// Counts actual VdSwap presents (what the FPS overlay measures). Read/reset by
// the UGameEngine::Tick diagnostic in framerate.cpp so present/s and tick/s can
// be compared side by side.
std::atomic<uint32_t> g_vdswap_presents{0};

// Hash of the host thread that issues presents, so framerate.cpp can tell
// whether rendering runs on the game-tick thread or a separate render thread.
std::atomic<size_t> g_present_tid{0};

void Hook_VdSwap_FrameTick() {
    g_vdswap_presents.fetch_add(1, std::memory_order_relaxed);
    g_present_tid.store(std::hash<std::thread::id>{}(std::this_thread::get_id()),
                        std::memory_order_relaxed);
    if (g_fps_overlay)
        g_fps_overlay->RecordFrame();
}

// Boot movie sequencing.
//
// The title drives fullscreen movies through two unrelated paths:
//
//   1. FFullScreenMovieBink, configured from [FullScreenMovie] in
//      KronosGame/Config/Xenon/Cooked/Coalesced.ini:
//          StartupMovies=splash_screens
//          StartupMovies=UnrealLogo
//          StartupMovies=Loading
//
//   2. An UnrealScript native (sub_82981E10 -> sub_82ACC668) that formats
//      "..\KronosGame\Movies\%s.bik" and plays it blocking. DAH_Furon_English
//      arrives this way, which is why it is absent from the ini list above.
//
// Both funnel into FFullScreenMovieBink::GameThreadPlayMovie, vtable slot +20
// of off_820AB9B4:
//
//   sub_822B77E8(this, EMovieMode MovieMode, const TCHAR* MovieFilename,
//                INT StartFrame)
//
// MovieFilename is UTF-16BE. This file currently only observes that choke
// point; it does not yet reorder anything.

#include <rex/hook.h>

#include <algorithm>
#include <atomic>
#include <cctype>
#include <chrono>
#include <cstdint>
#include <string>

#include "redahm_logging.h"

namespace {

// The startup playlist ends on the looping "Loading" movie (mode 130). It is
// meant to be ended by the game calling the playlist advance/stop driver
// (sub_822BA0A0) once the front end is ready; when that call is lost (the race),
// loading.bik loops forever. We arm a watchdog when Loading starts and, if the
// game has not ended it within this window, force the advance ourselves.
constexpr uint64_t kLoadingStuckTimeoutMs = 1000;

std::atomic<bool> g_loading_armed{false};
std::atomic<uint32_t> g_loading_object{0};  // guest FFullScreenMovieBink playlist ptr
std::atomic<uint64_t> g_loading_start_ms{0};

bool NameContainsCI(const std::string& haystack, const char* needle) {
  std::string h = haystack;
  std::transform(h.begin(), h.end(), h.begin(),
                 [](unsigned char c) { return static_cast<char>(std::tolower(c)); });
  return h.find(needle) != std::string::npos;
}

// Milliseconds since the first movie call, so the log shows the gaps between
// entries rather than just absolute wall clock.
uint64_t BootMillis() {
  using clock = std::chrono::steady_clock;
  static const clock::time_point start = clock::now();
  return static_cast<uint64_t>(
      std::chrono::duration_cast<std::chrono::milliseconds>(clock::now() - start).count());
}

// MovieFilename is a UTF-16BE TCHAR*. These names are ASCII in practice, so
// anything outside that range means we are reading the wrong pointer.
std::string ReadMovieName(uint8_t* base, uint32_t guest_addr) {
  if (!guest_addr) {
    return "<null>";
  }
  const auto* chars = reinterpret_cast<const rex::be_u16*>(base + guest_addr);
  std::string name;
  for (int i = 0; i < 128; ++i) {
    const uint16_t c = chars[i];
    if (!c) {
      break;
    }
    name.push_back(c >= 0x20 && c < 0x7F ? static_cast<char>(c) : '?');
  }
  return name;
}

}  // namespace

REX_EXTERN(__imp__sub_822B77E8);
REX_EXTERN(__imp__sub_822B8170);
REX_EXTERN(__imp__sub_822B8318);
REX_EXTERN(__imp__sub_822B8DC0);
REX_EXTERN(__imp__sub_822BA0A0);
REX_EXTERN(__imp__sub_822B9CC0);

// Playlist advance/stop driver (int __fastcall(FFullScreenMovieBink* a1)).
// Calling it ends the current movie and moves the startup playlist forward,
// revealing the menu once the list is exhausted. Routed through our hook below,
// so a forced call also disarms the watchdog.
REX_IMPORT(sub_822BA0A0, ForcePlaylistAdvance, int(uint32_t));

// FFullScreenMovieBink::GameThreadPlayMovie (vtable +20)
REX_HOOK_RAW(sub_822B77E8) {
  RDAHM_INFO("[movie] t={:>6}ms PLAY  mode={} start={} name='{}'", BootMillis(), ctx.r4.u32,
             ctx.r6.u32, ReadMovieName(base, ctx.r5.u32));
  __imp__sub_822B77E8(ctx, base);
  RDAHM_INFO("[movie] t={:>6}ms PLAY  returned", BootMillis());
}

// vtable +24. Called as (this, ?, 1, 0, 0.0) right after the blocking wait in
// sub_82ACC668, which is the GameThreadStopMovie shape.
REX_HOOK_RAW(sub_822B8170) {
  RDAHM_INFO("[movie] t={:>6}ms STOP  r4={} r5={} r6={}", BootMillis(), ctx.r4.u32, ctx.r5.u32,
             ctx.r6.u32);
  __imp__sub_822B8170(ctx, base);
}

// vtable +28. Called as (this) between play and stop: the blocking wait.
REX_HOOK_RAW(sub_822B8318) {
  RDAHM_INFO("[movie] t={:>6}ms WAIT  enter", BootMillis());
  __imp__sub_822B8318(ctx, base);
  RDAHM_INFO("[movie] t={:>6}ms WAIT  leave", BootMillis());
}

// FFullScreenMovieBink low-level bik player (builds "Movies\<name>.bik"). BOTH
// GameThreadPlayMovie (sub_822B77E8) and the startup playlist advancer
// (sub_822BA2E0) funnel here, so this is the only choke point that sees the
// startup movies (UnrealLogo, Loading, DAH_Furon_English) which never reach the
// GameThreadPlayMovie hook. Args: a2 (r4) = mode, a3 (r5) = movie name
// (UTF-16BE TCHAR*). Instrumentation only for now -- log entry + return so we
// can see the real play order and whether a movie blocks/loops here.
REX_HOOK_RAW(sub_822B8DC0) {
  const std::string name = ReadMovieName(base, ctx.r5.u32);
  RDAHM_INFO("[movie] t={:>6}ms BINK  enter mode={} name='{}'", BootMillis(), ctx.r4.u32, name);

  // Arm the stuck-Loading watchdog. "Loading" is the looping last startup movie;
  // a1 (r3) is the playlist object we will force-advance if it never ends.
  if (NameContainsCI(name, "loading")) {
    g_loading_object.store(ctx.r3.u32, std::memory_order_relaxed);
    g_loading_start_ms.store(BootMillis(), std::memory_order_relaxed);
    g_loading_armed.store(true, std::memory_order_relaxed);
  }

  __imp__sub_822B8DC0(ctx, base);
  RDAHM_INFO("[movie] t={:>6}ms BINK  leave name='{}'", BootMillis(), name);
}

// Playlist advance/stop driver. Any call here means the current movie is being
// ended and the playlist moved on, so Loading is no longer stuck -- disarm the
// watchdog. Disarming BEFORE __imp__ matters: the same call also *starts* the
// next movie, and if that movie is Loading the hook above re-arms us.
REX_HOOK_RAW(sub_822BA0A0) {
  g_loading_armed.store(false, std::memory_order_relaxed);
  __imp__sub_822BA0A0(ctx, base);
}

// Movie-thread per-frame loading tick (renders the localized "Loading..." text,
// decodes the Bink frame, and normally calls sub_822BA0A0 itself). This is the
// safe place to drive the watchdog: same thread and same object the game uses to
// advance. We render the frame first, then -- if Loading has stayed up past the
// timeout without the game advancing -- force the advance here on the movie
// thread. (The earlier game-thread force crashed; this one matches the game.)
REX_HOOK_RAW(sub_822B9CC0) {
  __imp__sub_822B9CC0(ctx, base);

  if (!g_loading_armed.load(std::memory_order_relaxed)) {
    return;
  }
  if (BootMillis() - g_loading_start_ms.load(std::memory_order_relaxed) < kLoadingStuckTimeoutMs) {
    return;
  }
  const uint32_t object = g_loading_object.load(std::memory_order_relaxed);
  g_loading_armed.store(false, std::memory_order_relaxed);  // one-shot
  if (object) {
    RDAHM_WARN("[movie] loading.bik stuck > {}ms -- forcing playlist advance",
               kLoadingStuckTimeoutMs);
    ForcePlaylistAdvance(object);
  }
}

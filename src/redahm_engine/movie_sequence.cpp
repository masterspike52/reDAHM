// Boot movie sequencing.
//
// FFullScreenMovieBink (vtable off_820AB9B4) plays the startup playlist from
// [FullScreenMovie] in KronosGame/Config/Xenon/Cooked/Coalesced.ini:
//     StartupMovies=splash_screens
//     StartupMovies=UnrealLogo
//     StartupMovies=Loading        (the last entry loops, mode 130)
// DAH_Furon_English is not part of it: it is a Bink texture movie in the front
// end's UI scene (UI_FrontEnd_New, DAH_Furon_English_Bink), so it plays as soon
// as the front end is up.
//
// How the title orders them:
//   1. At boot sub_822BCF80 shows Splash.bmp and sets the splash end time,
//      dbl_835EA370, to now + 5 s.
//   2. The movie player's tick (sub_822B7308, on the rendering thread, which
//      PreInit starts) calls sub_822B8648 until that time passes; it then sets
//      dbl_835EA370 = -1 and plays StartupMovies[0]. The playlist index
//      (this + 108) is -1 until then.
//   3. At the end of FEngineLoop::Init (sub_82291C28) the game thread calls
//      GameThreadWaitForMovie (sub_822B8318), which blocks until the playlist
//      reaches its last entry, then GameThreadStopMovie, which ends Loading
//      (sub_822B9C20: at the last entry it advances the playlist to its end).
//      Only then does the front end run.
//
// On the 360 engine init takes longer than the 5 s splash, so the playlist is
// already running at step 3. Here init finishes in a few seconds: the wait saw
// index -1 and returned at once, the stop ended nothing, the front end (and
// DAH_Furon_English) started under the splash, and when the playlist began
// seconds later nothing was left to end Loading, which looped forever.
//
// The wait below also covers the splash: while the splash timer is pending and
// no startup movie has started, the game thread waits for the rendering thread
// to start the playlist, then the title's own wait and stop run as on the 360.

#include <rex/hook.h>

#include <algorithm>
#include <bit>
#include <cctype>
#include <chrono>
#include <cstdint>
#include <string>
#include <thread>

#include "redahm_logging.h"

namespace {

// FFullScreenMovieBink fields.
constexpr uint32_t kPlaylistIndex = 108;  // current startup movie, -1 when none
// Splash.bmp's end time (appSeconds), -1 once the startup playlist started.
constexpr uint32_t kSplashEndTime = 0x835EA370;
// How long the game thread waits for the playlist to start: the 5 s splash
// plus the rendering thread's first ticks, with room to spare.
constexpr auto kPlaylistStartTimeout = std::chrono::seconds(30);
constexpr auto kPlaylistPoll = std::chrono::milliseconds(20);

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

int32_t PlaylistIndex(uint8_t* base, uint32_t movie) {
  return static_cast<int32_t>(static_cast<uint32_t>(
      *reinterpret_cast<const rex::be_u32*>(base + movie + kPlaylistIndex)));
}

bool SplashPending(uint8_t* base) {
  const uint64_t bits = *reinterpret_cast<const rex::be<uint64_t>*>(base + kSplashEndTime);
  return std::bit_cast<double>(bits) != -1.0;
}

}  // namespace

REX_EXTERN(__imp__sub_822B77E8);
REX_EXTERN(__imp__sub_822B8170);
REX_EXTERN(__imp__sub_822B8318);
REX_EXTERN(__imp__sub_822B8DC0);

// FFullScreenMovieBink::GameThreadPlayMovie (vtable +20):
// (this, EMovieMode MovieMode, const TCHAR* MovieFilename, INT StartFrame).
REX_HOOK_RAW(sub_822B77E8) {
  RDAHM_INFO("[movie] t={:>6}ms PLAY  mode={} start={} name='{}'", BootMillis(), ctx.r4.u32,
             ctx.r6.u32, ReadMovieName(base, ctx.r5.u32));
  __imp__sub_822B77E8(ctx, base);
}

// GameThreadStopMovie (vtable +24).
REX_HOOK_RAW(sub_822B8170) {
  RDAHM_INFO("[movie] t={:>6}ms STOP  index {}", BootMillis(), PlaylistIndex(base, ctx.r3.u32));
  __imp__sub_822B8170(ctx, base);
}

// GameThreadWaitForMovie (vtable +28): waits for the startup playlist to reach
// its last entry, or returns at once when none is playing.
REX_HOOK_RAW(sub_822B8318) {
  const uint32_t movie = ctx.r3.u32;
  if (PlaylistIndex(base, movie) == -1 && SplashPending(base)) {
    // The playlist has not started yet: the splash is still up. Wait for the
    // rendering thread's tick to start it, as the 360's longer init did.
    RDAHM_INFO("[movie] t={:>6}ms WAIT  splash still up, waiting for the startup movies",
               BootMillis());
    const auto deadline = std::chrono::steady_clock::now() + kPlaylistStartTimeout;
    while (PlaylistIndex(base, movie) == -1 && std::chrono::steady_clock::now() < deadline) {
      std::this_thread::sleep_for(kPlaylistPoll);
    }
    if (PlaylistIndex(base, movie) == -1) {
      RDAHM_WARN("[movie] startup movies did not start within {} s",
                 std::chrono::duration_cast<std::chrono::seconds>(kPlaylistStartTimeout).count());
    }
  }
  RDAHM_INFO("[movie] t={:>6}ms WAIT  enter, index {}", BootMillis(), PlaylistIndex(base, movie));
  __imp__sub_822B8318(ctx, base);
  RDAHM_INFO("[movie] t={:>6}ms WAIT  leave, index {}", BootMillis(), PlaylistIndex(base, movie));
}

// The Bink player every movie goes through (builds "Movies\<name>.bik"):
// (this, mode, name).
REX_HOOK_RAW(sub_822B8DC0) {
  RDAHM_INFO("[movie] t={:>6}ms BINK  mode={} name='{}'", BootMillis(), ctx.r4.u32,
             ReadMovieName(base, ctx.r5.u32));
  __imp__sub_822B8DC0(ctx, base);
}

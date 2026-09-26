// Voice lines kept in a mission sound bank that isn't loaded when they play.
//
// PotF's FMOD projects come from Config/audioprojects.ini into a table of 218
// entries (0x836FBD18, 496 bytes each). A mission's dialogue lives in its own
// "mis" project, which the mission's script loads by name (sub_82355830); that
// unloads the previous mission's, so one mission bank is loaded at a time.
// Playing an event looks its project up by the event's project id (+60) and
// does nothing at all when that project isn't loaded: TriggerEvent
// (sub_82355E68) and an audio component's Play (sub_8280E900, which asks the
// event's info through sub_8280E228 first).
//
// Some lines play outside the mission whose bank holds them, the Pox Mart
// upgrade tips above all (AU_*_Fur_000_*: IS3_Shen_Long_Mis_030's
// AU_SL_Fur_000_Talisman_TheMaster_010 for the Jade Talisman, the Anal Probe,
// Time Stop and PK Magnet ones in the Paradiso and SunnyWood mission banks),
// and were silent there. Playing an event whose mission or ad hoc project
// isn't loaded now loads that project first (LoadProject sub_82351BC8, waiting
// for its sample data). It stays loaded until another is needed or the
// mission bank changes, so at most one bank besides the mission's is held.
//
// FMOD's pool (sub_82353FB8: 23.6 MB of physical memory) is sized for the
// title's own set of banks, so it grows by more than the largest mission bank
// (AU_Belleville_Mis_030 with its effects, 9.6 MB).

#include <rex/hook.h>
#include <rex/types.h>

#include "generated/redahm_init.h"
#include "redahm_engine/gpu/core/guest_memory.h"

REX_EXTERN(__imp__sub_82355E68);
REX_EXTERN(__imp__sub_8280E900);
REX_EXTERN(__imp__sub_82355830);
REX_EXTERN(__imp__sub_82353FB8);
REX_EXTERN(__imp__sub_82BEA130);

namespace {

namespace mem = redahm::gpu::mem;

// The project table.
constexpr u32 kProjects = 0x836FBD18;
constexpr u32 kProjectSize = 496;
constexpr u32 kProjectCount = 218;
constexpr u32 kProjectId = 100;
constexpr u32 kProjectFev = 104;         // the .fev name; empty for none
constexpr u32 kProjectScope = 156;       // ST_App 0, ST_AirCombat 1, ...
constexpr u32 kProjectScopeData = 160;   // ST_App: app 0, adhoc 1, mis 2, cin 3
constexpr u32 kProjectHandle = 224;      // the FMOD EventProject while loaded
constexpr u32 kScopeApp = 0;
constexpr u8 kAppAdhoc = 1;
constexpr u8 kAppMission = 2;

// The loaded mission project's entry (sub_82355830), 0 for none.
constexpr u32 kMissionProject = 0x8374838C;
// The FMOD pool's size, read by Memory_Initialize once it is allocated.
constexpr u32 kPoolSize = 0x83748390;
constexpr u32 kPoolGrowth = 12u << 20;

constexpr u32 kEventProjectId = 60;
constexpr u32 kComponentEvent = 108;

// The project loaded here for an event, 0 for none. Game thread only.
u32 g_extra_project = 0;
bool g_loading = false;
bool g_in_audio_init = false;

u32 Entry(u32 index) {
  return kProjects + index * kProjectSize;
}

bool Loaded(u32 index) {
  return mem::Load<u32>(Entry(index) + kProjectHandle) != 0;
}

// sub_82351A50: the project with the id, 0 (PH_NULL) for none.
u32 ProjectIndex(u32 id) {
  for (u32 i = 0; i < kProjectCount; ++i) {
    if (mem::Load<u32>(Entry(i) + kProjectId) == id)
      return i;
  }
  return 0;
}

// Runs a guest function on the caller's context and stack, then puts every
// register back for the call being hooked.
void CallGuest(PPCContext& ctx, u8* base, void (*fn)(PPCContext&, u8*), u32 r3, u32 r4) {
  const PPCContext saved = ctx;
  ctx.r3.u64 = r3;
  ctx.r4.u64 = r4;
  fn(ctx, base);
  ctx = saved;
}

void EnsureProjectLoaded(PPCContext& ctx, u8* base, u32 event) {
  if (!event || g_loading)
    return;
  const u32 index = ProjectIndex(mem::Load<u32>(event + kEventProjectId));
  if (!index || Loaded(index))
    return;
  const u32 entry = Entry(index);
  const u8 data = mem::Load<u8>(entry + kProjectScopeData);
  if (mem::Load<u32>(entry + kProjectScope) != kScopeApp ||
      (data != kAppAdhoc && data != kAppMission) || !mem::Load<u8>(entry + kProjectFev))
    return;

  g_loading = true;
  if (g_extra_project && Loaded(g_extra_project) &&
      Entry(g_extra_project) != mem::Load<u32>(kMissionProject)) {
    CallGuest(ctx, base, sub_82351E48, g_extra_project, 0);
  }
  CallGuest(ctx, base, sub_82351BC8, index, 1);
  g_extra_project = Loaded(index) ? index : 0;
  g_loading = false;
}

}  // namespace

// TriggerEvent (r3 event, ...).
REX_HOOK_RAW(sub_82355E68) {
  EnsureProjectLoaded(ctx, base, ctx.r3.u32);
  __imp__sub_82355E68(ctx, base);
}

// An audio component's Play (r3 component; its event at +108).
REX_HOOK_RAW(sub_8280E900) {
  if (const u32 component = ctx.r3.u32)
    EnsureProjectLoaded(ctx, base, mem::Load<u32>(component + kComponentEvent));
  __imp__sub_8280E900(ctx, base);
}

// Loading a mission's bank by name. Once the mission bank changes, the one
// loaded here goes, unless it has become the mission's own.
REX_HOOK_RAW(sub_82355830) {
  const u32 before = mem::Load<u32>(kMissionProject);
  __imp__sub_82355830(ctx, base);
  const u32 mission = mem::Load<u32>(kMissionProject);
  if (!g_extra_project || mission == before)
    return;
  if (Loaded(g_extra_project) && Entry(g_extra_project) != mission)
    CallGuest(ctx, base, sub_82351E48, g_extra_project, 0);
  g_extra_project = 0;
}

// The audio engine's FMOD start-up; its first allocation is the pool.
REX_HOOK_RAW(sub_82353FB8) {
  g_in_audio_init = true;
  __imp__sub_82353FB8(ctx, base);
  g_in_audio_init = false;
}

// XPhysicalAlloc (r3 size, r4 max address, r5 alignment, r6 protect).
REX_HOOK_RAW(sub_82BEA130) {
  if (g_in_audio_init) {
    g_in_audio_init = false;
    const u32 size = ctx.r3.u32 + kPoolGrowth;
    ctx.r3.u64 = size;
    mem::Store<u32>(kPoolSize, size);
  }
  __imp__sub_82BEA130(ctx, base);
}

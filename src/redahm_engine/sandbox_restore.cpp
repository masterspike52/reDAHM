// Cut sandbox mission restore: Big Willie's Deliveries (Paradiso sandbox 5).
//
// Of the thirteen sandbox missions cooked into the game, twelve unlock through
// the story (Briefings in Hong Kong and Paris, story mission results in
// Sunnywood, Paradiso and Gorta). Paradiso's fifth is whole: its level
// (is_paradiso_SandboxMission_5: pick up the greasy sack with psychokinesis,
// deliver it, 800 DNA), its giver (CPMissionGiver_12, the speaker box intro,
// accept/decline dialog in DT_paradiso.SandboxMission5) and its result wiring
// in Paradiso_MissionControl. Its giver is enabled by
// Paradiso_EnableStoryMissions behind SandboxMission_5_Available, the same way
// as the other three, but the only thing that ever sets that bool before the
// mission is played is the debug remote event EVENT_DEBUG_SANDBOX_5. The
// others are set by story results: sandbox 1 and 3 when M1b (Double Down) is
// won, sandbox 2 when M4 is.
//
// Kismet named variables are bound once, as a sequence initialises: sub_824AF158
// (variable link, SeqVar_Named) walks up the sequence's parents and links every
// variable whose VarName matches the named variable's FindVarName. Here the
// Paradiso_MissionControl lookups of SandboxMission_5_Available bind to
// SandboxMission_1_Available instead, so the delivery job opens alongside the
// checkpoint race when M1b is won, and a save already past M1b has it straight
// away (the bool is a saved checkpoint variable). Winning the job sets the
// bool it reads, which is already true.
//
// Its ending left Crypto unable to walk (weapons and cortex scan still
// working) even though its cinematic toggles leave the controller's input
// counts and the pawn's physics clean. Once the sack has been delivered (the
// SB5 level's CPSeqAct_SetPKable calling SetPKable), the ending's last
// ToggleCinematicMode, the one that turns cinematic mode off, is followed by
// PlayerController.ClientRestart(Pawn): what the game itself runs when Crypto
// leaves the saucer, returning the controller and pawn to walking with fresh
// movement input and the view on the pawn.
// UObject::CallFunction (sub_823EE5B8, object, FFrame& stack, result,
// UFunction*) runs both calls; FFrame::Node (the calling function) is at +4,
// FFrame::Object (its object) at +8.
//
// Guest layouts:
//   UObject: Outer +40, Name (FName: index, number) +44, Class +52. GNames
//     (dword_8375C1B8) entries hold their UTF-16 text at +16.
//   USeqVar_Named: FindVarName (FName: index, number) at +148.

#include <string>
#include <string_view>

#include <rex/cvar.h>
#include <rex/hook.h>
#include <rex/ppc/func.h>
#include <rex/types.h>

#include "generated/redahm_init.h"
#include "redahm_engine/graphics_settings.h"
#include "redahm_engine/gpu/core/guest_memory.h"
#include "redahm_logging.h"

REXCVAR_DEFINE_BOOL(redahm_restore_sandbox_missions, false, "POTF/Content",
                    "Restore Paradiso's cut sandbox mission (Big Willie's Deliveries)");

// sub_824AF158 (variable link, SeqVar_Named): binds the named variable.
REX_EXTERN(__imp__sub_824AF158);
// sub_823EE5B8 UObject::CallFunction (object, stack, result, function).
REX_EXTERN(__imp__sub_823EE5B8);

namespace {

namespace mem = redahm::gpu::mem;

constexpr u32 kGNames = 0x8375C1B8;
constexpr u32 kNameEntryText = 16;
constexpr u32 kObjectOuter = 40;
constexpr u32 kObjectName = 44;
constexpr u32 kFindVarName = 148;

constexpr std::u16string_view kCutName = u"SandboxMission_5_Available";
constexpr std::u16string_view kStandInName = u"SandboxMission_1_Available";
constexpr std::u16string_view kMissionControl = u"Paradiso_MissionControl";

bool NameIs(i32 index, std::u16string_view text) {
  const u32 names = mem::Load<u32>(kGNames);
  const i32 count = mem::Load<i32>(kGNames + 4);
  if (!names || index < 0 || index >= count)
    return false;
  const u32 entry = mem::Load<u32>(names + u32(index) * 4);
  if (!entry)
    return false;
  for (u32 i = 0; i <= text.size(); ++i) {
    const char16_t c = char16_t(mem::Load<u16>(entry + kNameEntryText + i * 2));
    if (c != (i < text.size() ? text[i] : u'\0'))
      return false;
  }
  return true;
}

// The stand-in's GNames index; names are never removed, so it holds once found.
i32 g_stand_in = -1;

i32 StandInName() {
  if (g_stand_in >= 0)
    return g_stand_in;
  const i32 count = mem::Load<i32>(kGNames + 4);
  for (i32 i = 0; i < count; ++i) {
    if (NameIs(i, kStandInName)) {
      g_stand_in = i;
      break;
    }
  }
  return g_stand_in;
}

//------------------------------------------------------------------------------
// The ending: the player restarted once cinematic mode goes off
//------------------------------------------------------------------------------

constexpr u32 kObjectNameNumber = 48;
constexpr u32 kObjectClass = 52;
constexpr u32 kFrameNode = 4;
constexpr u32 kFrameObject = 8;
constexpr u32 kParmsBelowStack = 0x80;
constexpr u32 kMaxOuterDepth = 32;
constexpr i32 kNameRescanGrowth = 2048;

// FName numbers are the name's trailing _N plus one, 0 for none, so
// "is_paradiso_SandboxMission_5" is ("is_paradiso_SandboxMission", 6).
bool ObjectIs(u32 object, std::u16string_view name, i32 number) {
  return object && mem::Load<i32>(object + kObjectNameNumber) == number &&
         NameIs(mem::Load<i32>(object + kObjectName), name);
}

bool ClassIs(u32 object, std::u16string_view name) {
  return object && ObjectIs(mem::Load<u32>(object + kObjectClass), name, 0);
}

u32 Outermost(u32 object) {
  for (u32 depth = 0; object && depth < kMaxOuterDepth; ++depth) {
    const u32 outer = mem::Load<u32>(object + kObjectOuter);
    if (!outer)
      return object;
    object = outer;
  }
  return 0;
}

// A name's GNames index, looked for again only once the table has grown.
struct CachedName {
  std::u16string_view text;
  i32 index = -1;
  i32 scanned = -1;

  bool Is(i32 name) {
    if (index < 0) {
      const i32 count = mem::Load<i32>(kGNames + 4);
      if (scanned >= 0 && count < scanned + kNameRescanGrowth)
        return false;
      scanned = count;
      for (i32 i = 0; i < count; ++i) {
        if (NameIs(i, text)) {
          index = i;
          break;
        }
      }
    }
    return name == index;
  }
};

CachedName g_set_pkable{u"SetPKable"};
CachedName g_set_cinematic_mode{u"SetCinematicMode"};
CachedName g_on_toggle_cinematic_mode{u"OnToggleCinematicMode"};

// Set once the sack is delivered, cleared when the player is restarted.
bool g_delivered = false;

// The word holding the controller's bCinematicMode (and the bCinemaDisable
// flags beside it).
u32 CinematicWord(u32 controller) {
  const i32 offset = redahm::graphics_settings::ScriptPropertyOffset(controller, "bCinematicMode");
  return offset >= 0 ? mem::Load<u32>(controller + u32(offset)) : 0;
}

void RestartPlayer(PPCContext& ctx, u8* base, u32 controller) {
  using redahm::graphics_settings::CallScriptFunction;
  using redahm::graphics_settings::ScriptFunction;
  using redahm::graphics_settings::ScriptPropertyOffset;
  const i32 pawn_offset = ScriptPropertyOffset(controller, "Pawn");
  const u32 pawn = pawn_offset >= 0 ? mem::Load<u32>(controller + u32(pawn_offset)) : 0;
  const u32 restart = ScriptFunction(controller, "ClientRestart");
  if (!pawn || !restart) {
    RDAHM_WARN("[sandbox] ending: can't restart the player (pawn {:08X}, ClientRestart {:08X})",
               pawn, restart);
    return;
  }
  const u32 parms = ctx.r1.u32 - kParmsBelowStack;
  mem::Store<u32>(parms, pawn);
  CallScriptFunction(ctx, base, controller, restart, parms);
  RDAHM_INFO("[sandbox] ending: restarted the player (controller {:08X}, pawn {:08X})", controller,
             pawn);
}

}  // namespace

REX_HOOK_RAW(sub_824AF158) {
  const u32 named = ctx.r4.u32;
  if (!REXCVAR_GET(redahm_restore_sandbox_missions) || !named) {
    __imp__sub_824AF158(ctx, base);
    return;
  }
  const i32 index = mem::Load<i32>(named + kFindVarName);
  const i32 number = mem::Load<i32>(named + kFindVarName + 4);
  const u32 outer = mem::Load<u32>(named + kObjectOuter);
  if (number != 0 || !outer || !NameIs(index, kCutName) ||
      !NameIs(mem::Load<i32>(outer + kObjectName), kMissionControl)) {
    __imp__sub_824AF158(ctx, base);
    return;
  }
  const i32 stand_in = StandInName();
  if (stand_in < 0) {
    __imp__sub_824AF158(ctx, base);
    return;
  }
  mem::Store<i32>(named + kFindVarName, stand_in);
  __imp__sub_824AF158(ctx, base);
  mem::Store<i32>(named + kFindVarName, index);
  RDAHM_INFO("[sandbox] Paradiso sandbox 5 availability bound to sandbox 1's ({:08X})", named);
}

// A script call: the delivery's SetPKable marks the ending; the ending's
// SetCinematicMode that turns cinematic mode off restarts the player.
REX_HOOK_RAW(sub_823EE5B8) {
  const u32 function = ctx.r6.u32;
  if (!function || !REXCVAR_GET(redahm_restore_sandbox_missions)) {
    __imp__sub_823EE5B8(ctx, base);
    return;
  }
  const i32 name = mem::Load<i32>(function + kObjectName);
  const u32 object = ctx.r3.u32;
  const u32 stack = ctx.r4.u32;
  if (g_set_pkable.Is(name)) {
    const u32 op = stack ? mem::Load<u32>(stack + kFrameObject) : 0;
    if (ClassIs(op, u"CPSeqAct_SetPKable") &&
        ObjectIs(Outermost(op), u"is_paradiso_SandboxMission", 6)) {
      g_delivered = true;
      RDAHM_INFO("[sandbox] delivery: sack {:08X} delivered", object);
    }
    __imp__sub_823EE5B8(ctx, base);
    return;
  }
  if (!g_delivered || !g_set_cinematic_mode.Is(name)) {
    __imp__sub_823EE5B8(ctx, base);
    return;
  }
  const u32 caller = stack ? mem::Load<u32>(stack + kFrameNode) : 0;
  const bool from_kismet =
      caller && g_on_toggle_cinematic_mode.Is(mem::Load<i32>(caller + kObjectName));
  const u32 before = from_kismet ? CinematicWord(object) : 0;
  const PPCContext saved = ctx;
  __imp__sub_823EE5B8(ctx, base);
  if (!from_kismet)
    return;
  const u32 after = CinematicWord(object);
  // Cinematic mode went off: flags only cleared, none set.
  if (after != before && (after & before) == after) {
    g_delivered = false;
    PPCContext call = saved;
    RestartPlayer(call, base, object);
    ctx.fpscr = call.fpscr;
  }
}

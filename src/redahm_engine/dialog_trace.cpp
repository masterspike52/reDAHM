// Dialogue trace: what each spoken line and FaceFX request did.
//
// Diagnostic for conversations ending early and mouths not moving. Log only;
// every hooked function runs unchanged.
//
// ACPDialogManager (vtable 0x821B2718):
//   +996  PlayDialogAudio (sub_829FD5A8): plays the current line's event,
//         *(*(manager +560) +124), and sets the line's duration (+528) to the
//         event's length (vtable +352 of the audio wrapper: event +104 in
//         seconds, x1000 to ms) x 0.001 + 0.4. A length of 0 leaves 0.4 s.
//   +1000 PlayCueAudio (sub_829FD6D0, manager, cue): the same for the cue's
//         event, *(*(manager + 28 * cue + 560) +84).
// CPAudioDesc (the event): ProjectID +60, FEVIndex +64, EventName (FString)
//   +68, EventGroupName +80, flags +92, length in seconds +104, filled on
//   play from FMOD's Event::getInfo lengthms (sub_8280E228).
// USkeletalMeshComponent::PlayFaceFXAnim (sub_825E2B38, component, anim set,
//   const FString& group, const FString& sequence): 1 when the anim started.
//   SkeletalMesh (+704) holds the FaceFXAsset at +252; the component's FaceFX
//   actor instance is at +1196.

#include <string>

#include <rex/cvar.h>
#include <rex/hook.h>
#include <rex/ppc/func.h>
#include <rex/types.h>

#include "generated/redahm_init.h"
#include "redahm_engine/gpu/core/guest_memory.h"
#include "redahm_logging.h"

REXCVAR_DEFINE_BOOL(redahm_dialog_trace, true, "POTF/Debug",
                    "Log each dialogue line's length and each FaceFX request");

REX_EXTERN(__imp__sub_829FD5A8);
REX_EXTERN(__imp__sub_829FD6D0);
REX_EXTERN(__imp__sub_825E2B38);

namespace {

namespace mem = redahm::gpu::mem;

constexpr u32 kManagerLine = 560;
constexpr u32 kManagerDuration = 528;
constexpr u32 kCueStride = 28;
constexpr u32 kLineEvent = 124;
constexpr u32 kCueEvent = 84;

constexpr u32 kEventProjectId = 60;
constexpr u32 kEventIndex = 64;
constexpr u32 kEventName = 68;
constexpr u32 kEventGroup = 80;
constexpr u32 kEventLength = 104;

constexpr u32 kComponentSkeletalMesh = 704;
constexpr u32 kMeshFaceFXAsset = 252;
constexpr u32 kComponentFaceFXInstance = 1196;

std::string ReadFString(u32 fstring) {
  if (!fstring)
    return {};
  const u32 data = mem::Load<u32>(fstring);
  const int32_t num = mem::Load<int32_t>(fstring + 4);
  std::string text;
  for (int32_t i = 0; data && i + 1 < num && i < 256; ++i) {
    const char16_t c = char16_t(mem::Load<u16>(data + u32(i) * 2));
    text += c < 0x80 ? char(c) : '?';
  }
  return text;
}

constexpr u32 kGNames = 0x8375C1B8;
constexpr u32 kNameEntryText = 16;
constexpr u32 kObjectName = 44;
constexpr u32 kObjectClass = 52;

std::string ObjectName(u32 object) {
  if (!object)
    return "none";
  const u32 names = mem::Load<u32>(kGNames);
  const int32_t count = mem::Load<int32_t>(kGNames + 4);
  const int32_t index = mem::Load<int32_t>(object + kObjectName);
  if (!names || index < 0 || index >= count)
    return {};
  const u32 entry = mem::Load<u32>(names + u32(index) * 4);
  std::string text;
  for (u32 i = 0; entry && i < 96; ++i) {
    const char16_t c = char16_t(mem::Load<u16>(entry + kNameEntryText + i * 2));
    if (!c)
      break;
    text += c < 0x80 ? char(c) : '?';
  }
  return text;
}

void LogLine(const char* kind, u32 manager, u32 line, u32 event) {
  if (!event) {
    RDAHM_INFO("[dialog] {} {:08X} ({}): no event, duration {:.2f} s", kind, line,
               ObjectName(line ? mem::Load<u32>(line + kObjectClass) : 0),
               mem::Load<float>(manager + kManagerDuration));
    return;
  }
  RDAHM_INFO("[dialog] {} {}/{} (project {}, index {}): length {:.3f} s, duration {:.2f} s",
             kind, ReadFString(event + kEventGroup), ReadFString(event + kEventName),
             mem::Load<int32_t>(event + kEventProjectId), mem::Load<int32_t>(event + kEventIndex),
             mem::Load<float>(event + kEventLength), mem::Load<float>(manager + kManagerDuration));
}

}  // namespace

REX_HOOK_RAW(sub_829FD5A8) {
  const u32 manager = ctx.r3.u32;
  __imp__sub_829FD5A8(ctx, base);
  if (!REXCVAR_GET(redahm_dialog_trace) || !manager)
    return;
  const u32 line = mem::Load<u32>(manager + kManagerLine);
  LogLine("line", manager, line, line ? mem::Load<u32>(line + kLineEvent) : 0);
}

REX_HOOK_RAW(sub_829FD6D0) {
  const u32 manager = ctx.r3.u32;
  const u32 cue = ctx.r4.u32;
  __imp__sub_829FD6D0(ctx, base);
  if (!REXCVAR_GET(redahm_dialog_trace) || !manager)
    return;
  const u32 line = mem::Load<u32>(manager + kCueStride * cue + kManagerLine);
  LogLine("cue", manager, line, line ? mem::Load<u32>(line + kCueEvent) : 0);
}

REX_HOOK_RAW(sub_825E2B38) {
  const u32 component = ctx.r3.u32;
  const u32 group = ctx.r5.u32;
  const u32 sequence = ctx.r6.u32;
  const std::string group_name = REXCVAR_GET(redahm_dialog_trace) ? ReadFString(group) : std::string();
  const std::string sequence_name = REXCVAR_GET(redahm_dialog_trace) ? ReadFString(sequence) : std::string();
  __imp__sub_825E2B38(ctx, base);
  if (!REXCVAR_GET(redahm_dialog_trace) || !component)
    return;
  const u32 mesh = mem::Load<u32>(component + kComponentSkeletalMesh);
  RDAHM_INFO("[dialog] FaceFX {}/{} on {:08X}: {} (asset {:08X}, instance {:08X})", group_name,
             sequence_name, component, ctx.r3.u32 ? "playing" : "FAILED",
             mesh ? mem::Load<u32>(mesh + kMeshFaceFXAsset) : 0,
             mem::Load<u32>(component + kComponentFaceFXInstance));
}

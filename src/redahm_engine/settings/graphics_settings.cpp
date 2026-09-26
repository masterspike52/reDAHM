// Graphics settings applied inside the game's engine.
//
// Shadows (redahm_shadows): PotF renders dynamic shadows per object.
// sub_82881ED8 sets each light/primitive interaction's projected shadow up:
// the shadow map is twice the object's projected size, clamped between
// GEngine->MinShadowResolution (+0x378, 16) and a cap from
// GEngine->MaxShadowResolution (+0x37C, 440): 0.278x it for most objects and
// 0.556x for one favoured object, never past the 880-texel shadow atlas (870).
// At 440 most objects get at most about 112 texels. Quality scales
// MaxShadowResolution before that function runs; off skips it, so no dynamic
// shadows are made (the renderer also drops their projection passes, which
// takes shadows made before switching off away at once).
//
// Decals (redahm_decals): the game viewport client's show flags (the ones the
// console's "show decals" toggles; DECALS is bit 1) decide whether decals draw.
// Their offset comes from the ShowFlags property. +0x24 was guessed once, but
// that is UObject's NetIndex and Outer, and setting bit 1 there turned the
// viewport client's Outer (GEngine) into a bad pointer: the main menu stopped
// taking input and the game fell silent.
//
// Level of detail (redahm_lod, on or off): off keeps every static mesh,
// skeletal mesh, particle system and pedestrian on its most detailed level and
// wants every texture mip at any distance; see "Level of detail" below.
//
// The objects and script property offsets these need are found at run time
// (reflection below). This runs on the rendering thread every present, over
// objects the game thread owns, so every guest read is checked, the searches
// run at most once a second until they succeed, and afterwards only the
// cached objects' classes are rechecked.

#include "redahm_engine/settings/graphics_settings.h"

#include <algorithm>
#include <atomic>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <string>
#include <string_view>
#include <vector>

#include <rex/cvar.h>
#include <rex/hook.h>
#include <rex/memory/utils.h>
#include <rex/ppc/func.h>

#include "redahm_engine/gpu/core/guest_memory.h"
#include "redahm_engine/gpu/core/settings.h"
#include "redahm_engine/perf/native_foliage.h"
#include "redahm_engine/redahm_logging.h"

REXCVAR_DEFINE_BOOL(redahm_decals, true, "POTF/Graphics", "Draw decals (scorch marks, blood, "
                                                         "signs projected onto surfaces)");
REXCVAR_DEFINE_BOOL(redahm_hud, true, "POTF/Graphics",
                    "Show the HUD (health, weapons, reticule, mini map, messages)");
REXCVAR_DEFINE_INT32(redahm_draw_distance, 30000, "POTF/Graphics",
                     "How far the view reaches, in the game's units: 30000 is the game's own "
                     "(ORIGINAL), 60000 twice it (FAR), 120000 four times (VERY FAR)")
    .range(30000, 120000);
REXCVAR_DEFINE_STRING(redahm_building_detail, "near", "POTF/Graphics",
                      "Where buildings show their detailed model: near (within 16000 units, as "
                      "the game does it) or draw_distance (as far as the draw distance reaches, "
                      "wherever their part of the city is loaded)")
    .allowed({"near", "draw_distance"});
REXCVAR_DEFINE_STRING(redahm_lod, "on", "POTF/Graphics",
                      "Level of detail: on (as the game does it) or off (full detail models "
                      "and textures at any distance)")
    .allowed({"on", "off"});
REXCVAR_DEFINE_STRING(redahm_small_object_cull, "off", "POTF/Graphics",
                      "Stop drawing objects too small on screen to matter: off, low, medium or "
                      "high (they fade out below about 2, 4 or 8 pixels tall at 1080p)")
    .allowed({"off", "low", "medium", "high"});
REXCVAR_DEFINE_BOOL(redahm_occlusion_depth_pass, false, "POTF/Graphics",
                    "Leave moving and animated objects the occlusion test found hidden out of "
                    "the depth pass too, not only out of the colour pass");

namespace redahm::graphics_settings {

namespace mem = redahm::gpu::mem;
namespace settings = redahm::gpu::settings;

namespace {

// UEngine *GEngine.
constexpr uint32_t kGEngine = 0x83746300;
// UWorld *GWorld (+80 the persistent level; its Actors, +128 data and +132
// count, start with the WorldInfo).
constexpr uint32_t kGWorld = 0x837485E0;
constexpr uint32_t kMaxShadowResolution = 0x37C;

// UGameViewportClient::ShowFlags bits.
constexpr uint64_t kShowDecals = 0x2;
// UGameEngine::GameViewport (FireTransition reaches the UI through it).
constexpr uint32_t kEngineGameViewport = 752;
// Presents between searches while an object has not been found.
constexpr uint32_t kSearchInterval = 60;

std::atomic<int32_t> g_original_max_shadow_resolution{-1};

//------------------------------------------------------------------------------
// Checked guest reads
//------------------------------------------------------------------------------

// Guest allocations start here: the 4 KB-page user heap sits below 0x40000000
// (the game's allocator lives at 0x2000036C, name entries there too), the
// 64 KB-page heap above it. Below is the null page.
constexpr uint32_t kGuestBegin = 0x00010000;
constexpr uint32_t kPageMask = 0xFFF;
// The title image (code, data, and globals such as GEngine and GNames), always
// mapped; the heaps' protection query does not cover it.
constexpr uint32_t kImageBegin = 0x82000000;
constexpr uint32_t kImageEnd = 0x837F0000;
// The end of the guest heaps objects live in (virtual heaps below the image).
constexpr uint32_t kGuestHeapEnd = 0x80000000;

bool Readable(uint32_t address) {
  if (address >= kImageBegin && address < kImageEnd)
    return true;
  if (address < kGuestBegin)
    return false;
  auto* heap = mem::Memory()->LookupHeap(address);
  uint32_t protect = 0;
  return heap && heap->QueryProtect(address, &protect) &&
         (protect & rex::memory::kMemoryProtectRead);
}

// Reads a T only when every byte of it is mapped readable.
template <typename T>
bool Read(uint32_t address, T& out) {
  if (!Readable(address))
    return false;
  const uint32_t last = address + sizeof(T) - 1;
  if ((last & ~kPageMask) != (address & ~kPageMask) && !Readable(last))
    return false;
  out = mem::Load<T>(address);
  return true;
}

uint32_t ReadU32(uint32_t address) {
  uint32_t value = 0;
  return Read(address, value) ? value : 0;
}

//------------------------------------------------------------------------------
// Reflection: objects and script properties by name
//------------------------------------------------------------------------------

// UObject, UField and UStruct members as this build lays them out: Outer,
// Name (an FName into GNames), Class; UField::SuperField and Next. The cast
// sub_82A6FE00 walks Class (+52) and SuperField (+60).
constexpr uint32_t kGNames = 0x8375C1B8;
constexpr uint32_t kNameEntryText = 16;
constexpr uint32_t kObjectOuter = 40;
constexpr uint32_t kObjectName = 44;
constexpr uint32_t kObjectClass = 52;
constexpr uint32_t kSuperField = 60;
constexpr uint32_t kFieldNext = 64;
// Where to look in a UStruct for its Children, and in a UProperty for its
// Offset: both are learnt (StructChildren, PropertyOffsetField).
constexpr uint32_t kStructScanBegin = 68;
constexpr uint32_t kStructScanEnd = 160;
constexpr uint32_t kPropertyScanEnd = 160;
// A property whose offset is known from the disassembly calibrates the
// UProperty::Offset member: UEngine::MaxShadowResolution.
constexpr uint32_t kCalibrationOffset = kMaxShadowResolution;
constexpr uint32_t kMaxNameLength = 64;
constexpr uint32_t kMaxFields = 4096;
constexpr uint32_t kMaxClassDepth = 32;

// The text of the FName at `address` (its GNames index).
std::string NameAt(uint32_t address) {
  int32_t index = -1;
  uint32_t names = 0;
  int32_t count = 0;
  if (!Read(address, index) || !Read(kGNames, names) || !Read(kGNames + 4, count) || index < 0 ||
      index >= count) {
    return {};
  }
  const uint32_t entry = ReadU32(names + uint32_t(index) * 4);
  std::string name;
  for (uint32_t i = 0; entry && i < kMaxNameLength; ++i) {
    uint16_t c = 0;
    if (!Read(entry + kNameEntryText + i * 2, c) || !c)
      break;
    name += c < 0x80 ? char(c) : '?';
  }
  return name;
}

std::string ObjectName(uint32_t object) {
  return NameAt(object + kObjectName);
}

uint32_t ObjectClass(uint32_t object) {
  return ReadU32(object + kObjectClass);
}

// The class named `name` among `cls` and its ancestors, or 0.
uint32_t FindClassInChain(uint32_t cls, std::string_view name) {
  for (uint32_t depth = 0; cls && depth < kMaxClassDepth; ++depth) {
    if (ObjectName(cls) == name)
      return cls;
    cls = ReadU32(cls + kSuperField);
  }
  return 0;
}

bool ObjectIsA(uint32_t object, std::string_view class_name) {
  return object && FindClassInChain(ObjectClass(object), class_name) != 0;
}

// UStruct::Children: the member heading a list of fields, linked through
// UField::Next, whose Outer is the struct.
int32_t g_children_offset = -1;

uint32_t StructChildren(uint32_t structure) {
  if (g_children_offset < 0) {
    for (uint32_t offset = kStructScanBegin; offset < kStructScanEnd; offset += 4) {
      const uint32_t first = ReadU32(structure + offset);
      uint32_t count = 0;
      uint32_t field = first;
      while (field && count < 8 && ReadU32(field + kObjectOuter) == structure) {
        field = ReadU32(field + kFieldNext);
        ++count;
      }
      if (first && count >= 2 && (count == 8 || !field)) {
        g_children_offset = int32_t(offset);
        RDAHM_INFO("[graphics] UStruct::Children at +{}", offset);
        break;
      }
    }
    if (g_children_offset < 0)
      return 0;
  }
  return ReadU32(structure + uint32_t(g_children_offset));
}

// The field named `name` declared by `cls` or an ancestor, or 0.
uint32_t FindField(uint32_t cls, std::string_view name) {
  for (uint32_t depth = 0; cls && depth < kMaxClassDepth; ++depth) {
    uint32_t count = 0;
    for (uint32_t field = StructChildren(cls); field && count < kMaxFields;
         field = ReadU32(field + kFieldNext), ++count) {
      if (ObjectName(field) == name)
        return field;
    }
    cls = ReadU32(cls + kSuperField);
  }
  return 0;
}

// UProperty::Offset: the member of MaxShadowResolution's property that holds
// its known offset.
int32_t g_property_offset_field = -1;

int32_t PropertyOffsetField() {
  if (g_property_offset_field >= 0)
    return g_property_offset_field;
  const uint32_t property = FindField(ObjectClass(ReadU32(kGEngine)), "MaxShadowResolution");
  if (!property)
    return -1;
  for (uint32_t offset = kFieldNext + 4; offset < kPropertyScanEnd; offset += 4) {
    if (ReadU32(property + offset) == kCalibrationOffset) {
      g_property_offset_field = int32_t(offset);
      RDAHM_INFO("[graphics] UProperty::Offset at +{}", offset);
      break;
    }
  }
  return g_property_offset_field;
}

// The byte offset of property `name` in objects of class `cls`, or -1.
int32_t PropertyOffset(uint32_t cls, std::string_view name) {
  const int32_t field = PropertyOffsetField();
  const uint32_t property = field >= 0 ? FindField(cls, name) : 0;
  int32_t offset = -1;
  if (!property || !Read(property + uint32_t(field), offset) || offset < 0 || offset > 0x10000)
    return -1;
  return offset;
}

// Script property offsets, learnt per class and reused while the class stays
// the same.
struct CachedOffset {
  uint32_t cls = 0;
  int32_t offset = -1;

  int32_t Get(uint32_t object_class, std::string_view name) {
    if (object_class != cls) {
      cls = object_class;
      offset = PropertyOffset(object_class, name);
    }
    return offset;
  }
};

// Logs every step of reading an object's class and name, readable or not, to
// find where a lookup fails.
void DiagnoseName(uint32_t object) {
  const auto raw = [](uint32_t address) {
    return Readable(address) ? mem::Load<uint32_t>(address) : 0xDEADDEADu;
  };
  const uint32_t cls = raw(object + kObjectClass);
  const uint32_t index = raw(object + kObjectName);
  const uint32_t cls_index = raw(cls + kObjectName);
  const uint32_t names = raw(kGNames);
  const uint32_t count = raw(kGNames + 4);
  const uint32_t entry = cls_index < count ? raw(names + cls_index * 4) : 0;
  std::string text;
  for (uint32_t i = 0; entry && i < 24; ++i) {
    const uint32_t at = entry + kNameEntryText + i * 2;
    if (!Readable(at))
      break;
    const uint16_t c = mem::Load<uint16_t>(at);
    text += c >= 0x20 && c < 0x7F ? char(c) : '.';
  }
  RDAHM_WARN("[graphics] object {:08X} (readable {}): name index {}, class {:08X} (readable {}) "
             "name index {}; GNames {:08X} (readable {}) count {}; entry {:08X} (readable {}) '{}'",
             object, Readable(object), index, cls, Readable(cls), cls_index, names,
             Readable(names), count, entry, Readable(entry), text);
}

// The engine's viewport client, at the member the title's own code reads:
// GameViewport (+752, as FireTransition sub_82AD6DD0 reaches the UI). Nothing
// else in the engine is followed: scanning its members for pointers once
// followed a stale one into freed memory.
uint32_t EngineViewportClient() {
  const uint32_t client = ReadU32(ReadU32(kGEngine) + kEngineGameViewport);
  return ObjectIsA(client, "GameViewportClient") ? client : 0;
}

// A found object and its class, rechecked cheaply every frame; searched for
// again, now and then, once it is gone.
struct Tracked {
  uint32_t object = 0;
  uint32_t cls = 0;
  uint32_t next_search = 0;
  bool reported_missing = false;

  bool Valid() const { return object && ObjectClass(object) == cls; }
  void Set(uint32_t found) {
    object = found;
    cls = found ? ObjectClass(found) : 0;
  }
};

uint32_t g_frame = 0;

bool SearchDue(Tracked& tracked) {
  if (g_frame < tracked.next_search)
    return false;
  tracked.next_search = g_frame + kSearchInterval;
  return true;
}

//------------------------------------------------------------------------------
// Decals
//------------------------------------------------------------------------------

Tracked g_viewport_client;
int32_t g_show_flags_offset = -1;

void ApplyDecals() {
  if (!g_viewport_client.Valid()) {
    g_viewport_client.Set(0);
    if (!SearchDue(g_viewport_client))
      return;
    g_viewport_client.Set(EngineViewportClient());
    if (!g_viewport_client.object) {
      if (!g_viewport_client.reported_missing && ReadU32(kGEngine)) {
        g_viewport_client.reported_missing = true;
        RDAHM_WARN("[graphics] no GameViewportClient found in {:08X} ({})", ReadU32(kGEngine),
                   ObjectName(ObjectClass(ReadU32(kGEngine))));
        DiagnoseName(ReadU32(kGEngine));
        DiagnoseName(ReadU32(ReadU32(kGEngine) + kEngineGameViewport));
      }
      return;
    }
    g_show_flags_offset = PropertyOffset(g_viewport_client.cls, "ShowFlags");
    uint64_t flags = 0;
    if (g_show_flags_offset >= 0)
      Read(g_viewport_client.object + uint32_t(g_show_flags_offset), flags);
    RDAHM_INFO("[graphics] {} {:08X}, ShowFlags at +{}: {:016X}",
               ObjectName(g_viewport_client.cls), g_viewport_client.object, g_show_flags_offset,
               flags);
  }
  if (g_show_flags_offset < 0)
    return;
  const uint32_t address = g_viewport_client.object + uint32_t(g_show_flags_offset);
  uint64_t flags = 0;
  if (!Read(address, flags))
    return;
  const uint64_t wanted = REXCVAR_GET(redahm_decals) ? (flags | kShowDecals) : (flags & ~kShowDecals);
  if (wanted != flags)
    mem::Store<uint64_t>(address, wanted);
}

//------------------------------------------------------------------------------
// HUD (game thread)
//------------------------------------------------------------------------------

// The HUD is CPHUD's MainHUDScene (a UIScene) plus what HUD.PostRender draws
// on the canvas. The game hides both through CPHUD.ShowHUD(bShow): it moves
// the global hide count (HudHideInc/HudHideDec, dword_835E4B00) and sets the
// scene's visibility by IsHudVisible() (count 0), and PostRender only draws
// while IsHudVisible() holds. Cutscenes use the same count, so hiding one step
// of it leaves theirs alone. redahm_hud off calls ShowHUD(false) once on each
// HUD as it ticks (CPHUD's TickInternal native, sub_8298EAF8), and on again
// ShowHUD(true) on the ones it hid. A new HUD (a new level) starts with the
// count reset (CPHUD.PostBeginPlay calls ForceHudVisible) and is hidden anew.
// ShowHUD is found by name among the HUD class's fields and run through
// ProcessEvent (vtable +228: object, function, parameters, result); its one
// parameter is a UBOOL, passed as all bits set or clear.
constexpr uint32_t kProcessEventSlot = 228;
constexpr size_t kMaxHuds = 8;

struct HudHidden {
  uint32_t hud;
  bool hidden;
};
std::vector<HudHidden> g_huds;
uint32_t g_show_hud_class = 0;
uint32_t g_show_hud_function = 0;
uint32_t g_show_hud_parms = 0;

void CallProcessEvent(PPCContext& ctx, uint8_t* base, uint32_t object, uint32_t function,
                      uint32_t parms) {
  const uint32_t vtable = ReadU32(object);
  const uint32_t target = vtable ? ReadU32(vtable + kProcessEventSlot) : 0;
  PPCFunc* fn = target ? rex::runtime::ResolveIndirectFunction(target) : nullptr;
  if (!fn)
    return;
  PPCContext call{};
  call.r1.u64 = uint64_t(ctx.r1.u32 - 0x100);
  call.r13 = ctx.r13;
  call.fpscr = ctx.fpscr;
  call.r3.u64 = object;
  call.r4.u64 = function;
  call.r5.u64 = parms;
  call.r6.u64 = 0;
  fn(call, base);
  ctx.fpscr = call.fpscr;
}

void ApplyHud(PPCContext& ctx, uint8_t* base, uint32_t hud) {
  if (!hud)
    return;
  const bool hide = !REXCVAR_GET(redahm_hud);
  auto it = std::find_if(g_huds.begin(), g_huds.end(),
                         [hud](const HudHidden& entry) { return entry.hud == hud; });
  if (it == g_huds.end()) {
    if (!hide)
      return;
    if (g_huds.size() >= kMaxHuds)
      g_huds.clear();
    g_huds.push_back({hud, false});
    it = g_huds.end() - 1;
  }
  if (it->hidden == hide)
    return;
  const uint32_t cls = ObjectClass(hud);
  if (cls != g_show_hud_class) {
    g_show_hud_class = cls;
    g_show_hud_function = FindField(cls, "ShowHUD");
    if (!g_show_hud_function)
      RDAHM_WARN("[graphics] no ShowHUD in {}", ObjectName(cls));
  }
  if (!g_show_hud_function)
    return;
  if (!g_show_hud_parms)
    g_show_hud_parms = mem::Alloc(16);
  if (!g_show_hud_parms)
    return;
  for (uint32_t i = 0; i < 16; i += 4)
    mem::Store<uint32_t>(g_show_hud_parms + i, 0);
  mem::Store<uint32_t>(g_show_hud_parms, hide ? 0u : 0xFFFFFFFFu);
  CallProcessEvent(ctx, base, hud, g_show_hud_function, g_show_hud_parms);
  it->hidden = hide;
}

//------------------------------------------------------------------------------
// Level of detail
//------------------------------------------------------------------------------

// Each kind of object picks its level of detail its own way, and off pins each
// to its most detailed level where it picks:
//  - Static meshes: level i draws while the camera is within
//    [i, i + 1) * LODDistanceRatio * LODMaxRange / levels (mesh +88, +84, +64),
//    unless the proxy forces one. Meshes in the static draw lists carry those
//    bands (DrawStaticElements sub_82928260, the buildings' sub_82B52360) and
//    InitViews tests them (see "Draw distance and static mesh level of detail"
//    below); meshes drawn dynamically ask GetLOD(distance) each frame
//    (sub_8292B040, the buildings' sub_82B54598), which off asks at distance 0.
//  - Skeletal meshes: UpdateSkelPose (sub_825E3790) takes ForcedLodModel
//    (component +864) less one when set, else the level the render thread
//    measured for the mesh object plus a global bias, into PredictedLODLevel
//    (+868). Off forces level 1 (the first) for the call.
//  - Particle systems: the proxy's draw (sub_828F3350) keeps the view's
//    distance times LODDistanceFactor (+348) for the component to pick its
//    level from, unless the system sets its level directly (+344). Off leaves 0.
//  - Pedestrians: each pawn's tick (sub_82A1ED30) asks the character LOD
//    manager (sub_82AFCED0, distance in f1) for a new level whenever its
//    distance (+2384) leaves the current one's range: below the lower edge
//    (+2380) or past the level's own reach (level +4). A level (+2428; flags at
//    +12: bit 31 a captured billboard instead of the mesh, bit 30 animated) is
//    the nearest in the per-class list whose reach covers the distance. Off
//    asks at distance 0, and a pawn still on a coarser level is pushed to ask
//    again.
//  - Texture mips (texture streaming, below).
// PlayerController.LODDistanceFactor (+824) is not the way in: CalcSceneView
// (sub_826229C0) recomputes it every frame from the field of view, and the
// views use it only for particles and to stretch cull distances.
bool LodOff() {
  return REXCVAR_GET(redahm_lod) == "off";
}

float DrawDistance();

// Off keeps full detail only within the draw distance; past it each kind of
// object picks its level as the game does. The pickers above get a distance
// (static meshes, particles, pedestrians); a skeletal mesh is measured from
// its bounds (PrimitiveComponent.Bounds origin, +396) to where InitViews last
// saw the view (first perspective view's ViewOrigin, kept below; one frame
// late on the game thread, which is near enough).
constexpr uint32_t kPrimitiveBoundsOrigin = 396;
std::atomic<float> g_view_origin[3] = {};
std::atomic<bool> g_view_origin_known{false};

// Whether off applies to an object `distance` away (negative: not known).
bool FullDetailAt(float distance) {
  if (!LodOff())
    return false;
  const float reach = DrawDistance();
  return distance >= 0.0f && (reach == 0.0f || distance <= reach);
}

// Distance from the view to a primitive component, or -1 when not known.
float ViewDistanceTo(uint32_t component) {
  if (!component || !g_view_origin_known.load(std::memory_order_acquire))
    return -1.0f;
  float sum = 0.0f;
  for (uint32_t axis = 0; axis < 3; ++axis) {
    float point = 0.0f;
    if (!Read(component + kPrimitiveBoundsOrigin + axis * 4, point) || !std::isfinite(point))
      return -1.0f;
    const float d = point - g_view_origin[axis].load(std::memory_order_relaxed);
    sum += d * d;
  }
  return std::sqrt(sum);
}

constexpr uint32_t kSkeletalForcedLod = 864;
constexpr uint32_t kParticleLodDirect = 344;
constexpr uint32_t kParticleLodDistance = 348;
constexpr uint32_t kPawnLodLowerEdge = 2380;
constexpr uint32_t kPawnLodDistance = 2384;
constexpr uint32_t kPawnLodLevel = 2428;
constexpr uint32_t kCharLodFlags = 12;
constexpr uint32_t kCharLodBillboard = 0x80000000;
constexpr uint32_t kCharLodAnimated = 0x40000000;
constexpr float kPawnLodAskAgain = 3.0e38f;

// Makes a pawn within the draw distance (its distance at +2384) on a coarser
// level than the nearest ask for a new one at its next check (its distance is
// then below the lower edge).
void RaisePawnLod(uint32_t pawn) {
  float distance = -1.0f;
  if (!Read(pawn + kPawnLodDistance, distance) || !FullDetailAt(distance))
    return;
  const uint32_t level = ReadU32(pawn + kPawnLodLevel);
  uint32_t flags = 0;
  if (!level || !Read(level + kCharLodFlags, flags))
    return;
  if ((flags & kCharLodBillboard) || !(flags & kCharLodAnimated))
    mem::Store<float>(pawn + kPawnLodLowerEdge, kPawnLodAskAgain);
}

//------------------------------------------------------------------------------
// Detailed buildings (render thread)
//------------------------------------------------------------------------------

// A CPBuildingActor draws one of two models: the low-detail stand-in the
// persistent level carries, or the detailed model its part of the city hands
// it on loading (active component +652, the other +688; see "Level
// streaming"). Once it has both, the building proxy's visibility test
// (sub_82B520D8, r3 proxy, r4 view) picks by distance: the detailed model
// (component +856 bit 31) draws only while the view (ViewOrigin, view +384) is
// within 16000 units of the proxy's bounds (+556), and the stand-in stops
// drawing once the view is that close to the detailed model's component bounds
// (+396) and the crossfade (component +996, 0.1 s from the swap, against the
// WorldInfo's TimeSeconds +852) is over. "draw_distance" moves the 16000 out to
// the draw distance (none when it has no limit); both models still pass the
// usual cull test (sub_8264F2C0).
constexpr uint32_t kBuildingProxyActor = 284;
constexpr uint32_t kBuildingProxyComponent = 288;
constexpr uint32_t kBuildingProxyOrigin = 556;
constexpr uint32_t kBuildingActive = 652;
constexpr uint32_t kBuildingOther = 688;
constexpr uint32_t kComponentSceneInfo = 88;
constexpr uint32_t kSceneInfoProxy = 16;
constexpr uint32_t kComponentBoundsOrigin = 396;
constexpr uint32_t kBuildingHighDetail = 856;
constexpr uint32_t kBuildingFadeEnd = 996;
constexpr uint32_t kWorldInfoTimeSeconds = 852;
constexpr uint32_t kBuildingViewOrigin = 384;

enum class BuildingView { kGame, kHidden, kCullOnly };

bool BuildingsDetailedToDrawDistance() {
  return REXCVAR_GET(redahm_building_detail) == "draw_distance";
}

// Squared distance from the view's origin to the point at `point`, or -1 when
// either cannot be read.
float ViewDistanceSq(uint32_t view, uint32_t point) {
  float sum = 0.0f;
  for (uint32_t axis = 0; axis < 3; ++axis) {
    float v = 0.0f, p = 0.0f;
    if (!Read(view + kBuildingViewOrigin + axis * 4, v) || !Read(point + axis * 4, p))
      return -1.0f;
    sum += (v - p) * (v - p);
  }
  return sum;
}

bool ComponentHasProxy(uint32_t component) {
  const uint32_t scene_info = ReadU32(component + kComponentSceneInfo);
  return scene_info && ReadU32(scene_info + kSceneInfoProxy);
}

float WorldTimeSeconds() {
  const uint32_t level = ReadU32(ReadU32(kGWorld) + 80);
  int32_t actors = 0;
  float time = 0.0f;
  if (!level || !Read(level + 132, actors) || actors <= 0)
    return 0.0f;
  const uint32_t world_info = ReadU32(ReadU32(level + 128));
  return world_info && Read(world_info + kWorldInfoTimeSeconds, time) ? time : 0.0f;
}

BuildingView DecideBuildingView(uint32_t proxy, uint32_t view) {
  if (!BuildingsDetailedToDrawDistance())
    return BuildingView::kGame;
  const uint32_t actor = ReadU32(proxy + kBuildingProxyActor);
  const uint32_t active = actor ? ReadU32(actor + kBuildingActive) : 0;
  const uint32_t other = actor ? ReadU32(actor + kBuildingOther) : 0;
  if (!active || !other || active == other || !ComponentHasProxy(active) ||
      !ComponentHasProxy(other))
    return BuildingView::kGame;
  const uint32_t component = ReadU32(proxy + kBuildingProxyComponent);
  int32_t detail = 0;
  float fade_end = 0.0f;
  if (!component || !Read(component + kBuildingHighDetail, detail) ||
      !Read(component + kBuildingFadeEnd, fade_end))
    return BuildingView::kGame;
  // The radius the detailed model reaches, squared; none without a limit.
  const float reach = DrawDistance();
  const auto within = [&](uint32_t point) {
    if (reach == 0.0f)
      return true;
    const float distance_sq = ViewDistanceSq(view, point);
    return distance_sq >= 0.0f && distance_sq <= reach * reach;
  };
  if (detail < 0)
    return within(proxy + kBuildingProxyOrigin) ? BuildingView::kCullOnly : BuildingView::kHidden;
  if (within(active + kComponentBoundsOrigin) && fade_end <= WorldTimeSeconds())
    return BuildingView::kHidden;
  return BuildingView::kCullOnly;
}

//------------------------------------------------------------------------------
// Draw distance and static mesh level of detail (render thread)
//------------------------------------------------------------------------------

// FSceneRenderer::InitViews (sub_823B2D38) decides what each view draws:
//  - Every primitive fades out over the last tenth of its proxy's
//    CullDistance (+264 of the proxy at PrimitiveSceneInfo +16), and is gone
//    past it.
//  - Each static mesh element (PrimitiveSceneInfo +28, count +32) draws while
//    the camera's squared distance lies in its [MinDrawDistance²,
//    MaxDrawDistance²) band (+272, +276). A mesh's levels of detail are
//    consecutive bands, the last one ending at its cull distance.
//  - Before either, the octree query (sub_828ABC98) keeps only primitives
//    inside the view frustum, and that frustum has a far plane. The projection
//    (sub_82430500) is UE3's infinite one with Z_PRECISION: [2][2] is 0.999,
//    not 1, so the far plane the frustum takes from it
//    (GetViewFrustumBounds, sub_828318D0) has a normal of 0.001 rather than
//    none, and lands at 999 times the near plane: about 30000 units with the
//    game camera's 30. The GPU never clips there (depth only approaches
//    0.999), but everything past it was dropped before any cull distance was
//    read. Most cull distances are cooked at 524288, so this plane was the
//    real draw distance.
// For the call, the primitives' cull distances and bands and the views' far
// planes are rewritten to the settings and put back afterwards, so nothing
// outside it sees them changed. InitViews refills the visible list it reads
// from the octree, so the rewrite covers every primitive in the scene
// (renderer -> scene (+0), array +1468, count +1472).
//
// Small object culling (redahm_small_object_cull) gives each primitive a cull
// distance of its own: where its bounding sphere (radius at
// PrimitiveSceneInfo +80, as sub_82844650 reads it) would stand less tall on
// screen than a fraction of the view's height. That is radius x the
// projection's [1][1] (view +148; the view's matrices are ViewMatrix +64 and
// ProjectionMatrix +128, as the FSceneView ctor sub_827D8AD0 builds them) /
// the fraction. The proxy's cull test (sub_8264F2C0) scales the distance by
// the view's LODDistanceFactor (+480), so the cull distance takes it too; the
// static bands compare the plain squared distance. Past it the primitive fades
// out over the last tenth as with any cull distance.
constexpr uint32_t kRendererScene = 0;
constexpr uint32_t kScenePrimitives = 1468;
// The views: renderer +56 array, +60 count, 1520 bytes each. ViewOrigin at
// +384 (w 0 for orthographic views); the frustum's planes at +400 (count +404)
// and the same planes transposed four at a time for the octree test at +412
// (count +416, padded to a multiple of four with copies of the last).
constexpr uint32_t kRendererViews = 56;
constexpr uint32_t kViewSize = 1520;
constexpr uint32_t kViewOrigin = 384;
constexpr uint32_t kViewPlanes = 400;
constexpr uint32_t kViewPermutedPlanes = 412;
constexpr int32_t kMaxViews = 8;
constexpr int32_t kMaxPlanes = 16;
// A side plane passes through the eye; the far plane lies thousands of units
// out. Moved out to "unlimited", it stays finite for the SIMD box test.
constexpr float kFarPlaneMinDistance = 1000.0f;
constexpr float kFarPlaneUnlimited = 1.0e30f;
constexpr uint32_t kViewProjectionYY = 148;
constexpr uint32_t kViewLodDistanceFactor = 480;
constexpr uint32_t kPrimitiveProxy = 16;
constexpr uint32_t kPrimitiveFlags = 52;
constexpr uint32_t kPrimitiveSphereRadius = 80;
constexpr uint32_t kPrimitiveSkipped = 0x100000;
constexpr uint32_t kPrimitiveStaticMeshes = 28;
constexpr uint32_t kProxyCullDistance = 264;
constexpr uint32_t kMeshMinDrawDistanceSq = 272;
constexpr uint32_t kMeshMaxDrawDistanceSq = 276;
constexpr float kFarthest = 3.0e38f;
constexpr int32_t kMaxPrimitives = 1 << 18;
constexpr int32_t kMaxElements = 256;

// The draw distance setting, in the game's units: the game's own reach is where
// its view's far plane lands (see above), and every other distance scales with
// it. From kUnlimitedDrawDistance on there is no limit.
constexpr int32_t kStockDrawDistance = 30000;
constexpr int32_t kMinDrawDistance = 10000;
constexpr int32_t kUnlimitedDrawDistance = 520000;

// The draw distance in units (0: without limit).
float DrawDistance() {
  const int32_t value = REXCVAR_GET(redahm_draw_distance);
  if (value >= kUnlimitedDrawDistance)
    return 0.0f;
  return float(std::max(value, kMinDrawDistance));
}

// How much further than the game's own objects stay drawn (0: without limit).
float DrawDistanceScale() {
  return DrawDistance() / float(kStockDrawDistance);
}

// The fraction of the view's height below which an object stops drawing, 0
// for none. 1080 rows: about 2, 4 and 8 pixels.
float SmallObjectFraction() {
  const std::string level = REXCVAR_GET(redahm_small_object_cull);
  if (level == "low")
    return 2.0f / 1080.0f;
  if (level == "medium")
    return 4.0f / 1080.0f;
  if (level == "high")
    return 8.0f / 1080.0f;
  return 0.0f;
}

float Scaled(float value, float scale) {
  if (scale == 0.0f)
    return kFarthest;
  return std::min(value * scale, kFarthest);
}

struct SavedWord {
  uint32_t address;
  uint32_t bits;
};
std::vector<SavedWord> g_saved;

void StoreSaved(uint32_t address, float value) {
  const uint32_t old_bits = mem::Load<uint32_t>(address);
  uint32_t new_bits;
  std::memcpy(&new_bits, &value, 4);
  if (old_bits == new_bits)
    return;
  g_saved.push_back({address, old_bits});
  mem::Store<uint32_t>(address, new_bits);
}

// Cheap shape check for a pointer about to be followed on every primitive,
// every frame: 4-aligned, in the guest heap or the image. A float or a stale
// value read as a pointer fails it.
bool PlausiblePointer(uint32_t address) {
  return (address & 3) == 0 &&
         ((address >= kGuestBegin && address < kGuestHeapEnd) ||
          (address >= kImageBegin && address < kImageEnd));
}

// The settings as they apply to one InitViews call.
struct SceneAdjust {
  float draw_scale = 1.0f;
  bool lod_off = false;
  // Small object culling: how far away an object of radius 1 stays tall
  // enough on screen (0: off), and the view's LODDistanceFactor.
  float small_reach_per_radius = 0.0f;
  float lod_distance_factor = 1.0f;
};

void AdjustPrimitive(uint32_t primitive, const SceneAdjust& adjust) {
  // InitViews leaves primitives with this flag alone (being removed); their
  // proxies need not be valid any more.
  if (mem::Load<uint32_t>(primitive + kPrimitiveFlags) & kPrimitiveSkipped)
    return;
  const float draw_scale = adjust.draw_scale;
  const bool lod_off = adjust.lod_off;
  // How far the primitive stays large enough to draw, 0 for no limit.
  float small_reach = 0.0f;
  if (adjust.small_reach_per_radius > 0.0f) {
    const float radius = mem::Load<float>(primitive + kPrimitiveSphereRadius);
    if (std::isfinite(radius) && radius > 0.0f)
      small_reach = std::min(radius * adjust.small_reach_per_radius, kFarthest);
  }
  const uint32_t proxy = mem::Load<uint32_t>(primitive + kPrimitiveProxy);
  if (PlausiblePointer(proxy)) {
    const float cull = mem::Load<float>(proxy + kProxyCullDistance);
    if (cull > 0.0f) {
      float next = draw_scale != 1.0f ? Scaled(cull, draw_scale) : cull;
      if (small_reach > 0.0f)
        next = std::min(next, small_reach * adjust.lod_distance_factor);
      StoreSaved(proxy + kProxyCullDistance, next);
    }
  }
  const uint32_t elements = mem::Load<uint32_t>(primitive + kPrimitiveStaticMeshes);
  const int32_t count = mem::Load<int32_t>(primitive + kPrimitiveStaticMeshes + 4);
  if (!PlausiblePointer(elements) || count <= 0 || count > kMaxElements)
    return;
  for (int32_t i = 0; i < count; ++i) {
    const uint32_t mesh = mem::Load<uint32_t>(elements + uint32_t(i) * 4);
    if (mesh && !PlausiblePointer(mesh))
      return;
  }
  // The nearest band (the full detail model), the farthest band's start and
  // where drawing stops.
  float first_min = kFarthest, last_min = 0.0f, cull_sq = 0.0f;
  for (int32_t i = 0; i < count; ++i) {
    const uint32_t mesh = mem::Load<uint32_t>(elements + uint32_t(i) * 4);
    if (!mesh)
      continue;
    const float min_sq = mem::Load<float>(mesh + kMeshMinDrawDistanceSq);
    const float max_sq = mem::Load<float>(mesh + kMeshMaxDrawDistanceSq);
    first_min = std::min(first_min, min_sq);
    last_min = std::max(last_min, min_sq);
    cull_sq = std::max(cull_sq, max_sq);
  }
  const float draw_sq = draw_scale == 0.0f ? 0.0f : draw_scale * draw_scale;
  float new_cull_sq = Scaled(cull_sq, draw_sq);
  if (small_reach > 0.0f)
    new_cull_sq = std::min(new_cull_sq, std::min(small_reach * small_reach, kFarthest));
  for (int32_t i = 0; i < count; ++i) {
    const uint32_t mesh = mem::Load<uint32_t>(elements + uint32_t(i) * 4);
    if (!mesh)
      continue;
    const float min_sq = mem::Load<float>(mesh + kMeshMinDrawDistanceSq);
    const float max_sq = mem::Load<float>(mesh + kMeshMaxDrawDistanceSq);
    const bool nearest = min_sq == first_min;
    const bool farthest = min_sq == last_min;
    float new_min = min_sq, new_max = max_sq;
    if (lod_off) {
      // The full detail model all the way; the others never.
      if (nearest) {
        new_max = new_cull_sq;
      } else {
        new_min = kFarthest;
        new_max = kFarthest;
      }
    } else {
      // The game's bands, only the last one reaching as far as drawing now does.
      if (!nearest)
        new_min = std::min(min_sq, new_cull_sq);
      new_max = farthest ? new_cull_sq : std::min(max_sq, new_cull_sq);
    }
    StoreSaved(mesh + kMeshMinDrawDistanceSq, new_min);
    StoreSaved(mesh + kMeshMaxDrawDistanceSq, new_max);
  }
}

// Moves each perspective view's far plane out by the draw distance scale, in
// the plane list and in its transposed copy (group j / 4 holds the X, Y, Z and
// W of four planes, 16 bytes each, the far plane's padding copies included).
void AdjustFarPlanes(uint32_t renderer, float draw_scale) {
  const uint32_t views = mem::Load<uint32_t>(renderer + kRendererViews);
  const int32_t view_count = mem::Load<int32_t>(renderer + kRendererViews + 4);
  if (!PlausiblePointer(views) || view_count <= 0 || view_count > kMaxViews)
    return;
  for (int32_t v = 0; v < view_count; ++v) {
    const uint32_t view = views + uint32_t(v) * kViewSize;
    const uint32_t origin = view + kViewOrigin;
    if (mem::Load<float>(origin + 12) <= 0.0f)
      continue;
    const uint32_t planes = mem::Load<uint32_t>(view + kViewPlanes);
    const int32_t plane_count = mem::Load<int32_t>(view + kViewPlanes + 4);
    const uint32_t permuted = mem::Load<uint32_t>(view + kViewPermutedPlanes);
    const int32_t permuted_count = mem::Load<int32_t>(view + kViewPermutedPlanes + 4);
    if (!PlausiblePointer(planes) || !PlausiblePointer(permuted) || plane_count <= 0 ||
        permuted_count < plane_count || permuted_count > kMaxPlanes || permuted_count % 4 != 0)
      continue;
    for (int32_t i = 0; i < plane_count; ++i) {
      const uint32_t plane = planes + uint32_t(i) * 16;
      float p[4];
      for (uint32_t k = 0; k < 4; ++k)
        p[k] = mem::Load<float>(plane + k * 4);
      const float eye = p[0] * mem::Load<float>(origin) + p[1] * mem::Load<float>(origin + 4) +
                        p[2] * mem::Load<float>(origin + 8);
      const float distance = p[3] - eye;
      if (distance < kFarPlaneMinDistance)
        continue;
      const float w = draw_scale == 0.0f ? eye + kFarPlaneUnlimited : eye + distance * draw_scale;
      for (int32_t j = 0; j < permuted_count; ++j) {
        const uint32_t lane = permuted + uint32_t(j / 4) * 64 + uint32_t(j % 4) * 4;
        if (mem::Load<float>(lane) == p[0] && mem::Load<float>(lane + 16) == p[1] &&
            mem::Load<float>(lane + 32) == p[2] && mem::Load<float>(lane + 48) == p[3])
          StoreSaved(lane + 48, w);
      }
      StoreSaved(plane + 12, w);
    }
  }
}

// The first perspective view's projection [1][1] and LODDistanceFactor, for
// small object culling; false when there is none.
bool PerspectiveScale(uint32_t renderer, float& projection_yy, float& lod_distance_factor) {
  const uint32_t views = mem::Load<uint32_t>(renderer + kRendererViews);
  const int32_t view_count = mem::Load<int32_t>(renderer + kRendererViews + 4);
  if (!PlausiblePointer(views) || view_count <= 0 || view_count > kMaxViews)
    return false;
  for (int32_t v = 0; v < view_count; ++v) {
    const uint32_t view = views + uint32_t(v) * kViewSize;
    if (mem::Load<float>(view + kViewOrigin + 12) <= 0.0f)
      continue;
    projection_yy = mem::Load<float>(view + kViewProjectionYY);
    lod_distance_factor = mem::Load<float>(view + kViewLodDistanceFactor);
    if (!std::isfinite(projection_yy) || projection_yy <= 0.0f)
      return false;
    if (!std::isfinite(lod_distance_factor) || lod_distance_factor <= 0.0f)
      lod_distance_factor = 1.0f;
    return true;
  }
  return false;
}

// Keeps the first perspective view's origin for the level of detail checks.
void RecordViewOrigin(uint32_t renderer) {
  const uint32_t views = mem::Load<uint32_t>(renderer + kRendererViews);
  const int32_t view_count = mem::Load<int32_t>(renderer + kRendererViews + 4);
  if (!PlausiblePointer(views) || view_count <= 0 || view_count > kMaxViews)
    return;
  for (int32_t v = 0; v < view_count; ++v) {
    const uint32_t origin = views + uint32_t(v) * kViewSize + kViewOrigin;
    if (mem::Load<float>(origin + 12) <= 0.0f)
      continue;
    for (uint32_t axis = 0; axis < 3; ++axis)
      g_view_origin[axis].store(mem::Load<float>(origin + axis * 4), std::memory_order_relaxed);
    g_view_origin_known.store(true, std::memory_order_release);
    return;
  }
}

// Rewrites the scene for the settings; RestoreScene puts it back.
void AdjustScene(uint32_t renderer) {
  g_saved.clear();
  RecordViewOrigin(renderer);
  SceneAdjust adjust;
  adjust.draw_scale = DrawDistanceScale();
  adjust.lod_off = LodOff();
  if (const float fraction = SmallObjectFraction(); fraction > 0.0f) {
    float projection_yy = 0.0f;
    if (PerspectiveScale(renderer, projection_yy, adjust.lod_distance_factor))
      adjust.small_reach_per_radius = projection_yy / fraction;
  }
  if (adjust.draw_scale == 1.0f && !adjust.lod_off && adjust.small_reach_per_radius == 0.0f)
    return;
  if (adjust.draw_scale != 1.0f)
    AdjustFarPlanes(renderer, adjust.draw_scale);
  const uint32_t scene = mem::Load<uint32_t>(renderer + kRendererScene);
  if (!PlausiblePointer(scene))
    return;
  const uint32_t primitives = mem::Load<uint32_t>(scene + kScenePrimitives);
  const int32_t count = mem::Load<int32_t>(scene + kScenePrimitives + 4);
  if (!PlausiblePointer(primitives))
    return;
  for (int32_t i = 0; i < count && i < kMaxPrimitives; ++i) {
    const uint32_t primitive = mem::Load<uint32_t>(primitives + uint32_t(i) * 4);
    if (PlausiblePointer(primitive))
      AdjustPrimitive(primitive, adjust);
  }
}

void RestoreScene() {
  for (auto it = g_saved.rbegin(); it != g_saved.rend(); ++it)
    mem::Store<uint32_t>(it->address, it->bits);
  g_saved.clear();
}

//------------------------------------------------------------------------------
// Occlusion in the depth pass (render thread)
//------------------------------------------------------------------------------

// The scene renderer (sub_823B4808) draws each depth priority group's depth
// first through sub_823B51C8 (renderer, group, r5 read occlusion, r6 the
// fading objects' pass). With dword_83748488 set, as engine init leaves it,
// the opaque call (r6 = 0) with r5 set starts by reading the queries earlier
// frames issued (sub_823A0858 per view): an object found hidden loses its bit
// in the view's PrimitiveVisibilityMap (+508), and a static one its static
// mesh bits (+544) as well. The depth pass then draws the static meshes left
// and every dynamic primitive (view +580, count +584) whose relevance word
// (+532, per primitive index at PrimitiveSceneInfo +48) has the group's bit
// (0x08000000, 0x04000000, 0x02000000, 0x01000000 for groups 0 to 3); unlike
// the colour pass (sub_823B58F0) it never looks at +508, so hidden dynamic
// objects (foliage, skinned meshes, particles) still had their depth drawn.
// redahm_occlusion_depth_pass clears those group bits of hidden dynamic
// primitives after the read and puts them back when the depth call returns.
// The queries issued at its end go by the frustum's set (+520), not these
// bits, so hidden objects keep being tested and come back once seen.
constexpr uint32_t kViewPrimitiveVisibility = 508;
constexpr uint32_t kViewRelevance = 532;
constexpr uint32_t kViewDynamicPrimitives = 580;
constexpr uint32_t kPrimitiveIndex = 48;
constexpr uint32_t kRelevanceGroups = 0x0F000000;

bool g_in_depth_pass = false;
std::vector<SavedWord> g_depth_pass_saved;

void BeginDepthPass(bool reads_occlusion) {
  g_in_depth_pass = reads_occlusion && REXCVAR_GET(redahm_occlusion_depth_pass);
  g_depth_pass_saved.clear();
}

void EndDepthPass() {
  for (auto it = g_depth_pass_saved.rbegin(); it != g_depth_pass_saved.rend(); ++it)
    mem::Store<uint32_t>(it->address, it->bits);
  g_depth_pass_saved.clear();
  g_in_depth_pass = false;
}

// After the occlusion read for `view`, inside the depth call.
void HideOccludedFromDepthPass(uint32_t view) {
  if (!g_in_depth_pass || !PlausiblePointer(view))
    return;
  const uint32_t visibility = mem::Load<uint32_t>(view + kViewPrimitiveVisibility);
  const uint32_t relevance = mem::Load<uint32_t>(view + kViewRelevance);
  const uint32_t list = mem::Load<uint32_t>(view + kViewDynamicPrimitives);
  const int32_t count = mem::Load<int32_t>(view + kViewDynamicPrimitives + 4);
  if (!PlausiblePointer(visibility) || !PlausiblePointer(relevance) || !PlausiblePointer(list) ||
      count <= 0 || count > kMaxPrimitives)
    return;
  for (int32_t i = 0; i < count; ++i) {
    const uint32_t primitive = mem::Load<uint32_t>(list + uint32_t(i) * 4);
    if (!PlausiblePointer(primitive))
      continue;
    const int32_t index = mem::Load<int32_t>(primitive + kPrimitiveIndex);
    if (index < 0 || index >= kMaxPrimitives)
      continue;
    const uint32_t bits = mem::Load<uint32_t>(visibility + uint32_t(index / 32) * 4);
    if (bits & (1u << (index & 31)))
      continue;
    const uint32_t word = relevance + uint32_t(index) * 4;
    const uint32_t value = mem::Load<uint32_t>(word);
    if (!(value & kRelevanceGroups))
      continue;
    g_depth_pass_saved.push_back({word, value});
    mem::Store<uint32_t>(word, value & ~kRelevanceGroups);
  }
}

}  // namespace

namespace {

//------------------------------------------------------------------------------
// Level streaming (game thread)
//------------------------------------------------------------------------------

// PotF's city is 42 streaming levels ('is_paradiso_n3p3' ... 'is_paradiso_p5p3'),
// each with one LevelStreamingVolume. UE3 loads a tile only while a view
// stands inside its volume, and the persistent level fills in the rest of the
// city with low-detail stand-ins: far buildings stayed low-poly whatever the
// LOD setting, and each tile's buildings popped in on entering it.
// The per-level decision, sub_8241F358(level, views, ..., &should_be_loaded,
// &should_be_visible), ORs every view's ShouldBeLoaded/ShouldBeVisible
// (vtable +264/+268) and serves UpdateLevelStreaming (sub_8241F520) and the
// streaming flush alike. A level with streaming volumes also loads and shows
// while one of its volumes lies within the extra range of a view: the stock
// view distance per step of the setting, everything when unlimited.
// LevelStreamingDistance levels (ShouldBeLoaded sub_824252A0, and in game
// ShouldBeVisible asks it too) load while a view stands within MaxDistance
// (+0x90) of Origin (+0x84) in X and Y; that distance scales with the setting.
// Other levels without volumes (missions, audio, scripting) are left to the
// game.
//
// A tile loaded while the setting is raised stays loaded and shown until the
// world changes (lowering the setting still shortens the far plane, cull
// distances, props and foliage). Loaded but hidden is not a state this
// UpdateLevelStreaming (sub_8241F520) keeps: a loaded level that should not be
// visible is marked for unload (+96 bit 24) and goes once its hide timer
// (+100) runs out. Unloading tiles mid-game breaks Kynapse, the AI navigation:
// the garbage collector has each tile's KynapseHierPathdataObj unload its path
// data and wait (sub_82B8BB08 -> sub_82BF97C0), and with many tiles loaded
// that wait hung on an entry the Kynapse list had moved, and pumping it by id
// instead crashed on a read finishing into another entry.
//
// A building's detailed model also lives in its tile. The persistent level's
// CPBuildingActors carry the low-detail component; each tile's
// CPBuildingLODManager, as the tile loads (sub_82B3C190), has every
// CPBuildingLODLocator find its building by GUID and hand it the high-detail
// component (sub_82B3C770 -> sub_82A07420), and the tile's unload puts the
// stand-in back (sub_82B3C8B0 -> sub_82A07598).
constexpr float kStockViewDistance = 30000.0f;
constexpr int32_t kMaxVolumes = 16;
// views: TArray<FSceneView*>, ViewOrigin at +384.
constexpr uint32_t kSceneViewOrigin = 384;
constexpr uint32_t kLevelShouldBeLoadedSlot = 264;
constexpr uint32_t kDistanceShouldBeLoaded = 0x824252A0;
constexpr uint32_t kDistanceOrigin = 0x84;
constexpr uint32_t kDistanceMaxDistance = 0x90;

// Extra range beyond a tile's volumes for a setting's scale (0 without limit).
float RangeForScale(float scale) {
  return scale == 0.0f ? kFarthest : (scale - 1.0f) * kStockViewDistance;
}

// The level streaming objects kept loaded, the world they belong to, and that
// world's clock when last seen.
std::vector<uint32_t> g_kept_levels;
uint32_t g_kept_world = 0;
float g_kept_world_seconds = 0.0f;

// Whether `level` is kept loaded; `keep` adds it. A reloaded or newly
// travelled-to world can land at the old one's address, with its level
// streaming objects at the old ones' addresses too; its clock starting over
// tells it apart, so the old world's far tiles are not all asked for at once
// the moment it begins.
bool KeepLevel(uint32_t level, bool keep) {
  const uint32_t world = mem::Load<uint32_t>(kGWorld);
  const float seconds = WorldTimeSeconds();
  if (world != g_kept_world || seconds + 1.0f < g_kept_world_seconds) {
    g_kept_levels.clear();
    g_kept_world = world;
  }
  g_kept_world_seconds = seconds;
  if (std::find(g_kept_levels.begin(), g_kept_levels.end(), level) != g_kept_levels.end())
    return true;
  if (keep)
    g_kept_levels.push_back(level);
  return keep;
}

CachedOffset g_level_volumes;    // LevelStreaming.EditorStreamingVolumes
CachedOffset g_volume_brush;     // Brush.BrushComponent
CachedOffset g_component_bounds; // PrimitiveComponent.Bounds

// Distance from `point` to the box of a volume's brush, or -1 when the
// volume's bounds cannot be read.
float DistanceToVolume(uint32_t volume, const float point[3]) {
  const int32_t brush_offset = g_volume_brush.Get(ObjectClass(volume), "BrushComponent");
  const uint32_t brush = brush_offset >= 0 ? ReadU32(volume + uint32_t(brush_offset)) : 0;
  const int32_t bounds = brush ? g_component_bounds.Get(ObjectClass(brush), "Bounds") : -1;
  if (bounds < 0)
    return -1.0f;
  // FBoxSphereBounds: Origin, BoxExtent, SphereRadius.
  float sum = 0.0f;
  for (uint32_t axis = 0; axis < 3; ++axis) {
    float origin = 0.0f, extent = 0.0f;
    if (!Read(brush + uint32_t(bounds) + axis * 4, origin) ||
        !Read(brush + uint32_t(bounds) + 12 + axis * 4, extent))
      return -1.0f;
    const float outside = std::max(std::fabs(point[axis] - origin) - extent, 0.0f);
    sum += outside * outside;
  }
  return std::sqrt(sum);
}

// Whether `level` streams by where the views are (streaming volumes or
// distance): the city's tiles. Kismet streams the rest (briefings, missions,
// interiors), loading, hiding and unloading them as its scripts go, and waits
// on each change.
bool StreamedByRange(uint32_t level) {
  const uint32_t vtable = ReadU32(level);
  if (vtable && ReadU32(vtable + kLevelShouldBeLoadedSlot) == kDistanceShouldBeLoaded)
    return true;
  const int32_t volumes_offset = g_level_volumes.Get(ObjectClass(level), "EditorStreamingVolumes");
  int32_t volume_count = 0;
  return volumes_offset >= 0 && ReadU32(level + uint32_t(volumes_offset)) &&
         Read(level + uint32_t(volumes_offset) + 4, volume_count) && volume_count > 0;
}

// Whether a view lies within the setting's reach of `level` (scale 0: without
// limit). Levels streamed by volumes or by distance only.
bool LevelWithinRange(uint32_t level, uint32_t views, float scale) {
  const uint32_t vtable = ReadU32(level);
  const bool by_distance =
      vtable && ReadU32(vtable + kLevelShouldBeLoadedSlot) == kDistanceShouldBeLoaded;
  float origin[2] = {}, max_distance = 0.0f;
  const int32_t volumes_offset =
      by_distance ? -1 : g_level_volumes.Get(ObjectClass(level), "EditorStreamingVolumes");
  uint32_t volumes = 0;
  int32_t volume_count = 0;
  if (by_distance) {
    if (!Read(level + kDistanceOrigin, origin[0]) || !Read(level + kDistanceOrigin + 4, origin[1]) ||
        !Read(level + kDistanceMaxDistance, max_distance))
      return false;
  } else {
    if (volumes_offset < 0)
      return false;
    volumes = ReadU32(level + uint32_t(volumes_offset));
    if (!volumes || !Read(level + uint32_t(volumes_offset) + 4, volume_count) || volume_count <= 0)
      return false;
  }
  if (scale == 0.0f)
    return true;
  const float range = RangeForScale(scale);
  const uint32_t view_array = views ? ReadU32(views) : 0;
  int32_t view_count = 0;
  if (!view_array || !Read(views + 4, view_count))
    return false;
  for (int32_t v = 0; v < view_count && v < kMaxViews; ++v) {
    const uint32_t view = ReadU32(view_array + uint32_t(v) * 4);
    float point[3];
    if (!view || !Read(view + kSceneViewOrigin, point[0]) ||
        !Read(view + kSceneViewOrigin + 4, point[1]) || !Read(view + kSceneViewOrigin + 8, point[2]))
      continue;
    if (by_distance) {
      if (std::hypot(point[0] - origin[0], point[1] - origin[1]) <= max_distance * scale)
        return true;
      continue;
    }
    for (int32_t i = 0; i < volume_count && i < kMaxVolumes; ++i) {
      const uint32_t volume = ReadU32(volumes + uint32_t(i) * 4);
      const float distance = volume ? DistanceToVolume(volume, point) : -1.0f;
      if (distance >= 0.0f && distance <= range)
        return true;
    }
  }
  return false;
}

// A world's first tiles are left to the game, and the extra reach grows in
// after them. Asking for the whole raised reach the moment a level loaded or
// the player travelled (most of the city at VERY FAR) left the pedestrians,
// police and mission characters standing still, and the first mission's
// loading screen waiting for good: the tiles around the start never got their
// Kynapse navigation data in with that many arriving at once. Raising the
// setting in the middle of play, which only ever adds tiles a few at a time,
// never showed it. So for kStreamingGrace seconds of world time the setting
// adds nothing, and then its reach widens over kStreamingRamp seconds, nearest
// tiles first.
constexpr float kStreamingGrace = 8.0f;
constexpr float kStreamingRamp = 20.0f;
// The scale standing in for "no limit" while the reach is still widening.
constexpr float kUnlimitedRampScale = 20.0f;

// The scale the level streaming works to now: 1 (the game's own reach) early
// in a world, rising to the setting's.
float StreamingScale(float scale) {
  const float seconds = WorldTimeSeconds();
  if (seconds < kStreamingGrace)
    return 1.0f;
  const float ramp = std::min((seconds - kStreamingGrace) / kStreamingRamp, 1.0f);
  if (ramp >= 1.0f)
    return scale;
  const float target = scale == 0.0f ? kUnlimitedRampScale : scale;
  return 1.0f + (target - 1.0f) * ramp;
}

// Rewrites the game's decision for `level` (the bools at `loaded` and
// `visible`): loaded and shown within the setting's reach, and kept so once
// loaded while the setting was raised.
void DecideLevel(uint32_t level, uint32_t views, uint32_t loaded, uint32_t visible) {
  const float scale = DrawDistanceScale();
  const bool raised = scale == 0.0f || scale > 1.0f;
  const float streaming_scale = raised ? StreamingScale(scale) : scale;
  const bool reaching = streaming_scale == 0.0f || streaming_scale > 1.0f;
  if (reaching && LevelWithinRange(level, views, streaming_scale)) {
    mem::Store<uint32_t>(loaded, 1);
    mem::Store<uint32_t>(visible, 1);
  }
  // Only the tiles: a Kismet level held loaded and shown never finished its
  // script's unload or hide (a mission's start waits on one).
  if (StreamedByRange(level) && KeepLevel(level, raised && mem::Load<uint32_t>(loaded) != 0)) {
    mem::Store<uint32_t>(loaded, 1);
    mem::Store<uint32_t>(visible, 1);
  }
}

//------------------------------------------------------------------------------
// Foliage (render thread)
//------------------------------------------------------------------------------

// FoliageFactory scatters the trees and bushes as FoliageComponents (over 400
// in the city), drawn by FFoliageSceneProxy::DrawDynamicElements
// (sub_8267FF98). It reads its component (proxy +272) every frame and draws
// only the instances within MaxDrawRadius (+724, cooked 4000), shrinking them
// away between MinTransitionRadius (+728) and it. The draw distance setting
// never reached them, so trees vanished 40 metres out. For the call the radii
// are scaled like the rest of the draw distance (unlimited: the whole world).
// The vertex factory copies the transition when the proxy first draws
// ({component, mesh, MinTransitionRadius², 1 / (MaxDrawRadius -
// MinTransitionRadius)} in the proxy's factories at +280/+284), so its copy is
// kept in step, and the component gets its own values back afterwards.
constexpr uint32_t kFoliageProxyComponent = 272;
constexpr uint32_t kFoliageProxyFactories = 280;
constexpr uint32_t kFoliageMaxDrawRadius = 724;
constexpr uint32_t kFoliageMinTransitionRadius = 728;
constexpr float kWorldSize = 524288.0f;

struct FoliageRadii {
  uint32_t component = 0;
  uint32_t max_bits = 0;
  uint32_t min_bits = 0;
};

FoliageRadii ScaleFoliage(uint32_t proxy) {
  FoliageRadii saved;
  const uint32_t component = ReadU32(proxy + kFoliageProxyComponent);
  float max_radius = 0.0f, min_radius = 0.0f;
  if (!component || !Read(component + kFoliageMaxDrawRadius, max_radius) ||
      !Read(component + kFoliageMinTransitionRadius, min_radius) || max_radius <= 0.0f)
    return saved;
  const float scale = DrawDistanceScale();
  const float factor = scale == 0.0f ? std::max(kWorldSize / max_radius, 1.0f) : scale;
  const float new_max = max_radius * factor;
  const float new_min = min_radius * factor;
  if (factor != 1.0f) {
    saved.component = component;
    saved.max_bits = mem::Load<uint32_t>(component + kFoliageMaxDrawRadius);
    saved.min_bits = mem::Load<uint32_t>(component + kFoliageMinTransitionRadius);
    mem::Store<float>(component + kFoliageMaxDrawRadius, new_max);
    mem::Store<float>(component + kFoliageMinTransitionRadius, new_min);
  }
  // Also when the setting is back at original, so a factory made while it
  // was raised stops shrinking instances too late.
  for (uint32_t i = 0; i < 2; ++i) {
    const uint32_t factory = ReadU32(proxy + kFoliageProxyFactories + i * 4);
    if (!factory || ReadU32(factory) != component)
      continue;
    mem::Store<float>(factory + 8, new_min * new_min);
    mem::Store<float>(factory + 12, 1.0f / std::max(new_max - new_min, 1.0f));
  }
  return saved;
}

void RestoreFoliage(const FoliageRadii& saved) {
  if (!saved.component)
    return;
  mem::Store<uint32_t>(saved.component + kFoliageMaxDrawRadius, saved.max_bits);
  mem::Store<uint32_t>(saved.component + kFoliageMinTransitionRadius, saved.min_bits);
}

//------------------------------------------------------------------------------
// Props (game thread)
//------------------------------------------------------------------------------

// The street props (benches, bins, lamps, hydrants...) are not actors in the
// level: CPPropInstanceManager keeps them as instances and lends each one an
// actor from a pool while a view is near. Its update (sub_829F9400) takes the
// instances within a view's frustum and within 7500 units in X and Y (17000
// from the saucer), nearest first, four a frame, and fades them out from 7000
// (16500); the rest give their actors back. Those four ranges are constants
// only this function reads (0x820A448C: 7000, 7500, 16500, 17000), so props
// vanished 75 metres out whatever the draw distance. They scale with the
// setting now.
//
// The pools are sized per map in the ini (KronosGame.CPStaticPropPoolSize and
// CPDynamicPropPoolSize: 125 to 200 each in the cities), read through
// GConfig->GetInt (sub_8235C9A8) as the manager spawns its actors
// (sub_829F8208). Instances keep their actor while in range, so a range the
// pool cannot cover would leave near props without one. The pools grow with
// the setting's area when the map starts (up to 16 times, never past the
// map's instances), and each frame the range stops where the instances in
// front of the views would outnumber the pools (never short of the game's own).
//
// The manager: instances +564 (164 bytes each, +568 count; +20 flags, bit 30
// static, bit 29 gone; X and Y at +24), the pools' actors +576 (static, +580
// count) and +600 (dynamic, +604 count), the views +636 (208 bytes each, +640
// count; forward in X and Y at +96, origin at +112, in the saucer +192).
constexpr uint32_t kPropRanges = 0x820A448C;
constexpr float kStockPropRanges[4] = {7000.0f, 7500.0f, 16500.0f, 17000.0f};
constexpr uint32_t kStaticPropPoolSection = 0x821B2288;
constexpr uint32_t kDynamicPropPoolSection = 0x821B22C8;
constexpr uint32_t kPropInstances = 564;
constexpr uint32_t kPropInstanceSize = 164;
constexpr uint32_t kPropInstanceFlags = 20;
constexpr uint32_t kPropInstanceX = 24;
constexpr uint32_t kPropStatic = 0x40000000;
constexpr uint32_t kPropGone = 0x20000000;
constexpr uint32_t kPropStaticPool = 576;
constexpr uint32_t kPropDynamicPool = 600;
constexpr uint32_t kPropViews = 636;
constexpr uint32_t kPropViewSize = 208;
constexpr uint32_t kPropViewForward = 96;
constexpr uint32_t kPropViewOrigin = 112;
constexpr int32_t kMaxPropInstances = 1 << 16;
constexpr float kMaxPoolGrowth = 16.0f;
// Share of a pool the range may fill, leaving actors for props coming into
// view while others are still handed back.
constexpr float kPoolShare = 0.85f;
// The frustum as seen from above, widened: instances within this angle of a
// view's forward direction count against the pools. Looking nearly straight
// down, all around do.
constexpr float kFrustumCos = 0.5f;
constexpr float kMinForward = 0.3f;
// Far enough for any map, finite for the range's square.
constexpr float kPropRangeLimit = 1.0e7f;

// The manager whose pools are being spawned (inside sub_829F8208).
uint32_t g_spawning_prop_manager = 0;

bool PropIsStatic(uint32_t instance) {
  return (mem::Load<uint32_t>(instance + kPropInstanceFlags) & kPropStatic) != 0;
}

int32_t CountProps(uint32_t manager, bool is_static) {
  const uint32_t instances = mem::Load<uint32_t>(manager + kPropInstances);
  const int32_t count = std::min(mem::Load<int32_t>(manager + kPropInstances + 4), kMaxPropInstances);
  if (!PlausiblePointer(instances))
    return 0;
  int32_t props = 0;
  for (int32_t i = 0; i < count; ++i)
    props += PropIsStatic(instances + uint32_t(i) * kPropInstanceSize) == is_static;
  return props;
}

// A pool's ini size grown for the setting when the map starts.
int32_t PropPoolSize(int32_t size, uint32_t manager, bool is_static) {
  const float scale = DrawDistanceScale();
  const float area = scale == 0.0f ? kMaxPoolGrowth : std::min(scale * scale, kMaxPoolGrowth);
  if (size <= 0 || area <= 1.0f)
    return size;
  const int32_t grown = int32_t(float(size) * area);
  return std::max(size, std::min(grown, CountProps(manager, is_static)));
}

// How far the pools reach: the distance within which the instances in front
// of the views fill each pool's share (kPropRangeLimit when they never do).
float PropPoolRange(uint32_t manager) {
  const uint32_t instances = mem::Load<uint32_t>(manager + kPropInstances);
  const int32_t count = std::min(mem::Load<int32_t>(manager + kPropInstances + 4), kMaxPropInstances);
  const uint32_t views = mem::Load<uint32_t>(manager + kPropViews);
  const int32_t view_count = mem::Load<int32_t>(manager + kPropViews + 4);
  if (!PlausiblePointer(instances) || !PlausiblePointer(views) || view_count <= 0 ||
      view_count > kMaxViews)
    return kPropRangeLimit;
  struct View {
    float x, y, forward_x, forward_y;
    bool all_around;
  };
  View view_list[kMaxViews];
  for (int32_t v = 0; v < view_count; ++v) {
    const uint32_t view = views + uint32_t(v) * kPropViewSize;
    View& out = view_list[v];
    out.x = mem::Load<float>(view + kPropViewOrigin);
    out.y = mem::Load<float>(view + kPropViewOrigin + 4);
    const float fx = mem::Load<float>(view + kPropViewForward);
    const float fy = mem::Load<float>(view + kPropViewForward + 4);
    const float length = std::hypot(fx, fy);
    out.all_around = !(length >= kMinForward);
    out.forward_x = out.all_around ? 0.0f : fx / length;
    out.forward_y = out.all_around ? 0.0f : fy / length;
  }
  static std::vector<float> distances[2];
  distances[0].clear();
  distances[1].clear();
  for (int32_t i = 0; i < count; ++i) {
    const uint32_t instance = instances + uint32_t(i) * kPropInstanceSize;
    const uint32_t flags = mem::Load<uint32_t>(instance + kPropInstanceFlags);
    if (flags & kPropGone)
      continue;
    const float x = mem::Load<float>(instance + kPropInstanceX);
    const float y = mem::Load<float>(instance + kPropInstanceX + 4);
    float nearest = kFarthest;
    for (int32_t v = 0; v < view_count; ++v) {
      const View& view = view_list[v];
      const float dx = x - view.x, dy = y - view.y;
      const float distance = std::hypot(dx, dy);
      if (!view.all_around && dx * view.forward_x + dy * view.forward_y < kFrustumCos * distance)
        continue;
      nearest = std::min(nearest, distance);
    }
    if (nearest < kFarthest)
      distances[(flags & kPropStatic) ? 0 : 1].push_back(nearest);
  }
  float range = kPropRangeLimit;
  for (int32_t k = 0; k < 2; ++k) {
    const uint32_t pool = manager + (k == 0 ? kPropStaticPool : kPropDynamicPool);
    const size_t share = size_t(std::max(float(mem::Load<int32_t>(pool + 4)) * kPoolShare, 0.0f));
    std::vector<float>& list = distances[k];
    if (list.size() <= share)
      continue;
    std::nth_element(list.begin(), list.begin() + share, list.end());
    range = std::min(range, list[share]);
  }
  return range;
}

// Sets the prop ranges for this update: the setting's, as far as the pools
// reach, never short of the game's.
void ApplyPropRanges(uint32_t manager) {
  static bool writable = false;
  if (!writable) {
    // Read-only data in the title image.
    writable = rex::memory::Protect(mem::At<uint8_t>(kPropRanges), sizeof(kStockPropRanges),
                                    rex::memory::PageAccess::kReadWrite);
    if (!writable)
      return;
  }
  const float scale = DrawDistanceScale();
  const float pool_range = scale == 1.0f ? 0.0f : PropPoolRange(manager);
  // Pairs: fade start and range, on foot and from the saucer.
  for (uint32_t pair = 0; pair < 2; ++pair) {
    const float stock = kStockPropRanges[pair * 2 + 1];
    const float wanted = scale == 0.0f ? kPropRangeLimit : std::min(stock * scale, kPropRangeLimit);
    const float factor = std::max(std::min(wanted, pool_range), stock) / stock;
    for (uint32_t i = 0; i < 2; ++i) {
      const uint32_t index = pair * 2 + i;
      mem::Store<float>(kPropRanges + index * 4, kStockPropRanges[index] * factor);
    }
  }
}

//------------------------------------------------------------------------------
// Texture streaming (game thread)
//------------------------------------------------------------------------------

// UE3 streams each texture's mips by how large the texture's instances look
// from the streaming views (FStreamingHandlerTextureStatic::GetWantedMips,
// sub_82344770): distance times the manager's fudge factor against each
// instance's radius and texel factor and the view's screen size, which is the
// title's 1280-wide view. Rendered at 3x that, textures asked for about
// log2(3) mips fewer than the screen showed and stayed blurry until close.
// The fudge factor is divided by the resolution scale, which makes the
// request match the host resolution; with level of detail off it all but
// vanishes, so every mip is wanted at any distance. The manager still raises
// it under memory pressure.
float TextureStreamingFactor() {
  const float factor = 1.0f / std::max(settings::ResolutionScale(), 1.0f);
  return LodOff() ? factor * 0.001f : factor;
}

}  // namespace

void ApplyPerFrame() {
  ++g_frame;
  ApplyDecals();
}

int32_t ScriptPropertyOffset(uint32_t object, std::string_view name) {
  return object ? PropertyOffset(ObjectClass(object), name) : -1;
}

uint32_t ScriptFunction(uint32_t object, std::string_view name) {
  return object ? FindField(ObjectClass(object), name) : 0;
}

void CallScriptFunction(PPCContext& ctx, uint8_t* base, uint32_t object, uint32_t function,
                        uint32_t parms) {
  CallProcessEvent(ctx, base, object, function, parms);
}

}  // namespace redahm::graphics_settings

REX_EXTERN(__imp__sub_823B2D38);

// FSceneRenderer::InitViews (renderer).
REX_HOOK_RAW(sub_823B2D38) {
  namespace gs = redahm::graphics_settings;
  gs::AdjustScene(ctx.r3.u32);
  __imp__sub_823B2D38(ctx, base);
  gs::RestoreScene();
}

REX_EXTERN(__imp__sub_8298EAF8);

// CPHUD's TickInternal native (r3 HUD, r4 script frame), every tick; see
// "HUD".
REX_HOOK_RAW(sub_8298EAF8) {
  const uint32_t hud = ctx.r3.u32;
  __imp__sub_8298EAF8(ctx, base);
  redahm::graphics_settings::ApplyHud(ctx, base, hud);
}

REX_EXTERN(__imp__sub_823B51C8);
REX_EXTERN(__imp__sub_823A0858);

// A depth priority group's depth pass (renderer, group, r5 read occlusion,
// r6 fading objects' pass); see "Occlusion in the depth pass".
REX_HOOK_RAW(sub_823B51C8) {
  namespace gs = redahm::graphics_settings;
  gs::BeginDepthPass(ctx.r5.u32 != 0 && ctx.r6.u32 == 0);
  __imp__sub_823B51C8(ctx, base);
  gs::EndDepthPass();
}

// The occlusion read for one view (renderer, view).
REX_HOOK_RAW(sub_823A0858) {
  const uint32_t view = ctx.r4.u32;
  __imp__sub_823A0858(ctx, base);
  redahm::graphics_settings::HideOccludedFromDepthPass(view);
}

// FFoliageSceneProxy::DrawDynamicElements (r3 proxy); see "Foliage". The
// draw itself runs natively (native_foliage.cpp).
REX_HOOK_RAW(sub_8267FF98) {
  namespace gs = redahm::graphics_settings;
  const gs::FoliageRadii saved = gs::ScaleFoliage(ctx.r3.u32);
  redahm::native_foliage::DrawFoliageProxy(ctx, base);
  gs::RestoreFoliage(saved);
}

REX_EXTERN(__imp__sub_82344770);

// FStreamingHandlerTextureStatic::GetWantedMips (f1 the streaming manager's
// fudge factor, r3 manager, r4 texture, r5 the streaming views); see
// "Texture streaming".
REX_HOOK_RAW(sub_82344770) {
  ctx.f1.f64 *= redahm::graphics_settings::TextureStreamingFactor();
  __imp__sub_82344770(ctx, base);
}

// Level of detail; see "Level of detail" in the namespace above.

REX_EXTERN(__imp__sub_8292B040);

// FStaticMeshSceneProxy::GetLOD (r3 proxy, f1 distance).
REX_HOOK_RAW(sub_8292B040) {
  if (redahm::graphics_settings::FullDetailAt(float(ctx.f1.f64)))
    ctx.f1.f64 = 0.0;
  __imp__sub_8292B040(ctx, base);
}

REX_EXTERN(__imp__sub_82B54598);

// The buildings' copy of it (CPBuildingComponent's proxy; r3 proxy, f1 distance).
REX_HOOK_RAW(sub_82B54598) {
  if (redahm::graphics_settings::FullDetailAt(float(ctx.f1.f64)))
    ctx.f1.f64 = 0.0;
  __imp__sub_82B54598(ctx, base);
}

REX_EXTERN(__imp__sub_825E3790);

// USkeletalMeshComponent::UpdateSkelPose (r3 component, f1 delta time).
REX_HOOK_RAW(sub_825E3790) {
  namespace gs = redahm::graphics_settings;
  const uint32_t component = ctx.r3.u32;
  const int32_t forced = component ? gs::mem::Load<int32_t>(component + gs::kSkeletalForcedLod) : 1;
  const bool force = forced <= 0 && gs::FullDetailAt(gs::ViewDistanceTo(component));
  if (force)
    gs::mem::Store<int32_t>(component + gs::kSkeletalForcedLod, 1);
  __imp__sub_825E3790(ctx, base);
  if (force)
    gs::mem::Store<int32_t>(component + gs::kSkeletalForcedLod, forced);
}

REX_EXTERN(__imp__sub_828F3350);

// FParticleSystemSceneProxy's draw (r3 proxy, r4 draw interface, r5 view, r6
// depth priority group).
REX_HOOK_RAW(sub_828F3350) {
  namespace gs = redahm::graphics_settings;
  const uint32_t proxy = ctx.r3.u32;
  __imp__sub_828F3350(ctx, base);
  if (proxy && gs::mem::Load<uint32_t>(proxy + gs::kParticleLodDirect) == 0 &&
      gs::FullDetailAt(gs::mem::Load<float>(proxy + gs::kParticleLodDistance)))
    gs::mem::Store<float>(proxy + gs::kParticleLodDistance, 0.0f);
}

REX_EXTERN(__imp__sub_82AFCED0);

// CPCharLOD picking a pedestrian's level (f1 distance, r4 pawn class, r6 the
// pawn's lower edge).
REX_HOOK_RAW(sub_82AFCED0) {
  if (redahm::graphics_settings::FullDetailAt(float(ctx.f1.f64)))
    ctx.f1.f64 = 0.0;
  __imp__sub_82AFCED0(ctx, base);
}

REX_EXTERN(__imp__sub_82A1ED30);

// The pedestrians' pawn tick (r3 pawn, f1 delta time).
REX_HOOK_RAW(sub_82A1ED30) {
  namespace gs = redahm::graphics_settings;
  if (ctx.r3.u32 && gs::LodOff())
    gs::RaisePawnLod(ctx.r3.u32);
  __imp__sub_82A1ED30(ctx, base);
}

REX_EXTERN(__imp__sub_82B520D8);
REX_EXTERN(__imp__sub_8264F2C0);

// The building proxy's visibility test (r3 proxy, r4 view); see "Detailed
// buildings". sub_8264F2C0 is the base proxy's cull test it ends in.
REX_HOOK_RAW(sub_82B520D8) {
  namespace gs = redahm::graphics_settings;
  switch (ctx.r3.u32 && ctx.r4.u32 ? gs::DecideBuildingView(ctx.r3.u32, ctx.r4.u32)
                                   : gs::BuildingView::kGame) {
    case gs::BuildingView::kHidden:
      ctx.r3.u64 = 0;
      return;
    case gs::BuildingView::kCullOnly:
      __imp__sub_8264F2C0(ctx, base);
      return;
    case gs::BuildingView::kGame:
      __imp__sub_82B520D8(ctx, base);
      return;
  }
}

REX_EXTERN(__imp__sub_8241F358);

// The per-level streaming decision (r3 level streaming, r4 views, r6 should be
// loaded, r7 should be visible); see "Level streaming".
REX_HOOK_RAW(sub_8241F358) {
  namespace gs = redahm::graphics_settings;
  const uint32_t level = ctx.r3.u32;
  const uint32_t views = ctx.r4.u32;
  const uint32_t should_be_loaded = ctx.r6.u32;
  const uint32_t should_be_visible = ctx.r7.u32;
  __imp__sub_8241F358(ctx, base);
  if (!level || !should_be_loaded || !should_be_visible)
    return;
  gs::DecideLevel(level, views, should_be_loaded, should_be_visible);
}


REX_EXTERN(__imp__sub_829F8208);

// CPPropInstanceManager spawning its prop pools (r3 manager); see "Props".
REX_HOOK_RAW(sub_829F8208) {
  namespace gs = redahm::graphics_settings;
  gs::g_spawning_prop_manager = ctx.r3.u32;
  __imp__sub_829F8208(ctx, base);
  gs::g_spawning_prop_manager = 0;
}

REX_EXTERN(__imp__sub_8235C9A8);

// FConfigCacheIni::GetInt (r3 config, r4 section, r5 key, r6 value, r7 file),
// for the prop pool sizes; see "Props".
REX_HOOK_RAW(sub_8235C9A8) {
  namespace gs = redahm::graphics_settings;
  const uint32_t section = ctx.r4.u32;
  const uint32_t value = ctx.r6.u32;
  __imp__sub_8235C9A8(ctx, base);
  const uint32_t manager = gs::g_spawning_prop_manager;
  if (!manager || !ctx.r3.u32 || !value ||
      (section != gs::kStaticPropPoolSection && section != gs::kDynamicPropPoolSection))
    return;
  const int32_t size = gs::mem::Load<int32_t>(value);
  gs::mem::Store<int32_t>(value, gs::PropPoolSize(size, manager, section == gs::kStaticPropPoolSection));
}

REX_EXTERN(__imp__sub_829F9400);

// CPPropInstanceManager's update (r3 manager); see "Props".
REX_HOOK_RAW(sub_829F9400) {
  redahm::graphics_settings::ApplyPropRanges(ctx.r3.u32);
  __imp__sub_829F9400(ctx, base);
}

REX_EXTERN(__imp__sub_82881ED8);

// Sets a light/primitive interaction's per-object projected shadow up
// (r3 light scene info, r4 interaction).
REX_HOOK_RAW(sub_82881ED8) {
  namespace gs = redahm::graphics_settings;
  const auto quality = gs::settings::Shadows();
  if (quality == gs::settings::ShadowQuality::kOff)
    return;
  const uint32_t engine = gs::mem::Load<uint32_t>(gs::kGEngine);
  if (engine) {
    int32_t original = gs::g_original_max_shadow_resolution.load(std::memory_order_relaxed);
    if (original < 0) {
      original = gs::mem::Load<int32_t>(engine + gs::kMaxShadowResolution);
      gs::g_original_max_shadow_resolution.store(original, std::memory_order_relaxed);
      RDAHM_INFO("[graphics] MaxShadowResolution {}", original);
    }
    float scale = 1.0f;
    switch (quality) {
      case gs::settings::ShadowQuality::kLow:
        scale = 0.5f;
        break;
      case gs::settings::ShadowQuality::kHigh:
        scale = 2.5f;
        break;
      case gs::settings::ShadowQuality::kUltra:
        // Enough for every object to reach the atlas's 870-texel limit.
        scale = 8.0f;
        break;
      default:
        break;
    }
    gs::mem::Store<int32_t>(engine + gs::kMaxShadowResolution,
                            static_cast<int32_t>(static_cast<float>(original) * scale));
  }
  __imp__sub_82881ED8(ctx, base);
}

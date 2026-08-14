#pragma once

#include <rex/ui/imgui_dialog.h>
#include <rex/ui/keybinds.h>

#include <algorithm>
#include <array>
#include <cctype>
#include <cstdio>
#include <cstring>
#include <map>
#include <string>

#include "imgui.h"
#include "redahm_engine/console_exec.h"

// One button. `arg` non-null makes the row an editable argument box whose text
// is appended to `cmd` (which then ends in a space), for commands that take a
// value the game does not enumerate. `note` is shown in the tooltip, for
// commands whose reported status needs explaining.
struct DebugCommandEntry {
  const char* label;
  const char* cmd;
  const char* arg = nullptr;
  const char* note = nullptr;
};

// Several handlers apply their effect and then deliberately `li r3, 0` so the
// command keeps travelling down the chain. They work; they just never report
// as handled. Marked so the history panel is not read as a bug.
inline constexpr const char* kFallsThrough =
    "Works, but the handler returns 0 by design so this always reports "
    "unhandled.";

struct DebugCommandGroup {
  const char* name;
  const DebugCommandEntry* entries;
  size_t count;
  bool default_open;
};

namespace redahm_debug_commands {

// ---------------------------------------------------------------------------
// Native engine commands
// ---------------------------------------------------------------------------

// VIEWMODE. Anything the dispatcher does not recognise falls through to the lit
// mode, which is what makes "VIEWMODE LIT" work without a literal of its own.
inline constexpr DebugCommandEntry kViewModes[] = {
    {"Lit", "VIEWMODE LIT"},
    {"Unlit", "VIEWMODE UNLIT"},
    {"Wireframe", "VIEWMODE WIREFRAME"},
    {"Brush wireframe", "VIEWMODE BRUSHWIREFRAME"},
    {"Lighting only", "VIEWMODE LIGHTINGONLY"},
    {"Light complexity", "VIEWMODE LIGHTCOMPLEXITY"},
    {"Shader complexity", "VIEWMODE SHADERCOMPLEXITY"},
    {"Texture density", "VIEWMODE TEXTUREDENSITY"},
    {"Next", "VIEWMODE NEXTVIEWMODE"},
    {"Previous", "VIEWMODE PREVVIEWMODE"},
};

// The full 36-entry SHOW flag table at 0x82139AE8, in table order, plus
// PREPHYSBONES which the dispatcher special-cases ahead of the table.
inline constexpr DebugCommandEntry kShowFlags[] = {
    {"BOUNDS", "SHOW BOUNDS"},
    {"BSP", "SHOW BSP"},
    {"BSPSPLIT", "SHOW BSPSPLIT"},
    {"COLLISION", "SHOW COLLISION"},
    {"CONSTRAINTS", "SHOW CONSTRAINTS"},
    {"COVER", "SHOW COVER"},
    {"DECALINFO", "SHOW DECALINFO"},
    {"DECALS", "SHOW DECALS"},
    {"DYNAMICSHADOWS", "SHOW DYNAMICSHADOWS"},
    {"FOG", "SHOW FOG"},
    {"FOLIAGE", "SHOW FOLIAGE"},
    {"HITPROXIES", "SHOW HITPROXIES"},
    {"LEVELCOLORATION", "SHOW LEVELCOLORATION"},
    {"MESHEDGES", "SHOW MESHEDGES"},
    {"MISSINGCOLLISION", "SHOW MISSINGCOLLISION"},
    {"NAVNODES", "SHOW NAVNODES"},
    {"PARTICLES", "SHOW PARTICLES"},
    {"PATHS", "SHOW PATHS"},
    {"PORTALS", "SHOW PORTALS"},
    {"POSTPROCESS", "SHOW POSTPROCESS"},
    {"SHADOWFRUSTUMS", "SHOW SHADOWFRUSTUMS"},
    {"SKELMESHES", "SHOW SKELMESHES"},
    {"SKELETALMESHES", "SHOW SKELETALMESHES"},
    {"SPEEDTREES", "SHOW SPEEDTREES"},
    {"STATICMESHES", "SHOW STATICMESHES"},
    {"TERRAIN", "SHOW TERRAIN"},
    {"TERRAINPATCHES", "SHOW TERRAINPATCHES"},
    {"UNLITTRANSLUCENCY", "SHOW UNLITTRANSLUCENCY"},
    {"ZEROEXTENT", "SHOW ZEROEXTENT"},
    {"NONZEROEXTENT", "SHOW NONZEROEXTENT"},
    {"VOLUMES", "SHOW VOLUMES"},
    {"RIGIDBODY", "SHOW RIGIDBODY"},
    {"TERRAINCOLLISION", "SHOW TERRAINCOLLISION"},
    {"BUILDINGS", "SHOW BUILDINGS"},
    {"NORMALS", "SHOW NORMALS"},
    {"BONES", "SHOW BONES"},
    {"PREPHYSBONES", "SHOW PREPHYSBONES"},
};

// STAT only knows these two in this build; every other stat name falls through
// the whole chain unhandled.
inline constexpr DebugCommandEntry kStats[] = {
    {"FPS", "STAT FPS"},
    {"Levels", "STAT LEVELS"},
    {"Chart show", "CHART SHOW"},
    {"Chart key", "CHART KEY"},
    {"Chart rescale", "CHART RESCALE"},
    {"Chart lock scale", "CHART LOCKSCALE"},
    {"Chart reset", "CHART RESET"},
    {"Chart filter", "CHART FILTER=", "None"},
    {"Reset FPS chart", "RESETFPSCHART"},
    {"Dump FPS chart", "DUMPFPSCHART"},
    {"Get max tick rate", "GETMAXTICKRATE"},
};

inline constexpr DebugCommandEntry kRendering[] = {
    {"Toggle UI", "TOGGLEUI"},
    {"Toggle occlusion", "TOGGLEOCCLUSION"},
    {"Toggle rendering thread", "ToggleRenderingThread"},
    {"Downsample on", "DownsampleOn", nullptr, kFallsThrough},
    {"Downsample off", "DownsampleOff", nullptr, kFallsThrough},
    {"Post process on", "set D3DRenderDevice UsePostProcessEffects True"},
    {"Post process off", "set D3DRenderDevice UsePostProcessEffects False"},
    {"Full motion blur", "FULLMOTIONBLUR"},
    {"Toggle VSM", "TOGGLEVSM"},
    {"Toggle BPCF", "TOGGLEBPCF"},
    {"Shadow quality", "SHADOWQUALITY ", "2"},
    {"Shadow radius", "SHADOWRADIUS ", "1.0"},
    {"Shadow depth bias", "SHADOWDEPTHBIAS ", "0.03"},
    {"Dump shadow stats", "DUMPDYNAMICSHADOWSTATS"},
    // These three are sub-tokens of SHADERCOMPLEXITY, not commands of their
    // own: the handler at 0x8230AA2C only reaches them after matching
    // SHADERCOMPLEXITY and pulling the next token.
    {"Shader complexity additive", "SHADERCOMPLEXITY TOGGLEADDITIVE"},
    {"Shader complexity pixel", "SHADERCOMPLEXITY TOGGLEPIXEL"},
    {"Shader complexity max", "SHADERCOMPLEXITY MAX ", "1.0"},
    {"Collision overlay", "TOGGLECOLLISIONOVERLAY"},
    {"Missing phys materials", "LISTMISSINGPHYSICALMATERIALS"},
    {"Precache", "PRECACHE"},
    {"Kill particles", "KILLPARTICLES"},
    {"Gamma", "GAMMA ", "1.0"},
    {"VSync", "VSYNC ", "1"},
    {"Tiling", "TILING ", "1"},
    {"Tiling mode", "TILINGMODE ", "1"},
    {"Movie test", "MOVIETEST"},
    {"Dump shader stats", "DUMPSHADERSTATS"},
    // RecompileGlobalShaders is the only top-level literal the dispatcher
    // matches; "RecompileShaders <x>" strings in the binary are log formats.
    {"Recompile global shaders", "RecompileGlobalShaders"},
    {"Rebuild distro", "rebuilddistro"},
    {"Set resolution", "SETRES ", "1280x720"},
};

// SCALE is the detail-mode scalability system. SET/TOGGLE take one of
// DYNAMICDECALS, DYNAMICLIGHTS, DYNAMICSHADOWS, STATICDECALS,
// LIGHTENVIRONMENTSHADOWS, MOTIONBLUR, SPEEDTREEFRONDS, SPEEDTREELEAVES,
// ONLYSTREAMINTEXTURES, SKELETALMESHLODBIAS, PARTICLELODBIAS, DEPTHOFFIELD,
// BLOOM, QUALITYBLOOM, DETAILMODE or SCREENPERCENTAGE.
inline constexpr DebugCommandEntry kScalability[] = {
    {"Fastest", "SCALE FASTEST"},
    {"Low end", "SCALE LOWEND"},
    {"High end", "SCALE HIGHEND"},
    {"Prettiest", "SCALE PRETTIEST"},
    {"Toggle flag", "SCALE TOGGLE ", "MOTIONBLUR"},
    {"Set flag", "SCALE SET ", "DETAILMODE 2"},
    {"Screen percentage", "SCALE SET SCREENPERCENTAGE ", "100"},
};

inline constexpr DebugCommandEntry kPostProcess[] = {
    {"Scene shadows", "POSTPROCESS SCENESHADOWS ", "0 0 0"},
    {"Scene highlights", "POSTPROCESS SCENEHIGHLIGHTS ", "1 1 1"},
    {"Scene midtones", "POSTPROCESS SCENEMIDTONES ", "1 1 1"},
    {"Scene desaturation", "POSTPROCESS SCENEDESATURATION ", "0"},
};

inline constexpr DebugCommandEntry kContent[] = {
    {"List textures", "LISTTEXTURES"},
    {"List streaming", "LISTTEXTURES STREAMING"},
    {"List non-streaming", "LISTTEXTURES NONSTREAMING"},
    {"Available tex mem", "AVAILABLETEXMEM"},
    {"Only stream in textures", "ONLYSTREAMINTEXTURES"},
    {"List anim sets", "LISTANIMSETS"},
    {"Anim seq stats", "ANIMSEQSTATS"},
    {"Show hot Kismet", "SHOWHOTKISMET"},
    {"Streaming volumes on", "TOGGLESTREAMINGVOLUMES ON"},
    {"Streaming volumes off", "TOGGLESTREAMINGVOLUMES OFF"},
    {"Streaming push view", "TOGGLESTREAMINGVOLUMES PUSHVIEW"},
    {"Meshes with collision", "MeshesWithCollision"},
    {"List loaded packages", "ListLoadedPackages"},
    {"List precache packages", "ListPrecacheMapPackages"},
};

inline constexpr DebugCommandEntry kMemory[] = {
    {"Mem", "MEM"},
    {"Mem stat", "MEM STAT"},
    {"Mem detailed", "MEM DETAILED"},
    {"Find leaks", "MEM FindLeaks"},
    {"Set baseline", "MEM SetBaseline"},
    {"Mem report", "MemReport"},
    {"Frag check", "MemFragCheck"},
    {"Frag check post GC", "MemFragCheckPostGC"},
    {"Leak check", "MemLeakCheck"},
    {"Leak check post GC", "MemLeakCheckPostGC"},
    {"Dump allocs", "DUMPALLOCS"},
    {"Dump allocs summary", "DUMPALLOCS SUMMARYONLY -AlphaSort"},
    {"Trim memory", "TRIMMEMORY"},
    {"Memory split", "MEMORYSPLIT"},
    {"Particle memory", "PARTICLEMEMORY"},
    {"Particle mesh usage", "PARTICLEMESHUSAGE"},
    {"Dump particle counts", "DUMPPARTICLECOUNTS"},
    {"Audio mem", "AUDIOMEM"},
    {"XMem dump", "XMEMDUMP"},
    {"GPU resource dump", "GPURESOURCEDUMP"},
    {"GPU resources detailed", "DUMPGPURESOURCES DETAILED"},
    {"Config mem", "CONFIGMEM"},
    {"Config hash", "CONFIGHASH"},
    {"Name hash", "NAMEHASH"},
    {"View names", "VIEWNAMES"},
};

inline constexpr DebugCommandEntry kObjects[] = {
    {"Obj list", "OBJ LIST"},
    {"Obj list class", "OBJ LIST CLASS=", "Actor"},
    {"Obj classes", "OBJ CLASSES"},
    {"Obj garbage", "OBJ GARBAGE"},
    {"Obj GC", "OBJ GC"},
    {"Obj mark", "OBJ MARK"},
    {"Obj mark check", "OBJ MARKCHECK"},
    {"Obj refs", "OBJ REFS NAME=", ""},
    {"Obj hash", "OBJ HASH"},
    {"Obj linkers", "OBJ LINKERS"},
    {"Obj components", "OBJ COMPONENTS"},
    {"Obj flags", "OBJ FLAGS"},
    {"Obj bulk", "OBJ BULK"},
    {"Obj net", "OBJ NET"},
    {"Obj dependencies", "OBJ DEPENDENCIES PACKAGE=", ""},
    {"Obj dump", "OBJ DUMP ", ""},
    {"Get", "GET ", "Engine Class"},
    {"Get all", "GETALL ", "Actor bHidden"},
    {"Get all state", "GETALLSTATE ", "Actor"},
    {"Set", "SET ", "D3DRenderDevice UsePostProcessEffects True"},
    {"Set (no PEC)", "SETNOPEC ", ""},
    {"Verify components", "VERIFYCOMPONENTS"},
    {"Dump natives", "DUMPNATIVES"},
    {"Dump backtraces", "DUMPBACKTRACES"},
};

inline constexpr DebugCommandEntry kAudio[] = {
    {"List sounds", "ListSounds"},
    {"List sound durations", "LISTSOUNDDURATIONS"},
    {"Reset sound state", "ResetSoundState"},
    {"Isolate dry audio", "IsolateDryAudio"},
    {"Isolate reverb", "IsolateReverb"},
    {"Isolate EQ", "IsolateEQ"},
    {"Isolate radio", "ISOLATERADIO"},
    {"Isolate center voice", "ISOLATECENTERVOICE"},
    {"Test low pass filter", "TestLowPassFilter"},
    {"Test EQ filter", "TestEQFilter"},
    {"Set sound mode", "SetSoundMode ", ""},
    {"Set mic input level", "SetMicInputLevel ", "1.0"},
    {"Music volume", "MUSIC ", "1.0"},
    {"Master volume", "MASTERVOL ", "1.0"},
    {"Bank report", "BANKREPORT"},
    {"Debug audio all", "DEBUGAUDIO ALL"},
    {"Debug audio off", "DEBUGAUDIO OFF"},
};

// NXVIS takes one PhysX debug-visualisation flag; the full set the dispatcher
// matches is listed in the tooltip.
inline constexpr DebugCommandEntry kPhysics[] = {
    {"NX stats", "NXSTATS"},
    {"NX dump mem", "NXDUMPMEM"},
    {"NX vis", "NXVIS ", "COLLISION"},
    {"NX vis collision AABBs", "NXVIS COLLISIONAABBS"},
    {"NX vis contacts", "NXVIS CONTACTS"},
    {"NX vis contact force", "NXVIS CONTACTFORCE"},
    {"NX vis world axes", "NXVIS WORLDAXES"},
    {"NX vis body axes", "NXVIS BODYAXES"},
    {"NX vis mass axes", "NXVIS MASSAXES"},
    {"NX vis joint limits", "NXVIS JOINTLIMITS"},
    {"NX vis CCD", "NXVIS CCD"},
    {"NX vis force fields", "NXVIS FORCEFIELDS"},
    {"Dump awake", "DUMPAWAKE"},
    {"Dump dynamic", "DUMPDYNAMIC"},
    {"Dump sim islands", "DUMPSIMISLANDS"},
    {"Phys iteration limit", "GLimitPhysIterations ", "1"},
};

inline constexpr DebugCommandEntry kNavigation[] = {
    {"Show octree", "SHOWOCTREE"},
    {"Analyze octree", "ANALYZEOCTREE"},
    {"Nav octree stats", "NAVOCTREE STATS"},
    {"Nav octree find", "NAVOCTREE FIND NAME=", ""},
    {"Nav analyze octree", "NAVANALYZEOCTREE"},
    {"Show scene quadtree", "SHOWSCENEQUADTREE"},
    {"Analyze scene quadtree", "ANALYZESCENEQUADTREE"},
    {"Define paths", "DEFINEPATHS"},
    {"Define paths (review)", "DEFINEPATHS REVIEWPATHS=1"},
    {"Add long reach specs", "ADDLONGREACHSPECS"},
    {"Path collision on", "SETPATHCOLLISION ENABLED=1"},
    {"Path collision off", "SETPATHCOLLISION ENABLED=0"},
    {"Show extent line check", "SHOWEXTENTLINECHECK"},
    {"Show line check", "SHOWLINECHECK"},
    {"Show point check", "SHOWPOINTCHECK"},
    {"Flush debug lines", "FLUSHPERSISTENTDEBUGLINES"},
};

// Character LOD manager.
inline constexpr DebugCommandEntry kCharLod[] = {
    {"On", "CHARLOD on"},
    {"Off", "CHARLOD off"},
    {"Behind only", "CHARLOD behindonly"},
    {"Behind pretend", "CHARLOD behindpretend"},
    {"Debug", "CHARLOD debug"},
    {"Show dist", "CHARLOD showdist"},
    {"Set dist", "CHARLOD setdist ", "medium"},
    {"Dump one frame", "CHARLOD dumponeframe"},
    {"Dump multi lines", "CHARLOD dumpmultilines"},
    {"Dump dist table", "CHARLOD dumpdisttable"},
    {"Opt out on", "CHARLOD optouton"},
    {"Opt out off", "CHARLOD optoutoff"},
    {"Resort", "CHARLOD resort"},
    {"Full sort", "CHARLOD fullsort"},
};

inline constexpr DebugCommandEntry kCapture[] = {
    {"Screenshot", "SHOT"},
    {"Screenshot (alt)", "SCREENSHOT"},
    {"Tiled shot", "TILEDSHOT ", "2"},
    {"Profile script start", "PROFILESCRIPT START"},
    {"Profile script stop", "PROFILESCRIPT STOP"},
    {"Script profiler start", "SCRIPTPROFILER START"},
    {"Script profiler stop", "SCRIPTPROFILER STOP"},
    {"CPU trace", "CPUTRACE"},
    {"Struct perf start", "STRUCTPERFDATA START"},
    {"Struct perf stop", "STRUCTPERFDATA STOP"},
    {"Struct perf reset", "STRUCTPERFDATA RESET"},
    {"Trace game tick", "TRACEGAMETICK"},
    {"Trace render tick", "TRACERENDERTICK"},
    {"Suppress", "SUPPRESS ", ""},
    {"Unsuppress", "UNSUPPRESS ", ""},
};

inline constexpr DebugCommandEntry kLevel[] = {
    {"Open map", "OPEN ", "is_paradiso"},
    {"Stream map", "STREAMMAP ", ""},
    {"Server travel", "SERVERTRAVEL ", ""},
    {"Toggle SFO", "TOGGLESFO", nullptr, kFallsThrough},
    {"Exec file", "EXEC ", ""},
    {"Cancel matinee", "CANCELMATINEE"},
    {"Abort matinee", "ABORTMATINEE"},
    {"Disconnect", "DISCONNECT"},
    {"Reconnect", "RECONNECT"},
    {"Cancel", "CANCEL"},
    {"Reset loaders", "RESETLOADERS"},
    {"Show log", "SHOWLOG"},
    {"Game version", "GAMEVERSION"},
    {"Crack URL", "CRACKURL ", ""},
    {"Defer", "DEFER ", ""},
    {"Dir", "DIR ", ""},
    {"Enable exec components", "EnableCPExecComponent"},
    {"Exit", "EXIT"},
};

// ---------------------------------------------------------------------------
// Kronos script exec functions -- the shipped dev keyboard layout
// ---------------------------------------------------------------------------

inline constexpr DebugCommandEntry kCheats[] = {
    {"All ammo (F9)", "AllAmmo"},
    {"All weapons on (F11)", "AllWeapons true"},
    {"All weapons off (F10)", "AllWeapons false"},
    {"Infinite UFO ability", "InfiniteUFOAbility"},
    {"Spawn next human", "SpawnNextHuman"},
    {"Add alert points", "AddAlertPoints"},
    {"Remove alert points", "RemoveAlertPoints"},
    {"Freeze AI (F3)", "playersonly"},
    {"Toggle HUD (F8)", "ToggleHUD"},
    {"Show scores (F1)", "showscores"},
    {"Show map (F2)", "showmap"},
    {"Toggle navigation map", "ToggleNavigationMap"},
    {"Quick save", "quicksave"},
    {"Quick load", "quickload"},
    {"Reload user prefs", "ReloadUserPrefs"},
    {"Drop all", "dropall"},
    {"Switch to best weapon", "SwitchToBestWeapon"},
    {"Switch weapon", "switchweapon ", "1"},
    {"Next weapon", "NextWeapon"},
    {"Previous weapon", "PrevWeapon"},
    {"Next alt weapon", "NextAltWeapon"},
    {"Toggle fire modes", "ToggleFireModes"},
    {"Fling PK", "FlingPK"},
    {"Crypto weapon B", "CryptoWeaponB"},
    {"Crypto weapon X", "CryptoWeaponX"},
    {"Crypto weapon X (RT)", "CryptoWeaponXRT"},
    {"Crypto weapon Y", "CryptoWeaponY"},
    {"Use vehicle", "UseVehicle"},
    {"Change posture", "ChangePosture"},
    {"Toggle physics mode", "TogglePhysicsMode"},
    {"Pause", "Pause"},
    {"Snapshot toggle", "Snapshot toggle"},
    {"Invert mouse", "InvertMouse"},
    {"Vert flight", "VertFlight"},
    {"Aim zoom", "AimZoom"},
    {"Close map menu", "CloseMapMenu"},
};

inline constexpr DebugCommandEntry kCamera[] = {
    {"Free cam on", "FreeCam on"},
    {"Free cam off", "FreeCam off"},
    {"Free cam reset", "FreeCam reset"},
    {"Camera default", "Camera Default"},
    {"Camera first person", "Camera FirstPerson"},
    {"Camera third person", "Camera ThirdPerson"},
    {"Camera scale +", "addcamerascale 5"},
    {"Camera scale -", "addcamerascale -5"},
    {"Camera scale", "addcamerascale ", "5"},
};

inline constexpr DebugCommandEntry kKronosDebug[] = {
    {"Pawn names", "PawnNames"},
    {"Pawn in front", "PawnInFront"},
    {"Toggle spatial debug lines", "ToggleSpatialDebugLines"},
    {"Grow spatial extent", "GrowSpatialExtent"},
    {"Shrink spatial extent", "ShrinkSpatialExtent"},
    {"Toggle actor mgr debug lines", "ToggleActorMgrDebugLines"},
    {"Grow actor mgr extent", "GrowActorMgrExtent"},
    {"Shrink actor mgr extent", "ShrinkActorMgrExtent"},
    {"Toggle combat spawning", "ToggleCombatSpawning"},
    {"Add autopilot nav point 1", "AddAutoPilotNavPoint UFOExitPathNode1 50"},
    {"Add autopilot nav point 2", "AddAutoPilotNavPoint UFOExitPathNode2 200"},
    {"Deactivate autopilot", "DeactivateAutoPilot"},
    {"Add autopilot nav point", "AddAutoPilotNavPoint ", "UFOExitPathNode1 50"},
};

template <size_t N>
constexpr DebugCommandGroup MakeGroup(const char* name, const DebugCommandEntry (&e)[N],
                                      bool open = false) {
  return DebugCommandGroup{name, e, N, open};
}

inline const DebugCommandGroup* Groups(size_t& count) {
  static const DebugCommandGroup groups[] = {
      MakeGroup("Kronos cheats", kCheats, true),
      MakeGroup("Kronos camera", kCamera),
      MakeGroup("Kronos debug draw", kKronosDebug),
      MakeGroup("View modes", kViewModes, true),
      MakeGroup("Show flags", kShowFlags),
      MakeGroup("Stats & charts", kStats),
      MakeGroup("Rendering", kRendering),
      MakeGroup("Scalability", kScalability),
      MakeGroup("Post process", kPostProcess),
      MakeGroup("Textures & streaming", kContent),
      MakeGroup("Memory", kMemory),
      MakeGroup("Objects & properties", kObjects),
      MakeGroup("Audio", kAudio),
      MakeGroup("Physics", kPhysics),
      MakeGroup("Navigation & paths", kNavigation),
      MakeGroup("Character LOD", kCharLod),
      MakeGroup("Capture & profiling", kCapture),
      MakeGroup("Level & session", kLevel),
  };
  count = sizeof(groups) / sizeof(groups[0]);
  return groups;
}

inline bool ContainsNoCase(const char* haystack, const std::string& needle) {
  if (needle.empty()) {
    return true;
  }
  const size_t hn = std::strlen(haystack);
  if (needle.size() > hn) {
    return false;
  }
  for (size_t i = 0; i + needle.size() <= hn; ++i) {
    size_t j = 0;
    for (; j < needle.size(); ++j) {
      const int a = std::tolower(static_cast<unsigned char>(haystack[i + j]));
      const int b = std::tolower(static_cast<unsigned char>(needle[j]));
      if (a != b) {
        break;
      }
    }
    if (j == needle.size()) {
      return true;
    }
  }
  return false;
}

}  // namespace redahm_debug_commands

class DebugCommandOverlayDialog : public rex::ui::ImGuiDialog {
 public:
  explicit DebugCommandOverlayDialog(rex::ui::ImGuiDrawer* drawer)
      : rex::ui::ImGuiDialog(drawer) {
    rex::ui::RegisterBind("bind_debug_commands", "F5", "Toggle debug command overlay",
        [this] { visible_ = !visible_; });
  }

  ~DebugCommandOverlayDialog() { rex::ui::UnregisterBind("bind_debug_commands"); }

  void OnDraw(ImGuiIO& io) override {
    if (!visible_) {
      return;
    }

    ImGui::SetNextWindowSize(ImVec2(560.0f, 640.0f), ImGuiCond_FirstUseEver);
    ImGui::SetNextWindowPos(ImVec2(40.0f, 60.0f), ImGuiCond_FirstUseEver);

    if (ImGui::Begin("Debug Commands", &visible_)) {
      DrawStatus();

      ImGui::SetNextItemWidth(-90.0f);
      ImGui::InputTextWithHint("##filter", "Filter commands...", filter_, sizeof(filter_));
      ImGui::SameLine();
      if (ImGui::Button("Clear")) {
        filter_[0] = '\0';
      }


      const std::string filter(filter_);

      ImGui::BeginChild("##commands", ImVec2(0.0f, -bottom_height_), false);
      size_t group_count = 0;
      const auto* groups = redahm_debug_commands::Groups(group_count);
      for (size_t g = 0; g < group_count; ++g) {
        DrawGroup(groups[g], filter);
      }
      ImGui::EndChild();

      DrawSplitter();
      DrawCustom();
      DrawHistory();
    }
    ImGui::End();
  }

 private:
  void DrawStatus() {
    const uint32_t self = RedahmConsoleExecObject();
    const uint32_t ar = RedahmConsoleOutputDevice();

    if (self != 0 && ar != 0) {
      ImGui::TextColored(ImVec4(0.4f, 0.9f, 0.4f, 1.0f), "Console ready.");
      ImGui::SameLine();
      ImGui::TextDisabled("engine %08X  Ar %08X", self, ar);
      const size_t depth = RedahmConsoleQueueDepth();
      if (depth != 0) {
        ImGui::SameLine();
        ImGui::TextDisabled("| %zu queued", depth);
      }
    } else {
      ImGui::TextColored(ImVec4(1.0f, 0.6f, 0.2f, 1.0f),
                         "Not dispatching yet (engine %08X, Ar %08X).", self, ar);
      ImGui::TextWrapped(
          self == 0
              ? "Waiting on the first engine Exec call to latch the object to "
                "call. Anything the game dispatches does it -- open a map, or "
                "press a controller button in a level. Commands queued now run "
                "as soon as that happens."
              : "Waiting on GLog to finish construction. This clears within a "
                "frame or two of engine init.");
    }
    ImGui::Separator();
  }

  // Lays buttons out left to right and wraps at the edge of the content region,
  // so a 37-entry group stays readable at any window width.
  void WrapButton(const DebugCommandEntry& entry) {
    const float window_x2 = ImGui::GetWindowPos().x + ImGui::GetWindowContentRegionMax().x;
    const float spacing = ImGui::GetStyle().ItemSpacing.x;
    const float width =
        ImGui::CalcTextSize(entry.label).x + ImGui::GetStyle().FramePadding.x * 2.0f;

    if (!row_empty_ && last_button_x2_ + spacing + width < window_x2) {
      ImGui::SameLine();
    }

    if (ImGui::Button(entry.label)) {
      Send(entry.cmd);
    }
    Tooltip(entry, "");
    last_button_x2_ = ImGui::GetItemRectMax().x;
    row_empty_ = false;
  }

  static void Tooltip(const DebugCommandEntry& entry, const char* suffix) {
    if (!ImGui::IsItemHovered()) {
      return;
    }
    ImGui::BeginTooltip();
    ImGui::Text("%s%s", entry.cmd, suffix);
    if (entry.note != nullptr) {
      ImGui::Separator();
      ImGui::PushTextWrapPos(360.0f);
      ImGui::TextColored(ImVec4(0.9f, 0.8f, 0.4f, 1.0f), "%s", entry.note);
      ImGui::PopTextWrapPos();
    }
    ImGui::EndTooltip();
  }

  void ArgRow(const DebugCommandEntry& entry) {
    auto& buf = arg_buffers_[entry.cmd];
    if (buf[0] == '\0' && !arg_seeded_[entry.cmd]) {
      arg_seeded_[entry.cmd] = true;
      std::snprintf(buf.data(), buf.size(), "%s", entry.arg);
    }

    ImGui::PushID(entry.cmd);
    const bool run = ImGui::Button(entry.label);
    Tooltip(entry, "<arg>");
    ImGui::SameLine();
    ImGui::SetNextItemWidth(-1.0f);
    const bool submitted = ImGui::InputText("##arg", buf.data(), buf.size(),
                                            ImGuiInputTextFlags_EnterReturnsTrue);
    ImGui::PopID();

    if (run || submitted) {
      Send(std::string(entry.cmd) + buf.data());
    }
    row_empty_ = true;
  }

  void DrawGroup(const DebugCommandGroup& group, const std::string& filter) {
    size_t matches = 0;
    for (size_t i = 0; i < group.count; ++i) {
      if (Matches(group.entries[i], filter)) {
        ++matches;
      }
    }
    if (matches == 0) {
      return;
    }

    if (!filter.empty()) {
      ImGui::SetNextItemOpen(true, ImGuiCond_Always);
    }
    const ImGuiTreeNodeFlags flags =
        group.default_open ? ImGuiTreeNodeFlags_DefaultOpen : ImGuiTreeNodeFlags_None;
    if (!ImGui::CollapsingHeader(group.name, flags)) {
      return;
    }

    row_empty_ = true;
    for (size_t i = 0; i < group.count; ++i) {
      const DebugCommandEntry& entry = group.entries[i];
      if (!Matches(entry, filter)) {
        continue;
      }
      if (entry.arg != nullptr) {
        ArgRow(entry);
      } else {
        WrapButton(entry);
      }
    }
    ImGui::NewLine();
  }

  static bool Matches(const DebugCommandEntry& entry, const std::string& filter) {
    using redahm_debug_commands::ContainsNoCase;
    return ContainsNoCase(entry.label, filter) || ContainsNoCase(entry.cmd, filter);
  }

  void DrawCustom() {
    ImGui::TextUnformatted("Custom command");
    ImGui::SetNextItemWidth(-70.0f);
    const bool submitted = ImGui::InputText("##custom", custom_, sizeof(custom_),
                                            ImGuiInputTextFlags_EnterReturnsTrue);
    ImGui::SameLine();
    if ((ImGui::Button("Run") || submitted) && custom_[0] != '\0') {
      Send(custom_);
    }
  }

  // Drag bar between the command list and the console pane. The output of a
  // single OBJ LIST is worth far more room than the old fixed 140px allowed,
  // and how much depends entirely on what is being looked at.
  void DrawSplitter() {
    ImGui::PushStyleColor(ImGuiCol_Button, ImVec4(0.0f, 0.0f, 0.0f, 0.0f));
    ImGui::PushStyleColor(ImGuiCol_ButtonHovered,
                          ImGui::GetStyleColorVec4(ImGuiCol_SeparatorHovered));
    ImGui::PushStyleColor(ImGuiCol_ButtonActive,
                          ImGui::GetStyleColorVec4(ImGuiCol_SeparatorActive));
    ImGui::Button("##splitter", ImVec2(-1.0f, 6.0f));
    ImGui::PopStyleColor(3);

    if (ImGui::IsItemActive()) {
      bottom_height_ -= ImGui::GetIO().MouseDelta.y;
    }
    if (ImGui::IsItemHovered() || ImGui::IsItemActive()) {
      ImGui::SetMouseCursor(ImGuiMouseCursor_ResizeNS);
    }

    // Upper bound is computed first so it can never fall below the lower one on
    // a very short window, which would make the clamp ill-formed.
    const float max_height = std::max(160.0f, ImGui::GetWindowHeight() - 200.0f);
    bottom_height_ = std::clamp(bottom_height_, 90.0f, max_height);
  }

  static void StatusLabel(RedahmConsoleStatus status) {
    switch (status) {
      case RedahmConsoleStatus::kHandled:
        ImGui::TextColored(ImVec4(0.4f, 0.9f, 0.4f, 1.0f), "handled  ");
        break;
      case RedahmConsoleStatus::kUnhandled:
        ImGui::TextColored(ImVec4(0.9f, 0.7f, 0.3f, 1.0f), "unhandled");
        break;
      case RedahmConsoleStatus::kNotDispatched:
        ImGui::TextColored(ImVec4(0.9f, 0.4f, 0.4f, 1.0f), "not run  ");
        break;
    }
  }

  // The category is the EName the engine tagged the line with, so this is the
  // game's own severity rather than a guess made from the text.
  static ImVec4 CategoryColor(const std::string& category) {
    if (category == "Error" || category == "Critical") {
      return ImVec4(0.95f, 0.45f, 0.45f, 1.0f);
    }
    if (category == "Warning" || category == "ScriptWarning" ||
        category == "ScriptLog") {
      return ImVec4(0.95f, 0.80f, 0.35f, 1.0f);
    }
    if (category == "Cmd" || category == "Init" || category == "Exit") {
      return ImVec4(0.55f, 0.80f, 1.00f, 1.0f);
    }
    return ImVec4(0.82f, 0.82f, 0.82f, 1.0f);
  }

  static void CopyOutput(const std::vector<RedahmConsoleLine>& lines) {
    std::string joined;
    for (const auto& line : lines) {
      joined += line.text;
      joined += '\n';
    }
    ImGui::SetClipboardText(joined.c_str());
  }

  void DrawOutput(const std::vector<RedahmConsoleLine>& lines, bool truncated) {
    if (ImGui::SmallButton("Copy")) {
      CopyOutput(lines);
    }
    if (truncated) {
      ImGui::SameLine();
      ImGui::TextColored(ImVec4(0.9f, 0.7f, 0.3f, 1.0f), "output capped at %zu lines",
                         lines.size());
    }

    // Lines are long (OBJ LIST prints full object paths) and must not wrap, so
    // the pane scrolls horizontally instead.
    const float line_h = ImGui::GetTextLineHeightWithSpacing();
    const float height =
        std::min(260.0f, line_h * static_cast<float>(lines.size()) + line_h);
    ImGui::BeginChild("##lines", ImVec2(0.0f, height), true,
                      ImGuiWindowFlags_HorizontalScrollbar);

    // Clipped: an expanded 512-line dump would otherwise cost a full text
    // layout per line per frame.
    ImGuiListClipper clipper;
    clipper.Begin(static_cast<int>(lines.size()));
    while (clipper.Step()) {
      for (int i = clipper.DisplayStart; i < clipper.DisplayEnd; ++i) {
        const RedahmConsoleLine& line = lines[static_cast<size_t>(i)];
        ImGui::PushStyleColor(ImGuiCol_Text, CategoryColor(line.category));
        ImGui::TextUnformatted(line.text.c_str());
        ImGui::PopStyleColor();
      }
    }
    ImGui::EndChild();
  }

  void DrawHistory() {
    const auto history = RedahmConsoleHistory();
    if (history.empty()) {
      ImGui::TextDisabled("No commands dispatched yet.");
      return;
    }

    ImGui::TextDisabled("Dispatched (newest first)");
    ImGui::SameLine();
    if (ImGui::SmallButton("Clear")) {
      RedahmClearConsoleHistory();
    }

    ImGui::BeginChild("##history", ImVec2(0.0f, 0.0f), true);
    int id = 0;
    for (auto it = history.rbegin(); it != history.rend(); ++it, ++id) {
      ImGui::PushID(id);

      StatusLabel(it->status);
      ImGui::SameLine();

      const size_t line_count = it->output ? it->output->size() : 0;

      ImGuiTreeNodeFlags flags = ImGuiTreeNodeFlags_SpanAvailWidth;
      if (line_count == 0) {
        // A leaf that never pushes, so the no-output rows still line up with
        // the ones that have an arrow.
        flags |= ImGuiTreeNodeFlags_Leaf | ImGuiTreeNodeFlags_NoTreePushOnOpen |
                 ImGuiTreeNodeFlags_Bullet;
      }

      const bool open =
          line_count == 0
              ? ImGui::TreeNodeEx("##entry", flags, "%s", it->cmd.c_str())
              : ImGui::TreeNodeEx("##entry", flags, "%s  (%zu line%s)", it->cmd.c_str(),
                                  line_count, line_count == 1 ? "" : "s");

      if (open && line_count != 0) {
        DrawOutput(*it->output, it->output_truncated);
        ImGui::TreePop();
      }

      ImGui::PopID();
    }
    ImGui::EndChild();
  }

  void Send(std::string cmd) { RedahmQueueConsoleCommand(std::move(cmd)); }

  bool visible_ = false;
  char filter_[128] = {};
  char custom_[192] = {};

  // Height of the custom-command + console area below the splitter.
  float bottom_height_ = 240.0f;

  // Wrapped-button layout state, reset at the start of every group.
  float last_button_x2_ = 0.0f;
  bool row_empty_ = true;

  // Keyed by the entry's command literal, which has static storage duration.
  std::map<const char*, std::array<char, 128>> arg_buffers_;
  std::map<const char*, bool> arg_seeded_;
};

// GRAPHICS and MODS in the game's Options menu.
//
// The in-game Options scene (UI_FrontEnd_InGame: UI_OptionsIG) lists its rows
// in a CPUIStringList, MenuItems, cooked with three ListItems: GAMEPLAY
// (gl.frntend.gmpl), Crypto Layout (gl.frntend.ccrp) and Saucer Layout
// (gl.frntend.cufo). GRAPHICS and MODS are appended through the class's own
// AddListItem, so they draw, highlight and scroll like their neighbours.
//
// Choosing a row runs the scene's Kismet: the accept sound, a fade out, then a
// CPSeqAct_Switch on the row picks a CPUIAction_FireTransition, which the
// background scene (UI_InGameBackground) answers by flipping the menu box,
// fading its row bars (CPUIImage_Bar1..9) to the transition's
// m_NextSceneNumBars and opening m_SceneToOpen. The Switch has nothing wired to
// a fourth or fifth row, so for ours it is pointed at GAMEPLAY's link instead
// and the GAMEPLAY scene (UI_GameOptions_IG) opens exactly as GAMEPLAY does.
// That scene then serves as our page: its title reads GRAPHICS or MODS, its
// toggles and sliders are faded out and its rows are ours.
//
// The graphics page lists the setting categories (DISPLAY, QUALITY, EFFECTS).
// A on a category lists its settings, one per row ("RESOLUTION   1080P");
// there left, right and A step the selected setting and B returns to the
// categories. B on the categories reaches the game, which leaves through the
// scene's own transition.
//
// The mods page lists the folders in mods/ ("RE-ENLIGHTENED   ON"), each
// switched by its redahm_mod_ cvar (mod_loader.cpp): A toggles the selected
// one, left turns it off and right on. Mods load as the game starts, so a
// changed row says RESTART. B leaves as on the graphics page.
//
// On either page changes apply as they are made and X saves them to
// redahm.toml; the title reads "GRAPHICS - X TO SAVE" while there is something
// to save. Leaving without saving puts the last saved values back.
//
// The bar counts follow the rows: the Options scene opens with five bars
// rather than three, a page with one per row, and the page fades the
// background's bars itself as its views change. There are nine bars, so a
// view longer than that scrolls.
//
// Guest layouts (KronosGame.u / Engine.u property order, checked against the
// code that uses them):
//   UObject: Name (FName) at +44; GNames (dword_8375C1B8) entries hold their
//     UTF-16 text at +16.
//   UIScreenObject: Children TArray at +96.
//   UIObject: Owner, then OwnerScene; +364 or +368 depending on whether the
//     class carries an interface table, settled at run time from a list and the
//     menu that owns it.
//   UCPUIStringList: ListItems TArray<FListItem> at +900, StartIndex at +992,
//     curIndex at +996 (counted from StartIndex). FListItem is 40 bytes: Text,
//     LocalizationKey, ItemState and DisplayText. A LocalizationKey of "0" makes
//     DisplayText the Text itself (sub_82B03238).
//   UCPUIFrontEndMenu: m_MenuList at +896.
//   UCPUILabel: LocalizationKey at +916, DrawCaption (what it draws) at +928.
//   CPUI widgets: StartFade (dest alpha in f1, children in r5) and Fade
//     (progress in f1, children in r5) at vtable +652 and +656.
//   UCPSeqAct_Switch: OutputLinks count at +152, Indices TArray<int> at +224.
//   UCPUIAction_FireTransition: m_SceneToOpen at +236, m_NextSceneNumBars at
//     +240, m_TransitionTypeClose at +244.

#include "redahm_engine/settings/graphics_menu.h"

#include <algorithm>
#include <array>
#include <atomic>
#include <cctype>
#include <charconv>
#include <chrono>
#include <mutex>
#include <optional>
#include <string>
#include <string_view>
#include <unordered_map>
#include <utility>
#include <vector>

#include <rex/cvar.h>
#include <rex/hook.h>
#include <rex/ppc/context.h>
#include <rex/ppc/func.h>
#include <rex/types.h>

#include "generated/redahm_init.h"
#include "redahm_engine/gpu/core/guest_memory.h"
#include "redahm_engine/mod/mod_loader.h"
#include "redahm_engine/redahm_logging.h"

// Hooked, their originals run on the caller's own context, untouched:
//   sub_82B03C48  UCPUIStringList render override (list, canvas)
//   sub_82ADA748  UCPUILabel render override (label, canvas)
//   sub_829DBCD0  UCPSeqAct_Switch::Activated (op)
//   sub_82AD6DD0  UCPUIAction_FireTransition::Activated (op)
//   sub_82BEB2C0  XInputGetState (user, state), a tail call to
//                 XamInputGetState; the viewport's controller poll reads the
//                 pad through it.
// Called:
//   sub_82B036C8  UCPUIStringList::AddListItem (list, const FString& Text,
//                 const FString& LocalizationKey)
//   sub_82B037D8  UCPUIStringList::ClearList (list), which leaves the
//                 selection alone
//   sub_822BBE90  FString::operator= (dst, src)
//   sub_82A6FE00  the cast to a CPUI widget, null for anything else
REX_EXTERN(__imp__sub_82B03C48);
REX_EXTERN(__imp__sub_82ADA748);
REX_EXTERN(__imp__sub_829DBCD0);
REX_EXTERN(__imp__sub_82AD6DD0);
REX_EXTERN(__imp__sub_82BEB2C0);
REX_IMPORT(__imp__sub_82B036C8, AddListItem, void(u32, u32, u32));
REX_IMPORT(__imp__sub_82B037D8, ClearList, void(u32));
REX_IMPORT(__imp__sub_822BBE90, AssignFString, void(u32, u32));
REX_IMPORT(__imp__sub_82A6FE00, CastToWidget, u32(u32));

namespace redahm::graphics_menu {

namespace {

namespace mem = redahm::gpu::mem;
using Clock = std::chrono::steady_clock;

constexpr u32 kGNames = 0x8375C1B8;
constexpr u32 kNameEntryText = 16;
constexpr u32 kObjectName = 44;
constexpr u32 kChildren = 96;
// UIObject's own members lie between UIScreenObject's end and UIObject's.
constexpr u32 kUIObjectMembersBegin = 0x154;
constexpr u32 kUIObjectMembersEnd = 0x330;
constexpr u32 kGuestHeapBegin = 0x40000000;

constexpr u32 kListItems = 900;
constexpr u32 kStartIndex = 992;
constexpr u32 kCurIndex = 996;
constexpr u32 kListItemSize = 40;
constexpr u32 kListItemText = 0;
constexpr u32 kListItemLocalizationKey = 12;
// FListItem::ItemState: 0 normal, 1 disabled (half alpha), 2 hidden.
constexpr u32 kListItemState = 24;
constexpr u8 kItemStateNormal = 0;
constexpr u32 kMenuList = 896;
constexpr u32 kLabelLocalizationKey = 916;
constexpr u32 kLabelDrawCaption = 928;
constexpr u32 kStartFade = 652;
constexpr u32 kFade = 656;

constexpr u32 kSwitchOutputLinkCount = 152;
constexpr u32 kSwitchIndices = 224;
constexpr u32 kTransitionSceneToOpen = 236;
constexpr u32 kTransitionNumBars = 240;
constexpr u32 kTransitionClose = 244;

constexpr std::u16string_view kOptionsScene = u"UI_OptionsIG";
constexpr std::u16string_view kGameplayScene = u"UI_GameOptions_IG";
// Scenes the Options menu opens, whose close transitions return to it.
constexpr std::u16string_view kOptionsChildScenes[] = {
    u"UI_GameOptions_IG", u"UI_CryptoControls_IG", u"UI_UFOControls_IG"};

constexpr std::u16string_view kGameplayKey = u"gl.frntend.gmpl";
constexpr std::u16string_view kCryptoLayoutKey = u"gl.frntend.ccrp";
constexpr std::u16string_view kLiteralKey = u"0";
constexpr std::u16string_view kGraphicsText = u"GRAPHICS";
constexpr std::u16string_view kModsText = u"MODS";
constexpr std::u16string_view kNoModsText = u"NO MODS FOUND";
constexpr u32 kStockItemCount = 3;
constexpr i32 kGraphicsIndex = i32(kStockItemCount);
constexpr i32 kModsIndex = kGraphicsIndex + 1;
constexpr u32 kItemCount = kStockItemCount + 2;
// The Options switch's output for GAMEPLAY.
constexpr i32 kGameplayLink = 0;
// Bars the Options scene is cooked with, and with GRAPHICS and MODS.
constexpr i32 kStockOptionsBars = 3;
constexpr i32 kOptionsBars = i32(kItemCount);
// The background scene's row bars (CPUIImage_Bar1..9).
constexpr u32 kBarCount = 9;

// X_INPUT_STATE: dwPacketNumber, then XINPUT_GAMEPAD.
constexpr u32 kGamepad = 4;
constexpr u32 kThumbLX = kGamepad + 4;
constexpr u16 kPadUp = 0x0001;
constexpr u16 kPadDown = 0x0002;
constexpr u16 kPadLeft = 0x0004;
constexpr u16 kPadRight = 0x0008;
constexpr u16 kPadA = 0x1000;
constexpr u16 kPadB = 0x2000;
constexpr u16 kPadX = 0x4000;
constexpr i16 kStickThreshold = 16000;

// A widget counts as on screen while it has drawn this recently.
constexpr auto kOnScreenFor = std::chrono::milliseconds(150);
// How long an A press on GRAPHICS or MODS waits for the Options Kismet to reach its
// switch (it fades the menu out first).
constexpr auto kArmedFor = std::chrono::seconds(2);

//------------------------------------------------------------------------------
// Settings
//------------------------------------------------------------------------------

struct Option {
  std::u16string_view label;
  const char* value;
};

// The page opens on its categories; choosing one lists its settings.
enum Category : int { kDisplay, kQuality, kEffects, kCategoryCount };
constexpr std::u16string_view kCategoryLabels[kCategoryCount] = {u"DISPLAY", u"QUALITY",
                                                                 u"EFFECTS"};

// A number moved in steps between min and max; the row shows a bar and the
// number, the game's own value marked, the top one by its label.
struct Slider {
  int min;
  int max;
  int step;
  int original;
  std::u16string_view max_label;
};

struct Setting {
  Category category;
  std::u16string_view label;
  const char* cvar;
  std::vector<Option> options;
  // Takes effect only when the game next starts.
  bool restart;
  // Set for a number rather than a list of options.
  std::optional<Slider> slider = std::nullopt;
};

const std::vector<Setting>& Settings() {
  static const std::vector<Setting> settings = {
      {kDisplay, u"RESOLUTION", "redahm_resolution",
       {{u"480P", "480p"}, {u"720P", "720p"}, {u"1080P", "1080p"}, {u"1440P", "1440p"},
        {u"4K", "4k"}},
       true},
      {kDisplay, u"FRAME RATE", "redahm_frame_cap",
       {{u"30", "30"}, {u"60", "60"}, {u"75", "75"}, {u"90", "90"}, {u"120", "120"},
        {u"144", "144"}, {u"DISPLAY", "display"}, {u"OFF", "off"}},
       false},
      {kDisplay, u"VSYNC", "redahm_vsync", {{u"OFF", "false"}, {u"ON", "true"}}, false},
      {kDisplay, u"DISPLAY MODE", "fullscreen",
       {{u"WINDOWED", "false"}, {u"FULLSCREEN", "true"}}, false},
      {kDisplay, u"PICTURE", "redahm_stretch_output",
       {{u"LETTERBOX", "false"}, {u"STRETCH", "true"}}, false},
      {kDisplay, u"HUD", "redahm_hud", {{u"OFF", "false"}, {u"ON", "true"}}, false},
      {kDisplay, u"GRAPHICS API", "redahm_gpu_api",
       {{u"DIRECT3D 12", "d3d12"}, {u"VULKAN", "vulkan"}}, true},
      {kQuality, u"ANISOTROPY", "redahm_anisotropy",
       {{u"OFF", "off"}, {u"2X", "2x"}, {u"4X", "4x"}, {u"8X", "8x"}, {u"16X", "16x"}},
       false},
      {kQuality, u"SHADOWS", "redahm_shadows",
       {{u"OFF", "off"}, {u"LOW", "low"}, {u"ORIGINAL", "original"}, {u"HIGH", "high"},
        {u"ULTRA", "ultra"}},
       false},
      {kQuality, u"LEVEL OF DETAIL", "redahm_lod", {{u"ON", "on"}, {u"OFF (FULL DETAIL)", "off"}},
       false},
      // In the game's units: 30000 is its own reach (graphics_settings.cpp).
      {kQuality, u"DRAW DISTANCE", "redahm_draw_distance",
       {{u"ORIGINAL", "30000"}, {u"FAR", "60000"}, {u"VERY FAR", "120000"}}, false},
      {kQuality, u"DETAILED BUILDINGS", "redahm_building_detail",
       {{u"NEAR (ORIGINAL)", "near"}, {u"WITHIN DRAW DISTANCE", "draw_distance"}}, false},
      {kQuality, u"DECALS", "redahm_decals", {{u"OFF", "false"}, {u"ON", "true"}}, false},
      {kQuality, u"SMALL OBJECT CULLING", "redahm_small_object_cull",
       {{u"OFF", "off"}, {u"LOW", "low"}, {u"MEDIUM", "medium"}, {u"HIGH", "high"}}, false},
      {kQuality, u"OCCLUSION IN DEPTH PASS", "redahm_occlusion_depth_pass",
       {{u"OFF", "false"}, {u"ON", "true"}}, false},
      {kEffects, u"BLOOM", "redahm_bloom", {{u"OFF", "false"}, {u"ON", "true"}}, false},
      {kEffects, u"DEPTH OF FIELD", "redahm_depth_of_field",
       {{u"OFF", "false"}, {u"ON", "true"}}, false},
      {kEffects, u"DISTORTION", "redahm_distortion", {{u"OFF", "false"}, {u"ON", "true"}},
       false},
      {kEffects, u"MOTION BLUR", "disable_motion_blur", {{u"ON", "false"}, {u"OFF", "true"}},
       true},
  };
  return settings;
}

// The settings of a category, as indices into Settings().
std::vector<size_t> CategorySettings(int category) {
  std::vector<size_t> rows;
  for (size_t i = 0; i < Settings().size(); ++i) {
    if (Settings()[i].category == category)
      rows.push_back(i);
  }
  return rows;
}

std::string Lowercase(std::string value) {
  for (char& c : value)
    c = static_cast<char>(std::tolower(static_cast<unsigned char>(c)));
  return value;
}

std::string CurrentValue(const Setting& setting) {
  return Lowercase(rex::cvar::GetFlagByName(setting.cvar));
}

std::vector<std::string> CurrentValues() {
  std::vector<std::string> values;
  for (const Setting& setting : Settings())
    values.push_back(CurrentValue(setting));
  return values;
}

int FindOption(const Setting& setting, const std::string& value) {
  for (size_t i = 0; i < setting.options.size(); ++i) {
    if (value == setting.options[i].value)
      return int(i);
  }
  return -1;
}

// The values the running game started with, so restart-bound rows can say
// when they have been changed.
const std::vector<std::string>& BootValues() {
  static const std::vector<std::string> values = CurrentValues();
  return values;
}

// A slider's value, on its grid and within its range.
int SliderValue(const Setting& setting) {
  const Slider& slider = *setting.slider;
  const std::string text = CurrentValue(setting);
  int value = slider.original;
  std::from_chars(text.data(), text.data() + text.size(), value);
  value = std::clamp(value, slider.min, slider.max);
  return slider.min + (value - slider.min + slider.step / 2) / slider.step * slider.step;
}

// "[=====-------]  120000", with the game's own value and the top one named.
std::u16string SliderText(const Setting& setting) {
  constexpr int kMarks = 12;
  const Slider& slider = *setting.slider;
  const int value = SliderValue(setting);
  const int filled = int((long long)(value - slider.min) * kMarks / (slider.max - slider.min));
  std::u16string text = u"[";
  for (int i = 0; i < kMarks; ++i)
    text += i < filled ? u'=' : u'-';
  text += u"]  ";
  if (value >= slider.max) {
    text += slider.max_label;
    return text;
  }
  for (char c : std::to_string(value))
    text += char16_t(c);
  if (value == slider.original)
    text += u" (ORIGINAL)";
  return text;
}

std::u16string RowText(size_t index) {
  const Setting& setting = Settings()[index];
  const std::string value = CurrentValue(setting);
  const int option = FindOption(setting, value);
  std::u16string text(setting.label);
  text += u"   ";
  if (setting.slider) {
    text += SliderText(setting);
  } else if (option >= 0) {
    text += setting.options[option].label;
  } else {
    for (char c : value)
      text += char16_t(std::toupper(static_cast<unsigned char>(c)));
  }
  if (setting.restart && value != BootValues()[index])
    text += u"   RESTART";
  return text;
}

// Moves a setting one option (or one slider step) along, stopping at either
// end.
void StepSetting(size_t index, int direction) {
  const Setting& setting = Settings()[index];
  if (setting.slider) {
    const int value = SliderValue(setting);
    const int next =
        std::clamp(value + direction * setting.slider->step, setting.slider->min, setting.slider->max);
    if (next != value || CurrentValue(setting) != std::to_string(value))
      rex::cvar::SetFlagByName(setting.cvar, std::to_string(next));
    return;
  }
  const int count = int(setting.options.size());
  const int current = FindOption(setting, CurrentValue(setting));
  const int next = current < 0 ? 0 : std::clamp(current + direction, 0, count - 1);
  if (next != current)
    rex::cvar::SetFlagByName(setting.cvar, setting.options[next].value);
}

//------------------------------------------------------------------------------
// Mods
//------------------------------------------------------------------------------

// The mod folders, as found when the game started (a new one needs a restart
// to get its cvar).
const std::vector<redahm::mods::Mod>& ModList() {
  static const std::vector<redahm::mods::Mod> mods = redahm::mods::Mods();
  return mods;
}

bool ModEnabled(const redahm::mods::Mod& mod) {
  return Lowercase(rex::cvar::GetFlagByName(mod.cvar)) == "true";
}

std::u16string ModRowText(const redahm::mods::Mod& mod) {
  const bool enabled = ModEnabled(mod);
  std::u16string text = mod.label;
  text += enabled ? u"   ON" : u"   OFF";
  if (enabled != mod.loaded)
    text += u"   RESTART";
  return text;
}

void SetMod(size_t index, bool enabled) {
  const redahm::mods::Mod& mod = ModList()[index];
  if (ModEnabled(mod) != enabled)
    rex::cvar::SetFlagByName(mod.cvar, enabled ? "true" : "false");
}

//------------------------------------------------------------------------------
// Guest objects
//------------------------------------------------------------------------------

std::u16string ReadFString(u32 fstring) {
  const u32 data = mem::Load<u32>(fstring);
  const i32 num = mem::Load<i32>(fstring + 4);
  std::u16string text;
  // Num counts the terminator.
  for (i32 i = 0; data && i + 1 < num; ++i)
    text += char16_t(mem::Load<u16>(data + u32(i) * 2));
  return text;
}

std::u16string ObjectName(u32 object) {
  if (!object)
    return {};
  const i32 index = mem::Load<i32>(object + kObjectName);
  const u32 names = mem::Load<u32>(kGNames);
  const i32 count = mem::Load<i32>(kGNames + 4);
  if (!names || index < 0 || index >= count)
    return {};
  const u32 entry = mem::Load<u32>(names + u32(index) * 4);
  std::u16string name;
  for (u32 i = 0; entry && i < 128; ++i) {
    const char16_t c = char16_t(mem::Load<u16>(entry + kNameEntryText + i * 2));
    if (!c)
      break;
    name += c;
  }
  return name;
}

// Whether a guest address lies in committed, readable memory; the owner
// search below follows whatever each field holds.
bool Readable(u32 address) {
  if (address < kGuestHeapBegin)
    return false;
  auto* heap = mem::Memory()->LookupHeap(address);
  u32 protect = 0;
  return heap && heap->QueryProtect(address, &protect) &&
         (protect & rex::memory::kMemoryProtectRead);
}

// UIObject::Owner's offset, learnt from the first list whose owning menu
// points back at it: the first field of UIObject's own members that holds the
// menu (DockTargets, further on, can name it too).
std::atomic<i32> g_owner_offset{-1};

void LearnOwnerOffset(u32 list) {
  if (g_owner_offset.load(std::memory_order_relaxed) >= 0)
    return;
  for (u32 offset = kUIObjectMembersBegin; offset < kUIObjectMembersEnd; offset += 4) {
    const u32 menu = mem::Load<u32>(list + offset);
    if (!Readable(menu + kMenuList) || mem::Load<u32>(menu + kMenuList) != list)
      continue;
    g_owner_offset.store(i32(offset), std::memory_order_relaxed);
    const u32 scene = mem::Load<u32>(list + offset + 4);
    const std::u16string name = ObjectName(scene);
    RDAHM_INFO("[graphics menu] UIObject::Owner at +{}, list {:08X} in scene '{}'", offset, list,
               std::string(name.begin(), name.end()));
    return;
  }
}

u32 OwnerOf(u32 widget) {
  const i32 offset = g_owner_offset.load(std::memory_order_relaxed);
  return offset < 0 ? 0 : mem::Load<u32>(widget + u32(offset));
}

u32 SceneOf(u32 widget) {
  const i32 offset = g_owner_offset.load(std::memory_order_relaxed);
  return offset < 0 ? 0 : mem::Load<u32>(widget + u32(offset) + 4);
}

u32 ListItemCount(u32 list) {
  return mem::Load<u32>(list + kListItems + 4);
}

u32 ListItem(u32 list, u32 index) {
  return mem::Load<u32>(list + kListItems) + index * kListItemSize;
}

i32 SelectedRow(u32 list) {
  return mem::Load<i32>(list + kStartIndex) + mem::Load<i32>(list + kCurIndex);
}

// The Options list as cooked: its first two keys are GAMEPLAY and Crypto
// Layout, whether or not GRAPHICS has been added yet.
bool HasOptionsRows(u32 list) {
  const u32 count = ListItemCount(list);
  if (count < kStockItemCount || count > kItemCount)
    return false;
  return ReadFString(ListItem(list, 0) + kListItemLocalizationKey) == kGameplayKey &&
         ReadFString(ListItem(list, 1) + kListItemLocalizationKey) == kCryptoLayoutKey;
}

void WriteFString(u32 at, u32 chars, std::u16string_view text) {
  for (size_t i = 0; i < text.size(); ++i)
    mem::Store<u16>(chars + u32(i) * 2, text[i]);
  mem::Store<u16>(chars + u32(text.size()) * 2, 0);
  mem::Store<u32>(at, chars);
  mem::Store<u32>(at + 4, u32(text.size() + 1));
  mem::Store<u32>(at + 8, u32(text.size() + 1));
}

// Guest FStrings handed to the game, which copies them. Only the game thread
// uses them.
struct Scratch {
  static constexpr u32 kSize = 2048;
  static constexpr size_t kMaxChars = 480;
  u32 block = 0;

  // Up to two strings, at slot 0 and 1.
  u32 Write(u32 slot, std::u16string_view text) {
    if (!block)
      block = mem::Alloc(kSize);
    if (!block)
      return 0;
    text = text.substr(0, kMaxChars);
    const u32 at = block + slot * 12;
    WriteFString(at, block + 32 + slot * 1008, text);
    return at;
  }
};
Scratch g_list_scratch;
Scratch g_label_scratch;

void AddItem(u32 list, std::u16string_view text, std::u16string_view key) {
  const u32 text_fs = g_list_scratch.Write(0, text);
  const u32 key_fs = g_list_scratch.Write(1, key);
  if (text_fs && key_fs)
    AddListItem(list, text_fs, key_fs);
}

// Calls a guest virtual taking the object in r3, a float in f1 and a flag in
// r5, on a frame below the hooked caller's.
void CallFadeVirtual(PPCContext& ctx, uint8_t* base, u32 object, u32 slot, double f1, u32 r5) {
  const u32 vtable = mem::Load<u32>(object);
  const u32 target = vtable ? mem::Load<u32>(vtable + slot) : 0;
  PPCFunc* fn = target ? rex::runtime::ResolveIndirectFunction(target) : nullptr;
  if (!fn)
    return;
  PPCContext call{};
  call.r1.u64 = u64(ctx.r1.u32 - 0x100);
  call.r13 = ctx.r13;
  call.fpscr = ctx.fpscr;
  call.r3.u64 = object;
  call.r5.u64 = r5;
  call.f1.f64 = f1;
  fn(call, base);
  ctx.fpscr = call.fpscr;
}

//------------------------------------------------------------------------------
// State (game thread, apart from the pad hook's hand-offs)
//------------------------------------------------------------------------------

enum class Mode : int { kIdle, kOpening, kActive };
std::atomic<Mode> g_mode{Mode::kIdle};
// Which page the GAMEPLAY scene stands in for, set as it opens.
enum class Page : int { kGraphics, kMods };
std::atomic<Page> g_page{Page::kGraphics};
// When A was pressed on GRAPHICS or MODS, 0 when not waiting for the switch.
std::atomic<i64> g_armed_ns{0};
// Presses on the page, taken when the page next draws: left and right step
// the selected setting (turn the selected mod off and on), open enters the
// selected category, back returns to the categories and toggle flips the
// selected mod.
enum Request : u32 {
  kPrevious = 1u << 0,
  kNext = 1u << 1,
  kOpen = 1u << 2,
  kBack = 1u << 3,
  kToggle = 1u << 4,
  kSave = 1u << 5
};
std::atomic<u32> g_requests{0};
// The selected row is a slider: holding left or right keeps stepping it.
std::atomic<bool> g_slider_selected{false};
constexpr i64 kSliderRepeatDelayNs = 350'000'000;
constexpr i64 kSliderRepeatIntervalNs = 60'000'000;
// The category being shown, or -1 for the list of categories.
std::atomic<int> g_category{-1};
// The rows the view shows, as built.
std::vector<std::u16string> g_rows;
// Changes apply as they are made; X saves them and leaving the page without
// saving puts back the values last saved (or found as the page opened). The
// page's cvars with those values, and whether any now differs.
std::vector<std::pair<std::string, std::string>> g_saved_values;
std::atomic<bool> g_unsaved{false};
// When X last saved, for the title's note.
std::atomic<i64> g_saved_ns{0};
constexpr i64 kSavedNoteNs = 2'000'000'000;
// Whether the page list holds the page's rows rather than GAMEPLAY's.
bool g_rows_are_ours = false;
// After the page swaps its rows the list's script leaves its first row faded
// until the cursor moves; the pad hook then moves it away and back
// (kNudgeFirst, a release, kNudgeSecond, a release). 0 when idle.
std::atomic<u32> g_nudge_step{0};
std::atomic<u16> g_nudge_first{0};
std::atomic<u16> g_nudge_second{0};
constexpr u32 kNudgeSteps = 4;
constexpr u32 kNudgePolls = 3;

std::atomic<u32> g_options_list{0};
std::atomic<i64> g_options_list_drawn_ns{0};
std::atomic<u32> g_page_list{0};
std::atomic<i64> g_page_list_drawn_ns{0};

// The GAMEPLAY rows the graphics page stands in for, to put back should the
// game show the same scene again.
struct StockItem {
  std::u16string text;
  std::u16string key;
};
std::vector<StockItem> g_page_stock_items;
std::u16string g_title_caption;

std::mutex g_config_mutex;
std::filesystem::path g_config_path;

i64 NowNs() {
  return std::chrono::duration_cast<std::chrono::nanoseconds>(Clock::now().time_since_epoch())
      .count();
}

bool DrawnRecently(const std::atomic<i64>& drawn) {
  return NowNs() - drawn.load(std::memory_order_acquire) <=
         std::chrono::duration_cast<std::chrono::nanoseconds>(kOnScreenFor).count();
}

void SaveConfig() {
  std::filesystem::path path;
  {
    std::lock_guard lock(g_config_mutex);
    path = g_config_path;
  }
  if (!path.empty())
    rex::cvar::SaveConfig(path);
}

// Every cvar the pages change, with its value: the settings, then the mods.
std::vector<std::pair<std::string, std::string>> PageValues() {
  std::vector<std::pair<std::string, std::string>> values;
  for (const Setting& setting : Settings())
    values.emplace_back(setting.cvar, rex::cvar::GetFlagByName(setting.cvar));
  for (const redahm::mods::Mod& mod : ModList())
    values.emplace_back(mod.cvar, rex::cvar::GetFlagByName(mod.cvar));
  return values;
}

void MarkSaved() {
  g_saved_values = PageValues();
  g_unsaved.store(false, std::memory_order_release);
}

void UpdateUnsaved() {
  g_unsaved.store(PageValues() != g_saved_values, std::memory_order_release);
}

// X: writes redahm.toml.
void SaveChanges() {
  SaveConfig();
  MarkSaved();
  g_saved_ns.store(NowNs(), std::memory_order_release);
  RDAHM_INFO("[graphics menu] settings saved");
}

// Leaving without saving: the values last saved come back.
void RevertChanges() {
  int reverted = 0;
  for (const auto& [cvar, value] : g_saved_values) {
    if (rex::cvar::GetFlagByName(cvar) != value) {
      rex::cvar::SetFlagByName(cvar, value);
      ++reverted;
    }
  }
  g_unsaved.store(false, std::memory_order_release);
  if (reverted)
    RDAHM_INFO("[graphics menu] {} unsaved change(s) put back", reverted);
}

//------------------------------------------------------------------------------
// Options list
//------------------------------------------------------------------------------

void ForgetPage();

void OnOptionsListRender(u32 list) {
  if (ListItemCount(list) == kStockItemCount) {
    AddItem(list, kGraphicsText, kLiteralKey);
    AddItem(list, kModsText, kLiteralKey);
    RDAHM_INFO("[graphics menu] added GRAPHICS and MODS to the Options list {:08X}", list);
  }
  // A page whose scene went away without its close transition (a level change
  // takes every scene down with it) is over.
  if (g_mode.load(std::memory_order_acquire) == Mode::kActive &&
      !DrawnRecently(g_page_list_drawn_ns))
    ForgetPage();
  g_options_list.store(list, std::memory_order_release);
  g_options_list_drawn_ns.store(NowNs(), std::memory_order_release);
}

//------------------------------------------------------------------------------
// Graphics and mods pages (the GAMEPLAY scene)
//------------------------------------------------------------------------------

// UCPUIStringList draws at most this many rows (from StartIndex) while its
// flag +896 & 0x40000000 is set; the rest scroll. The GAMEPLAY list's window
// fits its own rows, so the page widens it to its longest view (up to the nine
// rows the bars mark), which the window would otherwise scroll, hiding the
// first or last row, and puts it back when the page is over.
constexpr u32 kVisibleRows = 1004;
i32 g_stock_visible_rows = -1;

void FitVisibleRows(u32 list, i32 rows) {
  if (g_stock_visible_rows < 0) {
    g_stock_visible_rows = mem::Load<i32>(list + kVisibleRows);
    RDAHM_INFO("[graphics menu] list shows {} rows at a time", g_stock_visible_rows);
  }
  mem::Store<i32>(list + kVisibleRows, std::max(g_stock_visible_rows, rows));
}

void RestoreVisibleRows(u32 list) {
  if (g_stock_visible_rows >= 0)
    mem::Store<i32>(list + kVisibleRows, g_stock_visible_rows);
  g_stock_visible_rows = -1;
}

// The page's scene went away with the page still up; its list and window are
// gone with it.
void ForgetPage() {
  RevertChanges();
  g_mode.store(Mode::kIdle, std::memory_order_release);
  g_page_list.store(0, std::memory_order_release);
  g_rows_are_ours = false;
  g_stock_visible_rows = -1;
  RDAHM_INFO("[graphics menu] the page's scene is gone");
}

// The graphics page's rows: the categories, or a category's settings.
std::vector<std::u16string> GraphicsRows() {
  std::vector<std::u16string> rows;
  const int category = g_category.load(std::memory_order_acquire);
  if (category < 0) {
    for (std::u16string_view label : kCategoryLabels)
      rows.emplace_back(label);
  } else {
    for (size_t setting : CategorySettings(category))
      rows.push_back(RowText(setting));
  }
  return rows;
}

// The mods page's rows: one per mod folder.
std::vector<std::u16string> ModRows() {
  std::vector<std::u16string> rows;
  for (const redahm::mods::Mod& mod : ModList())
    rows.push_back(ModRowText(mod));
  if (rows.empty())
    rows.emplace_back(kNoModsText);
  return rows;
}

bool OnModsPage() {
  return g_page.load(std::memory_order_acquire) == Page::kMods;
}

// The rows a page opens on, which its opening transition marks with bars.
i32 OpeningRows() {
  return OnModsPage() ? std::clamp(i32(ModList().size()), 1, i32(kBarCount)) : kCategoryCount;
}

void BuildPageRows(PPCContext& ctx, uint8_t* base, u32 list) {
  g_rows = OnModsPage() ? ModRows() : GraphicsRows();
  ClearList(list);
  for (const std::u16string& row : g_rows)
    AddItem(list, row, kLiteralKey);
  g_rows_are_ours = true;
  i32 longest = kCategoryCount;
  if (OnModsPage()) {
    longest = i32(g_rows.size());
  } else {
    for (int category = 0; category < kCategoryCount; ++category)
      longest = std::max(longest, i32(CategorySettings(category).size()));
  }
  FitVisibleRows(list, std::min(longest, i32(kBarCount)));
}

void SelectRow(u32 list, i32 row) {
  mem::Store<i32>(list + kStartIndex, 0);
  mem::Store<i32>(list + kCurIndex, row);
}

void RestoreStockRows(u32 list) {
  ClearList(list);
  for (const StockItem& item : g_page_stock_items)
    AddItem(list, item.text, item.key);
  g_rows_are_ours = false;
  RestoreVisibleRows(list);
}

//------------------------------------------------------------------------------
// Row bars
//------------------------------------------------------------------------------

// The background scene's orange row bars, CPUIImage_Bar1..9. A transition
// fades them to its bar count once, as a scene opens; the page's views change
// row counts without one, so it fades the bars itself. The active scenes are
// GEngine->GameViewport (+752) -> UIController (+92) -> SceneClient (+120) ->
// ActiveScenes (+192, count +196), as FireTransition (sub_82AD6DD0) reaches
// them.
constexpr u32 kGEngine = 0x83746300;
constexpr u32 kEngineGameViewport = 752;
constexpr u32 kViewportUIController = 92;
constexpr u32 kControllerSceneClient = 120;
constexpr u32 kSceneClientActiveScenes = 192;
constexpr std::u16string_view kBackgroundScene = u"UI_InGameBackground";
constexpr std::u16string_view kBarPrefix = u"CPUIImage_Bar";
constexpr u32 kMaxWidgetDepth = 8;

std::array<u32, kBarCount> g_bars{};
i32 g_bars_shown = -1;

void CollectBars(u32 widget, u32 depth) {
  if (!Readable(widget) || depth > kMaxWidgetDepth)
    return;
  const std::u16string name = ObjectName(widget);
  if (name.size() > kBarPrefix.size() && name.compare(0, kBarPrefix.size(), kBarPrefix) == 0) {
    const int index = name[kBarPrefix.size()] - u'1';
    if (index >= 0 && index < int(kBarCount) && name.size() == kBarPrefix.size() + 1)
      g_bars[size_t(index)] = widget;
  }
  const u32 children = mem::Load<u32>(widget + kChildren);
  const i32 count = mem::Load<i32>(widget + kChildren + 4);
  for (i32 i = 0; Readable(children) && i < count && i < 256; ++i)
    CollectBars(mem::Load<u32>(children + u32(i) * 4), depth + 1);
}

bool FindBars() {
  g_bars.fill(0);
  const u32 engine = mem::Load<u32>(kGEngine);
  const u32 viewport = Readable(engine) ? mem::Load<u32>(engine + kEngineGameViewport) : 0;
  const u32 controller = Readable(viewport) ? mem::Load<u32>(viewport + kViewportUIController) : 0;
  const u32 client = Readable(controller) ? mem::Load<u32>(controller + kControllerSceneClient) : 0;
  if (!Readable(client))
    return false;
  const u32 scenes = mem::Load<u32>(client + kSceneClientActiveScenes);
  const i32 count = mem::Load<i32>(client + kSceneClientActiveScenes + 4);
  for (i32 i = 0; Readable(scenes) && i < count && i < 64; ++i) {
    const u32 scene = mem::Load<u32>(scenes + u32(i) * 4);
    if (Readable(scene) && ObjectName(scene) == kBackgroundScene)
      CollectBars(scene, 0);
  }
  return std::any_of(g_bars.begin(), g_bars.end(), [](u32 bar) { return bar != 0; });
}

// Shows the first `count` bars and hides the rest.
void ShowBars(PPCContext& ctx, uint8_t* base, i32 count) {
  if (count == g_bars_shown)
    return;
  if (!FindBars()) {
    RDAHM_WARN("[graphics menu] row bars not found");
    g_bars_shown = count;
    return;
  }
  for (u32 i = 0; i < kBarCount; ++i) {
    if (!g_bars[i])
      continue;
    CallFadeVirtual(ctx, base, g_bars[i], kStartFade, i32(i) < count ? 1.0 : 0.0, 1);
    CallFadeVirtual(ctx, base, g_bars[i], kFade, 1.0, 1);
  }
  g_bars_shown = count;
}

// The GAMEPLAY scene's toggles and sliders sit beside the menu under one
// panel; the graphics page keeps them faded out, over the scene's own fade in.
void HideGameplayValues(PPCContext& ctx, uint8_t* base, u32 list) {
  const u32 menu = OwnerOf(list);
  const u32 panel = menu ? OwnerOf(menu) : 0;
  if (!panel)
    return;
  const u32 children = mem::Load<u32>(panel + kChildren);
  const i32 count = mem::Load<i32>(panel + kChildren + 4);
  for (i32 i = 0; children && i < count; ++i) {
    const u32 child = mem::Load<u32>(children + u32(i) * 4);
    if (!child || child == menu || !CastToWidget(child))
      continue;
    CallFadeVirtual(ctx, base, child, kStartFade, 0.0, 1);
    CallFadeVirtual(ctx, base, child, kFade, 1.0, 1);
  }
}

// Moves the cursor away and back through the pad, as a player would: the
// list's script only refreshes its rows on a move of its own.
void Nudge(i32 selected, size_t rows) {
  const bool at_bottom = selected + 1 >= i32(rows);
  g_nudge_first.store(at_bottom ? kPadUp : kPadDown, std::memory_order_release);
  g_nudge_second.store(at_bottom ? kPadDown : kPadUp, std::memory_order_release);
  g_nudge_step.store(1, std::memory_order_release);
}

// Rebuilds the rows for the view now chosen and selects one.
void ShowView(PPCContext& ctx, uint8_t* base, u32 list, i32 selected) {
  BuildPageRows(ctx, base, list);
  SelectRow(list, selected);
  Nudge(selected, g_rows.size());
}

void OnModsRequests(PPCContext& ctx, uint8_t* base, u32 list, u32 requests, i32 row) {
  if (!(requests & (kPrevious | kNext | kToggle)) || row < 0 || row >= i32(ModList().size()))
    return;
  const size_t index = size_t(row);
  if (requests & kToggle)
    SetMod(index, !ModEnabled(ModList()[index]));
  else
    SetMod(index, (requests & kNext) != 0);
  BuildPageRows(ctx, base, list);
}

void OnGraphicsRequests(PPCContext& ctx, uint8_t* base, u32 list, u32 requests, i32 row) {
  if (OnModsPage()) {
    OnModsRequests(ctx, base, list, requests, row);
    return;
  }
  const int category = g_category.load(std::memory_order_acquire);
  if (category < 0) {
    if ((requests & kOpen) && row >= 0 && row < kCategoryCount) {
      g_category.store(row, std::memory_order_release);
      ShowView(ctx, base, list, 0);
    }
  } else if (requests & kBack) {
    g_category.store(-1, std::memory_order_release);
    ShowView(ctx, base, list, category);
  } else if (requests & (kPrevious | kNext)) {
    const std::vector<size_t> settings = CategorySettings(category);
    if (row >= 0 && row < i32(settings.size())) {
      if (requests & kPrevious)
        StepSetting(settings[size_t(row)], -1);
      if (requests & kNext)
        StepSetting(settings[size_t(row)], +1);
      BuildPageRows(ctx, base, list);
    }
  }
}

void OnGameplayListRender(PPCContext& ctx, uint8_t* base, u32 list) {
  if (g_mode.load(std::memory_order_acquire) != Mode::kActive) {
    // The page is over; should the scene show again as GAMEPLAY, its rows
    // come back.
    if (list == g_page_list.load(std::memory_order_acquire)) {
      if (g_rows_are_ours)
        RestoreStockRows(list);
      g_page_list.store(0, std::memory_order_release);
    }
    return;
  }

  if (list != g_page_list.load(std::memory_order_acquire)) {
    g_page_stock_items.clear();
    for (u32 i = 0; i < ListItemCount(list); ++i) {
      const u32 item = ListItem(list, i);
      g_page_stock_items.push_back({ReadFString(item + kListItemText),
                                    ReadFString(item + kListItemLocalizationKey)});
    }
    BuildPageRows(ctx, base, list);
    g_page_list.store(list, std::memory_order_release);
    RDAHM_INFO("[graphics menu] {} page in {:08X}", OnModsPage() ? "mods" : "graphics", list);
  }
  g_page_list_drawn_ns.store(NowNs(), std::memory_order_release);

  const u32 requests = g_requests.exchange(0, std::memory_order_acq_rel);
  OnGraphicsRequests(ctx, base, list, requests, SelectedRow(list));
  if (requests & kSave)
    SaveChanges();
  UpdateUnsaved();
  {
    const int shown = g_category.load(std::memory_order_acquire);
    const i32 selected = SelectedRow(list);
    bool slider = false;
    if (shown >= 0 && !OnModsPage()) {
      const std::vector<size_t> settings = CategorySettings(shown);
      slider = selected >= 0 && selected < i32(settings.size()) &&
               Settings()[settings[size_t(selected)]].slider.has_value();
    }
    g_slider_selected.store(slider, std::memory_order_release);
  }
  // Every view that fits the widened window shouldn't scroll. The list's
  // script still scrolls by the stock window it knows: selecting a lower row of
  // a long category moved StartIndex on, and the shorter view after it then
  // started a row down, its first row gone. Keep the list at its top, with the
  // same row selected. A longer list of mods scrolls as the list likes.
  const i32 start = mem::Load<i32>(list + kStartIndex);
  if (start != 0 && g_rows.size() <= kBarCount) {
    static u32 logged = 0;
    if (logged++ < 4)
      RDAHM_INFO("[graphics menu] list scrolled to {}, back to the top", start);
    SelectRow(list, SelectedRow(list));
  }
  // The GAMEPLAY scene's script greys out (FListItem::ItemState 1, drawn at
  // half alpha) the row it keeps from being changed in game, by position, so
  // whatever the page shows first was drawn faded. Every page row is live.
  for (u32 i = 0; i < ListItemCount(list); ++i) {
    const u32 state = ListItem(list, i) + kListItemState;
    if (mem::Load<u8>(state) != kItemStateNormal)
      mem::Store<u8>(state, kItemStateNormal);
  }
  ShowBars(ctx, base, i32(g_rows.size()));
  HideGameplayValues(ctx, base, list);
}

// The page's title: its name, and whether X has something to save or just
// saved it.
std::u16string PageTitle() {
  std::u16string title(OnModsPage() ? kModsText : kGraphicsText);
  if (g_unsaved.load(std::memory_order_acquire))
    title += u" - X TO SAVE";
  else if (NowNs() - g_saved_ns.load(std::memory_order_acquire) < kSavedNoteNs)
    title += u" - SAVED";
  return title;
}

// The GAMEPLAY scene's title shares GAMEPLAY's key.
void OnGameplayLabelRender(u32 label) {
  if (ReadFString(label + kLabelLocalizationKey) != kGameplayKey)
    return;
  const std::u16string caption = ReadFString(label + kLabelDrawCaption);
  const bool active = g_mode.load(std::memory_order_acquire) == Mode::kActive;
  const bool ours = caption.starts_with(kGraphicsText) || caption.starts_with(kModsText);
  const std::u16string title = PageTitle();
  if (active && caption != title) {
    if (!ours)
      g_title_caption = caption;
    if (const u32 text = g_label_scratch.Write(0, title))
      AssignFString(label + kLabelDrawCaption, text);
  } else if (!active && ours && !g_title_caption.empty()) {
    if (const u32 text = g_label_scratch.Write(0, g_title_caption))
      AssignFString(label + kLabelDrawCaption, text);
  }
}

void EnterPage() {
  MarkSaved();
  g_saved_ns.store(0, std::memory_order_release);
  g_requests.store(0, std::memory_order_release);
  g_category.store(-1, std::memory_order_release);
  // The opening transition fades in the first view's bars.
  g_bars_shown = OpeningRows();
  g_mode.store(Mode::kActive, std::memory_order_release);
  RDAHM_INFO("[graphics menu] opening the {} page", OnModsPage() ? "mods" : "graphics");
}

void LeavePage() {
  g_mode.store(Mode::kIdle, std::memory_order_release);
  RevertChanges();
  RDAHM_INFO("[graphics menu] left the page");
}

//------------------------------------------------------------------------------
// Hooks
//------------------------------------------------------------------------------

void OnListRender(PPCContext& ctx, uint8_t* base, u32 list) {
  if (!list)
    return;
  (void)BootValues();
  LearnOwnerOffset(list);
  const u32 scene = SceneOf(list);
  if (!scene)
    return;
  const std::u16string scene_name = ObjectName(scene);
  const bool options_rows = HasOptionsRows(list);
  if (options_rows) {
    static u32 logged_list = 0;
    if (logged_list != list) {
      logged_list = list;
      RDAHM_INFO("[graphics menu] Options rows in list {:08X}, scene '{}'", list,
                 std::string(scene_name.begin(), scene_name.end()));
    }
  }
  if (scene_name == kOptionsScene && options_rows)
    OnOptionsListRender(list);
  else if (scene_name == kGameplayScene)
    OnGameplayListRender(ctx, base, list);
}

void OnLabelRender(u32 label) {
  if (!label)
    return;
  // Only while the page is up or its title may still need putting back.
  if (g_mode.load(std::memory_order_acquire) != Mode::kActive && g_title_caption.empty())
    return;
  const u32 scene = SceneOf(label);
  if (scene && ObjectName(scene) == kGameplayScene)
    OnGameplayLabelRender(label);
}

// Before the Options switch fires: an A press on GRAPHICS or MODS takes
// GAMEPLAY's link. Returns the index to put back afterwards, or -1.
i32 OnSwitchActivated(u32 op) {
  const i64 armed = g_armed_ns.load(std::memory_order_acquire);
  if (!armed || NowNs() - armed >
                    std::chrono::duration_cast<std::chrono::nanoseconds>(kArmedFor).count())
    return -1;
  if (mem::Load<i32>(op + kSwitchOutputLinkCount) != i32(kStockItemCount) ||
      mem::Load<i32>(op + kSwitchIndices + 4) < 1)
    return -1;
  const u32 indices = mem::Load<u32>(op + kSwitchIndices);
  const i32 index = mem::Load<i32>(indices);
  if (index != kGraphicsIndex && index != kModsIndex)
    return -1;
  g_page.store(index == kModsIndex ? Page::kMods : Page::kGraphics, std::memory_order_release);
  g_armed_ns.store(0, std::memory_order_release);
  g_mode.store(Mode::kOpening, std::memory_order_release);
  mem::Store<i32>(indices, kGameplayLink);
  return index;
}

// Before a transition fires: the bar count it asks for, and whether it ends
// the page.
struct TransitionPatch {
  i32 original_bars = 0;
  bool patched = false;
  bool leaves_page = false;
};

TransitionPatch OnTransition(u32 op) {
  TransitionPatch patch;
  const bool close = mem::Load<u32>(op + kTransitionClose) != 0;
  const std::u16string scene = ObjectName(mem::Load<u32>(op + kTransitionSceneToOpen));
  const i32 bars = mem::Load<i32>(op + kTransitionNumBars);
  const Mode mode = g_mode.load(std::memory_order_acquire);

  i32 wanted = bars;
  if (mode == Mode::kOpening && !close) {
    wanted = OpeningRows();
    EnterPage();
  } else if (bars == kStockOptionsBars) {
    const bool opens_options = !close && scene == kOptionsScene;
    const bool returns_to_options =
        close && std::find(std::begin(kOptionsChildScenes), std::end(kOptionsChildScenes),
                           scene) != std::end(kOptionsChildScenes);
    if (opens_options || returns_to_options)
      wanted = kOptionsBars;
  }
  patch.leaves_page = mode == Mode::kActive && close;
  if (wanted != bars) {
    patch.original_bars = bars;
    patch.patched = true;
    mem::Store<i32>(op + kTransitionNumBars, wanted);
  }
  return patch;
}

// After the pad is read: arms the GRAPHICS and MODS rows, and on a page turns
// left and right into setting changes the game never sees.
void OnPadState(u32 state, u32 result, u32 user) {
  if (result != 0 || !state || user >= 4)
    return;
  static std::array<u16, 4> held{};
  static std::array<i32, 4> stick{};
  // Buttons whose press the page took, kept from the game until released so
  // it never sees them go down.
  static std::array<u16, 4> swallowed{};
  const u32 gamepad = state + kGamepad;
  const u16 buttons = mem::Load<u16>(gamepad);
  const i16 lx = mem::Load<i16>(state + kThumbLX);
  const i32 stick_x = lx < -kStickThreshold ? -1 : (lx > kStickThreshold ? 1 : 0);
  const u16 pressed = u16(buttons & ~held[user]);
  const bool stick_moved = stick_x != 0 && stick_x != stick[user];
  held[user] = buttons;
  stick[user] = stick_x;
  swallowed[user] &= buttons;

  const Mode mode = g_mode.load(std::memory_order_acquire);
  if (mode == Mode::kActive && g_page_list.load(std::memory_order_acquire) &&
      DrawnRecently(g_page_list_drawn_ns)) {
    // Categories: A opens one; B goes on to the game, which leaves the page.
    // In a category: left, right and A step the setting; B returns to the
    // categories.
    // Mods: A toggles the mod, left turns it off and right on; B goes on to
    // the game.
    const bool in_category = g_category.load(std::memory_order_acquire) >= 0;
    u32 requests = 0;
    if (OnModsPage()) {
      if ((pressed & kPadLeft) || (stick_moved && stick_x < 0))
        requests |= kPrevious;
      if ((pressed & kPadRight) || (stick_moved && stick_x > 0))
        requests |= kNext;
      if (pressed & kPadA)
        requests |= kToggle;
      swallowed[user] |= u16(pressed & kPadA);
    } else if (in_category) {
      if ((pressed & kPadLeft) || (stick_moved && stick_x < 0))
        requests |= kPrevious;
      if ((pressed & (kPadRight | kPadA)) || (stick_moved && stick_x > 0))
        requests |= kNext;
      // A slider keeps stepping while left or right is held.
      static std::array<i32, 4> hold_direction{};
      static std::array<i64, 4> hold_since{};
      static std::array<i64, 4> last_repeat{};
      const i32 direction = ((buttons & kPadLeft) || stick_x < 0)    ? -1
                            : ((buttons & kPadRight) || stick_x > 0) ? 1
                                                                     : 0;
      const i64 now = NowNs();
      if (direction != hold_direction[user] || !g_slider_selected.load(std::memory_order_acquire)) {
        hold_direction[user] = direction;
        hold_since[user] = now;
        last_repeat[user] = now;
      } else if (direction && now - hold_since[user] >= kSliderRepeatDelayNs &&
                 now - last_repeat[user] >= kSliderRepeatIntervalNs) {
        requests |= direction < 0 ? kPrevious : kNext;
        last_repeat[user] = now;
      }
      if (pressed & kPadB)
        requests |= kBack;
      swallowed[user] |= u16(pressed & (kPadA | kPadB));
    } else {
      if (pressed & kPadA)
        requests |= kOpen;
      swallowed[user] |= u16(pressed & kPadA);
    }
    // Either page: X saves.
    if (pressed & kPadX)
      requests |= kSave;
    swallowed[user] |= u16(pressed & kPadX);
    if (requests)
      g_requests.fetch_or(requests, std::memory_order_acq_rel);
    u16 out = u16(buttons & ~(kPadLeft | kPadRight | swallowed[user]));
    // The refresh nudge, on the first pad polled: a press, a release, the
    // press back, a release.
    if (user == 0) {
      const u32 step = g_nudge_step.load(std::memory_order_acquire);
      if (step) {
        out = u16(out & ~(kPadUp | kPadDown));
        // Each phase lasts kNudgePolls polls, so the game sees it however
        // often it reads the pad in a frame.
        const u32 phase = (step - 1) / kNudgePolls;
        if (phase == 0)
          out |= g_nudge_first.load(std::memory_order_acquire);
        else if (phase == 2)
          out |= g_nudge_second.load(std::memory_order_acquire);
        g_nudge_step.store(step >= kNudgeSteps * kNudgePolls ? 0 : step + 1,
                           std::memory_order_release);
      }
    }
    mem::Store<u16>(gamepad, out);
    mem::Store<i16>(state + kThumbLX, 0);
    return;
  }
  if (swallowed[user])
    mem::Store<u16>(gamepad, u16(buttons & ~swallowed[user]));

  const u32 list = g_options_list.load(std::memory_order_acquire);
  if (mode == Mode::kIdle && (pressed & kPadA) && list && DrawnRecently(g_options_list_drawn_ns) &&
      ListItemCount(list) == kItemCount &&
      (SelectedRow(list) == kGraphicsIndex || SelectedRow(list) == kModsIndex))
    g_armed_ns.store(NowNs(), std::memory_order_release);
}

}  // namespace

void SetConfigPath(const std::filesystem::path& path) {
  std::lock_guard lock(g_config_mutex);
  g_config_path = path;
}

}  // namespace redahm::graphics_menu

// sub_82B03C48 (list, canvas).
REX_HOOK_RAW(sub_82B03C48) {
  redahm::graphics_menu::OnListRender(ctx, base, ctx.r3.u32);
  __imp__sub_82B03C48(ctx, base);
}

// sub_82ADA748 (label, canvas).
REX_HOOK_RAW(sub_82ADA748) {
  redahm::graphics_menu::OnLabelRender(ctx.r3.u32);
  __imp__sub_82ADA748(ctx, base);
}

// sub_829DBCD0 (op).
REX_HOOK_RAW(sub_829DBCD0) {
  const u32 op = ctx.r3.u32;
  const i32 restore = redahm::graphics_menu::OnSwitchActivated(op);
  __imp__sub_829DBCD0(ctx, base);
  // Indices is copied back to the Kismet variable after the switch runs; the
  // Options menu's own row stays GRAPHICS.
  if (restore >= 0) {
    namespace menu = redahm::graphics_menu;
    redahm::gpu::mem::Store<i32>(redahm::gpu::mem::Load<u32>(op + menu::kSwitchIndices), restore);
  }
}

// sub_82AD6DD0 (op).
REX_HOOK_RAW(sub_82AD6DD0) {
  const u32 op = ctx.r3.u32;
  const auto patch = redahm::graphics_menu::OnTransition(op);
  __imp__sub_82AD6DD0(ctx, base);
  if (patch.patched) {
    redahm::gpu::mem::Store<i32>(op + redahm::graphics_menu::kTransitionNumBars,
                                 patch.original_bars);
  }
  if (patch.leaves_page)
    redahm::graphics_menu::LeavePage();
}

// sub_82BEB2C0 (user, state).
REX_HOOK_RAW(sub_82BEB2C0) {
  const u32 user = ctx.r3.u32;
  const u32 state = ctx.r4.u32;
  __imp__sub_82BEB2C0(ctx, base);
  redahm::graphics_menu::OnPadState(state, ctx.r3.u32, user);
}

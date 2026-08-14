// Host-side reader for the engine's UObject reflection data.
//
// Nothing in here calls into the guest. Every field is a direct read of guest
// memory through the virtual membase. That is deliberate, and it is the only
// approach that works in this build: FOutputDevice::Logf is compiled out --
// nullsub_3 at 0x8232D178 is a bare `blr` with 207 call sites -- so every
// text-reporting console command ("OBJ LIST", "OBJ CLASSES", "MEM") returns
// "handled" and prints precisely nothing. The reflection data those commands
// walk is fully intact; only the reporting was stripped.
//
// Anchors, all confirmed in live code rather than inferred from xref counts.
// sub_822A1EE0 (UnrealEd's ShowClasses, walked by OBJ CLASSES) pins the object
// array, and FName::ToString (sub_8233E1A0) pins the name table:
//
//   FNameEntry* e = ((FNameEntry**)*(uint32*)0x8375C1B8)[Index];
//   text = (TCHAR*)(e + 0x10);            // UTF-16BE, null terminated
//   if (Number) text += "_" + (Number - 1);
//
// The object header offsets are further down, next to the constants, along
// with how each was established -- read those rather than trusting this
// summary. Note in particular that Class is +0x34 and +0x3C is UField's
// SuperField; an earlier version of this file had that backwards, because
// ShowClasses compares GetSuperClass() and it was misread as ->Class.

#pragma once

#include <rex/ppc/context.h>

#include <cstddef>
#include <cstdint>
#include <memory>
#include <string>
#include <vector>

// One live entry of GObjObjects. Null slots (GC holes) are not represented.
struct RedahmObject {
  uint32_t addr = 0;        // guest address of the UObject
  int32_t index = 0;        // slot in GObjObjects
  uint32_t class_addr = 0;  // UObject::Class
  std::string name;         // UObject::Name, resolved through GNames
  std::string class_name;   // Class->Name, same resolution
};

struct RedahmObjectSnapshot {
  std::vector<RedahmObject> objects;
  int32_t array_num = 0;    // GObjObjects.Num as read
  int32_t null_slots = 0;   // empty slots skipped
  uint32_t data_ptr = 0;    // GObjObjects.Data
  int32_t names_num = 0;    // GNames.Num, for sanity display
  bool truncated = false;   // hit the object cap
  uint64_t sequence = 0;    // bumped per refresh; lets the UI cache derived data
};

// How often the dword at a given header offset looks like a pointer to another
// object. Used to locate Outer without more static archaeology.
struct RedahmFieldProbe {
  uint32_t offset = 0;
  int object_hits = 0;  // value is the address of a live object
  int code_hits = 0;    // value is in the image range (vtable / static)
  int nonzero = 0;
  int samples = 0;
};

// Ask the next drain to rebuild the snapshot. Safe from any thread.
void RedahmRequestObjectRefresh();
bool RedahmObjectRefreshPending();

// Rebuild the snapshot if one was requested. Must run on a guest thread with a
// live context -- currently the UGameEngine::Tick drain in framerate.cpp.
void RedahmRefreshObjectSnapshot(uint8_t* base);

// Most recent snapshot, or null before the first refresh. Cheap to copy: the
// UI holds the shared_ptr for a frame so a concurrent refresh cannot pull the
// vector out from under it.
std::shared_ptr<const RedahmObjectSnapshot> RedahmObjects();

// Guest membase, latched on the first refresh. Null before that. Reading guest
// memory from the UI thread through this is safe -- the arena stays mapped --
// but the contents can be stale or freed, so treat values as advisory.
const uint8_t* RedahmGuestBase();

// Validated reads: an address in unmapped or no-access guest memory reads as
// zero rather than faulting, so the UI can dereference speculative pointers
// freely. Validation is against the owning heap's page state, not a range test.
uint32_t RedahmReadU32(uint32_t addr);

// Drops this thread's page-validity cache. The reader keeps a one-entry cache
// so a sequential walk does not re-query the page table on every read; callers
// that read across frames should call this once per frame so a page that has
// since been decommitted cannot be read through a stale entry.
void RedahmResetReadCache();
std::vector<uint32_t> RedahmReadDwords(uint32_t addr, size_t count);

// FName {Index, Number} -> text, via GNames. Empty if it does not resolve.
std::string RedahmResolveFName(uint32_t index, uint32_t number);

// Read an object's Name field (+0x2C) directly, for objects not in a snapshot.
std::string RedahmReadObjectName(uint32_t obj_addr);

std::vector<RedahmFieldProbe> RedahmProbeObjectFields(const RedahmObjectSnapshot& snapshot,
                                                      uint32_t max_offset, int sample_limit);

// TArray<UObject*> GObjObjects: Data, then Num.
inline constexpr uint32_t kRedahmObjObjectsData = 0x8375AA48;
inline constexpr uint32_t kRedahmObjObjectsNum = 0x8375AA4C;

// Header offsets, exposed so the UI can label the hex dump.
//
// Class was 0x3C here until the FindField iterator (sub_822AF650 / sub_822B0D18)
// and the GETALL filter in UObject::StaticExec settled it. Both do the same
// IsA walk, and it reads:
//
//   lwz r11, 0x28(r24)   ; Outer chain      -> Outer  +0x28
//   ld  r10,  8(r11)     ; 64-bit flags     -> Flags  +0x08
//   lwz r11, 0x34(r24)   ; Obj->Class       -> Class  +0x34
//   lwz r11, 0x3C(r11)   ; Class->Super     -> Super  +0x3C
//
// The original 0x3C came from misreading sub_822A1EE0 as `It->Class == Class`
// when it is UnrealEd's ShowClasses, whose test is `It->GetSuperClass() ==
// Class`. So 0x3C is the superclass link, and every Class name the browser
// showed before this was the object's superclass field read off a plain
// UObject -- i.e. meaningless for anything that is not a UStruct.
inline constexpr uint32_t kRedahmObjectFlagsOffset = 0x08;  // EObjectFlags, 64-bit
inline constexpr uint32_t kRedahmObjectOuterOffset = 0x28;  // UObject*
inline constexpr uint32_t kRedahmObjectNameOffset = 0x2C;   // FName {Index, Number}
inline constexpr uint32_t kRedahmObjectClassOffset = 0x34;  // UClass*

// UField / UStruct / UProperty, from the field iterator (sub_822B0C90 /
// sub_822B0D18) and UProperty::ExportText (sub_823C4F48), whose value address
// is `a1[18] * index + a1[25] + Data` -- ElementSize at 0x48, Offset at 0x64.
//
// SuperField at 0x3C sits immediately before Next at 0x40, which is what makes
// the earlier confusion resolve: 0x3C is not a UObject field at all, it is
// UField's, so UObject ends at 0x3C and nothing overlaps.
inline constexpr uint32_t kRedahmStructSuperOffset = 0x3C;     // UField::SuperField
inline constexpr uint32_t kRedahmFieldNextOffset = 0x40;       // UField::Next
inline constexpr uint32_t kRedahmStructChildrenOffset = 0x4C;  // UStruct::Children
inline constexpr uint32_t kRedahmPropArrayDimOffset = 0x44;
inline constexpr uint32_t kRedahmPropElementSizeOffset = 0x48;
inline constexpr uint32_t kRedahmPropOffsetOffset = 0x64;

// UBoolProperty::BitMask. Bools share a dword and are selected by a mask rather
// than having a byte each, which is why they read as a hex word without it.
// From UBoolProperty::ImportText (sub_823C74F8), which sets and clears the
// value with `*value | *(prop + 128)` and `*value & ~*(prop + 128)`.
inline constexpr uint32_t kRedahmBoolBitMaskOffset = 0x80;

// UStructProperty::Struct, the UScriptStruct describing the members. Same slot
// as BitMask because both are the first field a UProperty subclass adds, which
// also lines up with Offset at 0x64 leaving UProperty ending at 0x80.
//
// This is the one offset here that was reasoned from layout rather than read
// out of a function, so it is self-checking: the struct name is resolved and
// shown in the type column. If it comes back empty or as nonsense, it is wrong.
inline constexpr uint32_t kRedahmStructPropStructOffset = 0x80;

// Same 0x80 slot again: UByteProperty::Enum and UObjectProperty::PropertyClass.
// sub_823D0250 reads the property's +0x80 and treats it as the subclass's own
// object, alongside ArrayDim at [17] and ElementSize at [18], which is what
// confirms the slot rather than the layout argument alone.
inline constexpr uint32_t kRedahmBytePropEnumOffset = 0x80;
inline constexpr uint32_t kRedahmObjectPropClassOffset = 0x80;

// UEnum::Names, a TArray<FName>. UEnum derives from UField, so its own fields
// start at 0x44 -- and sub_82B22B58 indexes it as *(a1[17] + 8 * i) bounded by
// a1[18], i.e. Data 0x44, Num 0x48, 8 bytes per FName.
inline constexpr uint32_t kRedahmEnumNamesData = 0x44;
inline constexpr uint32_t kRedahmEnumNamesNum = 0x48;

// One reflected field of a class. `type` is the property object's own class
// name -- "IntProperty", "ObjectProperty", "StructProperty" and so on -- which
// is how the value gets decoded without any per-type offsets of our own.
struct RedahmProperty {
  uint32_t addr = 0;
  std::string name;
  std::string type;
  std::string owner;        // class that declared it
  std::string struct_name;  // StructProperty only: Vector, Rotator, Color, ...
  // Values the type constrains this to: True/False for a bool, the tag list for
  // an enum-backed byte. Empty when the value is free-form. Each entry is valid
  // ImportText, so picking one can be written back unchanged.
  std::vector<std::string> options;
  uint32_t offset = 0;
  uint32_t element_size = 0;
  int32_t array_dim = 1;
};

// Objects assignable to an ObjectProperty: everything in the snapshot whose
// class derives from the property's PropertyClass. Built on demand, since it
// scans the whole object list -- not something to do per frame.
struct RedahmObjectOption {
  uint32_t addr = 0;
  std::string path;
};
std::vector<RedahmObjectOption> RedahmObjectOptionsFor(const RedahmObjectSnapshot& snapshot,
                                                       uint32_t prop_addr, int max_options = 400);

// Walks Children/Next for the class and each of its SuperFields, so inherited
// properties are included. Bounded against corrupt links.
std::vector<RedahmProperty> RedahmEnumerateProperties(uint32_t class_addr, int max_props = 1024);

// Case-insensitive lookup by name across the class and its ancestors.
bool RedahmFindProperty(uint32_t class_addr, const char* name, RedahmProperty& out);

// Best-effort decode of one element of a property on a given object.
std::string RedahmFormatPropertyValue(const RedahmProperty& prop, uint32_t obj_addr,
                                      int32_t element = 0);

// ---------------------------------------------------------------------------
// Property writing
// ---------------------------------------------------------------------------
// Values are written by the engine, not by us. UObject::StaticExec's SET core
// (sub_822A1230) does exactly three things per object, and this reproduces them
// against one object instead of every instance of a class:
//
//   if (!(*(objvt + 52))(obj)) {                        // skip templates
//      if (!(flags & 0x200) && bPEC) (*(objvt + 64))(obj, prop);   // PreEditChange
//      (*(*(prop) + 312))(prop, text, obj + Offset, 1, obj, 0);    // ImportText
//      if (!(flags & 0x200) && bPEC) (*(objvt + 72))(obj, prop);   // PostEditChange
//   }
//
// Going through ImportText rather than composing bytes is what makes every
// property type editable -- ints, floats, bools, enums, names, object
// references and structs all parse the same way SET parses them. PostEditChange
// is the half that makes an edit actually take effect instead of just changing
// a field the engine never notices; it is compiled into this build (see
// sub_82711C80, UMaterial's override).

struct RedahmEditRecord {
  std::string target;   // Package.Object.Property
  std::string value;
  bool ok = false;
  std::string detail;
};

// Queue an edit. Safe from any thread; applied on the next drain, because
// ImportText and PostEditChange are guest calls and need a guest thread.
void RedahmQueuePropertyEdit(uint32_t obj_addr, uint32_t prop_addr, std::string text,
                             bool post_edit_change);

// Apply queued edits. Must run on a guest thread with a live context.
void RedahmDrainPropertyEdits(PPCContext& __restrict ctx, uint8_t* base);

size_t RedahmPropertyEditQueueDepth();
std::vector<RedahmEditRecord> RedahmPropertyEditLog();

// ---------------------------------------------------------------------------
// Screen picking
// ---------------------------------------------------------------------------
// Everything below is driven by the property system rather than new hardcoded
// offsets: the camera is found by class name and read through its Location /
// Rotation / FOV properties, and actor positions come from each class's own
// Location property. ACamera::UpdateCamera writes the POV back onto the camera
// actor, so the actor's own transform is the view transform.

struct RedahmVec3 {
  float x = 0.0f;
  float y = 0.0f;
  float z = 0.0f;
};

struct RedahmViewInfo {
  bool valid = false;
  uint32_t source_addr = 0;
  std::string source_path;
  std::string source_class;
  RedahmVec3 location;
  // Radians, converted from FRotator's 65536-per-turn integers.
  float pitch = 0.0f;
  float yaw = 0.0f;
  float roll = 0.0f;
  float fov_deg = 90.0f;
  bool fov_from_property = false;
  // How the camera was located, so a wrong view is attributable.
  const char* via = "override";
};

// Locate the active camera. `preferred`, if non-zero, is used instead of the
// search -- the UI exposes that so a wrong guess can be corrected by hand.
RedahmViewInfo RedahmFindView(const RedahmObjectSnapshot& snapshot, uint32_t preferred = 0);

// World -> screen. Returns false when the point is behind the camera. `depth`
// comes back as distance along the view direction, for tie-breaking.
bool RedahmProjectToScreen(const RedahmViewInfo& view, const RedahmVec3& world, float width,
                           float height, float& out_x, float& out_y, float& out_depth);

// Location of an object, if its class declares one. Offsets are cached per
// class, so this is cheap to call across a whole snapshot.
bool RedahmObjectLocation(uint32_t obj_addr, uint32_t class_addr, RedahmVec3& out);

// A box to draw around an object. Derived from whatever the class actually
// declares -- a cylinder's CollisionRadius/CollisionHeight, a component's
// BoxExtent or SphereRadius -- falling back to a fixed size so a selection is
// always visible even when nothing describes its size.
struct RedahmBounds {
  RedahmVec3 center;
  RedahmVec3 extent;
  bool measured = false;  // false => the fallback size, not the object's own
  const char* source = "";
};
bool RedahmObjectBounds(uint32_t obj_addr, uint32_t class_addr, RedahmBounds& out);



// Full path name, built by walking Outer: "Package.Group.Object". Bounded, so
// a corrupt or cyclic Outer chain cannot spin.
std::string RedahmObjectPath(uint32_t obj_addr);

// Superclass chain of an object's class, nearest first: "Texture2D <- Texture
// <- Surface <- Object". Only meaningful for the class of an object, which is
// always a UStruct, so the +0x3C read is valid here.
std::string RedahmClassChain(uint32_t class_addr);

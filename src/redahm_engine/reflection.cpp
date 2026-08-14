// See reflection.h for where the addresses and offsets come from.

#include <rex/memory/utils.h>
#include <rex/ppc/func.h>
#include <rex/system/kernel_state.h>
#include <rex/system/xmemory.h>
#include <rex/system/xtypes.h>
#include <rex/types.h>

#include <algorithm>
#include <atomic>
#include <cctype>
#include <chrono>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <mutex>
#include <unordered_map>
#include <unordered_set>

#include "redahm_logging.h"
#include "reflection.h"

namespace {

// TArray<FNameEntry*> FName::Names
constexpr uint32_t kNamesData = 0x8375C1B8;
constexpr uint32_t kNamesNum = 0x8375C1BC;

// FNameEntry: the UTF-16BE text starts here. Everything before it is the hash
// link and flags, which we have no need for.
constexpr uint32_t kNameEntryString = 0x10;

// Sanity bounds. These only exist so a garbage read taken before the arrays are
// constructed cannot be acted on -- they are not tuned limits.
constexpr uint32_t kMaxPlausibleObjects = 0x100000;
constexpr uint32_t kMaxPlausibleNames = 0x40000;
constexpr size_t kMaxNameChars = 128;

// Guest memory is a set of mapped heaps, not one flat span -- startup reports
// `image=82000000-837F0000` and `rexcrt_heap: guest=0x20000000-0x30000000`,
// with plenty of reserved-but-uncommitted address space between and around
// them. A range test alone is therefore not a safety check: the first version
// of this file used one, dereferenced an address in an uncommitted region
// during the object walk, and took the process down with it.
//
// So every read is validated -- but against the *host* page state, not the
// guest heap's bookkeeping. BaseHeap::QueryProtect just hands back
// page_entry.current_protect from the heap's own page table, and for the
// loaded XEX image those entries are zero: the second version of this file
// treated that as "unreadable" and rejected the entire image, so GObjObjects
// and GNames both read as 0 and the walk never started. VirtualQuery on the
// translated host address is the thing that actually predicts whether a
// dereference faults, which is the only question being asked here.
//
// Cost is one VirtualQuery per page, memoised per thread. This started as a
// one-entry cache on the assumption that the walk reads sequentially. It does
// not: every object costs a hop from the pointer array to the object to the
// name table and back, so a single-entry cache missed on nearly every read and
// turned the walk into ~1M syscalls inside UGameEngine::Tick -- a multi-second
// freeze. Memoising every page instead brings it down to one query per distinct
// page touched, which is on the order of ten thousand.
//
// Staleness is bounded by clearing the map: the walk clears it on entry and
// runs entirely inside the guest's own tick, so the guest cannot free anything
// underneath it; the UI thread clears it once per frame.
bool AddrRangeSane(uint32_t addr) {
  return addr >= 0x00010000 && addr < 0xC0000000;
}

// Guest page base -> host pointer, or null for "queried and not readable".
// Negative results are memoised too; a snapshot with many dead pointers would
// otherwise re-query the same dead pages once per reference.
thread_local std::unordered_map<uint32_t, const uint8_t*> t_page_map;

void ResetPageCache() {
  t_page_map.clear();
}

// Host pointer for `addr` if the whole [addr, addr+size) range is readable
// guest memory, else null. Uses TranslateVirtual rather than membase + addr so
// that heaps carrying a host_address_offset resolve correctly.
const uint8_t* GuestRead(uint32_t addr, uint32_t size) {
  if (!AddrRangeSane(addr) || size == 0) {
    return nullptr;
  }
  // Straddling reads would need both pages checked; nothing here reads more
  // than 4 bytes at a time except ReadWide, which steps a character at a time.
  const uint32_t page = addr & ~0xFFFu;
  if ((addr + size - 1) > (page + 0xFFF)) {
    const uint8_t* first = GuestRead(addr, (page + 0x1000) - addr);
    if (first == nullptr || GuestRead(page + 0x1000, (addr + size) - (page + 0x1000)) == nullptr) {
      return nullptr;
    }
    return first;
  }

  const uint8_t* page_host = nullptr;
  auto it = t_page_map.find(page);
  if (it != t_page_map.end()) {
    page_host = it->second;
  } else {
    auto* ks = rex::system::kernel_state();
    auto* mem = ks ? ks->memory() : nullptr;
    if (mem == nullptr) {
      return nullptr;  // not cached: the kernel may exist by the next call
    }
    // TranslateVirtual, not membase + addr: heaps can carry a
    // host_address_offset, and it resolves to membase + addr when they do not.
    const uint8_t* host = mem->TranslateVirtual<const uint8_t*>(page);
    if (host != nullptr) {
      size_t length = 0;
      auto access = rex::memory::PageAccess::kNoAccess;
      const bool readable =
          rex::memory::QueryProtect(const_cast<uint8_t*>(host), length, access) &&
          (static_cast<int>(access) & static_cast<int>(rex::memory::PageAccess::kReadOnly)) != 0;
      if (!readable) {
        host = nullptr;
      }
    }
    t_page_map.emplace(page, host);
    page_host = host;
  }

  if (page_host == nullptr) {
    return nullptr;
  }
  return page_host + (addr - page);
}

// One-shot report of what the read path actually resolves for a known-good
// image address. If the walk comes back empty again, this says which step is
// responsible instead of leaving us to guess a third time.
void LogReadPathDiagnostic(uint32_t probe_addr) {
  auto* ks = rex::system::kernel_state();
  auto* mem = ks ? ks->memory() : nullptr;
  if (mem == nullptr) {
    RDAHM_WARN("[refl] diag: no kernel_state()->memory()");
    return;
  }
  const uint8_t* membase = mem->virtual_membase();
  const uint8_t* host = mem->TranslateVirtual<const uint8_t*>(probe_addr);
  size_t length = 0;
  auto access = rex::memory::PageAccess::kNoAccess;
  const bool queried = rex::memory::QueryProtect(
      const_cast<uint8_t*>(mem->TranslateVirtual<const uint8_t*>(probe_addr & ~0xFFFu)), length,
      access);
  RDAHM_INFO(
      "[refl] diag {:#010x}: membase={} host={} (delta={:#x}) query={} access={} region={:#x} "
      "-> GuestRead={}",
      probe_addr, static_cast<const void*>(membase), static_cast<const void*>(host),
      static_cast<uintptr_t>(host - membase), queried, static_cast<int>(access), length,
      static_cast<const void*>(GuestRead(probe_addr, 4)));
}

std::atomic<const uint8_t*> g_base{nullptr};
std::atomic<bool> g_refresh_requested{false};
std::atomic<uint64_t> g_sequence{0};

std::mutex g_snapshot_mutex;
std::shared_ptr<const RedahmObjectSnapshot> g_snapshot;

// FNameEntry text never changes for a given index -- UE3's name table is
// append-only -- so this can live across refreshes.
std::mutex g_name_cache_mutex;
std::unordered_map<uint32_t, std::string> g_name_cache;

// `base` is accepted only to keep the call sites readable; addresses are
// resolved through the memory system, not by adding to it.
uint32_t ReadU32(const uint8_t* base, uint32_t addr) {
  (void)base;
  const uint8_t* p = GuestRead(addr, 4);
  if (p == nullptr) {
    return 0;
  }
  return *reinterpret_cast<const rex::be_u32*>(p);
}

// UTF-16BE, folded to ASCII. Names in this engine are identifiers, so anything
// wide is a misread rather than real content and is worth seeing as '?'.
// Validated per character: a string that runs to the end of a mapped page
// simply stops there instead of reading into whatever follows.
std::string ReadWide(const uint8_t* base, uint32_t addr, size_t max_chars) {
  (void)base;
  std::string out;
  for (size_t i = 0; i < max_chars; ++i) {
    const uint8_t* p = GuestRead(addr + static_cast<uint32_t>(i * 2), 2);
    if (p == nullptr) {
      break;
    }
    const uint16_t ch = static_cast<uint16_t>((p[0] << 8) | p[1]);
    if (ch == 0) {
      break;
    }
    out.push_back(ch < 0x80 ? static_cast<char>(ch) : '?');
  }
  return out;
}

std::string ResolveNameIndex(const uint8_t* base, uint32_t index) {
  {
    std::lock_guard<std::mutex> lock(g_name_cache_mutex);
    auto it = g_name_cache.find(index);
    if (it != g_name_cache.end()) {
      return it->second;
    }
  }

  const uint32_t num = ReadU32(base, kNamesNum);
  if (num == 0 || num > kMaxPlausibleNames || index >= num) {
    return {};
  }
  const uint32_t data = ReadU32(base, kNamesData);
  if (!AddrRangeSane(data)) {
    return {};
  }
  const uint32_t entry = ReadU32(base, data + index * 4);
  if (!AddrRangeSane(entry)) {
    return {};
  }
  std::string text = ReadWide(base, entry + kNameEntryString, kMaxNameChars);
  if (text.empty()) {
    return {};
  }

  std::lock_guard<std::mutex> lock(g_name_cache_mutex);
  g_name_cache.emplace(index, text);
  return text;
}

std::string ResolveFName(const uint8_t* base, uint32_t index, uint32_t number) {
  std::string text = ResolveNameIndex(base, index);
  if (text.empty() || number == 0) {
    return text;
  }
  // FName::ToString appends the instance suffix as Number - 1.
  return text + "_" + std::to_string(number - 1);
}

std::string ReadObjectNameAt(const uint8_t* base, uint32_t obj) {
  const uint32_t idx = ReadU32(base, obj + kRedahmObjectNameOffset);
  const uint32_t num = ReadU32(base, obj + kRedahmObjectNameOffset + 4);
  return ResolveFName(base, idx, num);
}

}  // namespace

void RedahmRequestObjectRefresh() {
  g_refresh_requested.store(true, std::memory_order_relaxed);
}

bool RedahmObjectRefreshPending() {
  return g_refresh_requested.load(std::memory_order_relaxed);
}

const uint8_t* RedahmGuestBase() {
  return g_base.load(std::memory_order_relaxed);
}

uint32_t RedahmReadU32(uint32_t addr) {
  return ReadU32(g_base.load(std::memory_order_relaxed), addr);
}

void RedahmResetReadCache() {
  ResetPageCache();
}

std::vector<uint32_t> RedahmReadDwords(uint32_t addr, size_t count) {
  const uint8_t* base = g_base.load(std::memory_order_relaxed);
  std::vector<uint32_t> out;
  out.reserve(count);
  for (size_t i = 0; i < count; ++i) {
    out.push_back(ReadU32(base, addr + static_cast<uint32_t>(i * 4)));
  }
  return out;
}

std::string RedahmResolveFName(uint32_t index, uint32_t number) {
  return ResolveFName(g_base.load(std::memory_order_relaxed), index, number);
}

std::string RedahmReadObjectName(uint32_t obj_addr) {
  return ReadObjectNameAt(g_base.load(std::memory_order_relaxed), obj_addr);
}

std::string RedahmObjectPath(uint32_t obj_addr) {
  const uint8_t* base = g_base.load(std::memory_order_relaxed);
  // Outers first, so the result reads Package.Group.Object.
  std::vector<std::string> parts;
  uint32_t cur = obj_addr;
  for (int depth = 0; depth < 16 && AddrRangeSane(cur); ++depth) {
    std::string n = ReadObjectNameAt(base, cur);
    if (n.empty()) {
      break;
    }
    parts.push_back(std::move(n));
    const uint32_t outer = ReadU32(base, cur + kRedahmObjectOuterOffset);
    if (outer == cur) {
      break;  // self-referential Outer; bail rather than spin
    }
    cur = outer;
  }
  std::string out;
  for (auto it = parts.rbegin(); it != parts.rend(); ++it) {
    if (!out.empty()) {
      out += '.';
    }
    out += *it;
  }
  return out;
}

std::string RedahmClassChain(uint32_t class_addr) {
  const uint8_t* base = g_base.load(std::memory_order_relaxed);
  std::string out;
  uint32_t cur = class_addr;
  for (int depth = 0; depth < 24 && AddrRangeSane(cur); ++depth) {
    const std::string n = ReadObjectNameAt(base, cur);
    if (n.empty()) {
      break;
    }
    if (!out.empty()) {
      out += " <- ";
    }
    out += n;
    const uint32_t super = ReadU32(base, cur + kRedahmStructSuperOffset);
    if (super == cur) {
      break;
    }
    cur = super;
  }
  return out;
}

std::shared_ptr<const RedahmObjectSnapshot> RedahmObjects() {
  std::lock_guard<std::mutex> lock(g_snapshot_mutex);
  return g_snapshot;
}

void RedahmRefreshObjectSnapshot(uint8_t* base) {
  // Latched every frame rather than once: it costs a relaxed store, and it
  // means the UI can read guest memory as soon as the game has ticked even if
  // nobody has asked for a snapshot yet.
  g_base.store(base, std::memory_order_relaxed);

  if (!g_refresh_requested.exchange(false, std::memory_order_relaxed)) {
    return;
  }

  ResetPageCache();
  const auto walk_start = std::chrono::steady_clock::now();

  static bool logged_diag = false;
  if (!logged_diag) {
    logged_diag = true;
    LogReadPathDiagnostic(kRedahmObjObjectsData);
  }

  auto snap = std::make_shared<RedahmObjectSnapshot>();
  snap->sequence = g_sequence.fetch_add(1, std::memory_order_relaxed) + 1;
  snap->data_ptr = ReadU32(base, kRedahmObjObjectsData);
  snap->array_num = static_cast<int32_t>(ReadU32(base, kRedahmObjObjectsNum));
  snap->names_num = static_cast<int32_t>(ReadU32(base, kNamesNum));

  // Logged before the walk, not after. The first version only logged on
  // completion, so when it faulted mid-walk the log said nothing at all about
  // what it had been handed.
  RDAHM_INFO("[refl] walk #{} starting: GObjObjects Data={:#010x} Num={} | GNames Num={}",
             snap->sequence, snap->data_ptr, snap->array_num, snap->names_num);

  if (snap->array_num <= 0 || static_cast<uint32_t>(snap->array_num) > kMaxPlausibleObjects ||
      !AddrRangeSane(snap->data_ptr)) {
    RDAHM_WARN("[refl] GObjObjects not ready or implausible: Data={:#010x} Num={}", snap->data_ptr,
               snap->array_num);
    std::lock_guard<std::mutex> lock(g_snapshot_mutex);
    g_snapshot = std::move(snap);
    return;
  }

  // Class names are read once per distinct class rather than once per object;
  // a level is tens of thousands of objects across a few hundred classes.
  std::unordered_map<uint32_t, std::string> class_names;

  // How many slots pointed at memory that is not mapped. A handful means stale
  // entries; a flood means the array is not what we think it is, and the number
  // is far more useful than a silently short object list.
  int unreadable = 0;

  snap->objects.reserve(static_cast<size_t>(snap->array_num));
  for (int32_t i = 0; i < snap->array_num; ++i) {
    const uint32_t obj = ReadU32(base, snap->data_ptr + static_cast<uint32_t>(i) * 4);
    if (!AddrRangeSane(obj)) {
      ++snap->null_slots;
      continue;
    }
    // A slot that is non-null but unmapped is not an object. Skipping it keeps
    // one bad pointer from poisoning the whole snapshot.
    if (GuestRead(obj + kRedahmObjectClassOffset, 4) == nullptr) {
      ++unreadable;
      continue;
    }

    RedahmObject entry;
    entry.addr = obj;
    entry.index = i;
    entry.class_addr = ReadU32(base, obj + kRedahmObjectClassOffset);
    entry.name = ReadObjectNameAt(base, obj);

    if (AddrRangeSane(entry.class_addr)) {
      auto it = class_names.find(entry.class_addr);
      if (it == class_names.end()) {
        it = class_names.emplace(entry.class_addr, ReadObjectNameAt(base, entry.class_addr)).first;
      }
      entry.class_name = it->second;
    }

    snap->objects.push_back(std::move(entry));
  }

  const auto walk_ms = std::chrono::duration_cast<std::chrono::milliseconds>(
                           std::chrono::steady_clock::now() - walk_start)
                           .count();
  RDAHM_INFO(
      "[refl] snapshot #{}: {} objects ({} null slots, {} unmapped) across {} classes, "
      "GNames={}, {} pages, {} ms",
      snap->sequence, snap->objects.size(), snap->null_slots, unreadable, class_names.size(),
      snap->names_num, t_page_map.size(), walk_ms);
  // The walk runs inside UGameEngine::Tick, so its cost is a visible stall.
  // Worth saying out loud rather than leaving it to feel like a hang.
  if (walk_ms > 100) {
    RDAHM_WARN("[refl] walk stalled the game thread for {} ms", walk_ms);
  }
  if (unreadable > static_cast<int>(snap->objects.size())) {
    RDAHM_WARN(
        "[refl] more unmapped slots ({}) than live objects ({}) -- GObjObjects at {:#010x} is "
        "probably not a TArray<UObject*>",
        unreadable, snap->objects.size(), kRedahmObjObjectsData);
  }

  std::lock_guard<std::mutex> lock(g_snapshot_mutex);
  g_snapshot = std::move(snap);
}

static std::vector<RedahmProperty> EnumeratePropertiesUncached(uint32_t class_addr, int max_props) {
  const uint8_t* base = g_base.load(std::memory_order_relaxed);
  std::vector<RedahmProperty> out;

  // Outermost class first would list Object's fields before the leaf's; walking
  // leaf-first matches how the engine lays them out and reads better.
  uint32_t owner = class_addr;
  for (int depth = 0; depth < 24 && AddrRangeSane(owner); ++depth) {
    const std::string owner_name = ReadObjectNameAt(base, owner);
    uint32_t field = ReadU32(base, owner + kRedahmStructChildrenOffset);

    for (int guard = 0; guard < 4096 && AddrRangeSane(field); ++guard) {
      if (static_cast<int>(out.size()) >= max_props) {
        return out;
      }
      RedahmProperty p;
      p.addr = field;
      p.owner = owner_name;
      p.name = ReadObjectNameAt(base, field);
      p.type = ReadObjectNameAt(base, ReadU32(base, field + kRedahmObjectClassOffset));
      p.offset = ReadU32(base, field + kRedahmPropOffsetOffset);
      p.element_size = ReadU32(base, field + kRedahmPropElementSizeOffset);
      p.array_dim = static_cast<int32_t>(ReadU32(base, field + kRedahmPropArrayDimOffset));

      // Children also carries UFunction, UConst, UEnum and UStruct entries.
      // Only things whose class name ends in "Property" are readable fields;
      // this avoids needing the UProperty class pointer to test against.
      const bool is_property =
          p.type.size() > 8 && p.type.compare(p.type.size() - 8, 8, "Property") == 0;
      if (is_property && p.type == "StructProperty") {
        p.struct_name = ReadObjectNameAt(base, ReadU32(base, field + kRedahmStructPropStructOffset));
      }
      if (is_property && p.type == "BoolProperty") {
        p.options = {"True", "False"};
      }
      if (is_property && p.type == "ByteProperty") {
        // A byte with a UEnum behind it is really an enumeration; list its tags
        // so the value can be picked rather than typed as a number.
        const uint32_t enum_obj = ReadU32(base, field + kRedahmBytePropEnumOffset);
        if (AddrRangeSane(enum_obj)) {
          const uint32_t data = ReadU32(base, enum_obj + kRedahmEnumNamesData);
          const int32_t count = static_cast<int32_t>(ReadU32(base, enum_obj + kRedahmEnumNamesNum));
          if (AddrRangeSane(data) && count > 0 && count < 4096) {
            for (int32_t k = 0; k < count; ++k) {
              const uint32_t entry = data + static_cast<uint32_t>(k) * 8;
              std::string tag = ResolveFName(base, ReadU32(base, entry), ReadU32(base, entry + 4));
              if (!tag.empty()) {
                p.options.push_back(std::move(tag));
              }
            }
          }
        }
      }
      if (is_property && !p.name.empty()) {
        out.push_back(std::move(p));
      }

      const uint32_t next = ReadU32(base, field + kRedahmFieldNextOffset);
      if (next == field) {
        break;
      }
      field = next;
    }

    const uint32_t super = ReadU32(base, owner + kRedahmStructSuperOffset);
    if (super == owner) {
      break;
    }
    owner = super;
  }
  return out;
}

namespace {

// A class's property list never changes at runtime, so enumerating it is a
// one-off. It very much needs to be: the walk crosses Children/Next for the
// class and every ancestor, doing several validated guest reads and a name
// resolution per field. RedahmFindProperty was re-running that on every call,
// and UpdateView alone calls it three or four times a frame for the camera --
// which is what made the browser cost the game its framerate.
std::mutex g_props_cache_mutex;
std::unordered_map<uint32_t, std::shared_ptr<const std::vector<RedahmProperty>>> g_props_cache;

std::shared_ptr<const std::vector<RedahmProperty>> PropertiesFor(uint32_t class_addr) {
  {
    std::lock_guard<std::mutex> lock(g_props_cache_mutex);
    auto it = g_props_cache.find(class_addr);
    if (it != g_props_cache.end()) {
      return it->second;
    }
  }
  auto built = std::make_shared<const std::vector<RedahmProperty>>(
      EnumeratePropertiesUncached(class_addr, 4096));
  std::lock_guard<std::mutex> lock(g_props_cache_mutex);
  return g_props_cache.emplace(class_addr, std::move(built)).first->second;
}

}  // namespace

std::vector<RedahmProperty> RedahmEnumerateProperties(uint32_t class_addr, int max_props) {
  const auto props = PropertiesFor(class_addr);
  if (max_props <= 0 || props->size() <= static_cast<size_t>(max_props)) {
    return *props;
  }
  return std::vector<RedahmProperty>(props->begin(), props->begin() + max_props);
}

bool RedahmFindProperty(uint32_t class_addr, const char* name, RedahmProperty& out) {
  const auto props = PropertiesFor(class_addr);
  for (const auto& p : *props) {
    if (p.name.size() != std::strlen(name)) {
      continue;
    }
    bool same = true;
    for (size_t i = 0; i < p.name.size(); ++i) {
      if (std::tolower(static_cast<unsigned char>(p.name[i])) !=
          std::tolower(static_cast<unsigned char>(name[i]))) {
        same = false;
        break;
      }
    }
    if (same) {
      out = p;
      return true;
    }
  }
  return false;
}

std::vector<RedahmObjectOption> RedahmObjectOptionsFor(const RedahmObjectSnapshot& snapshot,
                                                       uint32_t prop_addr, int max_options) {
  const uint8_t* base = g_base.load(std::memory_order_relaxed);
  std::vector<RedahmObjectOption> out;
  out.push_back(RedahmObjectOption{0, "None"});

  const uint32_t prop_class = ReadU32(base, prop_addr + kRedahmObjectPropClassOffset);
  if (!AddrRangeSane(prop_class)) {
    return out;
  }

  for (const auto& o : snapshot.objects) {
    if (static_cast<int>(out.size()) >= max_options) {
      break;
    }
    // Class default objects are not assignable instances. Spelled out rather
    // than calling IsTemplateName, which is declared further down the file.
    if (o.name.empty() || o.name.compare(0, 9, "Default__") == 0) {
      continue;
    }
    // Accept the exact class or anything derived from it, the way an assignment
    // in the engine would.
    uint32_t cls = o.class_addr;
    bool derives = false;
    for (int depth = 0; depth < 24 && AddrRangeSane(cls); ++depth) {
      if (cls == prop_class) {
        derives = true;
        break;
      }
      const uint32_t super = ReadU32(base, cls + kRedahmStructSuperOffset);
      if (super == cls) {
        break;
      }
      cls = super;
    }
    if (!derives) {
      continue;
    }
    out.push_back(RedahmObjectOption{o.addr, RedahmObjectPath(o.addr)});
  }
  return out;
}

std::string RedahmFormatPropertyValue(const RedahmProperty& prop, uint32_t obj_addr,
                                      int32_t element) {
  const uint8_t* base = g_base.load(std::memory_order_relaxed);
  const uint32_t at =
      obj_addr + prop.offset + static_cast<uint32_t>(element) * prop.element_size;

  const auto read_float = [&](uint32_t a) {
    const uint32_t bits = ReadU32(base, a);
    float f = 0.0f;
    std::memcpy(&f, &bits, sizeof(f));
    return f;
  };
  const auto fmt = [](const char* f, auto... args) {
    char buf[256];
    std::snprintf(buf, sizeof(buf), f, args...);
    return std::string(buf);
  };

  if (prop.type == "IntProperty") {
    return fmt("%d", static_cast<int32_t>(ReadU32(base, at)));
  }
  if (prop.type == "FloatProperty") {
    return fmt("%g", read_float(at));
  }
  if (prop.type == "ByteProperty") {
    const uint8_t* p = GuestRead(at, 1);
    return p ? fmt("%u", *p) : std::string("<unreadable>");
  }
  if (prop.type == "BoolProperty") {
    const uint32_t mask = ReadU32(base, prop.addr + kRedahmBoolBitMaskOffset);
    const uint32_t word = ReadU32(base, at);
    if (mask == 0) {
      // No mask means this is not laid out the way UBoolProperty::ImportText
      // expects; showing the raw word beats inventing an answer.
      return fmt("0x%08X (no bitmask)", word);
    }
    return (word & mask) != 0 ? "True" : "False";
  }
  if (prop.type == "NameProperty") {
    return ResolveFName(base, ReadU32(base, at), ReadU32(base, at + 4));
  }
  if (prop.type == "ObjectProperty" || prop.type == "ClassProperty" ||
      prop.type == "ComponentProperty" || prop.type == "InterfaceProperty") {
    const uint32_t target = ReadU32(base, at);
    if (target == 0) {
      return "None";
    }
    const std::string path = RedahmObjectPath(target);
    return path.empty() ? fmt("%08X", target) : path;
  }
  if (prop.type == "StrProperty") {
    // FString is a TArray<TCHAR>: Data, ArrayNum, ArrayMax.
    const uint32_t data = ReadU32(base, at);
    const int32_t num = static_cast<int32_t>(ReadU32(base, at + 4));
    if (data == 0 || num <= 0) {
      return "\"\"";
    }
    return "\"" + ReadWide(base, data, std::min<size_t>(static_cast<size_t>(num), 256)) + "\"";
  }
  if (prop.type == "ArrayProperty") {
    return fmt("[%d elements]", static_cast<int32_t>(ReadU32(base, at + 4)));
  }
  if (prop.type == "StructProperty") {
    // Formatted the way UE writes it, because this text is also what gets fed
    // back to ImportText when the value is edited. The previous format --
    // "(1, 2, 3) | ints (...)" -- was readable but not parseable, so editing a
    // Location silently failed: the grid handed ImportText a string it had no
    // way to understand.
    const auto i32at = [&](uint32_t a) { return static_cast<int32_t>(ReadU32(base, a)); };
    if (prop.struct_name == "Vector") {
      return fmt("(X=%g,Y=%g,Z=%g)", read_float(at), read_float(at + 4), read_float(at + 8));
    }
    if (prop.struct_name == "Rotator") {
      return fmt("(Pitch=%d,Yaw=%d,Roll=%d)", i32at(at), i32at(at + 4), i32at(at + 8));
    }
    if (prop.struct_name == "Vector2D") {
      return fmt("(X=%g,Y=%g)", read_float(at), read_float(at + 4));
    }
    if (prop.struct_name == "Color") {
      const uint8_t* p = GuestRead(at, 4);
      return p ? fmt("(B=%u,G=%u,R=%u,A=%u)", p[0], p[1], p[2], p[3]) : std::string("<unreadable>");
    }
    if (prop.struct_name == "LinearColor") {
      return fmt("(R=%g,G=%g,B=%g,A=%g)", read_float(at), read_float(at + 4), read_float(at + 8),
                 read_float(at + 12));
    }
    return fmt("<%s, %u bytes>",
               prop.struct_name.empty() ? "struct" : prop.struct_name.c_str(), prop.element_size);
  }
  return fmt("0x%08X", ReadU32(base, at));
}

namespace {

constexpr float kPi = 3.14159265358979323846f;

// FRotator stores 65536 units per full turn.
float RotatorToRadians(int32_t units) {
  return static_cast<float>(units) * (2.0f * kPi / 65536.0f);
}

RedahmVec3 ReadVec3(const uint8_t* base, uint32_t addr) {
  RedahmVec3 v;
  const uint32_t xb = ReadU32(base, addr);
  const uint32_t yb = ReadU32(base, addr + 4);
  const uint32_t zb = ReadU32(base, addr + 8);
  std::memcpy(&v.x, &xb, 4);
  std::memcpy(&v.y, &yb, 4);
  std::memcpy(&v.z, &zb, 4);
  return v;
}

// Class -> byte offset of its Location property, or -1 when it has none.
// Enumerating properties per object would be hopeless across 150k objects;
// per class it is a few hundred lookups.
std::mutex g_loc_cache_mutex;
std::unordered_map<uint32_t, int64_t> g_loc_offset_cache;

int64_t LocationOffsetForClass(uint32_t class_addr) {
  {
    std::lock_guard<std::mutex> lock(g_loc_cache_mutex);
    auto it = g_loc_offset_cache.find(class_addr);
    if (it != g_loc_offset_cache.end()) {
      return it->second;
    }
  }
  RedahmProperty p;
  int64_t off = -1;
  if (RedahmFindProperty(class_addr, "Location", p) && p.element_size >= 12) {
    off = static_cast<int64_t>(p.offset);
  }
  std::lock_guard<std::mutex> lock(g_loc_cache_mutex);
  g_loc_offset_cache.emplace(class_addr, off);
  return off;
}

// Class default objects carry a Location too, and they are not in the world.
bool IsTemplateName(const std::string& name) {
  return name.compare(0, 9, "Default__") == 0;
}

}  // namespace

bool RedahmObjectLocation(uint32_t obj_addr, uint32_t class_addr, RedahmVec3& out) {
  const int64_t off = LocationOffsetForClass(class_addr);
  if (off < 0) {
    return false;
  }
  out = ReadVec3(g_base.load(std::memory_order_relaxed), obj_addr + static_cast<uint32_t>(off));
  return true;
}

namespace {

// How to size the box for a given class, worked out once and reused. Resolving
// this per frame would mean re-enumerating the class's whole property list
// every frame for the selected object.
struct BoundsPlan {
  enum Kind { kNone, kCylinder, kBoxExtent, kSphere } kind = kNone;
  uint32_t a = 0;  // radius / box-extent / sphere-radius offset
  uint32_t b = 0;  // height offset, cylinder only
  uint32_t component_offset = 0;
  bool via_component = false;
  const char* source = "default";
};

std::mutex g_bounds_cache_mutex;
std::unordered_map<uint32_t, BoundsPlan> g_bounds_cache;

BoundsPlan ResolveBoundsPlan(uint32_t class_addr) {
  BoundsPlan plan;
  RedahmProperty r;
  RedahmProperty h;
  if (RedahmFindProperty(class_addr, "CollisionRadius", r) &&
      RedahmFindProperty(class_addr, "CollisionHeight", h)) {
    plan.kind = BoundsPlan::kCylinder;
    plan.a = r.offset;
    plan.b = h.offset;
    plan.source = "CollisionRadius/Height";
    return plan;
  }

  // Otherwise the size lives on a component. CollisionComponent first, then the
  // usual mesh components -- a prop or an NPC carries its real extent on the
  // thing that draws it, not on the actor.
  static constexpr const char* kComponentProps[] = {
      "CollisionComponent", "Mesh", "StaticMeshComponent", "SkeletalMeshComponent", "LightEnvironment"};
  for (const char* name : kComponentProps) {
    RedahmProperty comp;
    if (RedahmFindProperty(class_addr, name, comp)) {
      plan.component_offset = comp.offset;
      plan.via_component = true;
      plan.source = name;
      return plan;
    }
  }
  return plan;
}

BoundsPlan BoundsPlanForClass(uint32_t class_addr) {
  {
    std::lock_guard<std::mutex> lock(g_bounds_cache_mutex);
    auto it = g_bounds_cache.find(class_addr);
    if (it != g_bounds_cache.end()) {
      return it->second;
    }
  }
  BoundsPlan plan = ResolveBoundsPlan(class_addr);
  std::lock_guard<std::mutex> lock(g_bounds_cache_mutex);
  g_bounds_cache.emplace(class_addr, plan);
  return plan;
}

float ReadFloatAt(const uint8_t* base, uint32_t addr) {
  const uint32_t bits = ReadU32(base, addr);
  float f = 0.0f;
  std::memcpy(&f, &bits, sizeof(f));
  return f;
}

// The collision component's own layout, cached per component class. Without
// this the highlight re-enumerated the component class's entire property list
// three or four times every frame, since each RedahmFindProperty call walks it
// from scratch.
struct CompPlan {
  // kBoxSphereBounds is UPrimitiveComponent::Bounds, an FBoxSphereBounds of
  // { FVector Origin; FVector BoxExtent; FLOAT SphereRadius; }. It is already
  // in world space and already encloses the rendered mesh, which makes it far
  // and away the best source -- the earlier attempt looked for CollisionRadius
  // and CollisionHeight on the actor, but in UE3 those are accessors rather
  // than properties, so almost nothing resolved and only one object in 176 on
  // screen ended up with a usable box.
  enum Kind { kNone, kBoxSphereBounds, kBox, kCylinder, kSphere } kind = kNone;
  uint32_t a = 0;
  uint32_t b = 0;
  const char* source = "";
};

std::mutex g_comp_cache_mutex;
std::unordered_map<uint32_t, CompPlan> g_comp_cache;

CompPlan CompPlanForClass(uint32_t comp_class) {
  {
    std::lock_guard<std::mutex> lock(g_comp_cache_mutex);
    auto it = g_comp_cache.find(comp_class);
    if (it != g_comp_cache.end()) {
      return it->second;
    }
  }
  CompPlan plan;
  RedahmProperty p;
  RedahmProperty q;
  if (RedahmFindProperty(comp_class, "Bounds", p) && p.element_size >= 28) {
    plan = CompPlan{CompPlan::kBoxSphereBounds, p.offset, 0, "Bounds"};
  } else if (RedahmFindProperty(comp_class, "BoxExtent", p) && p.element_size >= 12) {
    plan = CompPlan{CompPlan::kBox, p.offset, 0, "BoxExtent"};
  } else if (RedahmFindProperty(comp_class, "CollisionRadius", p) &&
             RedahmFindProperty(comp_class, "CollisionHeight", q)) {
    plan = CompPlan{CompPlan::kCylinder, p.offset, q.offset, "component cylinder"};
  } else if (RedahmFindProperty(comp_class, "SphereRadius", p)) {
    plan = CompPlan{CompPlan::kSphere, p.offset, 0, "SphereRadius"};
  }
  std::lock_guard<std::mutex> lock(g_comp_cache_mutex);
  g_comp_cache.emplace(comp_class, plan);
  return plan;
}

}  // namespace

bool RedahmObjectBounds(uint32_t obj_addr, uint32_t class_addr, RedahmBounds& out) {
  if (!RedahmObjectLocation(obj_addr, class_addr, out.center)) {
    return false;
  }
  const uint8_t* base = g_base.load(std::memory_order_relaxed);

  // Visible at arm's length and at distance without being silly either way.
  out.extent = RedahmVec3{48.0f, 48.0f, 48.0f};
  out.measured = false;
  out.source = "default";

  const BoundsPlan plan = BoundsPlanForClass(class_addr);
  if (plan.kind == BoundsPlan::kCylinder) {
    const float r = ReadFloatAt(base, obj_addr + plan.a);
    const float h = ReadFloatAt(base, obj_addr + plan.b);
    if (r > 0.1f && h > 0.1f && r < 100000.0f && h < 100000.0f) {
      out.extent = RedahmVec3{r, r, h};
      out.measured = true;
      out.source = plan.source;
    }
    return true;
  }

  if (plan.via_component) {
    const uint32_t comp = ReadU32(base, obj_addr + plan.component_offset);
    if (AddrRangeSane(comp)) {
      const CompPlan cp = CompPlanForClass(ReadU32(base, comp + kRedahmObjectClassOffset));
      if (cp.kind == CompPlan::kBoxSphereBounds) {
        // FBoxSphereBounds: Origin, BoxExtent, SphereRadius -- world space, so
        // it replaces the centre as well as the extent.
        const RedahmVec3 origin{ReadFloatAt(base, comp + cp.a), ReadFloatAt(base, comp + cp.a + 4),
                                ReadFloatAt(base, comp + cp.a + 8)};
        const RedahmVec3 e{ReadFloatAt(base, comp + cp.a + 12),
                           ReadFloatAt(base, comp + cp.a + 16),
                           ReadFloatAt(base, comp + cp.a + 20)};
        if (e.x > 0.1f && e.y > 0.1f && e.z > 0.1f && e.x < 1e6f && e.y < 1e6f && e.z < 1e6f) {
          out.center = origin;
          out.extent = e;
          out.measured = true;
          out.source = cp.source;
        }
      } else if (cp.kind == CompPlan::kBox) {
        const RedahmVec3 e{ReadFloatAt(base, comp + cp.a), ReadFloatAt(base, comp + cp.a + 4),
                           ReadFloatAt(base, comp + cp.a + 8)};
        if (e.x > 0.1f && e.y > 0.1f && e.z > 0.1f) {
          out.extent = e;
          out.measured = true;
          out.source = cp.source;
        }
      } else if (cp.kind == CompPlan::kCylinder) {
        const float r = ReadFloatAt(base, comp + cp.a);
        const float h = ReadFloatAt(base, comp + cp.b);
        if (r > 0.1f && h > 0.1f) {
          out.extent = RedahmVec3{r, r, h};
          out.measured = true;
          out.source = cp.source;
        }
      } else if (cp.kind == CompPlan::kSphere) {
        const float r = ReadFloatAt(base, comp + cp.a);
        if (r > 0.1f) {
          out.extent = RedahmVec3{r, r, r};
          out.measured = true;
          out.source = cp.source;
        }
      }
    }
  }
  return true;
}

RedahmViewInfo RedahmFindView(const RedahmObjectSnapshot& snapshot, uint32_t preferred) {
  const uint8_t* base = g_base.load(std::memory_order_relaxed);
  RedahmViewInfo view;

  uint32_t cam = preferred;
  uint32_t cam_class = 0;
  std::string cam_class_name;

  if (cam != 0) {
    cam_class = ReadU32(base, cam + kRedahmObjectClassOffset);
    cam_class_name = ReadObjectNameAt(base, cam_class);
  } else {
    // Ask the PlayerController which camera is actually rendering. Scanning for
    // a class named *Camera* and taking the last match was picking placed
    // cutscene CameraActors -- the view came out hundreds of metres from the
    // player, so every pick landed on distant props and no nearby object was
    // ever a candidate.
    uint32_t pc = 0;
    for (const auto& o : snapshot.objects) {
      if (o.class_name.find("PlayerController") == std::string::npos) {
        continue;
      }
      if (o.name.empty() || IsTemplateName(o.name)) {
        continue;
      }
      pc = o.addr;  // last wins: the live controller outlives any archetype
    }
    if (pc != 0) {
      const uint32_t pc_class = ReadU32(base, pc + kRedahmObjectClassOffset);
      RedahmProperty cam_prop;
      if (RedahmFindProperty(pc_class, "PlayerCamera", cam_prop)) {
        const uint32_t candidate = ReadU32(base, pc + cam_prop.offset);
        if (AddrRangeSane(candidate)) {
          cam = candidate;
          cam_class = ReadU32(base, cam + kRedahmObjectClassOffset);
          cam_class_name = ReadObjectNameAt(base, cam_class);
          view.via = "PlayerController.PlayerCamera";
        }
      }
    }

    if (cam == 0) {
      // Fallback: the old class-name scan, which is better than no view at all
      // but is exactly the guess that went wrong, so it says so.
      for (const auto& o : snapshot.objects) {
        if (o.class_name.find("Camera") == std::string::npos) {
          continue;
        }
        if (o.name.empty() || IsTemplateName(o.name)) {
          continue;
        }
        if (LocationOffsetForClass(o.class_addr) < 0) {
          continue;
        }
        cam = o.addr;
        cam_class = o.class_addr;
        cam_class_name = o.class_name;
        view.via = "class-name guess";
      }
    }
  }

  if (cam == 0 || cam_class == 0) {
    return view;
  }

  RedahmProperty loc_prop;
  RedahmProperty rot_prop;
  if (!RedahmFindProperty(cam_class, "Location", loc_prop) ||
      !RedahmFindProperty(cam_class, "Rotation", rot_prop)) {
    return view;
  }

  view.location = ReadVec3(base, cam + loc_prop.offset);
  view.pitch = RotatorToRadians(static_cast<int32_t>(ReadU32(base, cam + rot_prop.offset)));
  view.yaw = RotatorToRadians(static_cast<int32_t>(ReadU32(base, cam + rot_prop.offset + 4)));
  view.roll = RotatorToRadians(static_cast<int32_t>(ReadU32(base, cam + rot_prop.offset + 8)));

  // FOVAngle is the usual name; DefaultFOV is the fallback ACamera carries.
  RedahmProperty fov_prop;
  if (RedahmFindProperty(cam_class, "FOVAngle", fov_prop) ||
      RedahmFindProperty(cam_class, "DefaultFOV", fov_prop)) {
    const uint32_t bits = ReadU32(base, cam + fov_prop.offset);
    float f = 0.0f;
    std::memcpy(&f, &bits, 4);
    if (f > 1.0f && f < 179.0f) {
      view.fov_deg = f;
      view.fov_from_property = true;
    }
  }

  view.valid = true;
  view.source_addr = cam;
  view.source_class = cam_class_name;
  view.source_path = RedahmObjectPath(cam);
  return view;
}

bool RedahmProjectToScreen(const RedahmViewInfo& view, const RedahmVec3& world, float width,
                           float height, float& out_x, float& out_y, float& out_depth) {
  if (!view.valid || width <= 0.0f || height <= 0.0f) {
    return false;
  }
  // Unreal axes: X forward, Y right, Z up. Roll is ignored -- gameplay cameras
  // here do not roll, and including it would only rotate the picking disc.
  const float cp = std::cos(view.pitch);
  const float sp = std::sin(view.pitch);
  const float cy = std::cos(view.yaw);
  const float sy = std::sin(view.yaw);

  const RedahmVec3 fwd{cp * cy, cp * sy, sp};
  const RedahmVec3 right{-sy, cy, 0.0f};
  // up = right x forward
  const RedahmVec3 up{right.y * fwd.z - right.z * fwd.y, right.z * fwd.x - right.x * fwd.z,
                      right.x * fwd.y - right.y * fwd.x};

  const RedahmVec3 d{world.x - view.location.x, world.y - view.location.y,
                     world.z - view.location.z};

  const float z = d.x * fwd.x + d.y * fwd.y + d.z * fwd.z;
  if (z <= 1.0f) {
    return false;  // behind the camera, or on top of it
  }
  const float x = d.x * right.x + d.y * right.y + d.z * right.z;
  const float y = d.x * up.x + d.y * up.y + d.z * up.z;

  // UE3's FOVAngle is horizontal.
  const float half_h_tan = std::tan(view.fov_deg * 0.5f * kPi / 180.0f);
  const float half_v_tan = half_h_tan * (height / width);

  out_x = (0.5f + 0.5f * (x / z) / half_h_tan) * width;
  out_y = (0.5f - 0.5f * (y / z) / half_v_tan) * height;
  out_depth = z;
  return true;
}

namespace {

// Virtual slots, byte offsets into the vtable, all read off sub_822A1230.
constexpr uint32_t kSlotPreEditChange = 64;
constexpr uint32_t kSlotPostEditChange = 72;
constexpr uint32_t kSlotImportText = 312;  // on the *property's* vtable
constexpr uint32_t kObjectFlagSkipMask = 0x200;

bool InImage(uint32_t a) {
  return a >= 0x82000000 && a < 0x837F0000;
}

struct PendingEdit {
  uint32_t obj = 0;
  uint32_t prop = 0;
  std::string text;
  bool post_edit_change = true;
};

std::mutex g_edit_mutex;
std::vector<PendingEdit> g_edit_queue;
std::vector<RedahmEditRecord> g_edit_log;
constexpr size_t kMaxEditLog = 32;

void RecordEdit(RedahmEditRecord rec) {
  std::lock_guard<std::mutex> lock(g_edit_mutex);
  g_edit_log.push_back(std::move(rec));
  while (g_edit_log.size() > kMaxEditLog) {
    g_edit_log.erase(g_edit_log.begin());
  }
}

bool ApplyEdit(PPCContext& __restrict ctx, uint8_t* base, const PendingEdit& e,
               std::string& detail) {
  const uint8_t* rb = g_base.load(std::memory_order_relaxed);
  const uint32_t obj_vt = ReadU32(rb, e.obj);
  const uint32_t prop_vt = ReadU32(rb, e.prop);
  if (!InImage(obj_vt) || !InImage(prop_vt)) {
    detail = "object or property vtable not in image";
    return false;
  }
  const uint32_t offset = ReadU32(rb, e.prop + kRedahmPropOffsetOffset);
  const uint32_t fn_import = ReadU32(rb, prop_vt + kSlotImportText);
  const uint32_t fn_pre = ReadU32(rb, obj_vt + kSlotPreEditChange);
  const uint32_t fn_post = ReadU32(rb, obj_vt + kSlotPostEditChange);
  if (!InImage(fn_import)) {
    detail = "ImportText slot empty";
    return false;
  }

  // Same stack discipline the console dispatcher uses: the text buffer sits
  // above the callee reserve so a callee writing its parameter save area into
  // our frame cannot clobber it.
  constexpr uint32_t kCalleeReserve = 0x200;
  constexpr uint32_t kRedZone = 0x100;
  const uint32_t saved_r1 = ctx.r1.u32;
  const uint32_t saved_r3 = ctx.r3.u32;
  const uint64_t saved_lr = ctx.lr;
  const uint64_t saved_ctr = ctx.ctr.u64;

  const uint32_t bytes = static_cast<uint32_t>((e.text.size() + 1) * 2);
  const uint32_t buf = (saved_r1 - kRedZone - bytes) & ~15u;
  uint8_t* p = base + buf;
  for (size_t i = 0; i < e.text.size(); ++i) {
    p[i * 2] = 0;
    p[i * 2 + 1] = static_cast<uint8_t>(e.text[i]);
  }
  p[e.text.size() * 2] = 0;
  p[e.text.size() * 2 + 1] = 0;
  const uint32_t call_sp = (buf - kCalleeReserve) & ~15u;

  const auto call = [&](uint32_t fnptr, uint32_t a3, uint32_t a4, uint32_t a5, uint32_t a6,
                        uint32_t a7, uint32_t a8) {
    PPCFunc* fn = rex::runtime::ResolveIndirectFunction(fnptr);
    if (fn == nullptr) {
      return false;
    }
    ctx.r1.u32 = call_sp;
    ctx.r3.u32 = a3;
    ctx.r4.u32 = a4;
    ctx.r5.u32 = a5;
    ctx.r6.u32 = a6;
    ctx.r7.u32 = a7;
    ctx.r8.u32 = a8;
    fn(ctx, base);
    return true;
  };

  // The engine skips objects whose flags carry 0x200 before calling either
  // edit notification, so honour that rather than notifying a dying object.
  const bool notify =
      e.post_edit_change && (ReadU32(rb, e.obj + 0x0C) & kObjectFlagSkipMask) == 0;

  if (notify && InImage(fn_pre)) {
    call(fn_pre, e.obj, e.prop, 0, 0, 0, 0);
  }
  const bool imported = call(fn_import, e.prop, buf, e.obj + offset, 1, e.obj, 0);
  if (notify && InImage(fn_post)) {
    call(fn_post, e.obj, e.prop, 0, 0, 0, 0);
  }

  ctx.r1.u32 = saved_r1;
  ctx.r3.u32 = saved_r3;
  ctx.lr = saved_lr;
  ctx.ctr.u64 = saved_ctr;

  if (!imported) {
    detail = "could not resolve ImportText";
    return false;
  }
  detail = notify ? "imported + PostEditChange" : "imported";
  return true;
}

}  // namespace

void RedahmQueuePropertyEdit(uint32_t obj_addr, uint32_t prop_addr, std::string text,
                             bool post_edit_change) {
  if (!AddrRangeSane(obj_addr) || !AddrRangeSane(prop_addr)) {
    return;
  }
  std::lock_guard<std::mutex> lock(g_edit_mutex);
  g_edit_queue.push_back(PendingEdit{obj_addr, prop_addr, std::move(text), post_edit_change});
}

size_t RedahmPropertyEditQueueDepth() {
  std::lock_guard<std::mutex> lock(g_edit_mutex);
  return g_edit_queue.size();
}

std::vector<RedahmEditRecord> RedahmPropertyEditLog() {
  std::lock_guard<std::mutex> lock(g_edit_mutex);
  return g_edit_log;
}

void RedahmDrainPropertyEdits(PPCContext& __restrict ctx, uint8_t* base) {
  for (;;) {
    PendingEdit e;
    {
      std::lock_guard<std::mutex> lock(g_edit_mutex);
      if (g_edit_queue.empty()) {
        return;
      }
      e = std::move(g_edit_queue.front());
      g_edit_queue.erase(g_edit_queue.begin());
    }

    ResetPageCache();
    const std::string target = RedahmObjectPath(e.obj) + "." + RedahmReadObjectName(e.prop);
    // Logged before the call: ImportText runs guest code, and if it faults this
    // line is the only record of what was being written.
    RDAHM_INFO("[refl] set {} = \"{}\"", target, e.text);

    std::string detail;
    const bool ok = ApplyEdit(ctx, base, e, detail);
    RDAHM_INFO("[refl] set {} -> {} ({})", target, ok ? "ok" : "failed", detail);
    RecordEdit(RedahmEditRecord{target, e.text, ok, detail});
  }
}

std::vector<RedahmFieldProbe> RedahmProbeObjectFields(const RedahmObjectSnapshot& snapshot,
                                                      uint32_t max_offset, int sample_limit) {
  std::vector<RedahmFieldProbe> probes;
  if (snapshot.objects.empty()) {
    return probes;
  }

  std::unordered_set<uint32_t> addrs;
  addrs.reserve(snapshot.objects.size() * 2);
  for (const auto& o : snapshot.objects) {
    addrs.insert(o.addr);
  }

  const size_t samples =
      sample_limit > 0
          ? std::min(snapshot.objects.size(), static_cast<size_t>(sample_limit))
          : snapshot.objects.size();

  for (uint32_t off = 0; off <= max_offset; off += 4) {
    RedahmFieldProbe probe;
    probe.offset = off;
    probe.samples = static_cast<int>(samples);
    for (size_t i = 0; i < samples; ++i) {
      const uint32_t v = RedahmReadU32(snapshot.objects[i].addr + off);
      if (v == 0) {
        continue;
      }
      ++probe.nonzero;
      if (addrs.count(v) != 0) {
        ++probe.object_hits;
      } else if (v >= 0x82000000 && v < 0x83400000) {
        ++probe.code_hits;
      }
    }
    probes.push_back(probe);
  }
  return probes;
}

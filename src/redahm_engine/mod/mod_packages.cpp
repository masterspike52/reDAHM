// UE3 package edits for drop-in mods.
//
// Packages (UE3 v455, Xbox 360): big endian. The summary runs Tag, Version,
// TotalHeaderSize, FolderName, PackageFlags, NameCount/Offset,
// ExportCount/Offset, ImportCount/Offset, DependsOffset, Guid, Generations
// (count, 12 bytes each), EngineVersion, CookerVersion, CompressionFlags and
// CompressedChunks (count, then UncompressedOffset/Size, CompressedOffset/Size
// each). A compressed package keeps the summary uncompressed and each chunk as
// a UE3 compressed chunk: tag, block size, compressed and uncompressed size,
// the blocks' (compressed, uncompressed) sizes, then LZO1X blocks. A fully
// compressed package (Engine.xxx, KronosGame.xxx...) is one such chunk.
//   Name: FString, flags as two words (low first).
//   Import: ClassPackage, ClassName (FNames), Outer, ObjectName.
//   Export: Class, Super, Outer, ObjectName (FName), Archetype, ObjectFlags
//     (64-bit), SerialSize, SerialOffset, ComponentMap (count, FName + int
//     each), ExportFlags, NetObjects (count, ints), PackageGuid.
//
// Edited packages are written uncompressed (flags and chunk count cleared,
// PKG_StoreCompressed off), the form the game's own uncompressed packages
// (Engine and character packages) already take.
//
// .PackagePatch (UPK Explorer; little endian): version, then three table
// updates (original count; entries of index, entry in the package's layout,
// is-new byte) for names, imports and exports; object updates (export index,
// local offset records of position and 64-bit flag, serialized data); v2 adds
// reference lists used only for validation. The TFC Installer applies one by
// replacing the updated entries, appending new ones, and giving each updated
// object its data: in its own slot when it fits, else at the end of the file.
// A local offset record marks a file offset inside the data stored relative to
// the object's start. Tables that change are written again at the end of the
// file and the summary pointed at them. Checked against the installer's output
// for every patch in a 253-package mod.
//
// .TFCMapping (little endian): -1, version, (v3) bulk byte, entry count; each
// entry an object path ("Group\Name"), its external TFC mips (count, TFC name,
// index, mips) and its local mips (count, TFC name, index, mips); a mip is
// compression, offset, size on disk, element count, width, height. Local mips
// are embedded in the package: a mapped Texture2D gets the entry's mips (data
// from the pack's .tfc, LZO blocks kept compressed; size -1 = empty, packed in
// the mip tail), SizeX/SizeY and OriginalSizeX/Y set to the top mip,
// FirstResourceMemMip and MipTailBaseIdx to the first and last mip with data
// (single-mip textures: OriginalSize only, and both indices removed), and its
// TextureFileCacheName dropped. External TFC mips aren't supported yet.

#include "redahm_engine/mod/mod_packages.h"

#include <algorithm>
#include <cctype>
#include <cstring>
#include <stdexcept>
#include <string_view>

namespace redahm::mods {

namespace {

constexpr uint32_t kPackageTag = 0x9E2A83C1;
constexpr uint32_t kFullyCompressedBlock = 0x20000;
constexpr uint32_t kStoreCompressed = 0x02000000;
constexpr size_t kImportSize = 28;
constexpr size_t kExportFixedSize = 40;
constexpr size_t kExportSerialSize = 32;  // SerialSize, then SerialOffset
constexpr uint32_t kBulkLzo = 0x10;
constexpr uint32_t kBulkEmpty = 0x21;
constexpr uint32_t kBulkSeparateFile = 0x1;

struct Bad : std::runtime_error {
  using std::runtime_error::runtime_error;
};

// Byte access with bounds checks, big or little endian.
struct Reader {
  const uint8_t* data;
  size_t size;
  size_t pos = 0;
  bool little = false;

  void Need(size_t n) const {
    if (pos > size || size - pos < n)
      throw Bad("read past the end");
  }
  uint32_t U32() {
    Need(4);
    const uint8_t* p = data + pos;
    pos += 4;
    return little ? uint32_t(p[0]) | uint32_t(p[1]) << 8 | uint32_t(p[2]) << 16 | uint32_t(p[3]) << 24
                  : uint32_t(p[3]) | uint32_t(p[2]) << 8 | uint32_t(p[1]) << 16 | uint32_t(p[0]) << 24;
  }
  int32_t I32() { return int32_t(U32()); }
  uint64_t U64() {
    const uint64_t a = U32(), b = U32();
    return little ? a | b << 32 : a << 32 | b;
  }
  uint8_t U8() {
    Need(1);
    return data[pos++];
  }
  const uint8_t* Take(size_t n) {
    Need(n);
    const uint8_t* p = data + pos;
    pos += n;
    return p;
  }
  // FString: length (negative: UTF-16 characters), text with its terminator.
  std::string String() {
    const int32_t n = I32();
    if (n == 0)
      return {};
    std::string out;
    if (n > 0) {
      const uint8_t* p = Take(size_t(n));
      out.assign(reinterpret_cast<const char*>(p), size_t(n));
    } else {
      const size_t chars = size_t(-int64_t(n));
      const uint8_t* p = Take(chars * 2);
      for (size_t i = 0; i < chars; ++i) {
        const uint16_t c = little ? uint16_t(p[2 * i] | p[2 * i + 1] << 8)
                                  : uint16_t(p[2 * i] << 8 | p[2 * i + 1]);
        out += c < 0x80 ? char(c) : '?';
      }
    }
    while (!out.empty() && out.back() == '\0')
      out.pop_back();
    return out;
  }
};

uint32_t Be32(const Bytes& b, size_t at) {
  if (at + 4 > b.size())
    throw Bad("read past the end");
  return uint32_t(b[at]) << 24 | uint32_t(b[at + 1]) << 16 | uint32_t(b[at + 2]) << 8 | b[at + 3];
}
void PutBe32(uint8_t* p, uint32_t v) {
  p[0] = uint8_t(v >> 24);
  p[1] = uint8_t(v >> 16);
  p[2] = uint8_t(v >> 8);
  p[3] = uint8_t(v);
}
void PutBe32(Bytes& b, size_t at, uint32_t v) {
  if (at + 4 > b.size())
    throw Bad("write past the end");
  PutBe32(b.data() + at, v);
}
void AppendBe32(Bytes& b, uint32_t v) {
  const size_t at = b.size();
  b.resize(at + 4);
  PutBe32(b.data() + at, v);
}
void AppendBe64(Bytes& b, uint64_t v) {
  AppendBe32(b, uint32_t(v >> 32));
  AppendBe32(b, uint32_t(v));
}
void AppendString(Bytes& b, const std::string& s) {
  AppendBe32(b, uint32_t(s.size() + 1));
  b.insert(b.end(), s.begin(), s.end());
  b.push_back(0);
}

//------------------------------------------------------------------------------
// LZO and compressed chunks
//------------------------------------------------------------------------------

// A UE3 compressed chunk at `at`, appended to `out`; returns the end of the
// chunk.
size_t ReadCompressedChunk(const Bytes& file, size_t at, Bytes& out) {
  Reader r{file.data(), file.size(), at};
  if (r.U32() != kPackageTag)
    throw Bad("bad compressed chunk");
  const uint32_t block_size = r.U32();
  r.U32();  // compressed size
  const uint32_t total = r.U32();
  if (!block_size)
    throw Bad("bad compressed chunk");
  const size_t blocks = (size_t(total) + block_size - 1) / block_size;
  std::vector<std::pair<uint32_t, uint32_t>> table(blocks);
  for (auto& [compressed, uncompressed] : table) {
    compressed = r.U32();
    uncompressed = r.U32();
  }
  for (const auto& [compressed, uncompressed] : table) {
    const uint8_t* src = r.Take(compressed);
    Bytes piece;
    if (!Lzo1xDecompress(src, compressed, piece, uncompressed) || piece.size() != uncompressed)
      throw Bad("corrupt LZO block");
    out.insert(out.end(), piece.begin(), piece.end());
  }
  return r.pos;
}

//------------------------------------------------------------------------------
// Packages
//------------------------------------------------------------------------------

struct Summary {
  size_t flags_at = 0;  // PackageFlags, then the name/export/import counts and offsets
  uint32_t flags = 0;
  int32_t name_count = 0, name_offset = 0;
  int32_t export_count = 0, export_offset = 0;
  int32_t import_count = 0, import_offset = 0;
  size_t compression_at = 0;  // CompressionFlags, then the chunk count
};

Summary ReadSummary(const Bytes& b) {
  Reader r{b.data(), b.size()};
  if (r.U32() != kPackageTag)
    throw Bad("not a package");
  r.U32();  // version
  r.U32();  // total header size
  r.String();
  Summary s;
  s.flags_at = r.pos;
  s.flags = r.U32();
  s.name_count = r.I32();
  s.name_offset = r.I32();
  s.export_count = r.I32();
  s.export_offset = r.I32();
  s.import_count = r.I32();
  s.import_offset = r.I32();
  r.U32();      // depends offset
  r.Take(16);   // guid
  const int32_t generations = r.I32();
  if (generations < 0 || generations > 4096)
    throw Bad("bad summary");
  r.Take(size_t(generations) * 12);
  r.U32();  // engine version
  r.U32();  // cooker version
  s.compression_at = r.pos;
  return s;
}

void WriteSummary(Bytes& b, const Summary& s) {
  PutBe32(b, s.flags_at, s.flags & ~kStoreCompressed);
  PutBe32(b, s.flags_at + 4, uint32_t(s.name_count));
  PutBe32(b, s.flags_at + 8, uint32_t(s.name_offset));
  PutBe32(b, s.flags_at + 12, uint32_t(s.export_count));
  PutBe32(b, s.flags_at + 16, uint32_t(s.export_offset));
  PutBe32(b, s.flags_at + 20, uint32_t(s.import_count));
  PutBe32(b, s.flags_at + 24, uint32_t(s.import_offset));
  PutBe32(b, s.compression_at, 0);
  PutBe32(b, s.compression_at + 4, 0);
}

// The tables of an uncompressed image, as raw big-endian entries.
struct Tables {
  Summary summary;
  std::vector<Bytes> names;
  std::vector<Bytes> imports;
  std::vector<Bytes> exports;
};

Tables ReadTables(const Bytes& b) {
  Tables t;
  t.summary = ReadSummary(b);
  const Summary& s = t.summary;
  if (s.name_count < 0 || s.import_count < 0 || s.export_count < 0)
    throw Bad("bad table counts");
  Reader r{b.data(), b.size(), size_t(s.name_offset)};
  for (int32_t i = 0; i < s.name_count; ++i) {
    const size_t start = r.pos;
    const int32_t n = r.I32();
    r.Take(n >= 0 ? size_t(n) : size_t(-int64_t(n)) * 2);
    r.Take(8);
    t.names.emplace_back(b.begin() + start, b.begin() + r.pos);
  }
  r.pos = size_t(s.import_offset);
  for (int32_t i = 0; i < s.import_count; ++i) {
    const uint8_t* p = r.Take(kImportSize);
    t.imports.emplace_back(p, p + kImportSize);
  }
  r.pos = size_t(s.export_offset);
  for (int32_t i = 0; i < s.export_count; ++i) {
    const size_t start = r.pos;
    r.Take(kExportFixedSize);
    const int32_t components = r.I32();
    if (components < 0 || components > 1 << 20)
      throw Bad("bad export");
    r.Take(size_t(components) * 12);
    r.U32();  // export flags
    const int32_t net = r.I32();
    if (net < 0 || net > 1 << 20)
      throw Bad("bad export");
    r.Take(size_t(net) * 4 + 16);
    t.exports.emplace_back(b.begin() + start, b.begin() + r.pos);
  }
  return t;
}

std::string NameText(const Bytes& entry) {
  Reader r{entry.data(), entry.size()};
  return r.String();
}

//------------------------------------------------------------------------------
// .PackagePatch
//------------------------------------------------------------------------------

// A patch entry (little endian, the package's own field order) re-encoded
// big endian.
Bytes PatchName(Reader& r) {
  Bytes out;
  const int32_t n = r.I32();
  if (n >= 0) {
    const uint8_t* p = r.Take(size_t(n));
    AppendBe32(out, uint32_t(n));
    out.insert(out.end(), p, p + n);
  } else {
    const size_t chars = size_t(-int64_t(n));
    const uint8_t* p = r.Take(chars * 2);
    AppendBe32(out, uint32_t(n));
    for (size_t i = 0; i < chars; ++i) {
      out.push_back(p[2 * i + 1]);
      out.push_back(p[2 * i]);
    }
  }
  const uint64_t flags = r.U64();
  AppendBe32(out, uint32_t(flags));
  AppendBe32(out, uint32_t(flags >> 32));
  return out;
}

Bytes PatchImport(Reader& r) {
  Bytes out;
  for (int i = 0; i < 7; ++i)
    AppendBe32(out, r.U32());
  return out;
}

Bytes PatchExport(Reader& r) {
  Bytes out;
  for (int i = 0; i < 6; ++i)  // class, super, outer, name (2), archetype
    AppendBe32(out, r.U32());
  AppendBe64(out, r.U64());  // object flags
  AppendBe32(out, r.U32());  // serial size
  AppendBe32(out, r.U32());  // serial offset
  const int32_t components = r.I32();
  if (components < 0 || components > 1 << 20)
    throw Bad("bad patch export");
  AppendBe32(out, uint32_t(components));
  for (int32_t i = 0; i < components * 3; ++i)
    AppendBe32(out, r.U32());
  AppendBe32(out, r.U32());  // export flags
  const int32_t net = r.I32();
  if (net < 0 || net > 1 << 20)
    throw Bad("bad patch export");
  AppendBe32(out, uint32_t(net));
  for (int32_t i = 0; i < net; ++i)
    AppendBe32(out, r.U32());
  for (int i = 0; i < 4; ++i)  // guid
    AppendBe32(out, r.U32());
  return out;
}

struct TableUpdate {
  int32_t original_count = 0;
  struct Entry {
    int32_t index;
    Bytes value;
    bool is_new;
  };
  std::vector<Entry> entries;
};

template <typename Decode>
TableUpdate ReadTableUpdate(Reader& r, Decode decode) {
  TableUpdate t;
  t.original_count = r.I32();
  const int32_t n = r.I32();
  if (n < 0)
    throw Bad("bad patch table");
  for (int32_t i = 0; i < n; ++i) {
    TableUpdate::Entry e;
    e.index = r.I32();
    e.value = decode(r);
    e.is_new = r.U8() != 0;
    t.entries.push_back(std::move(e));
  }
  return t;
}

bool ApplyTableUpdate(std::vector<Bytes>& table, TableUpdate update, const char* label) {
  if (int64_t(table.size()) != update.original_count)
    throw Bad(std::string(label) + ": the package has " + std::to_string(table.size()) +
              " entries, the patch was made for " + std::to_string(update.original_count));
  std::sort(update.entries.begin(), update.entries.end(),
            [](const auto& a, const auto& b) { return a.index < b.index; });
  for (auto& e : update.entries) {
    if (e.is_new) {
      if (e.index != int32_t(table.size()))
        throw Bad(std::string(label) + ": new entry out of order");
      table.push_back(std::move(e.value));
    } else {
      if (e.index < 0 || size_t(e.index) >= table.size())
        throw Bad(std::string(label) + ": entry out of range");
      table[size_t(e.index)] = std::move(e.value);
    }
  }
  return !update.entries.empty();
}

size_t AppendTable(Bytes& image, const std::vector<Bytes>& table) {
  const size_t at = image.size();
  for (const Bytes& entry : table)
    image.insert(image.end(), entry.begin(), entry.end());
  return at;
}

//------------------------------------------------------------------------------
// Texture packs
//------------------------------------------------------------------------------

std::vector<std::string> NameList(const Tables& t) {
  std::vector<std::string> names;
  names.reserve(t.names.size());
  for (const Bytes& n : t.names)
    names.push_back(NameText(n));
  return names;
}

std::string FName(const std::vector<std::string>& names, int32_t index, int32_t number) {
  if (index < 0 || size_t(index) >= names.size())
    throw Bad("bad name index");
  return number ? names[size_t(index)] + "_" + std::to_string(number - 1) : names[size_t(index)];
}

std::string ObjectPath(const Tables& t, const std::vector<std::string>& names, int32_t ref) {
  std::vector<std::string> parts;
  for (int depth = 0; ref && depth < 64; ++depth) {
    if (ref > 0) {
      const Bytes& e = t.exports.at(size_t(ref - 1));
      parts.push_back(FName(names, int32_t(Be32(e, 12)), int32_t(Be32(e, 16))));
      ref = int32_t(Be32(e, 8));
    } else {
      const Bytes& i = t.imports.at(size_t(-int64_t(ref) - 1));
      parts.push_back(FName(names, int32_t(Be32(i, 20)), int32_t(Be32(i, 24))));
      ref = int32_t(Be32(i, 16));
    }
  }
  std::string path;
  for (auto it = parts.rbegin(); it != parts.rend(); ++it)
    path += (path.empty() ? "" : "\\") + *it;
  return path;
}

std::string ClassOf(const Tables& t, const std::vector<std::string>& names, const Bytes& e) {
  const int32_t c = int32_t(Be32(e, 0));
  if (c < 0) {
    const Bytes& i = t.imports.at(size_t(-int64_t(c) - 1));
    return FName(names, int32_t(Be32(i, 20)), int32_t(Be32(i, 24)));
  }
  if (c > 0) {
    const Bytes& x = t.exports.at(size_t(c - 1));
    return FName(names, int32_t(Be32(x, 12)), int32_t(Be32(x, 16)));
  }
  return "Class";
}

struct Tag {
  std::string name, type;
  size_t start, value, end;
};

// A Texture2D's new bytes, placed at file offset `at`.
Bytes RewriteTexture(const Bytes& obj, const std::vector<std::string>& names,
                     const TexturePack::Entry& entry, const Bytes& tfc, uint32_t at) {
  // Tagged properties after the NetIndex, up to None.
  std::vector<Tag> tags;
  Reader r{obj.data(), obj.size(), 4};
  size_t props_end = 0;
  for (;;) {
    const size_t start = r.pos;
    const int32_t ni = r.I32(), nn = r.I32();
    const std::string name = FName(names, ni, nn);
    if (name == "None") {
      props_end = r.pos;
      break;
    }
    const int32_t ti = r.I32(), tn = r.I32();
    const std::string type = FName(names, ti, tn);
    const int32_t size = r.I32();
    r.I32();  // array index
    if (type == "StructProperty")
      r.Take(8);
    const size_t value = r.pos;
    r.Take(type == "BoolProperty" ? 4 : size_t(std::max(size, 0)));
    tags.push_back({name, type, start, value, r.pos});
  }

  const auto& mips = entry.mips;
  const auto& top = mips.front();
  const bool single = mips.size() == 1;
  int32_t first_local = 0, last_data = int32_t(mips.size()) - 1;
  for (size_t i = 0; i < mips.size(); ++i) {
    if (mips[i].size > 0) {
      first_local = int32_t(i);
      break;
    }
  }
  for (size_t i = mips.size(); i-- > 0;) {
    if (mips[i].size > 0) {
      last_data = int32_t(i);
      break;
    }
  }
  auto set_value = [&](std::string_view name, int32_t& out) -> bool {
    if (single) {
      if (name == "OriginalSizeX") return out = int32_t(top.x), true;
      if (name == "OriginalSizeY") return out = int32_t(top.y), true;
      return false;
    }
    if (name == "SizeX" || name == "OriginalSizeX") return out = int32_t(top.x), true;
    if (name == "SizeY" || name == "OriginalSizeY") return out = int32_t(top.y), true;
    if (name == "FirstResourceMemMip") return out = first_local, true;
    if (name == "MipTailBaseIdx") return out = last_data, true;
    return false;
  };
  auto dropped = [&](std::string_view name) {
    return name == "TextureFileCacheName" ||
           (single && (name == "FirstResourceMemMip" || name == "MipTailBaseIdx"));
  };

  Bytes out(obj.begin(), obj.begin() + 4);
  for (const Tag& tag : tags) {
    if (dropped(tag.name))
      continue;
    const size_t at_tag = out.size();
    out.insert(out.end(), obj.begin() + tag.start, obj.begin() + tag.end);
    int32_t value = 0;
    if (tag.type == "IntProperty" && set_value(tag.name, value))
      PutBe32(out, at_tag + (tag.value - tag.start), uint32_t(value));
  }
  out.insert(out.end(), obj.begin() + (props_end - 8), obj.begin() + props_end);

  // Native part: source art bulk data, the mips, then whatever follows.
  r.pos = props_end;
  const uint32_t source_flags = r.U32();
  const int32_t source_count = r.I32();
  const int32_t source_size = r.I32();
  r.U32();
  const size_t source_inline =
      source_size > 0 && !(source_flags & kBulkSeparateFile) ? size_t(source_size) : 0;
  const uint8_t* source_data = r.Take(source_inline);
  const int32_t old_mips = r.I32();
  if (old_mips < 0 || old_mips > 64)
    throw Bad("bad texture mips");
  for (int32_t i = 0; i < old_mips; ++i) {
    const uint32_t flags = r.U32();
    r.I32();
    const int32_t size = r.I32();
    r.U32();
    if (size > 0 && !(flags & kBulkSeparateFile))
      r.Take(size_t(size));
    r.Take(8);
  }
  const size_t tail = r.pos;

  AppendBe32(out, source_flags);
  AppendBe32(out, uint32_t(source_count));
  AppendBe32(out, uint32_t(source_size));
  AppendBe32(out, at + uint32_t(out.size()) + 4);
  out.insert(out.end(), source_data, source_data + source_inline);
  AppendBe32(out, uint32_t(mips.size()));
  for (const auto& mip : mips) {
    if (mip.size <= 0) {
      AppendBe32(out, kBulkEmpty);
      AppendBe32(out, 0);
      AppendBe32(out, uint32_t(-1));
      AppendBe32(out, 0xFFFFFFFFu);
    } else {
      if (mip.offset < 0 || size_t(mip.offset) + size_t(mip.size) > tfc.size())
        throw Bad("texture pack mip past the end of its .tfc");
      AppendBe32(out, mip.compression == 2 ? kBulkLzo : 0);
      AppendBe32(out, uint32_t(mip.count));
      AppendBe32(out, uint32_t(mip.size));
      AppendBe32(out, at + uint32_t(out.size()) + 4);
      out.insert(out.end(), tfc.begin() + mip.offset, tfc.begin() + mip.offset + mip.size);
    }
    AppendBe32(out, mip.x);
    AppendBe32(out, mip.y);
  }
  out.insert(out.end(), obj.begin() + tail, obj.end());
  return out;
}

TexturePack::Mip ReadMip(Reader& r, int32_t version, int32_t default_compression) {
  TexturePack::Mip m;
  m.compression = version == 1 ? default_compression : r.I32();
  m.offset = int64_t(r.U32());
  if (version == 1 && m.compression == 0) {
    m.count = r.I32();
    m.size = m.count;
  } else {
    m.size = r.I32();
    m.count = r.I32();
  }
  m.x = r.U32();
  m.y = r.U32();
  return m;
}

}  // namespace

int ApplyTexturePackUnchecked(Bytes& image, const TexturePack& pack,
                              const std::unordered_set<std::string>* excluded);

std::string LowerPath(std::string path) {
  std::replace(path.begin(), path.end(), '/', '\\');
  std::transform(path.begin(), path.end(), path.begin(),
                 [](unsigned char c) { return char(std::tolower(c)); });
  return path;
}

//------------------------------------------------------------------------------
// LZO1X (the decompressor of minilzo, with bounds checks)
//------------------------------------------------------------------------------

bool Lzo1xDecompress(const uint8_t* src, size_t src_size, Bytes& out, size_t expected_size) {
  out.clear();
  out.reserve(expected_size);
  size_t ip = 0;
  auto in = [&](size_t i) -> int {
    return i < src_size ? src[i] : -1;
  };
  auto literals = [&](size_t n) -> bool {
    if (ip + n > src_size)
      return false;
    out.insert(out.end(), src + ip, src + ip + n);
    ip += n;
    return true;
  };
  auto copy_match = [&](size_t dist, size_t length) -> bool {
    if (dist == 0 || dist > out.size())
      return false;
    size_t from = out.size() - dist;
    for (size_t k = 0; k < length; ++k)
      out.push_back(out[from + k]);
    return true;
  };
  auto extend = [&](size_t t, size_t base, size_t& result) -> bool {
    while (in(ip) == 0) {
      t += 255;
      ++ip;
    }
    if (in(ip) < 0)
      return false;
    result = t + base + size_t(src[ip++]);
    return true;
  };
  if (!src_size)
    return false;

  enum { kLoop, kFirstLiteralRun, kMatch, kMatchDone, kMatchNext } state = kLoop;
  size_t t = 0;
  if (src[0] > 17) {
    t = size_t(src[0]) - 17;
    ip = 1;
    if (t < 4) {
      state = kMatchNext;
    } else {
      if (!literals(t))
        return false;
      state = kFirstLiteralRun;
    }
  }
  for (;;) {
    if (out.size() > expected_size + 3)
      return false;
    switch (state) {
      case kLoop: {
        const int c = in(ip++);
        if (c < 0)
          return false;
        t = size_t(c);
        if (t >= 16) {
          state = kMatch;
          break;
        }
        if (t == 0 && !extend(0, 15, t))
          return false;
        if (!literals(t + 3))
          return false;
        state = kFirstLiteralRun;
        break;
      }
      case kFirstLiteralRun: {
        const int c = in(ip++);
        if (c < 0)
          return false;
        t = size_t(c);
        if (t >= 16) {
          state = kMatch;
          break;
        }
        const int b = in(ip++);
        if (b < 0 || !copy_match(1 + 0x0800 + (t >> 2) + (size_t(b) << 2), 3))
          return false;
        state = kMatchDone;
        break;
      }
      case kMatch: {
        size_t dist = 0, length = 0;
        if (t >= 64) {
          const int b = in(ip++);
          if (b < 0)
            return false;
          dist = 1 + ((t >> 2) & 7) + (size_t(b) << 3);
          length = (t >> 5) - 1 + 2;
        } else if (t >= 32) {
          t &= 31;
          if (t == 0 && !extend(0, 31, t))
            return false;
          if (in(ip + 1) < 0)
            return false;
          dist = 1 + (size_t(src[ip]) >> 2) + (size_t(src[ip + 1]) << 6);
          ip += 2;
          length = t + 2;
        } else if (t >= 16) {
          dist = (t & 8) << 11;
          t &= 7;
          if (t == 0 && !extend(0, 7, t))
            return false;
          if (in(ip + 1) < 0)
            return false;
          dist += (size_t(src[ip]) >> 2) + (size_t(src[ip + 1]) << 6);
          ip += 2;
          if (dist == 0)
            return out.size() == expected_size;
          dist += 0x4000;
          length = t + 2;
        } else {
          const int b = in(ip++);
          if (b < 0)
            return false;
          dist = 1 + (t >> 2) + (size_t(b) << 2);
          length = 2;
        }
        if (!copy_match(dist, length))
          return false;
        state = kMatchDone;
        break;
      }
      case kMatchDone: {
        if (ip < 2)
          return false;
        t = src[ip - 2] & 3;
        state = t == 0 ? kLoop : kMatchNext;
        break;
      }
      case kMatchNext: {
        if (!literals(t))
          return false;
        const int c = in(ip++);
        if (c < 0)
          return false;
        t = size_t(c);
        state = kMatch;
        break;
      }
    }
  }
}

std::optional<Bytes> DecompressPackage(const Bytes& file) {
  try {
    if (file.size() < 8 || Be32(file, 0) != kPackageTag)
      return std::nullopt;
    if (Be32(file, 4) == kFullyCompressedBlock) {
      Bytes out;
      ReadCompressedChunk(file, 0, out);
      return out;
    }
    const Summary s = ReadSummary(file);
    const uint32_t flags = Be32(file, s.compression_at);
    const int32_t chunks = int32_t(Be32(file, s.compression_at + 4));
    if (!flags || chunks <= 0)
      return file;
    Reader r{file.data(), file.size(), s.compression_at + 8};
    std::vector<std::pair<uint32_t, uint32_t>> table;  // uncompressed offset, compressed offset
    for (int32_t i = 0; i < chunks; ++i) {
      const uint32_t uoffset = r.U32();
      r.U32();
      const uint32_t coffset = r.U32();
      r.U32();
      table.emplace_back(uoffset, coffset);
    }
    Bytes out(file.begin(), file.begin() + std::min<size_t>(table.front().first, file.size()));
    for (const auto& [uoffset, coffset] : table) {
      if (out.size() != uoffset)
        return std::nullopt;
      ReadCompressedChunk(file, coffset, out);
    }
    return out;
  } catch (const std::exception&) {
    return std::nullopt;
  }
}

std::optional<std::vector<std::string>> TexturePaths(const Bytes& file) {
  try {
    if (file.size() < 8 || Be32(file, 0) != kPackageTag)
      return std::nullopt;
    // The tables sit at the front of an unedited package; decompress chunks
    // until they parse.
    std::optional<Bytes> whole;
    Bytes partial;
    const bool fully = Be32(file, 4) == kFullyCompressedBlock;
    int32_t chunks = 0;
    Summary s;
    std::vector<std::pair<uint32_t, uint32_t>> table;
    if (!fully) {
      s = ReadSummary(file);
      if (Be32(file, s.compression_at) && (chunks = int32_t(Be32(file, s.compression_at + 4))) > 0) {
        Reader r{file.data(), file.size(), s.compression_at + 8};
        for (int32_t i = 0; i < chunks; ++i) {
          const uint32_t uoffset = r.U32();
          r.U32();
          const uint32_t coffset = r.U32();
          r.U32();
          table.emplace_back(uoffset, coffset);
        }
        partial.assign(file.begin(), file.begin() + std::min<size_t>(table.front().first, file.size()));
      }
    }
    const Bytes* image = &file;
    if (fully) {
      whole = DecompressPackage(file);
      if (!whole)
        return std::nullopt;
      image = &*whole;
    }
    size_t next_chunk = 0;
    for (;;) {
      if (!table.empty())
        image = &partial;
      try {
        const Tables t = ReadTables(*image);
        const std::vector<std::string> names = NameList(t);
        std::vector<std::string> paths;
        for (size_t i = 0; i < t.exports.size(); ++i) {
          if (ClassOf(t, names, t.exports[i]).rfind("Texture2D", 0) == 0)
            paths.push_back(ObjectPath(t, names, int32_t(i + 1)));
        }
        return paths;
      } catch (const Bad&) {
        if (table.empty() || next_chunk >= table.size())
          throw;
        ReadCompressedChunk(file, table[next_chunk++].second, partial);
      }
    }
  } catch (const std::exception&) {
    return std::nullopt;
  }
}

PatchResult ApplyPackagePatch(Bytes& image, const Bytes& patch) {
  PatchResult result;
  try {
    Tables t = ReadTables(image);
    Reader r{patch.data(), patch.size(), 0, true};
    const int32_t version = r.I32();
    if (version < 1 || version > 2)
      throw Bad("unsupported .PackagePatch version " + std::to_string(version));
    TableUpdate names = ReadTableUpdate(r, PatchName);
    TableUpdate imports = ReadTableUpdate(r, PatchImport);
    TableUpdate exports = ReadTableUpdate(r, PatchExport);
    struct ObjectUpdate {
      int32_t exported;
      std::vector<std::pair<int64_t, bool>> offsets;
      const uint8_t* data;
      size_t size;
    };
    std::vector<ObjectUpdate> updates;
    const int32_t count = r.I32();
    if (count < 0)
      throw Bad("bad object update count");
    for (int32_t i = 0; i < count; ++i) {
      ObjectUpdate u;
      u.exported = r.I32();
      const int32_t records = r.I32();
      if (records < 0)
        throw Bad("bad offset records");
      for (int32_t k = 0; k < records; ++k) {
        const int64_t position = int64_t(r.U64());
        u.offsets.emplace_back(position, r.U8() != 0);
      }
      const int32_t size = r.I32();
      if (size < 0)
        throw Bad("bad object data");
      u.size = size_t(size);
      u.data = r.Take(u.size);
      updates.push_back(std::move(u));
    }

    const size_t original_exports = t.exports.size();
    const bool names_changed = ApplyTableUpdate(t.names, std::move(names), "names");
    const bool imports_changed = ApplyTableUpdate(t.imports, std::move(imports), "imports");
    bool exports_changed = ApplyTableUpdate(t.exports, std::move(exports), "exports");

    for (const ObjectUpdate& u : updates) {
      if (u.exported < 0 || size_t(u.exported) >= t.exports.size())
        throw Bad("object update for a missing export");
      Bytes& e = t.exports[size_t(u.exported)];
      const uint32_t old_size = Be32(e, kExportSerialSize);
      const uint32_t old_at = Be32(e, kExportSerialSize + 4);
      const bool in_place = u.size > 0 && u.size <= old_size && old_at > 0 &&
                            size_t(u.exported) < original_exports &&
                            size_t(old_at) + old_size <= image.size();
      const size_t at = in_place ? old_at : image.size();
      Bytes data(u.data, u.data + u.size);
      for (const auto& [position, is64] : u.offsets) {
        if (position < 0 || size_t(position) + (is64 ? 8 : 4) > data.size())
          throw Bad("offset record out of range");
        const size_t p = size_t(position);
        if (is64) {
          uint64_t v = uint64_t(Be32(data, p)) << 32 | Be32(data, p + 4);
          v += at;
          PutBe32(data, p, uint32_t(v >> 32));
          PutBe32(data, p + 4, uint32_t(v));
        } else {
          PutBe32(data, p, Be32(data, p) + uint32_t(at));
        }
      }
      if (in_place) {
        std::copy(data.begin(), data.end(), image.begin() + at);
        std::fill(image.begin() + at + data.size(), image.begin() + at + old_size, 0);
      } else {
        image.insert(image.end(), data.begin(), data.end());
      }
      PutBe32(e, kExportSerialSize, uint32_t(data.size()));
      PutBe32(e, kExportSerialSize + 4, uint32_t(at));
      exports_changed = true;
    }

    Summary& s = t.summary;
    if (names_changed) {
      s.name_offset = int32_t(AppendTable(image, t.names));
      s.name_count = int32_t(t.names.size());
    }
    if (imports_changed) {
      s.import_offset = int32_t(AppendTable(image, t.imports));
      s.import_count = int32_t(t.imports.size());
    }
    if (exports_changed) {
      s.export_offset = int32_t(AppendTable(image, t.exports));
      s.export_count = int32_t(t.exports.size());
    }
    WriteSummary(image, s);
    result.ok = true;
  } catch (const std::exception& e) {
    result.error = e.what();
  }
  return result;
}

PatchResult LoadTexturePack(const Bytes& mapping, TexturePack& pack) {
  PatchResult result;
  try {
    Reader r{mapping.data(), mapping.size(), 0, true};
    int32_t version = 1;
    if (r.I32() == -1) {
      version = r.I32();
      if (version > 3)
        throw Bad("unsupported .TFCMapping version " + std::to_string(version));
      if (version >= 3)
        r.U8();
    } else {
      r.pos = 0;
    }
    const int32_t count = r.I32();
    if (count < 0)
      throw Bad("bad entry count");
    for (int32_t i = 0; i < count; ++i) {
      const std::string id = r.String();
      TexturePack::Entry entry;
      bool external = false;
      int32_t k = r.I32();
      if (k > 0) {
        r.String();
        r.I32();
        for (int32_t m = 0; m < k; ++m)
          ReadMip(r, version, 2);
        external = true;
      }
      k = r.I32();
      if (k > 0) {
        const std::string tfc = r.String();
        const int32_t index = r.I32();
        entry.tfc = LowerPath(index >= 0 ? tfc + "_" + std::to_string(index) : tfc);
        for (int32_t m = 0; m < k; ++m)
          entry.mips.push_back(ReadMip(r, version, 0));
      }
      if (external) {
        ++pack.skipped_external;
        continue;
      }
      if (!entry.mips.empty()) {
        std::string path = id;
        std::replace(path.begin(), path.end(), '/', '\\');
        pack.entries[path] = std::move(entry);
      }
    }
    result.ok = true;
  } catch (const std::exception& e) {
    result.error = e.what();
  }
  return result;
}

int ApplyTexturePack(Bytes& image, const TexturePack& pack,
                     const std::unordered_set<std::string>* excluded) {
  try {
    return ApplyTexturePackUnchecked(image, pack, excluded);
  } catch (const std::exception&) {
    return -1;
  }
}

int ApplyTexturePackUnchecked(Bytes& image, const TexturePack& pack,
                              const std::unordered_set<std::string>* excluded) {
  Tables t = ReadTables(image);
  const std::vector<std::string> names = NameList(t);
  int count = 0;
  for (size_t i = 0; i < t.exports.size(); ++i) {
    Bytes& e = t.exports[i];
    if (ClassOf(t, names, e).rfind("Texture2D", 0) != 0)
      continue;
    const std::string path = ObjectPath(t, names, int32_t(i + 1));
    if (excluded && excluded->count(path))
      continue;
    const auto it = pack.entries.find(path);
    if (it == pack.entries.end())
      continue;
    const uint32_t size = Be32(e, kExportSerialSize);
    const uint32_t at = Be32(e, kExportSerialSize + 4);
    if (size_t(at) + size > image.size())
      continue;
    const auto tfc = pack.tfcs.find(it->second.tfc);
    if (tfc == pack.tfcs.end())
      continue;
    const Bytes obj(image.begin() + at, image.begin() + at + size);
    Bytes rewritten = RewriteTexture(obj, names, it->second, tfc->second, at);
    uint32_t placed = at;
    if (rewritten.size() > size) {
      placed = uint32_t(image.size());
      rewritten = RewriteTexture(obj, names, it->second, tfc->second, placed);
      image.insert(image.end(), rewritten.begin(), rewritten.end());
    } else {
      std::copy(rewritten.begin(), rewritten.end(), image.begin() + at);
      std::fill(image.begin() + at + rewritten.size(), image.begin() + at + size, 0);
    }
    PutBe32(e, kExportSerialSize, uint32_t(rewritten.size()));
    PutBe32(e, kExportSerialSize + 4, placed);
    ++count;
  }
  if (count) {
    t.summary.export_offset = int32_t(AppendTable(image, t.exports));
    t.summary.export_count = int32_t(t.exports.size());
    WriteSummary(image, t.summary);
  }
  return count;
}

std::unordered_map<std::string, std::unordered_set<std::string>> ReadIdRemappings(
    const std::string& xml) {
  // <Package path="..."> ... <Object id="..." suffix="N" /> ... </Package>
  auto unescape = [](std::string text) {
    static const std::pair<std::string_view, char> kEntities[] = {
        {"&amp;", '&'}, {"&lt;", '<'}, {"&gt;", '>'}, {"&quot;", '"'}, {"&apos;", '\''}};
    for (const auto& [entity, c] : kEntities) {
      for (size_t at; (at = text.find(entity)) != std::string::npos;)
        text.replace(at, entity.size(), 1, c);
    }
    return text;
  };
  auto attribute = [&](size_t from, size_t to,
                       std::string_view name) -> std::optional<std::string> {
    const std::string key = std::string(name) + "=\"";
    const size_t at = xml.find(key, from);
    if (at == std::string::npos || at >= to)
      return std::nullopt;
    const size_t end = xml.find('"', at + key.size());
    if (end == std::string::npos || end > to)
      return std::nullopt;
    return unescape(xml.substr(at + key.size(), end - at - key.size()));
  };
  std::unordered_map<std::string, std::unordered_set<std::string>> out;
  for (size_t at = 0; (at = xml.find("<Package ", at)) != std::string::npos;) {
    const size_t tag_end = xml.find('>', at);
    if (tag_end == std::string::npos)
      break;
    const auto path = attribute(at, tag_end, "path");
    const bool self_closing = xml[tag_end - 1] == '/';
    const size_t close = self_closing ? tag_end : xml.find("</Package>", tag_end);
    if (close == std::string::npos)
      break;
    if (path && !self_closing) {
      auto& ids = out[LowerPath(*path)];
      for (size_t o = tag_end; (o = xml.find("<Object ", o)) != std::string::npos && o < close; ++o) {
        if (const auto id = attribute(o, xml.find('>', o), "id")) {
          std::string normal = *id;
          std::replace(normal.begin(), normal.end(), '/', '\\');
          ids.insert(normal);
        }
      }
    }
    at = close;
  }
  return out;
}

}  // namespace redahm::mods

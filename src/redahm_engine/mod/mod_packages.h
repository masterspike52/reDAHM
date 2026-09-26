#pragma once

// UE3 package edits for drop-in mods, host side and engine independent:
// packages as the game stores them (v455, Xbox 360, big endian, LZO), the TFC
// Installer's .PackagePatch files (UPK Explorer's package edits) and its
// texture packs (.TFCMapping + .tfc, textures with local mips). See
// mod_packages.cpp.

#include <cstdint>
#include <optional>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace redahm::mods {

using Bytes = std::vector<uint8_t>;

// LZO1X; false on malformed input.
bool Lzo1xDecompress(const uint8_t* src, size_t src_size, Bytes& out, size_t expected_size);

// A package file -> its uncompressed image (chunked or fully compressed; an
// uncompressed package comes back as is). nullopt when it can't be read.
std::optional<Bytes> DecompressPackage(const Bytes& file);

// The object paths ("Group\Name", outer first, no package) of a package's
// Texture2D exports, read from its header alone. For finding a texture
// pack's targets without unpacking every package.
std::optional<std::vector<std::string>> TexturePaths(const Bytes& file);

struct PatchResult {
  bool ok = false;
  std::string error;
};

// Applies a .PackagePatch (the file's bytes) to an uncompressed image, which
// must be the version the patch was made against (its table counts). The
// image stays uncompressed; its summary is marked so.
PatchResult ApplyPackagePatch(Bytes& image, const Bytes& patch);

// A texture pack: TFCMapping entries (local mips only) and their .tfc.
struct TexturePack {
  struct Mip {
    int32_t compression = 0;  // 0 none, 2 LZO
    int64_t offset = 0;
    int32_t size = 0;  // -1: empty (packed into the mip tail)
    int32_t count = 0;
    uint32_t x = 0, y = 0;
  };
  struct Entry {
    std::string tfc;  // the local mips' .tfc, lower-cased, without extension
    std::vector<Mip> mips;
  };
  std::unordered_map<std::string, Entry> entries;  // object path, exact (the installer matches case)
  std::unordered_map<std::string, Bytes> tfcs;     // by Entry::tfc
  int skipped_external = 0;  // entries with external (TFC-streamed) mips
};

// Reads a .TFCMapping's entries; the .tfc files they name ("LocalMips_0")
// go in pack.tfcs before the pack is applied.
PatchResult LoadTexturePack(const Bytes& mapping, TexturePack& pack);

// Rewrites every Texture2D in the image that the pack maps, but for the
// object paths in `excluded` (the package's IdRemappings: same path, another
// object). Returns how many, or -1 when the image can't be read (it is then
// left as it was).
int ApplyTexturePack(Bytes& image, const TexturePack& pack,
                     const std::unordered_set<std::string>* excluded = nullptr);

// A mod's GameProfile.IdRemappings.xml: per package (lower-cased game path,
// "kronosgame\cookedxenon\ch_murry.xxx"), the object paths that name a
// different object there than the texture pack's entry of that path.
std::unordered_map<std::string, std::unordered_set<std::string>> ReadIdRemappings(
    const std::string& xml);

// The lower-cased, backslashed form of a path.
std::string LowerPath(std::string path);

}  // namespace redahm::mods

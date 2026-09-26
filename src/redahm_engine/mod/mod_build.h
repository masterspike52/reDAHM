#pragma once

// Packages built from the mods' package edits (.PackagePatch files and
// texture packs), cached in mods/_generated. See mod_build.cpp.

#include <filesystem>
#include <map>
#include <string>
#include <vector>

namespace redahm::mods {

struct ModSource {
  std::string name;
  std::filesystem::path dir;   // the mod's folder
  std::filesystem::path root;  // where its game-layout files start (dir or dir/Game)
};

struct BuiltFile {
  std::filesystem::path host;
  std::string game_path;
};

// Builds, into `generated`, every package the mods edit, applying each mod's
// edits in order over the game's original (the TFC Installer's backup when
// the game folder holds one). Reuses the previous build when the mods and the
// game's packages haven't changed. Returns the built files by lower-cased
// game path.
std::map<std::string, BuiltFile> BuildPackages(const std::vector<ModSource>& mods,
                                               const std::filesystem::path& game_root,
                                               const std::filesystem::path& generated);

}  // namespace redahm::mods

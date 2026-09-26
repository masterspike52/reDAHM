#pragma once

// Drop-in mods: folders under mods/ (beside redahm.exe) enabled by the
// redahm_mods cvar, served to the game in front of its own files. See
// mod_loader.cpp.

#include <filesystem>

namespace rex {
class Runtime;
}

namespace redahm::mods {

// Where redahm.toml lives; mods/ is beside it unless redahm_mods_dir says
// otherwise. Before Install.
void SetConfigPath(const std::filesystem::path& config_path);

// Puts the enabled mods in front of game: once the runtime has mounted it and
// before the title runs.
void Install(rex::Runtime* runtime);

}  // namespace redahm::mods

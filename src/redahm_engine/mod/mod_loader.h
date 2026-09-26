#pragma once

// Drop-in mods: folders under mods/ (beside redahm.exe), each switched on by a
// cvar of its own, served to the game in front of its own files. See
// mod_loader.cpp.

#include <filesystem>
#include <string>
#include <vector>

namespace rex {
class Runtime;
}

namespace redahm::mods {

// Where redahm.toml lives; mods/ is beside it unless redahm_mods_dir says
// otherwise. Before RegisterModCvars.
void SetConfigPath(const std::filesystem::path& config_path);

// One bool cvar per folder in mods/ (redahm_mod_<folder>), once the config has
// been loaded (it is replayed onto them as they register) and before Install.
void RegisterModCvars();

// A folder in mods/, as the MODS page in the Options menu lists it.
struct Mod {
  std::u16string label;  // the folder's name, upper case
  std::string cvar;
  bool loaded = false;   // in use since the game started
};

// Every mod folder, in load order (by name; later ones win).
std::vector<Mod> Mods();

// Puts the enabled mods in front of game: once the runtime has mounted it and
// before the title runs.
void Install(rex::Runtime* runtime);

}  // namespace redahm::mods

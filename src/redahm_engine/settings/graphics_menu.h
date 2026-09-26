#pragma once

#include <filesystem>

// GRAPHICS and MODS in the game's Options menu (graphics_menu.cpp).
namespace redahm::graphics_menu {

// The config the app loaded; leaving the GRAPHICS or MODS page saves there.
void SetConfigPath(const std::filesystem::path& path);

}  // namespace redahm::graphics_menu

#pragma once

#include <filesystem>

// GRAPHICS in the game's Options menu (graphics_menu.cpp).
namespace redahm::graphics_menu {

// The config the app loaded; leaving the GRAPHICS page saves the settings there.
void SetConfigPath(const std::filesystem::path& path);

}  // namespace redahm::graphics_menu

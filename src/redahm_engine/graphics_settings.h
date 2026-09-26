#pragma once

// Graphics settings applied inside the game's own engine (the GRAPHICS menu's
// rows that UE3 decides, rather than the renderer). The renderer-side ones are
// in gpu/core/settings.h.

#include <cstdint>
#include <string_view>

#include <rex/ppc/context.h>

namespace redahm::graphics_settings {

// Once per presented frame: pushes the settings the engine reads per frame
// (show flags) into the game.
void ApplyPerFrame();

// The byte offset of script property `name` in objects of `object`'s class
// (declared there or by an ancestor), or -1. Game thread.
int32_t ScriptPropertyOffset(uint32_t object, std::string_view name);

// The UFunction `name` of `object`'s class (declared there or by an
// ancestor), or 0. Game thread.
uint32_t ScriptFunction(uint32_t object, std::string_view name);

// Runs `function` on `object` through ProcessEvent with the parameter block
// at guest address `parms`, on a frame below the caller's stack. Game thread.
void CallScriptFunction(PPCContext& ctx, uint8_t* base, uint32_t object, uint32_t function,
                        uint32_t parms);

}  // namespace redahm::graphics_settings

#pragma once

// Runtime DXC link for spec constant shaders.
//
// Pixel shaders with alpha test (nearly all of them) come out of XenosRecomp as
// lib_6_3 DXIL libraries calling an unresolved g_SpecConstants() export.
// D3D12 cannot create a shader from a library, so each masked spec constant
// value gets its own link against a one-function library returning it.

#include <cstddef>
#include <cstdint>
#include <vector>

namespace redahm::gpu {

// Thread-safe. Empty on failure.
std::vector<uint8_t> LinkSpecConstants(const uint8_t* library_dxil, size_t library_size,
                                       bool pixel_shader, uint32_t spec_constants);

}  // namespace redahm::gpu

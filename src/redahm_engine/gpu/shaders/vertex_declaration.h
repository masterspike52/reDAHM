#pragma once

// Vertex declarations: the D3DVERTEXELEMENT9 array a declaration was created
// from, as a host input layout over the guest vertex buffers.
//
// Buffers are uploaded with one 32-bit byte swap per word, so every element
// binds with its natural format (see ConvertDeclType). What the swap cannot
// undo is left to the REDAHM_RECOMP shaders: 16-bit pairs come out reversed
// (g_SwappedTexcoords), SHORT texcoords need sign extension (g_SintTexcoords),
// and the UBYTE4 tangent basis is converted from integers
// (the SPEC_CONSTANT_R11G11B10_NORMAL bit).

#include <memory>
#include <vector>

#include <plume_render_interface.h>
#include <rex/types.h>

#include "d3d/d3d_device.h"

namespace redahm::gpu {

struct HostVertexDeclaration {
  u64 hash = 0;
  std::vector<plume::RenderInputElement> input_elements;
  bool streams[d3d::kMaxStreams] = {};
  u32 swapped_texcoords = 0;
  u32 sint_texcoords = 0;
  bool integer_tangent_basis = false;
};

// The stream the zero-filled inputs a declaration omits read from.
inline constexpr u32 kZeroStream = 15;

// Thread-safe. Declarations are shared by element layout and live for the
// session: pipelines key on their address.
HostVertexDeclaration* RegisterVertexDeclaration(u32 declaration_va,
                                                 const d3d::VertexElement* elements);
HostVertexDeclaration* FindVertexDeclaration(u32 declaration_va);

}  // namespace redahm::gpu

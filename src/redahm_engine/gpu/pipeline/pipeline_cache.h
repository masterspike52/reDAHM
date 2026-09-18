#pragma once

// Graphics pipelines for guest draws, keyed by the shaders, the vertex
// declaration and strides, the targets and the D3D render states.

#include <cstring>

#include <plume_render_interface.h>
#include <rex/types.h>

namespace redahm::gpu {

struct GuestShader;
struct HostVertexDeclaration;

// Laid out without padding so it hashes and compares bytewise.
struct PipelineKey {
  GuestShader* vertex_shader = nullptr;
  GuestShader* pixel_shader = nullptr;
  HostVertexDeclaration* declaration = nullptr;

  u32 spec_constants = 0;
  u8 topology = 0;  // plume::RenderPrimitiveTopology
  u8 cull_mode = 0;
  u8 front_face = 0;
  u8 render_target_count = 0;

  u8 render_target_formats[4] = {};  // plume::RenderFormat
  u8 depth_format = 0;
  u8 depth_enable = 0;
  u8 depth_write = 0;
  u8 depth_func = 0;

  u8 stencil_enable = 0;
  u8 stencil_read_mask = 0;
  u8 stencil_write_mask = 0;
  u8 stencil_ref = 0;
  // fail, depth fail, pass, func; front then back.
  u8 stencil_front[4] = {};
  u8 stencil_back[4] = {};

  // Per target: enable, src, dst, op, src alpha, dst alpha, op alpha, write mask.
  u8 blend[4][8] = {};

  u16 vertex_strides[16] = {};

  i32 depth_bias = 0;
  float slope_scaled_depth_bias = 0.0f;
  u32 reserved = 0;
};
static_assert(sizeof(PipelineKey) == 128);

inline bool operator==(const PipelineKey& a, const PipelineKey& b) {
  return std::memcmp(&a, &b, sizeof(PipelineKey)) == 0;
}

// Needs Host().mutex. nullptr when a shader is missing or creation failed
// (failures are cached).
plume::RenderPipeline* GetPipelineLocked(const PipelineKey& key);

}  // namespace redahm::gpu

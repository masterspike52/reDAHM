#pragma once

// The D3D state the hooks track and the draws, clears and resolves that
// consume it.
//
// Object bindings (targets, textures, streams, shaders, viewport) come from
// the Set* hooks. Render and sampler states come from the device, where the
// title's own D3DRS/D3DSAMP setters store them. Every entry point takes
// Host().mutex.

#include <rex/types.h>

namespace redahm::gpu {

struct GuestShader;

// Set* hooks.
void SetRenderTarget(u32 index, u32 surface_va);
void SetDepthStencilSurface(u32 surface_va);
void SetViewport(float x, float y, float width, float height, float min_z, float max_z);
void SetScissorRect(i32 left, i32 top, i32 right, i32 bottom);
void SetTexture(u32 sampler, u32 texture_va);
void SetVertexShader(GuestShader* shader);
void SetPixelShader(GuestShader* shader);
void SetVertexDeclaration(u32 declaration_va);
void SetStreamSource(u32 stream, u32 buffer_va, u32 offset, u32 stride);
void SetIndices(u32 buffer_va);
void MarkVertexShaderConstantsDirty();
void MarkPixelShaderConstantsDirty();

void DrawVertices(u32 dev, u32 primitive, u32 start_vertex, u32 vertex_count);
void DrawIndexedVertices(u32 dev, u32 primitive, i32 base_vertex, u32 start_index,
                         u32 index_count);
// vertices_va holds vertex_count vertices of stream 0.
void DrawVerticesUP(u32 dev, u32 primitive, u32 vertex_count, u32 vertices_va, u32 stride);
// indices address vertices_va after adding base_vertex.
void DrawIndexedVerticesUP(u32 dev, u32 primitive, i32 base_vertex, u32 vertex_count,
                           u32 index_count, u32 indices_va, bool indices_32bit, u32 vertices_va,
                           u32 stride);

// D3DDevice_Clear. color is a D3DCOLOR.
void Clear(u32 dev, u32 rect_count, u32 rects_va, u32 flags, u32 color, float z, u32 stencil);

// D3DDevice_BeginTiling. The title's tiled surfaces hold one tile; the host
// renders the whole tiled area in one pass, so the bound surfaces grow to the
// union of the tile rects. Unless flags 1 or 2 are set the bound targets are
// then cleared. clear_color_va may be null.
void BeginTiling(u32 dev, u32 flags, u32 tile_count, u32 tile_rects_va, u32 clear_color_va,
                 float z, u32 stencil);

struct ResolveArgs {
  u32 flags = 0;
  u32 source_rect_va = 0;
  u32 dest_texture_va = 0;
  u32 dest_point_va = 0;
  u32 dest_level = 0;
  u32 dest_slice_or_face = 0;
  u32 clear_color_va = 0;
  float clear_z = 1.0f;
  u32 clear_stencil = 0;
};
void Resolve(u32 dev, const ResolveArgs& args);

// One Bink frame (BinkDrawFrame), converted from YUV and blended into render
// target 0 over a rectangle in target pixels.
struct MovieFrame {
  u32 y_plane = 0;  // texture headers; the alpha plane may be 0
  u32 cr_plane = 0;
  u32 cb_plane = 0;
  u32 a_plane = 0;
  float x = 0.0f;
  float y = 0.0f;
  float width = 0.0f;
  float height = 0.0f;
  float rows[3][4] = {};  // tor, tog, tob
  float constant = 1.0f;  // consts.x
  float alpha = 1.0f;
};
void DrawMovieFrame(const MovieFrame& frame);

// Once per present: periodically logs where draws went, and ends a traced
// frame (redahm_gpu_trace_frame). Needs Host().mutex.
void LogDrawStatsLocked();

// Forgets what the list has bound. Needs Host().mutex.
void InvalidateDrawBindingsLocked();

}  // namespace redahm::gpu

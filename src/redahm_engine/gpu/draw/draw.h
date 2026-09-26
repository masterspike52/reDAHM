#pragma once

// The D3D state the hooks track and the draws, clears and resolves that
// consume it.
//
// Object bindings (targets, textures, streams, shaders, viewport) come from
// the Set* hooks. Render and sampler states come from the device, where the
// title's own D3DRS/D3DSAMP setters store them. The setters record into state
// that belongs to the thread driving the device and take no lock. Draws,
// clears, resolves and movie frames capture that state, and what they read of
// the device and of guest memory, into packets for the GPU thread
// (render/gpu_thread.h), which runs them through the host command list.

#include <rex/types.h>

#include "core/frame_cost.h"

namespace redahm::gpu {

struct GuestShader;

//------------------------------------------------------------------------------
// The thread driving the device
//------------------------------------------------------------------------------

void SetRenderTarget(u32 index, u32 surface_va);
void SetDepthStencilSurface(u32 surface_va);
// D3DDevice_SetViewport: records the viewport and keeps the device fields
// GetViewport reads back. Draws clamp it to the bound targets, as the title's
// D3D does when it is set.
void SetViewport(u32 dev, u32 x, u32 y, u32 width, u32 height, float min_z, float max_z);
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
// indices address vertices_va after adding base_vertex. box_key is the
// occlusion box (occlusion::AddBox) the draw is queried as, or 0.
void DrawIndexedVerticesUP(u32 dev, u32 primitive, i32 base_vertex, u32 vertex_count,
                           u32 index_count, u32 indices_va, bool indices_32bit, u32 vertices_va,
                           u32 stride, u64 box_key = 0);

// D3DDevice_Clear. color is a D3DCOLOR.
void Clear(u32 dev, u32 rect_count, u32 rects_va, u32 flags, u32 color, float z, u32 stencil);

// D3DDevice_BeginTiling. The title's tiled surfaces hold one tile; the host
// renders the whole tiled area in one pass, so the bound surfaces grow to the
// union of the tile rects. Unless flags 1 or 2 are set the bound targets are
// then cleared. clear_color_va may be null. Waits for the GPU thread.
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

//------------------------------------------------------------------------------
// GPU thread
//------------------------------------------------------------------------------

// The recording side's view of a Swap, carried by the present packet.
struct SwapTiming {
  cost::Clock::time_point swap{};
  // Time the render thread slept in the guest's SleepEx since the last Swap:
  // waiting on the game thread.
  u64 render_sleep_ns = 0;
};

// Once per present: periodically logs where draws went, and ends a traced
// frame (redahm_gpu_trace_frame). Needs Host().mutex.
void LogDrawStatsLocked(const SwapTiming& timing);

// Forgets what the list has bound. Needs Host().mutex.
void InvalidateDrawBindingsLocked();

}  // namespace redahm::gpu

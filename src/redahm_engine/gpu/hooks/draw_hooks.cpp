// Draws, clears, resolves, tiling, queries and the frame swap.

#include <mutex>

#include <rex/hook.h>
#include <rex/types.h>

#include "generated/redahm_init.h"

#include "core/guest_memory.h"
#include "d3d/d3d_device.h"
#include "draw/draw.h"
#include "present/present.h"

// Frame counter for the FPS overlay (redahm_engine/hooks.cpp).
void Hook_VdSwap_FrameTick();

namespace {

using namespace redahm::gpu;

constexpr u32 kErrorOutOfMemory = 0x8007000E;
// D3DFMT_INDEX32 differs from D3DFMT_INDEX16 in this bit.
constexpr u32 kIndexFormat32Bit = 4;
// D3DQuery_GetData's visible pixel count for occlusion queries.
constexpr u32 kQueryVisiblePixels = 0x10000;

// The Xenon ABI reserves a GPR slot for every float argument (it arrives in f1
// but still consumes the next rN), while typed marshalling numbers integer
// arguments without skipping it. The z_gpr_slot placeholders below absorb that
// slot so the following integers read the right register.

//------------------------------------------------------------------------------
// Begin/End(Indexed)Vertices hand the title memory to fill; the draw happens
// at End.
//------------------------------------------------------------------------------

struct Scratch {
  u32 va = 0;
  u32 size = 0;

  u32 Reserve(u32 bytes) {
    if (bytes > size) {
      const u32 grown = std::max<u32>((bytes + 0xFFFF) & ~u32(0xFFFF), 0x10000);
      const u32 fresh = mem::Alloc(grown, 0x20);
      if (!fresh)
        return 0;
      mem::Free(va);
      va = fresh;
      size = grown;
    }
    return va;
  }
};

struct PendingDraw {
  bool active = false;
  bool indexed = false;
  u32 primitive = 0;
  i32 base_vertex = 0;
  u32 vertex_count = 0;
  u32 index_count = 0;
  bool indices_32bit = false;
  u32 stride = 0;
};

std::mutex g_pending_mutex;
PendingDraw g_pending;
Scratch g_vertices;
Scratch g_indices;

PendingDraw TakePending() {
  std::lock_guard lock(g_pending_mutex);
  PendingDraw pending = g_pending;
  g_pending = {};
  return pending;
}

// (pDevice, PrimitiveType, VertexCount, VertexStreamZeroStride)
u32 D3DDevice_BeginVertices_hook(u32 /*device*/, u32 primitive, u32 vertex_count, u32 stride) {
  std::lock_guard lock(g_pending_mutex);
  g_pending = {};
  const u32 va = vertex_count && stride ? g_vertices.Reserve(vertex_count * stride) : 0;
  if (!va)
    return 0;
  g_pending.active = true;
  g_pending.primitive = primitive;
  g_pending.vertex_count = vertex_count;
  g_pending.stride = stride;
  return va;
}

// (pDevice, PrimitiveType, BaseVertexIndex, NumVertices, IndexCount,
//  IndexDataFormat, VertexStreamZeroStride, ppIndexData, ppVertexData)
u32 D3DDevice_BeginIndexedVertices_hook(u32 /*device*/, u32 primitive, u32 base_vertex,
                                        u32 num_vertices, u32 index_count, u32 index_format,
                                        u32 stride, mapped_u32 index_data_out,
                                        mapped_u32 vertex_data_out) {
  const bool indices_32bit = (index_format & kIndexFormat32Bit) != 0;
  std::lock_guard lock(g_pending_mutex);
  g_pending = {};
  const u32 vertices = g_vertices.Reserve(num_vertices * stride);
  const u32 indices = g_indices.Reserve(index_count * (indices_32bit ? 4 : 2));
  if (index_data_out)
    *index_data_out = indices;
  if (vertex_data_out)
    *vertex_data_out = vertices;
  if (!vertices || !indices || !num_vertices || !index_count)
    return kErrorOutOfMemory;
  g_pending.active = true;
  g_pending.indexed = true;
  g_pending.primitive = primitive;
  g_pending.base_vertex = i32(base_vertex);
  g_pending.vertex_count = num_vertices;
  g_pending.index_count = index_count;
  g_pending.indices_32bit = indices_32bit;
  g_pending.stride = stride;
  return 0;
}

void D3DDevice_EndVertices_hook(u32 device) {
  const PendingDraw pending = TakePending();
  if (pending.active && !pending.indexed)
    DrawVerticesUP(device, pending.primitive, pending.vertex_count, g_vertices.va, pending.stride);
}

void D3DDevice_EndIndexedVertices_hook(u32 device) {
  const PendingDraw pending = TakePending();
  if (pending.active && pending.indexed) {
    DrawIndexedVerticesUP(device, pending.primitive, pending.base_vertex, pending.vertex_count,
                          pending.index_count, g_indices.va, pending.indices_32bit, g_vertices.va,
                          pending.stride);
  }
}

//------------------------------------------------------------------------------
// Draws.
//------------------------------------------------------------------------------

// (pDevice, PrimitiveType, StartVertex, VertexCount)
void D3DDevice_DrawVertices_hook(u32 device, u32 primitive, u32 start_vertex, u32 vertex_count) {
  DrawVertices(device, primitive, start_vertex, vertex_count);
}

// (pDevice, PrimitiveType, BaseVertexIndex, StartIndex, IndexCount)
void D3DDevice_DrawIndexedVertices_hook(u32 device, u32 primitive, u32 base_vertex,
                                        u32 start_index, u32 index_count) {
  DrawIndexedVertices(device, primitive, i32(base_vertex), start_index, index_count);
}

// (pDevice, PrimitiveType, VertexCount, pVertexStreamZeroData,
//  VertexStreamZeroStride)
void D3DDevice_DrawVerticesUP_hook(u32 device, u32 primitive, u32 vertex_count, u32 vertices,
                                   u32 stride) {
  DrawVerticesUP(device, primitive, vertex_count, vertices, stride);
}

// (pDevice, PrimitiveType, MinVertexIndex, NumVertices, IndexCount, pIndexData,
//  IndexDataFormat, pVertexStreamZeroData, VertexStreamZeroStride)
void D3DDevice_DrawIndexedVerticesUP_hook(u32 device, u32 primitive, u32 min_index,
                                          u32 num_vertices, u32 index_count, u32 indices,
                                          u32 index_format, u32 vertices, u32 stride) {
  DrawIndexedVerticesUP(device, primitive, 0, min_index + num_vertices, index_count, indices,
                        (index_format & kIndexFormat32Bit) != 0, vertices, stride);
}

//------------------------------------------------------------------------------
// Clears, resolves and tiling.
//------------------------------------------------------------------------------

// (pDevice, Count, pRects, Flags, Color, Z, Stencil, EDRAMClear)
void D3DDevice_Clear_hook(u32 device, u32 rect_count, u32 rects, u32 flags, u32 color, f64 z,
                          u32 /*z_gpr_slot*/, u32 stencil, u32 /*edram_clear*/) {
  Clear(device, rect_count, rects, flags, color, float(z), stencil);
}

// (pDevice, Flags, pSourceRect, pDestTexture, pDestPoint, DestLevel,
//  DestSliceOrFace, pClearColor, ClearZ, ClearStencil, pParameters)
void D3DDevice_Resolve_hook(u32 device, u32 flags, u32 source_rect, u32 dest_texture,
                            u32 dest_point, u32 dest_level, u32 dest_slice_or_face,
                            u32 clear_color, f64 clear_z, u32 /*z_gpr_slot*/, u32 clear_stencil,
                            u32 /*parameters*/) {
  ResolveArgs args;
  args.flags = flags;
  args.source_rect_va = source_rect;
  args.dest_texture_va = dest_texture;
  args.dest_point_va = dest_point;
  args.dest_level = dest_level;
  args.dest_slice_or_face = dest_slice_or_face;
  args.clear_color_va = clear_color;
  args.clear_z = float(clear_z);
  args.clear_stencil = clear_stencil;
  Resolve(device, args);
}

// (pDevice, Flags, Count, pTileRects, pClearColor, ClearZ, ClearStencil).
// PotF's scene pass (sub_824060A0) tiles tile-sized surfaces over the frame
// in strips from the table at 0x820A8D50 and resolves each strip itself.
void D3DDevice_BeginTiling_hook(u32 device, u32 flags, u32 count, u32 tile_rects,
                                u32 clear_color, f64 clear_z, u32 /*z_gpr_slot*/,
                                u32 clear_stencil) {
  BeginTiling(device, flags, count, tile_rects, clear_color, float(clear_z), clear_stencil);
}

// (pDevice, ResolveFlags, pResolveRects, pDestTexture, pClearColor, ClearZ,
//  ClearStencil, pParameters)
u32 D3DDevice_EndTiling_hook(u32 device, u32 resolve_flags, u32 resolve_rects, u32 dest_texture,
                             u32 clear_color, f64 clear_z, u32 /*z_gpr_slot*/, u32 clear_stencil,
                             u32 /*parameters*/) {
  if (dest_texture) {
    ResolveArgs args;
    args.flags = resolve_flags;
    args.source_rect_va = resolve_rects;
    args.dest_texture_va = dest_texture;
    args.clear_color_va = clear_color;
    args.clear_z = float(clear_z);
    args.clear_stencil = clear_stencil;
    Resolve(device, args);
  }
  return 0;
}

//------------------------------------------------------------------------------
// Occlusion queries report everything visible.
//------------------------------------------------------------------------------

u32 D3DQuery_Issue_hook(u32 /*query*/, u32 /*issue_flags*/) {
  return 0;
}

u32 D3DQuery_GetData_hook(u32 /*query*/, mapped_u32 data, u32 size, u32 /*flags*/) {
  if (data && size >= 4)
    *data = kQueryVisiblePixels;
  return 0;
}

//------------------------------------------------------------------------------
// Swap.
//------------------------------------------------------------------------------

// (pDevice, pFrontBuffer, pParameters)
u32 D3DDevice_Swap_hook(u32 /*device*/, u32 front_buffer, u32 /*parameters*/) {
  Hook_VdSwap_FrameTick();
  PresentFrame(front_buffer);
  return 0;
}

}  // namespace

REX_HOOK(D3DDevice_BeginVertices, D3DDevice_BeginVertices_hook);
REX_HOOK(D3DDevice_BeginIndexedVertices, D3DDevice_BeginIndexedVertices_hook);
REX_HOOK(D3DDevice_EndVertices, D3DDevice_EndVertices_hook);
REX_HOOK(D3DDevice_EndIndexedVertices, D3DDevice_EndIndexedVertices_hook);
REX_HOOK(D3DDevice_DrawVertices, D3DDevice_DrawVertices_hook);
REX_HOOK(D3DDevice_DrawIndexedVertices, D3DDevice_DrawIndexedVertices_hook);
REX_HOOK(D3DDevice_DrawVerticesUP, D3DDevice_DrawVerticesUP_hook);
REX_HOOK(D3DDevice_DrawIndexedVerticesUP, D3DDevice_DrawIndexedVerticesUP_hook);
REX_HOOK(D3DDevice_Clear, D3DDevice_Clear_hook);
REX_HOOK(D3DDevice_Resolve, D3DDevice_Resolve_hook);
REX_HOOK(D3DDevice_BeginTiling, D3DDevice_BeginTiling_hook);
REX_HOOK(D3DDevice_EndTiling, D3DDevice_EndTiling_hook);
REX_HOOK(D3DQuery_Issue, D3DQuery_Issue_hook);
REX_HOOK(D3DQuery_GetData, D3DQuery_GetData_hook);
REX_HOOK(D3DDevice_Swap, D3DDevice_Swap_hook);

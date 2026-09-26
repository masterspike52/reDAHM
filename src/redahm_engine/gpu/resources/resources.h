#pragma once

// Host objects behind the title's D3D resources.
//
// The title's own D3D code creates every resource header (CreateTexture,
// CreateSurface, and UE3's XGSet*Header over its own physical memory), and those
// headers stay the objects the title and the unhooked D3D getters work with.
// The renderer keeps a host twin per header address: a render target for each
// EDRAM surface, a sampled texture uploaded from the guest texels, a host copy
// of each vertex and index buffer. Contents are re-uploaded when the title
// unlocks or relocates the resource, and dropped when D3D destroys it.
//
// Full-size render targets, and the textures they resolve into, are held at
// settings::ResolutionScale() times their guest size (see SurfaceScale).
// Everything the title states in pixels (viewports, scissors, clear and
// resolve rectangles) stays in guest pixels until it reaches the host, through
// the Scale helpers below and the scale of the target it applies to.

#include <algorithm>
#include <cmath>
#include <memory>
#include <unordered_map>

#include <plume_render_interface.h>
#include <rex/types.h>

#include "core/settings.h"
#include "render/host.h"

namespace redahm::gpu {

struct HostTexture {
  u32 guest_va = 0;
  u32 signature[6] = {};  // header words the host copy was built from
  u32 d3d_format = 0;
  bool surface = false;  // EDRAM surface from CreateSurface
  bool depth = false;

  // Host size, and the size the title created the resource at. They differ
  // by `scale` for scaled surfaces and the textures they resolve into.
  u32 width = 0;
  u32 height = 0;
  u32 guest_width = 0;
  u32 guest_height = 0;
  u32 depth_or_slices = 1;  // volume depth
  u32 array_size = 1;       // 6 for cubes
  u32 mip_levels = 1;
  // Host pixels per guest pixel.
  float scale = 1.0f;
  // The scale is settled: surfaces from creation, textures at their first
  // resolve, after which only resolves write them.
  bool scaled = false;

  // The surface this one is another format's view of in EDRAM (UE3's
  // SceneColorRaw over SceneColor). It holds no host objects of its own;
  // FindSurfaceLocked returns that surface in its place.
  HostTexture* view_of = nullptr;
  // A surface's first EDRAM tile, from its header when it was created.
  u32 edram_base = ~0u;

  plume::RenderFormat format = plume::RenderFormat::UNKNOWN;
  plume::RenderTextureViewDimension view_dimension = plume::RenderTextureViewDimension::TEXTURE_2D;
  std::unique_ptr<plume::RenderTexture> texture;
  std::unique_ptr<plume::RenderTextureView> view;
  u32 slot = kInvalidSlot;
  plume::RenderTextureLayout layout = plume::RenderTextureLayout::UNKNOWN;
  bool render_target_capable = false;
  // The format has no uploadable host twin; only resolves write it.
  bool render_only = false;

  // The guest texels changed since the last upload.
  bool needs_upload = true;
  // A resolve wrote the host texture; guest memory does not hold its content.
  bool gpu_written = false;
  // Resolves into this texture so far.
  u64 resolve_count = 0;
  // A scaled texture at its guest size, for draws into unscaled targets, and
  // the resolve count it was made at (GuestSizeCopyLocked in draw.cpp).
  std::unique_ptr<HostTexture> guest_copy;
  u64 guest_copy_resolves = 0;
  // The view dropped the guest swizzle because a resolve fills this texture.
  bool identity_view = false;
  u64 last_bound_frame = 0;

  // Render target views (level | face << 8) for resolves into textures.
  std::unordered_map<u32, std::unique_ptr<plume::RenderTextureView>> target_views;
  std::unordered_map<u32, std::unique_ptr<plume::RenderFramebuffer>> target_framebuffers;
};

struct HostBuffer {
  // Unique for the session, so work derived from a buffer's contents can be
  // keyed by it (with `uploads`) even after its address is reused.
  u64 serial = 0;
  u32 guest_va = 0;
  bool index = false;
  bool index32 = false;
  u32 guest_address = 0;
  u32 size = 0;
  std::unique_ptr<plume::RenderBuffer> buffer;
  bool needs_upload = true;
  u64 last_bound_frame = 0;
  // Uploads so far. The first lands in GPU_UPLOAD when the device has it; a
  // buffer the title rewrites is dynamic and moves to UPLOAD, where the CPU
  // writes stay in system memory.
  u32 uploads = 0;
  plume::RenderHeapType heap = plume::RenderHeapType::UPLOAD;
  // A buffer the title rewrites frame after frame (the foliage instances, for
  // one) is copied into the frame's upload memory instead of a resource of its
  // own: creating a resource per rewrite cost more than the copy. The copy is
  // bound only while its upload generation is current.
  plume::RenderBuffer* ring = nullptr;
  u64 ring_offset = 0;
  u64 ring_generation = 0;
  // The frame of the latest upload, plus one; 0 before the first.
  u64 last_upload_frame = 0;
  // Guest bytes a packet captured for it (see BufferCaptureNeeded), uploaded
  // in place of guest memory. Only set while that packet runs.
  const u8* captured = nullptr;
};

// A buffer header's words as a packet captured them.
struct BufferHeader {
  u32 address = 0;
  u32 size = 0;
  bool index32 = false;
};

// Where a prepared buffer's bytes at `offset` are bound from.
inline plume::RenderBufferReference BufferReference(const HostBuffer& buffer, u64 offset) {
  return buffer.ring ? plume::RenderBufferReference(buffer.ring, buffer.ring_offset + offset)
                     : plume::RenderBufferReference(buffer.buffer.get(), offset);
}

// The scale a surface of this guest size renders at. Only surfaces at least
// half the title's 1280x720 frame in one dimension (the scene, its depth, the
// shadow atlas) follow redahm_resolution. The title's reduced-resolution
// post-process targets (the 322x182 bloom chain) blur with taps one guest
// texel apart; scaled up, those taps skip texels and smear every highlight
// into a comb of dots, so they stay at their own size.
inline float SurfaceScale(u32 guest_width, u32 guest_height) {
  constexpr u32 kScaledMinWidth = 640;
  constexpr u32 kScaledMinHeight = 360;
  if (guest_width >= kScaledMinWidth || guest_height >= kScaledMinHeight)
    return settings::ResolutionScale();
  return 1.0f;
}

// Guest pixels to host pixels at a target's scale.
inline float ScalePixel(float guest, float scale) {
  return guest * scale;
}

// A pixel edge: rounded, so the edges of neighbouring rectangles land on the
// same host pixel.
inline i32 ScalePixelEdge(i32 guest, float scale) {
  return i32(std::lround(double(guest) * scale));
}

// A size, never below one pixel.
inline u32 ScaleExtent(u32 guest, float scale) {
  return std::max<u32>(u32(std::lround(double(guest) * scale)), 1);
}

//------------------------------------------------------------------------------
// Recording side (render/gpu_thread.h): the title's threads, holding a
// gpu_thread::Recorder where it says so.
//------------------------------------------------------------------------------

// A texture header's fetch constant words, zero for a null texture.
void ReadTextureWords(u32 texture_va, u32 out[6]);

BufferHeader ReadBufferHeader(u32 buffer_va, bool index);

// Whether a packet drawing from this buffer must carry its guest bytes: the
// title rewrote it since it was last captured (an unlock marked it), or the
// header points somewhere new. The GPU thread otherwise keeps the copy it
// has. `slot` (the stream, or kBufferCaptureSlots - 1 for indices) lets a
// buffer rechecked in the same slot skip the lookups. Needs a Recorder.
inline constexpr u32 kBufferCaptureSlots = 17;
bool BufferCaptureNeeded(u32 buffer_va, bool index, const BufferHeader& header, u32 slot);

// CreateSurface and D3DResource_Destroy, queued in order with the draws.
void QueueRegisterSurface(u32 surface_va, u32 width, u32 height, u32 d3d_format);
void QueueDestroyResource(u32 resource_va);

//------------------------------------------------------------------------------
// GPU thread
//------------------------------------------------------------------------------

// Everything below needs Host().mutex unless it says otherwise.

// A colour target the renderer draws and samples itself, outside the title's
// resources: texture slot, plus its framebuffer in target_framebuffers[0].
std::unique_ptr<HostTexture> CreateScratchTargetLocked(u32 width, u32 height,
                                                       plume::RenderFormat format);
// Retires its objects once no in-flight frame uses them.
void ReleaseScratchTargetLocked(std::unique_ptr<HostTexture> texture);

// Host twin of the EDRAM surface CreateSurface returned, at SurfaceScale.
// width and height are the guest's.
HostTexture* RegisterSurfaceLocked(u32 surface_va, u32 width, u32 height, u32 d3d_format,
                                   u32 edram_base);

// Host twin of a texture header whose fetch constant a packet captured as
// `words`, created on first use and rebuilt when the header was reinitialized
// for a different texture.
HostTexture* GetTextureLocked(u32 texture_va, const u32 words[6]);

// Surfaces from CreateSurface, or nullptr. A view surface resolves to the
// surface it views.
HostTexture* FindSurfaceLocked(u32 surface_va);

// Predicated tiling creates surfaces the size of one tile and renders the
// whole tiled area through them, one tile at a time. The host has no EDRAM
// limit, so the surface is rebuilt to cover the whole area (guest pixels)
// instead. Contents are lost and framebuffers holding the old texture are
// retired. False when the surface already covers the area or could not be
// rebuilt.
bool GrowSurfaceLocked(HostTexture& surface, u32 width, u32 height);

// Uploads guest texels if they changed and moves the texture to SHADER_READ.
void PrepareTextureForSamplingLocked(HostTexture& texture, plume::RenderCommandList* list);

void TransitionTextureLocked(HostTexture& texture, plume::RenderCommandList* list,
                             plume::RenderTextureLayout layout);

// Framebuffer for a resolve from a surface at `source_scale` into one
// level/face of a texture. The texture's first resolve rebuilds it at that
// scale, and as float when a float surface resolves into a 16-bit normalized
// texture. nullptr when the texture cannot be rendered to.
plume::RenderFramebuffer* GetTextureTargetLocked(HostTexture& texture, u32 level, u32 face,
                                                 float source_scale,
                                                 plume::RenderFormat source_format);

// Host twin of a vertex or index buffer with the captured header.
HostBuffer* GetBufferLocked(u32 buffer_va, bool index, const BufferHeader& header);

// Uploads the buffer if its contents changed, from `captured` when set and
// guest memory otherwise. False when unusable.
bool PrepareBufferLocked(HostBuffer& buffer);

// Thread-safe: queue re-uploads after the title wrote guest memory. Texture
// marks reach the GPU thread directly; buffer marks make the next draw from
// the buffer capture it (BufferCaptureNeeded).
void MarkTextureDirty(u32 texture_va);
void MarkBufferDirty(u32 buffer_va);

// D3DResource_Destroy.
void DestroyResourceLocked(u32 resource_va);

// Framebuffer for up to four color surfaces plus depth.
plume::RenderFramebuffer* GetSurfaceFramebufferLocked(HostTexture* const* colors, u32 color_count,
                                                      HostTexture* depth);

// Once per presented frame: evicts stale twins and periodically logs the host
// memory footprint.
void TickResourcesLocked(u64 frame);

}  // namespace redahm::gpu

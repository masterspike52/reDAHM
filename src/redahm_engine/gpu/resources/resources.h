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

#include <memory>
#include <unordered_map>

#include <plume_render_interface.h>
#include <rex/types.h>

#include "render/host.h"

namespace redahm::gpu {

struct HostTexture {
  u32 guest_va = 0;
  u32 signature[6] = {};  // header words the host copy was built from
  u32 d3d_format = 0;
  bool surface = false;  // EDRAM surface from CreateSurface
  bool depth = false;

  u32 width = 0;
  u32 height = 0;
  u32 depth_or_slices = 1;  // volume depth
  u32 array_size = 1;       // 6 for cubes
  u32 mip_levels = 1;

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
  // The view dropped the guest swizzle because a resolve fills this texture.
  bool identity_view = false;
  u64 last_bound_frame = 0;

  // Render target views (level | face << 8) for resolves into textures.
  std::unordered_map<u32, std::unique_ptr<plume::RenderTextureView>> target_views;
  std::unordered_map<u32, std::unique_ptr<plume::RenderFramebuffer>> target_framebuffers;
};

struct HostBuffer {
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
};

// Everything below needs Host().mutex unless it says otherwise.

// Host twin of the EDRAM surface CreateSurface returned.
HostTexture* RegisterSurfaceLocked(u32 surface_va, u32 width, u32 height, u32 d3d_format);

// Host twin of a texture header, created on first use and rebuilt when the
// header was reinitialized for a different texture.
HostTexture* GetTextureLocked(u32 texture_va);

// Surfaces from CreateSurface, or nullptr.
HostTexture* FindSurfaceLocked(u32 surface_va);

// Predicated tiling creates surfaces the size of one tile and renders the
// whole tiled area through them, one tile at a time. The host has no EDRAM
// limit, so the surface is rebuilt to cover the whole area instead. Contents
// are lost and framebuffers holding the old texture are retired. False when
// the surface already covers the area or could not be rebuilt.
bool GrowSurfaceLocked(HostTexture& surface, u32 width, u32 height);

// Uploads guest texels if they changed and moves the texture to SHADER_READ.
void PrepareTextureForSamplingLocked(HostTexture& texture, plume::RenderCommandList* list);

void TransitionTextureLocked(HostTexture& texture, plume::RenderCommandList* list,
                             plume::RenderTextureLayout layout);

// Framebuffer for a resolve into one level/face of a texture. nullptr when
// the texture cannot be rendered to.
plume::RenderFramebuffer* GetTextureTargetLocked(HostTexture& texture, u32 level, u32 face);

HostBuffer* GetVertexBufferLocked(u32 buffer_va);
HostBuffer* GetIndexBufferLocked(u32 buffer_va);

// Uploads the buffer if its guest contents changed. False when unusable.
bool PrepareBufferLocked(HostBuffer& buffer);

// Thread-safe: queue re-uploads after the title wrote guest memory.
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

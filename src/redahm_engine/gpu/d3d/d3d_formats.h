#pragma once

// D3D values to plume: texture formats, vertex element types and the render
// state enums the title's D3DRS setters store.

#include <plume_render_interface.h>
#include <rex/graphics/xenos.h>
#include <rex/types.h>

#include "d3d/d3d_device.h"

namespace redahm::gpu::d3d {

// D3DFORMAT low six bits.
inline rex::graphics::xenos::TextureFormat TextureFormatOf(u32 d3d_format) {
  return static_cast<rex::graphics::xenos::TextureFormat>(d3d_format & 0x3F);
}

struct HostFormat {
  plume::RenderFormat format = plume::RenderFormat::UNKNOWN;
  bool block_compressed = false;
  // Guest texels have no host twin (EDRAM, depth and 10:10:10:2 formats): the
  // texture only ever receives resolves.
  bool render_only = false;
};

// Host format for a D3DFORMAT (texture, surface or resolve destination).
// Texels are stored guest byte order swapped per the format's endianness and
// otherwise unconverted, so formats without a host twin are UNKNOWN.
HostFormat ConvertTextureFormat(u32 d3d_format);

// The format a render target or depth surface of this D3DFORMAT renders into.
plume::RenderFormat ConvertSurfaceFormat(u32 d3d_format);

inline constexpr plume::RenderFormat kDepthStencilFormat = plume::RenderFormat::D32_FLOAT_S8_UINT;

bool IsRenderTargetCapable(plume::RenderFormat format);

// The sRGB twin of a format, for textures whose fetch constant marks the colour
// components TextureSign::kGamma (the Xenos sampler linearises those on read).
// UNKNOWN when the backend has no sRGB variant of that format.
plume::RenderFormat ToSrgbFormat(plume::RenderFormat format);

// D3DDECLTYPE to the vertex format the recompiled shaders read, given buffers
// uploaded with one 32-bit byte swap per word.
plume::RenderFormat ConvertDeclType(DeclType type);

const char* DeclUsageName(DeclUsage usage);

plume::RenderBlend ConvertBlend(u32 xenos_blend_factor, bool alpha_channel);
plume::RenderBlendOperation ConvertBlendOp(u32 xenos_blend_op);
plume::RenderComparisonFunction ConvertCompare(u32 xenos_compare);
plume::RenderStencilOp ConvertStencilOp(u32 xenos_stencil_op);

}  // namespace redahm::gpu::d3d

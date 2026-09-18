// The D3D object binding setters: render targets, viewport and scissor,
// textures, streams, indices, shaders and declarations, plus the shader
// constant dirty marks.
//
// Each setter records the binding for the draw path and keeps the device
// fields the title's D3DDevice_Get* functions read back. The render state and
// sampler state setters are not hooked: their recompiled bodies store into the
// device, which the draw path reads directly.

#include <cstring>

#include <rex/hook.h>
#include <rex/types.h>

#include "generated/redahm_init.h"

#include "core/guest_memory.h"
#include "core/log.h"
#include "d3d/d3d_device.h"
#include "draw/draw.h"
#include "shaders/guest_shaders.h"
#include "shaders/vertex_declaration.h"

namespace {

using namespace redahm::gpu;
namespace dv = d3d::dev;

constexpr u32 kMaxDeviceTextures = 26;
// D3DVertexDeclaration: the elements follow the object header.
constexpr u32 kDeclarationElements = 52;

void StoreFloat(u32 va, float value) {
  u32 bits;
  std::memcpy(&bits, &value, 4);
  mem::Store<u32>(va, bits);
}

// UE3 sets a null declaration and relies on the vertex shader's bound one
// (D3DVertexShader_Bind), as D3D_UpdateVertexShaderBinding does. The device
// keeps the declaration exactly as set.
u32 DrawDeclaration(u32 declaration, u32 vertex_shader) {
  return declaration ? declaration : FindBoundVertexDeclaration(vertex_shader);
}

void D3DDevice_SetRenderTarget_hook(u32 device, u32 index, u32 surface) {
  if (index >= d3d::kMaxRenderTargets)
    return;
  mem::Store<u32>(device + dv::kRenderTargets + index * 4, surface);
  SetRenderTarget(index, surface);
}

void D3DDevice_SetDepthStencilSurface_hook(u32 device, u32 surface) {
  mem::Store<u32>(device + dv::kDepthStencil, surface);
  SetDepthStencilSurface(surface);
}

void D3DDevice_SetViewport_hook(u32 device, rex::MappedPtr<d3d::Viewport> viewport) {
  if (!viewport)
    return;
  const float values[] = {float(u32(viewport->x)),     float(u32(viewport->y)),
                          float(u32(viewport->width)), float(u32(viewport->height)),
                          float(viewport->min_z),      float(viewport->max_z)};
  for (u32 i = 0; i < 6; ++i)
    StoreFloat(device + dv::kViewport + i * 4, values[i]);
  SetViewport(values[0], values[1], values[2], values[3], values[4], values[5]);
}

void D3DDevice_SetScissorRect_hook(u32 device, rex::MappedPtr<d3d::Rect> rect) {
  if (!rect)
    return;
  std::memcpy(mem::At<u8>(device + dv::kScissorRect), rect.host_address(), sizeof(d3d::Rect));
  SetScissorRect(rect->left, rect->top, rect->right, rect->bottom);
}

void D3DDevice_SetTexture_hook(u32 device, u32 sampler, u32 texture) {
  if (sampler < kMaxDeviceTextures)
    mem::Store<u32>(device + dv::kTextures + sampler * 4, texture);
  SetTexture(sampler, texture);
}

GuestShader* LookUpShader(u32 shader, const char* stage) {
  GuestShader* guest = FindGuestShader(shader);
  if (shader && !guest) {
    GPU_WARN_LIMITED(8, "Set{}Shader({:08X}): no registered shader (Common {:08X})", stage, shader,
                     mem::Load<u32>(shader));
  }
  return guest;
}

void D3DDevice_SetVertexShader_hook(u32 device, u32 shader) {
  mem::Store<u32>(device + dv::kVertexShader, shader);
  SetVertexShader(LookUpShader(shader, "Vertex"));
  SetVertexDeclaration(
      DrawDeclaration(mem::Load<u32>(device + dv::kVertexDeclaration), shader));
}

void D3DDevice_SetPixelShader_hook(u32 device, u32 shader) {
  mem::Store<u32>(device + dv::kPixelShader, shader);
  SetPixelShader(LookUpShader(shader, "Pixel"));
}

void D3DDevice_SetVertexDeclaration_hook(u32 device, u32 declaration) {
  mem::Store<u32>(device + dv::kVertexDeclaration, declaration);
  SetVertexDeclaration(DrawDeclaration(declaration, mem::Load<u32>(device + dv::kVertexShader)));
}

void D3DDevice_SetStreamSource_hook(u32 device, u32 stream, u32 buffer, u32 offset, u32 stride) {
  if (stream >= d3d::kMaxStreams)
    return;
  mem::Store<u32>(device + dv::kStreams + stream * 4, buffer);
  SetStreamSource(stream, buffer, offset, stride);
}

void D3DDevice_SetIndices_hook(u32 device, u32 buffer) {
  mem::Store<u32>(device + dv::kIndices, buffer);
  SetIndices(buffer);
}

}  // namespace

REX_HOOK(D3DDevice_SetRenderTarget, D3DDevice_SetRenderTarget_hook);
REX_HOOK(D3DDevice_SetDepthStencilSurface, D3DDevice_SetDepthStencilSurface_hook);
REX_HOOK(D3DDevice_SetViewport, D3DDevice_SetViewport_hook);
REX_HOOK(D3DDevice_SetScissorRect, D3DDevice_SetScissorRect_hook);
REX_HOOK(D3DDevice_SetTexture, D3DDevice_SetTexture_hook);
REX_HOOK(D3DDevice_SetVertexShader, D3DDevice_SetVertexShader_hook);
REX_HOOK(D3DDevice_SetPixelShader, D3DDevice_SetPixelShader_hook);
REX_HOOK(D3DDevice_SetVertexDeclaration, D3DDevice_SetVertexDeclaration_hook);
REX_HOOK(D3DDevice_SetStreamSource, D3DDevice_SetStreamSource_hook);
REX_HOOK(D3DDevice_SetIndices, D3DDevice_SetIndices_hook);

// sub_82E6FBC8, D3DDevice_SetFVF (pDevice, FVF), used by the Bink movie quad.
// D3D_BuildFVFDeclaration fills a declaration object inside the device and
// selects it. Raw so the title's builder runs on the inherited context.
REX_HOOK_RAW(sub_82E6FBC8) {
  const u32 device = ctx.r3.u32;
  __imp__sub_82E6FBC8(ctx, base);
  const u32 declaration = mem::Load<u32>(device + dv::kVertexDeclaration);
  RegisterVertexDeclaration(declaration,
                            mem::At<d3d::VertexElement>(declaration + kDeclarationElements));
  SetVertexDeclaration(declaration);
}

// The constant setters below stay raw: they touch no argument, only run the
// original and then mark dirty to gate the constant upload, and their arities
// differ. The float setters also raise the device's pending masks, which the
// draw path checks as well; the integer and boolean setters do not.
#define REDAHM_CONSTANT_DIRTY_HOOK(fn, mark) \
  REX_HOOK_RAW(fn) {                         \
    __imp__##fn(ctx, base);                  \
    mark;                                    \
  }

REDAHM_CONSTANT_DIRTY_HOOK(D3DDevice_SetVertexShaderConstantFN, MarkVertexShaderConstantsDirty())
REDAHM_CONSTANT_DIRTY_HOOK(D3DDevice_SetVertexShaderConstantI, MarkVertexShaderConstantsDirty())
REDAHM_CONSTANT_DIRTY_HOOK(D3DDevice_SetVertexShaderConstantB, MarkVertexShaderConstantsDirty())
REDAHM_CONSTANT_DIRTY_HOOK(D3DDevice_SetPixelShaderConstantFN, MarkPixelShaderConstantsDirty())
REDAHM_CONSTANT_DIRTY_HOOK(D3DDevice_SetPixelShaderConstantI, MarkPixelShaderConstantsDirty())
REDAHM_CONSTANT_DIRTY_HOOK(D3DDevice_SetPixelShaderConstantB, MarkPixelShaderConstantsDirty())

#undef REDAHM_CONSTANT_DIRTY_HOOK

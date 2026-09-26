// The D3D object binding setters: render targets, viewport and scissor,
// textures, streams, indices, shaders and declarations, plus the shader
// constant dirty marks.
//
// Each setter records the binding for the draw path and keeps the device
// fields the title's D3DDevice_Get* functions read back. The render state and
// sampler state setters are not hooked: their recompiled bodies store into the
// device, which the draw path reads directly.

#include <array>
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

// What a shader object maps to, remembered per object: the registry takes a
// lock per lookup, and UE3 sets shaders and declarations on almost every draw.
// Only the thread driving the device uses it.
struct ShaderObject {
  u32 shader_va = 0;
  u64 changes = ~u64{0};
  GuestShader* shader = nullptr;
  u32 bound_declaration = 0;
};
std::array<ShaderObject, 1024> g_shader_objects;

const ShaderObject& LookUpShaderObject(u32 shader_va, const char* stage) {
  const u64 changes = GuestShaderObjectChanges();
  ShaderObject& object = g_shader_objects[(shader_va >> 4) & (g_shader_objects.size() - 1)];
  if (object.shader_va == shader_va && object.changes == changes)
    return object;
  object.shader_va = shader_va;
  object.changes = changes;
  object.shader = FindGuestShader(shader_va);
  object.bound_declaration = FindBoundVertexDeclaration(shader_va);
  if (shader_va && !object.shader) {
    GPU_WARN_LIMITED(8, "Set{}Shader({:08X}): no registered shader (Common {:08X})", stage,
                     shader_va, mem::Load<u32>(shader_va));
  }
  return object;
}

// UE3 sets a null declaration and relies on the vertex shader's bound one
// (D3DVertexShader_Bind), as D3D_UpdateVertexShaderBinding does. The device
// keeps the declaration exactly as set.
u32 DrawDeclaration(u32 declaration, u32 vertex_shader) {
  return declaration ? declaration : LookUpShaderObject(vertex_shader, "Vertex").bound_declaration;
}

// The title's sub_82E7B758, run when the surface that sizes the frame changes:
// the scissor becomes (0, 0, 0xFFFF, 0xFFFF) and D3DDevice_SetViewport(&{0, 0,
// 0xFFFF, 0xFFFF, 0, 1}) (dword_8201690C) covers the whole target, clamped to it
// at the draw. UE3's post passes (DrawDenormalizedQuad after RHISetRenderTarget)
// set no viewport and rely on it; in split screen they otherwise kept the
// second view's viewport.
constexpr u32 kResetExtent = 0xFFFF;

void ResetViewportAndScissor(u32 device) {
  const d3d::Rect scissor = {0, 0, i32(kResetExtent), i32(kResetExtent)};
  std::memcpy(mem::At<u8>(device + dv::kScissorRect), &scissor, sizeof(scissor));
  SetScissorRect(0, 0, i32(kResetExtent), i32(kResetExtent));
  SetViewport(device, 0, 0, kResetExtent, kResetExtent, 0.0f, 1.0f);
}

void D3DDevice_SetRenderTarget_hook(u32 device, u32 index, u32 surface) {
  if (index >= d3d::kMaxRenderTargets)
    return;
  mem::Store<u32>(device + dv::kRenderTargets + index * 4, surface);
  SetRenderTarget(index, surface);
  // Target 0 resets, or with none bound the depth surface does.
  if (index == 0 && (surface || mem::Load<u32>(device + dv::kDepthStencil)))
    ResetViewportAndScissor(device);
}

void D3DDevice_SetDepthStencilSurface_hook(u32 device, u32 surface) {
  mem::Store<u32>(device + dv::kDepthStencil, surface);
  SetDepthStencilSurface(surface);
  if (surface && !mem::Load<u32>(device + dv::kRenderTargets))
    ResetViewportAndScissor(device);
}

void D3DDevice_SetViewport_hook(u32 device, rex::MappedPtr<d3d::Viewport> viewport) {
  if (!viewport)
    return;
  SetViewport(device, u32(viewport->x), u32(viewport->y), u32(viewport->width),
              u32(viewport->height), float(viewport->min_z), float(viewport->max_z));
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

void D3DDevice_SetVertexShader_hook(u32 device, u32 shader) {
  mem::Store<u32>(device + dv::kVertexShader, shader);
  const ShaderObject& object = LookUpShaderObject(shader, "Vertex");
  SetVertexShader(object.shader);
  const u32 declaration = mem::Load<u32>(device + dv::kVertexDeclaration);
  SetVertexDeclaration(declaration ? declaration : object.bound_declaration);
}

void D3DDevice_SetPixelShader_hook(u32 device, u32 shader) {
  mem::Store<u32>(device + dv::kPixelShader, shader);
  SetPixelShader(LookUpShaderObject(shader, "Pixel").shader);
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

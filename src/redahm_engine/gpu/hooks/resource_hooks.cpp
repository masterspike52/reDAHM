// Resource creation, locking, unlocking and destruction.
//
// The title's D3D keeps creating the resource headers and computing lock
// addresses. The renderer adds host twins after creation, re-uploads after
// unlocks, and releases them on destruction. Relocations (UE3's
// XGOffsetResourceAddress) need no hook: the host twins compare the header
// words they were built from on every bind.

#include <algorithm>
#include <mutex>

#include <rex/hook.h>
#include <rex/types.h>

#include "generated/redahm_init.h"

#include "core/guest_memory.h"
#include "d3d/d3d_device.h"
#include "render/host.h"
#include "resources/resources.h"
#include "shaders/guest_shaders.h"
#include "shaders/vertex_declaration.h"

namespace {

using namespace redahm::gpu;

constexpr u32 kLockCountMask = 0xF00;
constexpr u32 kLockCountOne = 0x100;
constexpr u32 kFlushRangeEmpty = 0xFFFF0000;

// D3DVertexShader flags word; D3DVertexShader_Bind sets kVertexShaderBound.
constexpr u32 kVertexShaderFlags = 872;
constexpr u32 kVertexShaderBound = 0x40;

// sub_82E76AD8, the body every unlock tails into: drops one lock, and when the
// last one goes resets the dirty ranges the locks accumulated. The original
// also flushes the CPU cache over those ranges, which has nothing to do here.
// Only textures with a mip tail pass a mip range.
void ReleaseLock(d3d::Resource& resource, be_u32* mip_flush) {
  const u32 common = resource.common;
  resource.common = common - kLockCountOne;
  if ((common & kLockCountMask) != kLockCountOne)
    return;
  resource.base_flush = kFlushRangeEmpty;
  if (mip_flush)
    *mip_flush = kFlushRangeEmpty;
}

// Textures pass their base and mip addresses from fetch words 1 and 5.
void UnlockTexture(u32 texture_va) {
  auto* texture = mem::At<d3d::BaseTexture>(texture_va);
  if (!texture)
    return;
  const bool has_mips = (u32(texture->format[5]) & ~u32(0xFFF)) != 0;
  ReleaseLock(texture->resource, has_mips ? &texture->mip_flush : nullptr);
  MarkTextureDirty(texture_va);
}

u32 D3DVertexBuffer_Unlock_hook(rex::MappedPtr<d3d::VertexBuffer> buffer) {
  if (!buffer)
    return 0;
  ReleaseLock(buffer->resource, nullptr);
  MarkBufferDirty(buffer.guest_address());
  return 0;
}

u32 D3DIndexBuffer_Unlock_hook(rex::MappedPtr<d3d::IndexBuffer> buffer) {
  if (!buffer)
    return 0;
  ReleaseLock(buffer->resource, nullptr);
  MarkBufferDirty(buffer.guest_address());
  return 0;
}

// D3DTexture/BaseTexture/CubeTexture/ArrayTexture/LineTexture_UnlockRect and
// D3DVolumeTexture_UnlockBox share one body (0x82E83E68..0x82E83F18). The
// level is unused: the whole texture shares one lock count.
u32 D3DTexture_UnlockRect_hook(u32 texture, u32 /*level*/) {
  UnlockTexture(texture);
  return 0;
}

// Level surfaces unlock their parent texture.
u32 D3DSurface_UnlockRect_hook(rex::MappedPtr<d3d::Surface> surface) {
  if (surface && (u32(surface->resource.common) & d3d::kCommonTextureLevelSurface))
    UnlockTexture(surface->surface_info);
  return 0;
}

// Volumes keep their parent texture at +0x18 as well.
u32 D3DVolume_UnlockBox_hook(rex::MappedPtr<d3d::Surface> volume) {
  if (volume)
    UnlockTexture(volume->surface_info);
  return 0;
}

// sub_82E760F8, D3DVertexShader_Bind (pShader, Flags, pVertexDeclaration,
// pStreamStrides, pPixelShader). RHICreateBoundShaderState binds each vertex
// shader to its declaration up front and later draws with a null declaration.
// The original patches the microcode's vertex fetches and links the pixel
// shader for the GPU; the renderer only needs the declaration.
u32 D3DVertexShader_Bind_hook(u32 shader, u32 /*flags*/, u32 declaration, u32 /*stream_strides*/,
                              u32 /*pixel_shader*/) {
  if (!shader)
    return 0;
  BindVertexShaderDeclaration(shader, declaration);
  mem::Store<u32>(shader + kVertexShaderFlags,
                  mem::Load<u32>(shader + kVertexShaderFlags) | kVertexShaderBound);
  return 0;
}

}  // namespace

REX_HOOK(D3DVertexBuffer_Unlock, D3DVertexBuffer_Unlock_hook);
REX_HOOK(D3DIndexBuffer_Unlock, D3DIndexBuffer_Unlock_hook);
REX_HOOK(D3DTexture_UnlockRect, D3DTexture_UnlockRect_hook);
REX_HOOK(D3DBaseTexture_UnlockRect, D3DTexture_UnlockRect_hook);
REX_HOOK(D3DCubeTexture_UnlockRect, D3DTexture_UnlockRect_hook);
REX_HOOK(D3DArrayTexture_UnlockRect, D3DTexture_UnlockRect_hook);
REX_HOOK(D3DLineTexture_UnlockRect, D3DTexture_UnlockRect_hook);
REX_HOOK(D3DVolumeTexture_UnlockBox, D3DTexture_UnlockRect_hook);
REX_HOOK(D3DSurface_UnlockRect, D3DSurface_UnlockRect_hook);
REX_HOOK(D3DVolume_UnlockBox, D3DVolume_UnlockBox_hook);
REX_HOOK(sub_82E760F8, D3DVertexShader_Bind_hook);

// The hooks below stay raw.
//
// Creation and destruction run their original on the inherited context, since
// the title's D3D builds and frees the headers: a typed REX_IMPORT re-roots the
// guest stack at ThreadState's r1 and overwrites the frames live underneath it.

// (Width, Height, Format, MultiSample, pParameters)
REX_HOOK_RAW(D3DDevice_CreateSurface) {
  const u32 width = ctx.r3.u32;
  const u32 height = ctx.r4.u32;
  const u32 format = ctx.r5.u32;
  __imp__D3DDevice_CreateSurface(ctx, base);
  if (const u32 surface = ctx.r3.u32) {
    std::lock_guard lock(Host().mutex);
    RegisterSurfaceLocked(surface, width, height, format);
  }
}

// Shaders: D3DDevice_Create*Shader and UE3's own path both copy the container
// header into the shader object and the microcode into physical memory, then
// register the object. The header copy sits at +872 (vertex) or +40 (pixel).

// XGRegisterVertexShader (pShader, pMicrocode). D3DDevice_CreateVertexShader
// goes through it as well.
REX_HOOK_RAW(XGRegisterVertexShader) {
  const u32 shader = ctx.r3.u32;
  const u32 microcode = ctx.r4.u32;
  __imp__XGRegisterVertexShader(ctx, base);
  RegisterGuestShader(shader, mem::At<u8>(shader + 872), mem::At<u8>(microcode), false);
}

// XGRegisterPixelShader (pShader, pMicrocode), UE3's path.
REX_HOOK_RAW(XGRegisterPixelShader) {
  const u32 shader = ctx.r3.u32;
  const u32 microcode = ctx.r4.u32;
  __imp__XGRegisterPixelShader(ctx, base);
  RegisterGuestShader(shader, mem::At<u8>(shader + 40), mem::At<u8>(microcode), true);
}

// D3DDevice_CreatePixelShader registers inline: microcode pointer at +24.
REX_HOOK_RAW(D3DDevice_CreatePixelShader) {
  __imp__D3DDevice_CreatePixelShader(ctx, base);
  if (const u32 shader = ctx.r3.u32) {
    RegisterGuestShader(shader, mem::At<u8>(shader + 40), mem::At<u8>(mem::Load<u32>(shader + 24)),
                        true);
  }
}

// (pVertexElements)
REX_HOOK_RAW(D3DDevice_CreateVertexDeclaration) {
  const u32 elements = ctx.r3.u32;
  __imp__D3DDevice_CreateVertexDeclaration(ctx, base);
  if (const u32 declaration = ctx.r3.u32)
    RegisterVertexDeclaration(declaration, mem::At<d3d::VertexElement>(elements));
}

// (pResource)
REX_HOOK_RAW(D3DResource_Destroy) {
  const u32 resource = ctx.r3.u32;
  if (auto* header = mem::At<d3d::Resource>(resource)) {
    const u32 type = u32(header->common) & d3d::kCommonTypeMask;
    if (type == d3d::kCommonTypeVertexShader || type == d3d::kCommonTypePixelShader) {
      UnregisterGuestShader(resource);
    } else {
      std::lock_guard lock(Host().mutex);
      DestroyResourceLocked(resource);
    }
  }
  __imp__D3DResource_Destroy(ctx, base);
}

// Shared by every Lock: tracks the locked byte range and the lock count, and
// hands back the address (in the write-combined view for D3DLOCK flag 0x10).
// The ring buffer packet and the fence wait the original emits are dropped.
// Raw because the second argument is a 64-bit command buffer handle, which the
// typed marshalling truncates to r4's low word.
//
// (pResource, u64 hCommandBuffer, HasMipRange, BaseAddress, MipAddress,
//  Address, Length, [stack] Flags)
REX_HOOK_RAW(D3D_EmitResourceMemoryPacket) {
  (void)base;
  const u32 resource = ctx.r3.u32;
  // The ninth integer argument, in the caller's parameter save area.
  u32 flags = mem::Load<u32>(ctx.r1.u32 + 0x54);
  if (ctx.r4.u64 != 0)
    flags |= 2;
  const u32 has_mip_range = ctx.r6.u32;
  const u32 base_address = ctx.r7.u32;
  const u32 mip_address = ctx.r8.u32;
  u32 address = ctx.r9.u32;
  const u32 length = ctx.r10.u32;

  auto* header = mem::At<d3d::Resource>(resource);
  const u32 common = header->common;
  if ((flags & 0x10) || (common & 0x200000)) {
    if (!(flags & 1)) {
      const bool mips = has_mip_range && mip_address;
      const u32 delta = address - (mips ? mip_address : base_address);
      auto* range = mem::At<be_u32>(resource + (mips ? 0x18 : 0x14));
      const u32 old_range = *range;
      const u32 low = std::min(delta >> 7, old_range >> 16);
      const u32 high = std::max((delta + length + 0x7F) >> 7, old_range & 0xFFFF);
      *range = (low << 16) | high;
    }
    if (flags & 0x10) {
      const u32 physical = (((address >> 20) + 0x200) & 0x1000) + (address & 0x1FFFFFFF);
      address = physical - 0x40000000;
    }
  }
  header->common = common + 0x100;
  ctx.r3.u64 = address;
}

#pragma once

// Guest D3DVertexShader / D3DPixelShader objects mapped to the recompiled
// host shaders in the XenosRecomp cache.
//
// Host shaders are shared per microcode hash: UE3 recreates identical shaders
// for every material instance, and the pipeline cache keys on GuestShader
// pointers, which therefore live for the whole session.

#include <memory>
#include <mutex>
#include <unordered_map>

#include <plume_render_interface.h>
#include <rex/types.h>

struct ShaderCacheEntry;

namespace redahm::gpu {

// shader_common.h spec constant bits.
inline constexpr u32 kSpecConstantR11G11B10Normal = 1 << 0;
inline constexpr u32 kSpecConstantAlphaTest = 1 << 1;

struct GuestShader {
  u64 hash = 0;
  bool pixel = false;
  const ShaderCacheEntry* entry = nullptr;
  u32 spec_constants_mask = 0;

  std::mutex mutex;
  // SPIR-V, or DXIL without spec constants.
  std::unique_ptr<plume::RenderShader> shader;
  // DXIL linked per masked spec constant value.
  std::unordered_map<u32, std::unique_ptr<plume::RenderShader>> linked;
};

// Registers a shader object once D3D or UE3 has built it. A Xenos shader
// container is its header part (kept in the object) followed by the microcode
// (copied to physical memory); the cache is keyed by the two together.
GuestShader* RegisterGuestShader(u32 shader_va, const u8* header_part, const u8* microcode,
                                 bool pixel);

// The shader a guest shader object maps to. nullptr for unknown objects and
// shaders missing from the cache.
GuestShader* FindGuestShader(u32 shader_va);

// Forgets the object, and the declaration it was bound to.
void UnregisterGuestShader(u32 shader_va);

// D3DVertexShader_Bind: UE3 binds each vertex shader object to its vertex
// declaration when it builds a bound shader state, then draws with a null
// declaration set, which D3D resolves to the shader's bound one.
void BindVertexShaderDeclaration(u32 shader_va, u32 declaration_va);

// The declaration BindVertexShaderDeclaration recorded, or 0.
u32 FindBoundVertexDeclaration(u32 shader_va);

// Host shader for the given spec constant value (masked internally). Creates
// and links on first use; needs the host device.
plume::RenderShader* GetHostShader(GuestShader* shader, u32 spec_constants);

}  // namespace redahm::gpu

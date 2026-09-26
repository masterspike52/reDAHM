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

struct ShaderOverride;

struct GuestShader {
  u64 hash = 0;
  bool pixel = false;
  const ShaderCacheEntry* entry = nullptr;
  // A hand-written replacement, used instead of the cache's host shader.
  const ShaderOverride* override = nullptr;
  // The replacement traces reflections through a copy of the scene, which the
  // draw provides (draw.cpp, screen-space reflections).
  bool screen_reflections = false;
  u32 spec_constants_mask = 0;
  // UE3's Xbox 360 instancing: the vertex shader splits the vertex index into
  // an instance (index / NumVerticesPerInstance) and a vertex within it, and
  // fetches the instance streams with the first. The float4 register holding
  // NumVerticesPerInstance, or -1 when the shader does not instance.
  i32 vertices_per_instance_register = -1;
  // UE3's view constants (row-vector ViewProjectionMatrix, four registers,
  // and CameraPosition), or -1. Screen-space reflections read them.
  i32 view_projection_register = -1;
  i32 camera_position_register = -1;
  // What the graphics settings (core/settings.h) change about UE3's own
  // pixel shaders, found by constant name: the bloom gather's BloomScale and
  // the depth of field's MinMaxBlurClamp (zeroed to turn them off), the
  // distortion apply pass (skipped), and the shadow projection passes, which
  // modulate the scene by ShadowModulateColor (skipped with shadows off).
  i32 bloom_scale_register = -1;
  i32 blur_clamp_register = -1;
  bool distortion_apply = false;
  bool shadow_projection = false;
  // Float4 registers the shader reads from its constant buffer: one past the
  // highest register in its constant table. XenosRecomp compiles literal
  // (def) registers into the shader, and relative reads stay inside arrays
  // the table declares. 256 when the container has no table.
  u32 float4_register_count = 256;
  // Samplers its constant table declares, one bit per D3D sampler. All 16 when
  // there is no table; a vertex shader with any sampler also gets all 16, as
  // its sampler registers do not number the pixel samplers.
  u32 sampler_mask = 0xFFFF;

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

// The shader with this microcode hash if the title has created it this session
// and the shader cache has it, else nullptr.
GuestShader* FindGuestShaderByHash(u64 hash);

// Counts new shaders; unchanged means FindGuestShaderByHash would answer as
// before.
u64 GuestShaderGeneration();

// Counts changes to which object maps to which shader and declaration;
// unchanged means FindGuestShader and FindBoundVertexDeclaration would answer
// as before for every object.
u64 GuestShaderObjectChanges();

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

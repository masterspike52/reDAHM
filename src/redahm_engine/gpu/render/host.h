#pragma once

// The host side of the renderer: the plume device, the swap chain, the
// command list ring, the bindless heaps shared by every pipeline, and the
// fence-deferred retirement of GPU objects.
//
// Everything below Host() is guarded by Host().mutex. Functions suffixed with
// Locked expect the caller to hold it.

#include <atomic>
#include <functional>
#include <memory>
#include <mutex>
#include <string>
#include <vector>

#include <plume_render_interface.h>
#include <rex/types.h>

namespace rex::ui {
class Window;
}

namespace redahm::gpu {

// Frames in flight: the CPU records frame N+1 while the GPU runs N.
inline constexpr u32 kFrameCount = 2;

inline constexpr u32 kTextureDescriptorCount = 16384;
inline constexpr u32 kSamplerDescriptorCount = 1024;

// The first texture descriptors are dimension-matched null textures so an
// unbound sampler slot still indexes a live descriptor.
enum : u32 {
  kNullTexture2DSlot = 0,
  kNullTexture3DSlot = 1,
  kNullTextureCubeSlot = 2,
  kReservedTextureSlots = 3,
};

inline constexpr u32 kInvalidSlot = ~u32{0};

// Fixed sampler descriptors the renderer's own passes use.
inline constexpr u32 kLinearClampSamplerSlot = 0;
inline constexpr u32 kPointClampSamplerSlot = 1;

// Push constant block the renderer's own shaders read (b3, space4 on D3D12;
// bytes [24, 120) of the shared push constant range on Vulkan). Laid out like
// the HLSL cbuffer in host_common.hlsli.
struct HostPushConstants {
  u32 texture_slot = 0;
  u32 sampler_slot = 0;
  float values[6] = {};
  // Further textures, and flags, for passes that sample more than one (the
  // Bink movie's cR, cB and alpha planes).
  u32 texture_slots[3] = {};
  u32 flags = 0;
  float rows[3][4] = {};
};
static_assert(sizeof(HostPushConstants) == 96);
inline constexpr u32 kHostPushConstantsSize = sizeof(HostPushConstants);
inline constexpr u32 kGuestPushConstantsSize = 24;  // three device addresses (Vulkan)

struct RetiredObjects {
  std::vector<std::unique_ptr<plume::RenderFramebuffer>> framebuffers;
  std::vector<std::unique_ptr<plume::RenderTextureView>> views;
  std::vector<std::unique_ptr<plume::RenderTexture>> textures;
  std::vector<std::unique_ptr<plume::RenderBuffer>> buffers;
  // (slot, null slot to install) pairs.
  std::vector<std::pair<u32, u32>> texture_slots;
};

struct FrameSlot {
  std::unique_ptr<plume::RenderCommandList> list;
  std::unique_ptr<plume::RenderCommandFence> fence;
  std::unique_ptr<plume::RenderCommandSemaphore> acquire_semaphore;
  bool submitted = false;
  RetiredObjects retired;
};

struct HostState {
  std::mutex mutex;

  rex::ui::Window* window = nullptr;
  bool vulkan = false;
  plume::RenderShaderFormat shader_format = plume::RenderShaderFormat::UNKNOWN;
  std::string backend_name;

  std::unique_ptr<plume::RenderInterface> render_interface;
  std::unique_ptr<plume::RenderDevice> device;
  std::unique_ptr<plume::RenderCommandQueue> queue;

  FrameSlot frames[kFrameCount];
  u32 frame = 0;
  bool list_open = false;
  // Bumped on every list begin. Bindings do not survive begin(), so the draw
  // state compares against this to know when to rebind everything.
  u64 list_generation = 0;

  std::unique_ptr<plume::RenderSwapChain> swap_chain;
  std::vector<std::unique_ptr<plume::RenderFramebuffer>> swap_framebuffers;
  std::vector<std::unique_ptr<plume::RenderCommandSemaphore>> render_semaphores;

  std::unique_ptr<plume::RenderPipelineLayout> pipeline_layout;
  std::unique_ptr<plume::RenderDescriptorSet> texture_set;
  std::unique_ptr<plume::RenderDescriptorSet> sampler_set;
  std::vector<bool> texture_slot_used;
  std::vector<bool> sampler_slot_used;
  u32 next_texture_slot_hint = kReservedTextureSlots;
  std::unique_ptr<plume::RenderTexture> null_textures[kReservedTextureSlots];
  std::unique_ptr<plume::RenderTextureView> null_views[kReservedTextureSlots];
  bool null_textures_transitioned = false;
  std::unique_ptr<plume::RenderSampler> linear_clamp_sampler;
  std::unique_ptr<plume::RenderSampler> point_clamp_sampler;

  // Zero-filled vertex stream for shader inputs a declaration leaves out.
  std::unique_ptr<plume::RenderBuffer> zero_vertex_buffer;

  std::atomic<bool> resize_requested{false};
  std::atomic<bool> shutting_down{false};
  bool ready = false;
};

HostState& Host();

// Brings up plume against the app window. Safe to call repeatedly; later calls
// return the cached result. Takes Host().mutex.
bool CreateHostDevice(rex::ui::Window* window);

// Stops recording, drains the in-flight frames and releases the swap chain.
// The device and the objects that reference it are deliberately leaked.
void ShutdownHost();

bool IsHostReady();

// Opens the recording command list if needed. nullptr when the host is not up
// or is shutting down.
plume::RenderCommandList* OpenCommandListLocked();

// Submits the open list with the given semaphores, advances the ring and frees
// what the reused slot retired. Unlocks nothing; the drain runs under the lock.
void SubmitFrameLocked(plume::RenderCommandSemaphore** wait, u32 wait_count,
                       plume::RenderCommandSemaphore** signal, u32 signal_count);

// Submits the open list (if any) and waits for every in-flight frame.
void FlushAndWaitLocked();

u32 CurrentFrameSlot();

// Deferred destruction until no in-flight command list can reference them.
void RetireLocked(std::unique_ptr<plume::RenderTexture> texture);
void RetireLocked(std::unique_ptr<plume::RenderTextureView> view);
void RetireLocked(std::unique_ptr<plume::RenderBuffer> buffer);
void RetireLocked(std::unique_ptr<plume::RenderFramebuffer> framebuffer);

u32 AllocateTextureSlotLocked();
void SetTextureSlotLocked(u32 slot, plume::RenderTexture* texture, plume::RenderTextureView* view);
void RetireTextureSlotLocked(u32 slot, plume::RenderTextureViewDimension dimension);

u32 AllocateSamplerSlotLocked();

// Binds the shared layout and bindless sets. Needed again after any other
// pipeline layout (the overlay's) was bound on the list.
void BindSharedLayoutLocked(plume::RenderCommandList* list);

// plume hands back live wrappers around null backend objects on failure. These
// return nullptr instead.
std::unique_ptr<plume::RenderBuffer> CreateBuffer(const plume::RenderBufferDesc& desc,
                                                  const char* tag);
std::unique_ptr<plume::RenderTexture> CreateTexture(const plume::RenderTextureDesc& desc,
                                                    const char* tag);
std::unique_ptr<plume::RenderPipeline> CreateGraphicsPipeline(
    const plume::RenderGraphicsPipelineDesc& desc, const char* tag);

void RequestResize();

// Waits out the in-flight frames and rebuilds the swap chain and its
// framebuffers. False when the window has no area (minimized).
bool ResizeSwapChainLocked();

}  // namespace redahm::gpu

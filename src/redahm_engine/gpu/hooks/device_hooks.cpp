// Device lifetime and the D3D functions that only exist to drive the GPU.
//
// The guest D3DDevice stays the home of D3D state: the title's render state
// and sampler state setters and the shader constant setters run unmodified and
// store into it. Creation skips the GPU bring-up (engines, ring buffer, EDRAM
// training) and the ring buffer, fence and vblank functions become no-ops, so
// no PM4 is ever produced.

#include <atomic>
#include <cstring>

#include <rex/hook.h>
#include <rex/types.h>

#include "generated/redahm_init.h"

#include "core/guest_memory.h"
#include "core/log.h"
#include "d3d/d3d_device.h"

namespace {

using namespace redahm::gpu;
namespace dv = d3d::dev;

// D3DDEVTYPE_COMMAND_BUFFER.
constexpr u32 kDeviceTypeCommandBuffer = 2;
// VdGlobalDevice import slot, holding the kernel variable's address.
constexpr u32 kVdGlobalDeviceImport = 0x82000924;
constexpr u32 kErrorOutOfMemory = 0x8007000E;
// D3D_SetHiZControl's word: the mode sits in bits 12-13.
constexpr u32 kHiZControl = 0x2AA4;
constexpr u32 kHiZModeMask = 0x3000;

std::atomic<u32> g_device{0};

u32 D3DDevice_Release_hook(u32 device) {
  const u32 count = mem::Load<u32>(device + dv::kReferenceCount);
  if (count > 1)
    mem::Store<u32>(device + dv::kReferenceCount, count - 1);
  return count > 1 ? count - 1 : 1;
}

u32 D3DDevice_Reset_hook(u32 device, rex::MappedPtr<d3d::PresentParameters> params) {
  if (params) {
    std::memcpy(mem::At<u8>(device + dv::kPresentParameters), params.host_address(),
                sizeof(d3d::PresentParameters));
  }
  return 0;
}

// D3D__ResetAllState's hierarchical Z packet: keep the setting, drop the packet.
u32 D3D_SetHiZControl_hook(u32 device, u32 mode) {
  const u32 control = mem::Load<u32>(device + kHiZControl);
  mem::Store<u32>(device + kHiZControl, ((mode << 12) & kHiZModeMask) | (control & ~kHiZModeMask));
  return 0;
}

u32 ReturnZero_hook() {
  return 0;
}

u32 ReturnOne_hook() {
  return 1;
}

}  // namespace

REX_HOOK(D3DDevice_Release, D3DDevice_Release_hook);
REX_HOOK(D3DDevice_Reset, D3DDevice_Reset_hook);
REX_HOOK(D3D_SetHiZControl, D3D_SetHiZControl_hook);

// Ring buffer, fences and the GPU scheduler.
REX_HOOK(D3DDevice_SetRingBufferParameters, ReturnZero_hook);
REX_HOOK(D3DDevice_RingBufferFlush, ReturnZero_hook);
REX_HOOK(D3DDevice_RingBufferSubmitBatch, ReturnZero_hook);
REX_HOOK(D3DDevice_RingBufferWaitForSpace, ReturnZero_hook);
REX_HOOK(D3DDevice_RingBufferPollReady, ReturnOne_hook);
REX_HOOK(D3DDevice_BlockUntilIdle, ReturnZero_hook);
REX_HOOK(D3DDevice_InsertFence, ReturnOne_hook);

// Per-frame GPU configuration and predication packets.
REX_HOOK(D3DDevice_SetShaderGPRAllocation, ReturnZero_hook);
REX_HOOK(D3DDevice_SetPredication, ReturnZero_hook);
REX_HOOK(D3DDevice_BeginZPass, ReturnZero_hook);
REX_HOOK(D3DDevice_EndZPass, ReturnZero_hook);
REX_HOOK(D3D_EmitStateRestorePacket, ReturnZero_hook);

// Display: vblank waits and gamma ramps.
REX_HOOK(D3DDevice_WaitForVBlank, ReturnZero_hook);
REX_HOOK(D3D_QueueVBlankWait, ReturnZero_hook);
REX_HOOK(D3DDevice_SetGammaRamp, ReturnZero_hook);
REX_HOOK(D3DDevice_SetPWLGammaRamp, ReturnZero_hook);
REX_HOOK(D3D_PersistDisplaySurface, ReturnZero_hook);

// UE3 records loading screen frames through a command buffer device and plays
// them back. That device is the main device, so recording draws directly and
// playback has nothing to do.
REX_HOOK(D3DCommandBuffer_BeginRecording, ReturnZero_hook);
REX_HOOK(D3DCommandBuffer_Marker, ReturnZero_hook);
REX_HOOK(D3DCommandBuffer_EndRecording, ReturnZero_hook);
REX_HOOK(D3DCommandBuffer_Playback, ReturnZero_hook);

// Direct3D_CreateDevice stays raw: it runs the title's own device setup
// (sub_82E923D8, the critical sections, D3D__ResetAllState) on the inherited
// context, since a typed REX_IMPORT re-roots the guest stack at ThreadState's
// r1 and overwrites the frames live underneath it.
namespace {

void CallGuest(PPCContext& ctx, u8* base, void (*fn)(PPCContext&, u8*), u32 r3) {
  // Runs on the caller's context and stack like a guest call would; only r3
  // changes and the non-volatile registers are the callee's to preserve.
  ctx.r3.u64 = r3;
  fn(ctx, base);
}

u32 CreateDevice(PPCContext& ctx, u8* base, u32 behavior_flags, u32 params_va) {
  const u32 device = mem::Alloc(d3d::kDeviceAllocSize, 0x80);
  if (!device)
    return 0;

  // Reference count, state templates and the owning thread.
  CallGuest(ctx, base, sub_82E923D8, device);
  // The device critical sections D3DDevice_Acquire/ReleaseThreadOwnership take.
  CallGuest(ctx, base, __imp__RtlInitializeCriticalSection, device + 0x3A60);
  CallGuest(ctx, base, __imp__RtlInitializeCriticalSection, device + 0x3A7C);

  mem::Store<u32>(device + dv::kBehaviorFlags, behavior_flags);
  if (auto* params = mem::At<d3d::PresentParameters>(params_va)) {
    std::memcpy(mem::At<u8>(device + dv::kPresentParameters), params,
                sizeof(d3d::PresentParameters));
    mem::Store<u32>(device + dv::kFrontBufferFormat,
                    (u32(params->front_buffer_format) & 0x3F) | 0x28280100);
  }
  if (const u32 global = mem::Load<u32>(kVdGlobalDeviceImport))
    mem::Store<u32>(global, device);

  // The title's own defaults for every render and sampler state, through the
  // dispatch tables D3D__ResetAllState installs.
  CallGuest(ctx, base, D3D__ResetAllState, device);
  return device;
}

}  // namespace

// (Adapter, DeviceType, hFocusWindow, BehaviorFlags, pPresentationParameters,
//  ppReturnedDeviceInterface)
REX_HOOK_RAW(Direct3D_CreateDevice) {
  const u32 device_type = ctx.r4.u32;
  const u32 behavior_flags = ctx.r6.u32;
  const u32 params_va = ctx.r7.u32;
  const u32 out_va = ctx.r8.u32;
  mem::Store<u32>(out_va, 0);

  u32 device = g_device.load();
  if (device) {
    // A second device, or UE3's command buffer device used to record loading
    // screens: both render through the one device.
    mem::Store<u32>(device + dv::kReferenceCount,
                    mem::Load<u32>(device + dv::kReferenceCount) + 1);
    if (device_type == kDeviceTypeCommandBuffer)
      GPU_INFO("Command buffer device aliased to the main device");
  } else {
    device = CreateDevice(ctx, base, behavior_flags, params_va);
    if (!device) {
      ctx.r3.u64 = kErrorOutOfMemory;
      return;
    }
    g_device.store(device);
    GPU_INFO("Guest D3D device at {:08X}", device);
  }
  mem::Store<u32>(out_va, device);
  ctx.r3.u64 = 0;
}

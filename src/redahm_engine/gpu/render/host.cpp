#include "render/host.h"

#include <chrono>
#include <cstring>
#include <thread>

#if defined(_WIN32)
#include <windows.h>
#else
#include <SDL3/SDL_video.h>
#endif

#include <plume_render_interface_builders.h>
#include <rex/ui/window.h>

#include "core/frame_cost.h"
#include "core/log.h"
#include "core/settings.h"
#include "render/backend.h"
#include "render/gpu_thread.h"
#include "render/host_pipelines.h"
#include "render/occlusion.h"
#include "render/upload_heap.h"

namespace redahm::gpu {

namespace {

bool GetRenderWindow(rex::ui::Window* window, plume::RenderWindow& out) {
#if defined(_WIN32)
  out = static_cast<plume::RenderWindow>(window->GetNativeWindowHandle());
  return out != nullptr;
#else
  (void)window;
  int count = 0;
  SDL_Window** windows = SDL_GetWindows(&count);
  SDL_Window* sdl_window = (windows && count > 0) ? windows[0] : nullptr;
  SDL_free(windows);
  out = sdl_window;
  return out != nullptr;
#endif
}

bool BuildSwapFramebuffersLocked(HostState& h) {
  h.swap_framebuffers.clear();
  h.render_semaphores.clear();
  const u32 count = h.swap_chain->getTextureCount();
  for (u32 i = 0; i < count; ++i) {
    const plume::RenderTexture* attachments[] = {h.swap_chain->getTexture(i)};
    auto framebuffer = h.device->createFramebuffer(plume::RenderFramebufferDesc(attachments, 1));
    auto semaphore = h.device->createCommandSemaphore();
    if (!framebuffer || !semaphore) {
      h.swap_framebuffers.clear();
      h.render_semaphores.clear();
      return false;
    }
    h.swap_framebuffers.push_back(std::move(framebuffer));
    h.render_semaphores.push_back(std::move(semaphore));
  }
  return true;
}

bool BuildNullTexturesLocked(HostState& h) {
  for (u32 i = 0; i < kReservedTextureSlots; ++i) {
    plume::RenderTextureDesc desc;
    desc.width = 1;
    desc.height = 1;
    desc.depth = 1;
    desc.mipLevels = 1;
    desc.arraySize = 1;
    desc.format = plume::RenderFormat::R8_UNORM;
    desc.committed = true;

    plume::RenderTextureViewDesc view_desc;
    view_desc.format = desc.format;
    view_desc.mipLevels = 1;
    view_desc.componentMapping = plume::RenderComponentMapping(
        plume::RenderSwizzle::ZERO, plume::RenderSwizzle::ZERO, plume::RenderSwizzle::ZERO,
        plume::RenderSwizzle::ZERO);

    switch (i) {
      case kNullTexture2DSlot:
        desc.dimension = plume::RenderTextureDimension::TEXTURE_2D;
        view_desc.dimension = plume::RenderTextureViewDimension::TEXTURE_2D;
        break;
      case kNullTexture3DSlot:
        desc.dimension = plume::RenderTextureDimension::TEXTURE_3D;
        view_desc.dimension = plume::RenderTextureViewDimension::TEXTURE_3D;
        break;
      default:
        desc.dimension = plume::RenderTextureDimension::TEXTURE_2D;
        desc.arraySize = 6;
        desc.flags = plume::RenderTextureFlag::CUBE;
        view_desc.dimension = plume::RenderTextureViewDimension::TEXTURE_CUBE;
        break;
    }

    h.null_textures[i] = CreateTexture(desc, "null-texture");
    if (!h.null_textures[i])
      return false;
    h.null_views[i] = h.null_textures[i]->createTextureView(view_desc);
    if (!h.null_views[i])
      return false;
    h.texture_set->setTexture(i, h.null_textures[i].get(), plume::RenderTextureLayout::SHADER_READ,
                              h.null_views[i].get());
    h.texture_slot_used[i] = true;
  }
  return true;
}

bool BuildPipelineLayoutLocked(HostState& h) {
  plume::RenderDescriptorSetBuilder texture_builder;
  texture_builder.begin();
  texture_builder.addTexture(0, kTextureDescriptorCount);
  texture_builder.end(true, kTextureDescriptorCount);
  h.texture_set = texture_builder.create(h.device.get());

  plume::RenderDescriptorSetBuilder sampler_builder;
  sampler_builder.begin();
  sampler_builder.addSampler(0, kSamplerDescriptorCount);
  sampler_builder.end(true, kSamplerDescriptorCount);
  h.sampler_set = sampler_builder.create(h.device.get());

  if (!h.texture_set || !h.sampler_set) {
    GPU_ERROR("Failed to create the bindless descriptor sets");
    return false;
  }
  h.texture_slot_used.assign(kTextureDescriptorCount, false);
  h.sampler_slot_used.assign(kSamplerDescriptorCount, false);

  plume::RenderPipelineLayoutBuilder layout_builder;
  layout_builder.begin(false, true);
  // Texture2D[] space0, Texture3D[] space1, TextureCube[] space2 all index the
  // same physical set; samplers are space3.
  layout_builder.addDescriptorSet(texture_builder);
  layout_builder.addDescriptorSet(texture_builder);
  layout_builder.addDescriptorSet(texture_builder);
  layout_builder.addDescriptorSet(sampler_builder);
  const plume::RenderShaderStageFlags stages =
      plume::RenderShaderStageFlag::VERTEX | plume::RenderShaderStageFlag::PIXEL;
  if (h.vulkan) {
    // One range for both stages: the guest shaders read their three constant
    // buffer device addresses from [0, 24), the renderer's own from [24, 56).
    layout_builder.addPushConstant(0, 4, kGuestPushConstantsSize + kHostPushConstantsSize, stages);
  } else {
    layout_builder.addPushConstant(3, 4, kHostPushConstantsSize, stages);
    layout_builder.addRootDescriptor(0, 4, plume::RenderRootDescriptorType::CONSTANT_BUFFER);
    layout_builder.addRootDescriptor(1, 4, plume::RenderRootDescriptorType::CONSTANT_BUFFER);
    layout_builder.addRootDescriptor(2, 4, plume::RenderRootDescriptorType::CONSTANT_BUFFER);
  }
  layout_builder.end();
  h.pipeline_layout = layout_builder.create(h.device.get());
  if (!h.pipeline_layout) {
    GPU_ERROR("Failed to create the shared pipeline layout");
    return false;
  }

  if (!BuildNullTexturesLocked(h))
    return false;

  plume::RenderSamplerDesc linear;
  linear.minFilter = plume::RenderFilter::LINEAR;
  linear.magFilter = plume::RenderFilter::LINEAR;
  linear.mipmapMode = plume::RenderMipmapMode::LINEAR;
  linear.addressU = plume::RenderTextureAddressMode::CLAMP;
  linear.addressV = plume::RenderTextureAddressMode::CLAMP;
  linear.addressW = plume::RenderTextureAddressMode::CLAMP;
  h.linear_clamp_sampler = h.device->createSampler(linear);

  plume::RenderSamplerDesc point = linear;
  point.minFilter = plume::RenderFilter::NEAREST;
  point.magFilter = plume::RenderFilter::NEAREST;
  point.mipmapMode = plume::RenderMipmapMode::NEAREST;
  h.point_clamp_sampler = h.device->createSampler(point);

  if (!h.linear_clamp_sampler || !h.point_clamp_sampler)
    return false;
  h.sampler_set->setSampler(kLinearClampSamplerSlot, h.linear_clamp_sampler.get());
  h.sampler_set->setSampler(kPointClampSamplerSlot, h.point_clamp_sampler.get());
  h.sampler_slot_used[kLinearClampSamplerSlot] = true;
  h.sampler_slot_used[kPointClampSamplerSlot] = true;
  return true;
}

void DrainRetiredLocked(HostState& h, FrameSlot& slot) {
  RetiredObjects& retired = slot.retired;
  for (const auto& [texture_slot, null_slot] : retired.texture_slots) {
    h.texture_set->setTexture(texture_slot, h.null_textures[null_slot].get(),
                              plume::RenderTextureLayout::SHADER_READ,
                              h.null_views[null_slot].get());
    h.texture_slot_used[texture_slot] = false;
  }
  retired.texture_slots.clear();
  retired.framebuffers.clear();
  retired.views.clear();
  retired.textures.clear();
  retired.buffers.clear();
}

//------------------------------------------------------------------------------
// Submit thread
//------------------------------------------------------------------------------

// The title's render thread only records (DeferredCommandList); replaying the
// recordings onto the D3D12/Vulkan command lists, submitting them, acquiring
// the swap chain image and presenting all happen here. The render thread
// saturated in the busiest scenes, and the backend calls and the driver under
// them were a quarter of the renderer's share of it.

void QueueSlotLocked(HostState& h, u32 index, bool present) {
  FrameSlot& slot = h.frames[index];
  slot.present = present;
  occlusion::QueueSlotLocked(index);
  {
    std::lock_guard lock(h.submit_mutex);
    slot.queued = true;
    h.submit_queue.push_back(index);
  }
  h.submit_wake.notify_one();
}

// Returns once the submit thread has submitted the slot and the GPU has run
// it. Only the render thread waits on slot fences.
void WaitForSlotLocked(HostState& h, FrameSlot& slot) {
  bool submitted;
  {
    std::unique_lock lock(h.submit_mutex);
    h.submit_done.wait(lock, [&] { return !slot.queued; });
    submitted = slot.submitted;
    slot.submitted = false;
  }
  if (submitted)
    h.queue->waitForCommandFence(slot.fence.get());
}

// Waits for everything submitted so far, through the submit thread's own
// fence: the slot fences belong to the render thread's waits.
void WaitForIdleOnSubmitThread(HostState& h) {
  h.idle_list->begin();
  h.idle_list->end();
  const plume::RenderCommandList* lists[] = {h.idle_list.get()};
  h.queue->executeCommandLists(lists, 1, nullptr, 0, nullptr, 0, h.idle_fence.get());
  h.queue->waitForCommandFence(h.idle_fence.get());
}

bool ResizeSwapChainOnSubmitThread(HostState& h) {
  if (!h.swap_chain)
    return false;
  // Every back buffer reference must be gone before resize() releases them.
  WaitForIdleOnSubmitThread(h);
  h.swap_framebuffers.clear();
  h.render_semaphores.clear();
  if (!h.swap_chain->resize()) {
    if (h.swap_chain->getWidth() && h.swap_chain->getHeight())
      GPU_ERROR("Swap chain resize failed");
    return false;
  }
  if (h.swap_chain->isEmpty() || !BuildSwapFramebuffersLocked(h))
    return false;
  h.swap_width.store(h.swap_chain->getWidth(), std::memory_order_release);
  h.swap_height.store(h.swap_chain->getHeight(), std::memory_order_release);
  return true;
}

bool AcquireBackBufferOnSubmitThread(HostState& h, FrameSlot& slot, u32& index) {
  const bool resize = h.resize_requested.exchange(false, std::memory_order_acq_rel);
  if (resize || h.swap_chain->needsResize() || h.swap_framebuffers.empty())
    ResizeSwapChainOnSubmitThread(h);
  if (h.swap_framebuffers.empty())
    return false;
  if (!h.swap_chain->acquireTexture(slot.acquire_semaphore.get(), &index)) {
    if (!ResizeSwapChainOnSubmitThread(h) ||
        !h.swap_chain->acquireTexture(slot.acquire_semaphore.get(), &index)) {
      return false;
    }
  }
  return index < h.swap_framebuffers.size();
}

void AddTiming(std::atomic<u64>& total, std::atomic<u64>& max, u64 ns) {
  total.fetch_add(ns, std::memory_order_relaxed);
  u64 seen = max.load(std::memory_order_relaxed);
  while (ns > seen && !max.compare_exchange_weak(seen, ns, std::memory_order_relaxed)) {
  }
}

void SubmitSlotOnSubmitThread(HostState& h, FrameSlot& slot) {
  using Clock = std::chrono::steady_clock;
  const auto start = Clock::now();
  plume::RenderCommandList* list = slot.list.get();
  list->begin();
  slot.recording.Replay(list, nullptr, nullptr);

  u32 back_index = 0;
  const bool have_back = slot.present && AcquireBackBufferOnSubmitThread(h, slot, back_index);
  if (have_back) {
    slot.present_recording.Replay(list, h.swap_framebuffers[back_index].get(),
                                  h.swap_chain->getTexture(back_index));
  }
  list->end();

  const plume::RenderCommandList* lists[] = {list};
  plume::RenderCommandSemaphore* waits[] = {slot.acquire_semaphore.get()};
  plume::RenderCommandSemaphore* signals[] = {
      have_back ? h.render_semaphores[back_index].get() : nullptr};
  h.queue->executeCommandLists(lists, 1, have_back ? waits : nullptr, have_back ? 1 : 0,
                               have_back ? signals : nullptr, have_back ? 1 : 0, slot.fence.get());
  const auto submitted = Clock::now();
  AddTiming(h.submit_ns, h.submit_max_ns,
            u64(std::chrono::duration_cast<std::chrono::nanoseconds>(submitted - start).count()));

  if (have_back) {
    h.swap_chain->setVsyncEnabled(settings::Vsync());
    if (!h.swap_chain->present(back_index, signals, 1))
      h.resize_requested.store(true, std::memory_order_release);
    AddTiming(h.present_ns, h.present_max_ns,
              u64(std::chrono::duration_cast<std::chrono::nanoseconds>(Clock::now() - submitted)
                      .count()));
  }
  h.submit_count.fetch_add(1, std::memory_order_relaxed);
}

void SubmitThreadMain() {
#if defined(_WIN32)
  // Presents and the frame's GPU work wait on this thread; keep it ahead of the
  // pipeline warm-up workers.
  SetThreadPriority(GetCurrentThread(), THREAD_PRIORITY_ABOVE_NORMAL);
#endif
  auto& h = Host();
  for (;;) {
    u32 index;
    {
      std::unique_lock lock(h.submit_mutex);
      h.submit_wake.wait(lock, [&] { return h.submit_stop || !h.submit_queue.empty(); });
      if (h.submit_queue.empty())
        return;
      index = h.submit_queue.front();
      h.submit_queue.pop_front();
    }
    FrameSlot& slot = h.frames[index];
    SubmitSlotOnSubmitThread(h, slot);
    occlusion::SlotSubmitted(index);
    {
      std::lock_guard lock(h.submit_mutex);
      slot.queued = false;
      slot.submitted = true;
    }
    h.submit_done.notify_all();
  }
}

void StopSubmitThread(HostState& h) {
  {
    std::lock_guard lock(h.submit_mutex);
    h.submit_stop = true;
  }
  h.submit_wake.notify_all();
  if (h.submit_thread.joinable())
    h.submit_thread.join();
}

}  // namespace

HostState& Host() {
  static HostState state;
  return state;
}

bool IsHostReady() {
  return Host().ready;
}

bool CreateHostDevice(rex::ui::Window* window) {
  auto& h = Host();
  std::lock_guard lock(h.mutex);
  if (h.ready)
    return true;
  if (h.device) {
    // A previous attempt got part of the way. Nothing to retry against.
    return false;
  }
  if (!window) {
    GPU_ERROR("CreateHostDevice called without a window");
    return false;
  }
  h.window = window;
  h.vulkan = settings::UseVulkan();

  h.render_interface = backend::CreateInterface(h.vulkan);
#if defined(_WIN32)
  if (!h.render_interface && !h.vulkan) {
    GPU_WARN("D3D12 is unavailable, falling back to Vulkan");
    h.vulkan = true;
    h.render_interface = backend::CreateInterface(true);
  }
#endif
  if (!h.render_interface) {
    GPU_ERROR("No plume render interface could be created");
    return false;
  }
  h.shader_format = h.render_interface->getCapabilities().shaderFormat;

  h.device = h.render_interface->createDevice();
  if (!h.device) {
    GPU_ERROR("plume createDevice failed");
    return false;
  }
  h.backend_name = backend::Describe(h.device.get(), h.vulkan);
  GPU_INFO("Renderer backend: {}", h.backend_name);

  h.queue = h.device->createCommandQueue(plume::RenderCommandListType::DIRECT);
  if (!h.queue) {
    GPU_ERROR("plume createCommandQueue failed");
    return false;
  }
  for (auto& slot : h.frames) {
    slot.list = h.queue->createCommandList();
    slot.fence = h.device->createCommandFence();
    slot.acquire_semaphore = h.device->createCommandSemaphore();
    if (!slot.list || !slot.fence || !slot.acquire_semaphore) {
      GPU_ERROR("Failed to create the command list ring");
      return false;
    }
  }
  h.idle_list = h.queue->createCommandList();
  h.idle_fence = h.device->createCommandFence();
  if (!h.idle_list || !h.idle_fence) {
    GPU_ERROR("Failed to create the submit thread's idle fence");
    return false;
  }

  plume::RenderWindow render_window{};
  if (!GetRenderWindow(window, render_window)) {
    GPU_ERROR("The app window has no native handle yet");
    return false;
  }
  plume::RenderSwapChainDesc swap_desc(render_window, plume::RenderFormat::B8G8R8A8_UNORM,
                                       kFrameCount + 1, false, kFrameCount);
  h.swap_chain = h.queue->createSwapChain(swap_desc);
  if (h.swap_chain && h.vulkan) {
    // plume's Vulkan swap chain creates its images on the first resize.
    h.swap_chain->resize();
  }
  if (!h.swap_chain || h.swap_chain->isEmpty()) {
    GPU_ERROR("plume createSwapChain failed");
    return false;
  }
  if (!BuildSwapFramebuffersLocked(h)) {
    GPU_ERROR("Failed to create the swap chain framebuffers");
    return false;
  }

  if (!BuildPipelineLayoutLocked(h))
    return false;

  h.zero_vertex_buffer = CreateBuffer(
      plume::RenderBufferDesc::VertexBuffer(256, plume::RenderHeapType::UPLOAD), "zero-vertices");
  if (!h.zero_vertex_buffer)
    return false;
  if (void* mapped = h.zero_vertex_buffer->map()) {
    std::memset(mapped, 0, 256);
    h.zero_vertex_buffer->unmap();
  }

  if (!InitHostPipelinesLocked())
    return false;
  occlusion::InitLocked();

  h.swap_width.store(h.swap_chain->getWidth(), std::memory_order_release);
  h.swap_height.store(h.swap_chain->getHeight(), std::memory_order_release);
  h.submit_thread = std::thread(SubmitThreadMain);
  h.ready = true;
  return true;
}

void ShutdownHost() {
  auto& h = Host();
  h.shutting_down.store(true, std::memory_order_release);
  // Queued packets are dropped. The GPU thread may be parked in Present's
  // overlay marshal, waiting on the UI thread that is running this, so it is
  // not waited for long.
  gpu_thread::Stop(250);

  // The GPU thread may still hold the lock for the same reason. Don't hang on
  // it.
  std::unique_lock lock(h.mutex, std::defer_lock);
  const auto deadline = std::chrono::steady_clock::now() + std::chrono::milliseconds(250);
  while (!lock.try_lock()) {
    if (std::chrono::steady_clock::now() >= deadline) {
      GPU_WARN("Renderer busy at shutdown, skipping the GPU drain");
      // The process is on its way out; a joinable thread would abort it.
      if (h.submit_thread.joinable())
        h.submit_thread.detach();
      return;
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(2));
  }
  if (!h.device)
    return;
  FlushAndWaitLocked();
  StopSubmitThread(h);
  h.ready = false;
  h.swap_framebuffers.clear();
  h.render_semaphores.clear();
  h.swap_chain.reset();
}

plume::RenderCommandList* OpenCommandListLocked() {
  auto& h = Host();
  if (!h.ready || h.shutting_down.load(std::memory_order_relaxed))
    return nullptr;
  FrameSlot& slot = h.frames[h.frame];
  if (h.list_open)
    return &slot.recording;

  slot.recording.begin();
  slot.present_recording.begin();
  slot.present = false;
  if (!h.null_textures_transitioned) {
    plume::RenderTextureBarrier barriers[kReservedTextureSlots];
    for (u32 i = 0; i < kReservedTextureSlots; ++i) {
      barriers[i] =
          plume::RenderTextureBarrier(h.null_textures[i].get(), plume::RenderTextureLayout::SHADER_READ);
    }
    slot.recording.barriers(plume::RenderBarrierStage::GRAPHICS, barriers, kReservedTextureSlots);
    h.null_textures_transitioned = true;
  }
  BindSharedLayoutLocked(&slot.recording);
  h.list_open = true;
  ++h.list_generation;
  return &slot.recording;
}

plume::RenderCommandList* OpenPresentListLocked() {
  auto& h = Host();
  if (!h.list_open)
    return nullptr;
  FrameSlot& slot = h.frames[h.frame];
  // Replay continues on the same command list, so the recording's bindings
  // carry over; bind the shared layout anyway, the present pass starts fresh.
  slot.present_recording.begin();
  BindSharedLayoutLocked(&slot.present_recording);
  return &slot.present_recording;
}

void BindSharedLayoutLocked(plume::RenderCommandList* list) {
  auto& h = Host();
  list->setGraphicsPipelineLayout(h.pipeline_layout.get());
  list->setGraphicsDescriptorSet(h.texture_set.get(), 0);
  list->setGraphicsDescriptorSet(h.texture_set.get(), 1);
  list->setGraphicsDescriptorSet(h.texture_set.get(), 2);
  list->setGraphicsDescriptorSet(h.sampler_set.get(), 3);
}

void SubmitFrameLocked(bool present) {
  auto& h = Host();
  if (h.list_open) {
    QueueSlotLocked(h, h.frame, present);
    h.list_open = false;
  }

  // The slot about to be reused may still be replaying or executing. Once the
  // submit thread is done with it and its fence signals, everything retired
  // while it recorded is unreferenced and its upload memory is free.
  h.frame = (h.frame + 1) % kFrameCount;
  FrameSlot& next = h.frames[h.frame];
  {
    cost::ScopedCost timed(cost::Costs().ring_waits);
    WaitForSlotLocked(h, next);
  }
  occlusion::SlotReusedLocked(h.frame);
  DrainRetiredLocked(h, next);
  ResetUploadSlotLocked(h.frame);
}

void FlushAndWaitLocked() {
  auto& h = Host();
  if (h.list_open) {
    QueueSlotLocked(h, h.frame, false);
    h.list_open = false;
  }
  for (u32 i = 0; i < kFrameCount; ++i) {
    WaitForSlotLocked(h, h.frames[i]);
    occlusion::SlotReusedLocked(i);
  }
}

u32 CurrentFrameSlot() {
  return Host().frame;
}

void RetireLocked(std::unique_ptr<plume::RenderTexture> texture) {
  if (texture)
    Host().frames[Host().frame].retired.textures.push_back(std::move(texture));
}

void RetireLocked(std::unique_ptr<plume::RenderTextureView> view) {
  if (view)
    Host().frames[Host().frame].retired.views.push_back(std::move(view));
}

void RetireLocked(std::unique_ptr<plume::RenderBuffer> buffer) {
  if (buffer)
    Host().frames[Host().frame].retired.buffers.push_back(std::move(buffer));
}

void RetireLocked(std::unique_ptr<plume::RenderFramebuffer> framebuffer) {
  if (framebuffer)
    Host().frames[Host().frame].retired.framebuffers.push_back(std::move(framebuffer));
}

u32 AllocateTextureSlotLocked() {
  auto& h = Host();
  for (u32 i = h.next_texture_slot_hint; i < kTextureDescriptorCount; ++i) {
    if (!h.texture_slot_used[i]) {
      h.texture_slot_used[i] = true;
      h.next_texture_slot_hint = i + 1;
      return i;
    }
  }
  for (u32 i = kReservedTextureSlots; i < h.next_texture_slot_hint && i < kTextureDescriptorCount;
       ++i) {
    if (!h.texture_slot_used[i]) {
      h.texture_slot_used[i] = true;
      h.next_texture_slot_hint = i + 1;
      return i;
    }
  }
  GPU_WARN_LIMITED(4, "Bindless texture heap is full ({} slots)", kTextureDescriptorCount);
  return kInvalidSlot;
}

void SetTextureSlotLocked(u32 slot, plume::RenderTexture* texture, plume::RenderTextureView* view) {
  if (slot == kInvalidSlot)
    return;
  Host().texture_set->setTexture(slot, texture, plume::RenderTextureLayout::SHADER_READ, view);
}

void RetireTextureSlotLocked(u32 slot, plume::RenderTextureViewDimension dimension) {
  if (slot == kInvalidSlot || slot < kReservedTextureSlots)
    return;
  u32 null_slot = kNullTexture2DSlot;
  if (dimension == plume::RenderTextureViewDimension::TEXTURE_3D)
    null_slot = kNullTexture3DSlot;
  else if (dimension == plume::RenderTextureViewDimension::TEXTURE_CUBE)
    null_slot = kNullTextureCubeSlot;
  Host().frames[Host().frame].retired.texture_slots.emplace_back(slot, null_slot);
}

u32 AllocateSamplerSlotLocked() {
  auto& h = Host();
  for (u32 i = 0; i < kSamplerDescriptorCount; ++i) {
    if (!h.sampler_slot_used[i]) {
      h.sampler_slot_used[i] = true;
      return i;
    }
  }
  return kInvalidSlot;
}

std::unique_ptr<plume::RenderBuffer> CreateBuffer(const plume::RenderBufferDesc& desc,
                                                  const char* tag) {
  auto& h = Host();
  if (!h.device)
    return nullptr;
  auto buffer = h.device->createBuffer(desc);
  if (backend::IsNull(buffer.get(), h.vulkan)) {
    GPU_ERROR("Buffer creation failed ({}, {} bytes)", tag, desc.size);
    return nullptr;
  }
  return buffer;
}

std::unique_ptr<plume::RenderTexture> CreateTexture(const plume::RenderTextureDesc& desc,
                                                    const char* tag) {
  auto& h = Host();
  if (!h.device)
    return nullptr;
  auto texture = h.device->createTexture(desc);
  if (backend::IsNull(texture.get(), h.vulkan)) {
    GPU_ERROR("Texture creation failed ({}, {}x{}x{} format {})", tag, desc.width, desc.height,
              desc.depth, static_cast<u32>(desc.format));
    return nullptr;
  }
  return texture;
}

std::unique_ptr<plume::RenderPipeline> CreateGraphicsPipeline(
    const plume::RenderGraphicsPipelineDesc& desc, const char* tag) {
  auto& h = Host();
  if (!h.device)
    return nullptr;
  auto pipeline = h.device->createGraphicsPipeline(desc);
  if (backend::IsNull(pipeline.get(), h.vulkan)) {
    GPU_ERROR("Graphics pipeline creation failed ({})", tag);
    return nullptr;
  }
  return pipeline;
}

void RequestResize() {
  Host().resize_requested.store(true, std::memory_order_release);
}

}  // namespace redahm::gpu

#include "draw/draw.h"

#include <algorithm>
#include <array>
#include <bit>
#include <cmath>
#include <cstring>
#include <format>
#include <mutex>
#include <string>
#include <unordered_map>
#include <vector>

#include <plume_render_interface.h>
#include <rex/graphics/registers.h>
#include <rex/graphics/xenos.h>
#include <rex/memory/utils.h>

#include "core/frame_cost.h"
#include "core/guest_memory.h"
#include "core/log.h"
#include "core/settings.h"
#include "d3d/d3d_device.h"
#include "d3d/d3d_formats.h"
#include "pipeline/pipeline_cache.h"
#include "render/gpu_thread.h"
#include "render/host.h"
#include "render/host_pipelines.h"
#include "render/occlusion.h"
#include "render/upload_heap.h"
#include "resources/resources.h"
#include "resources/sampler_cache.h"
#include "shaders/guest_shaders.h"
#include "shaders/vertex_declaration.h"

namespace redahm::gpu {

namespace {

namespace xe = rex::graphics::xenos;
namespace reg = rex::graphics::reg;
namespace dv = d3d::dev;

constexpr u32 kShaderConstantsSize = 256 * 16;
constexpr u32 kShaderConstantRegisters = 256;
constexpr u32 kSharedConstantsSize = 512;
constexpr u32 kMaxExpandedQuads = 16384;

//------------------------------------------------------------------------------
// Tracked state
//------------------------------------------------------------------------------

struct StreamBinding {
  u32 buffer_va = 0;
  u32 offset = 0;
  u32 stride = 0;
};

// Viewport and scissor are kept in guest pixels, as the title set them, and
// scaled to the bound targets when they reach the command list.
struct DrawState {
  u32 render_targets[d3d::kMaxRenderTargets] = {};
  u32 depth_stencil = 0;
  plume::RenderViewport viewport{0.0f, 0.0f, 1280.0f, 720.0f, 0.0f, 1.0f};
  plume::RenderRect scissor{0, 0, 1280, 720};
  u32 textures[d3d::kMaxSamplers] = {};
  GuestShader* vertex_shader = nullptr;
  GuestShader* pixel_shader = nullptr;
  u32 declaration_va = 0;
  StreamBinding streams[d3d::kMaxStreams] = {};
  u32 indices = 0;
};

// The device state a draw reads, as the title's D3DRS setters stored it.
struct DeviceSnapshot {
  u32 blend[4] = {};
  u32 color_write[4] = {};
  u32 depth_control = 0;
  u32 stencil_ref = 0;
  u32 raster = 0;
  u32 alpha_test = 0;
  u32 alpha_ref = 0;  // float bits, as are the two biases
  u32 depth_bias = 0;
  u32 slope_scale_depth_bias = 0;
  u32 scissor_enable = 0;
  u32 viewport_enable = 0;
  u32 vertex_control = 0;
  u32 vs_bools = 0;
  u32 ps_bools = 0;
};

// One sampler a draw's shaders declare: the bound texture's fetch constant
// words and the device's sampler state words.
struct SamplerCapture {
  u32 texture[6] = {};
  u32 sampler[6] = {};
};

//------------------------------------------------------------------------------
// Recording side: the thread driving the device
//------------------------------------------------------------------------------

// What the Set* hooks bound.
DrawState g_record;

// Float constants the GPU thread's copy of the device holds as current: every
// register below `captured` since `dirty` was last cleared. The setters and
// the device's pending masks set `dirty`; a draw then captures the registers
// its shader reads, and a draw whose shader reads more than was captured
// captures the rest.
struct ConstantRecord {
  bool dirty = true;
  u32 captured = 0;
};
ConstantRecord g_vs_record;
ConstantRecord g_ps_record;

// Adds up on the recording thread and reaches the shared totals every
// kRecordFlush packets, not with two atomic adds per draw.
constexpr u32 kRecordFlush = 256;
thread_local u64 t_record_ns = 0;
thread_local u32 t_records = 0;

class RecordTimer {
 public:
  RecordTimer() : start_(cost::Clock::now()) {}
  ~RecordTimer() {
    t_record_ns += u64(
        std::chrono::duration_cast<std::chrono::nanoseconds>(cost::Clock::now() - start_).count());
    if (++t_records < kRecordFlush)
      return;
    auto& costs = cost::Recording();
    costs.record_ns.fetch_add(t_record_ns, std::memory_order_relaxed);
    costs.records.fetch_add(t_records, std::memory_order_relaxed);
    t_record_ns = 0;
    t_records = 0;
  }

 private:
  cost::Clock::time_point start_;
};

void WaitForGpuThread(u64 packet) {
  const auto start = cost::Clock::now();
  if (packet)
    gpu_thread::WaitFor(packet);
  else
    gpu_thread::Drain();
  cost::Recording().wait_ns.fetch_add(
      u64(std::chrono::duration_cast<std::chrono::nanoseconds>(cost::Clock::now() - start).count()),
      std::memory_order_relaxed);
}

constexpr u32 PacketAlign(u64 value) {
  return u32((value + 15) & ~u64(15));
}

// Lays out a packet payload: each piece starts 16-byte aligned.
class PacketWriter {
 public:
  explicit PacketWriter(u8* data) : data_(data) {}
  template <typename T>
  void Put(const T& value) {
    std::memcpy(data_ + used_, &value, sizeof(T));
    used_ = PacketAlign(used_ + sizeof(T));
  }
  void PutBytes(const void* bytes, u32 size) {
    if (size)
      std::memcpy(data_ + used_, bytes, size);
    used_ = PacketAlign(used_ + size);
  }
  u32 used() const { return used_; }

 private:
  u8* data_;
  u32 used_ = 0;
};

class PacketReader {
 public:
  explicit PacketReader(const u8* data) : data_(data) {}
  template <typename T>
  T Get() {
    T value;
    std::memcpy(&value, data_ + offset_, sizeof(T));
    offset_ = PacketAlign(offset_ + sizeof(T));
    return value;
  }
  const u8* Bytes(u32 size) {
    const u8* bytes = data_ + offset_;
    offset_ = PacketAlign(offset_ + size);
    return size ? bytes : nullptr;
  }

 private:
  const u8* data_;
  u32 offset_ = 0;
};

// A big-endian word of the device, translated once per call: every
// mem::Load goes through the kernel state and a heap lookup, and a draw reads
// a hundred of them.
u32 DeviceWord(const u8* device, u32 offset) {
  u32 value;
  std::memcpy(&value, device + offset, 4);
  return std::byteswap(value);
}

void CaptureDevice(const u8* device, DeviceSnapshot& out) {
  static constexpr u32 kBlendOffsets[] = {dv::kBlendState0, dv::kBlendState1, dv::kBlendState2,
                                          dv::kBlendState3};
  for (u32 i = 0; i < 4; ++i) {
    out.blend[i] = DeviceWord(device, kBlendOffsets[i]);
    out.color_write[i] = DeviceWord(device, dv::kColorWriteEnable + i * 4);
  }
  out.depth_control = DeviceWord(device, dv::kDepthStencilState);
  out.stencil_ref = DeviceWord(device, dv::kStencilRef);
  out.raster = DeviceWord(device, dv::kRasterState);
  out.alpha_test = DeviceWord(device, dv::kAlphaTestState);
  out.alpha_ref = DeviceWord(device, dv::kAlphaRef);
  out.depth_bias = DeviceWord(device, dv::kDepthBias);
  out.slope_scale_depth_bias = DeviceWord(device, dv::kSlopeScaleDepthBias);
  out.scissor_enable = DeviceWord(device, dv::kScissorTestEnable);
  out.viewport_enable = DeviceWord(device, dv::kViewportEnable);
  out.vertex_control = DeviceWord(device, dv::kVertexControl);
  out.vs_bools = DeviceWord(device, dv::kVsBoolConstants);
  out.ps_bools = DeviceWord(device, dv::kPsBoolConstants);
}

// FindVertexDeclaration takes the registry's lock; the answer holds until a
// declaration is registered again.
HostVertexDeclaration* RecordedDeclaration(u32 declaration_va) {
  static u32 cached_va = 0;
  static u64 cached_registrations = ~u64{0};
  static HostVertexDeclaration* cached = nullptr;
  const u64 registrations = VertexDeclarationRegistrations();
  if (declaration_va != cached_va || registrations != cached_registrations) {
    cached = FindVertexDeclaration(declaration_va);
    cached_va = declaration_va;
    cached_registrations = registrations;
  }
  return cached;
}

// The float4 registers a draw with `shader` has to carry.
void TakeConstantRange(ConstantRecord& record, const GuestShader* shader, u16& first, u16& count) {
  const u32 needed = shader ? std::min(shader->float4_register_count, kShaderConstantRegisters) : 0;
  if (record.dirty) {
    record.dirty = false;
    record.captured = 0;
  }
  first = u16(record.captured);
  count = u16(needed > record.captured ? needed - record.captured : 0);
  record.captured = std::max(record.captured, needed);
}

//------------------------------------------------------------------------------
// Packets
//------------------------------------------------------------------------------

struct DrawInput {
  u32 primitive = 0;
  bool indexed = false;
  u32 start_vertex = 0;
  u32 vertex_count = 0;
  i32 base_vertex = 0;
  u32 start_index = 0;
  u32 index_count = 0;
  // User pointer draws: stream 0 and the indices travel in the packet.
  u32 up_stride = 0;
  u32 up_vertex_bytes = 0;
  u32 up_index_bytes = 0;
  bool up_indices_32bit = false;
  u64 box_key = 0;
};

// A draw, followed by: a SamplerCapture per bit of sampler_mask; the vertex
// and pixel float constants captured (big-endian, as the device holds them);
// buffer_count BufferCaptures, each followed by its buffer's guest bytes when
// it carries them; the user pointer vertices and indices.
struct DrawPacket {
  DrawState state;
  DeviceSnapshot device;
  HostVertexDeclaration* declaration = nullptr;
  DrawInput input;
  u16 sampler_mask = 0;
  u16 vs_first = 0;
  u16 vs_count = 0;
  u16 ps_first = 0;
  u16 ps_count = 0;
  u16 buffer_count = 0;
};

constexpr u8 kIndexStream = 0xFF;

struct BufferCapture {
  u32 buffer_va = 0;
  BufferHeader header;
  u8 stream = 0;  // kIndexStream for the index buffer
  bool contents = false;
};

// A clear, followed by rect_count plume::RenderRects in guest pixels.
struct ClearPacket {
  DrawState state;
  u32 scissor_enable = 0;
  u32 rect_count = 0;
  u32 target_mask = 0;
  bool whole_viewport = false;
  bool clear_depth = false;
  bool clear_stencil = false;
  plume::RenderColor color;
  float z = 0.0f;
  u32 stencil = 0;
};

struct ResolvePacket {
  DrawState state;
  ResolveArgs args;
  bool has_source_rect = false;
  i32 source_rect[4] = {};  // left, top, right, bottom
  i32 dest_point[2] = {};
  plume::RenderColor clear_color;
  u32 dest_words[6] = {};
};

struct MoviePacket {
  u32 render_target = 0;
  MovieFrame frame;
  u32 plane_words[4][6] = {};
};

//------------------------------------------------------------------------------
// GPU thread state: the packet being run and what the command list has bound
//------------------------------------------------------------------------------

DrawState g_state;
DeviceSnapshot g_device;
u32 g_texture_words[d3d::kMaxSamplers][6] = {};
u32 g_sampler_words[d3d::kMaxSamplers][6] = {};
// The device's float constants as captured so far, big-endian.
alignas(16) u8 g_vs_constants[kShaderConstantsSize] = {};
alignas(16) u8 g_ps_constants[kShaderConstantsSize] = {};
// The bound constant buffers are stale.
bool g_vs_dirty = true;
bool g_ps_dirty = true;
// The draw's buffers, from the headers its packet captured.
HostBuffer* g_streams[d3d::kMaxStreams] = {};
HostBuffer* g_index_buffer = nullptr;

float ConstantFloat(const u8* constants, u32 reg, u32 component) {
  u32 bits;
  std::memcpy(&bits, constants + reg * 16 + component * 4, 4);
  return std::bit_cast<float>(std::byteswap(bits));
}

// What the open command list has bound.
struct BoundState {
  u64 generation = ~u64{0};
  plume::RenderPipeline* pipeline = nullptr;
  plume::RenderFramebuffer* framebuffer = nullptr;
  UploadAllocation vs_constants;
  UploadAllocation ps_constants;
  // Float4 registers written into the bound constant buffers.
  u32 vs_registers = 0;
  u32 ps_registers = 0;
  u8 shared_constants[kSharedConstantsSize] = {};
  bool shared_valid = false;
  // Command list state the draw path set last; a draw that would set the same
  // again skips the call. Resolves, the movie quad and present set their own
  // and then reset all of this (InvalidateDrawBindingsLocked).
  bool viewport_valid = false;
  plume::RenderViewport viewport;
  plume::RenderRect scissor;
  bool vertex_buffers_valid = false;
  std::array<plume::RenderVertexBufferView, d3d::kMaxStreams> vertex_views{};
  std::array<plume::RenderInputSlot, d3d::kMaxStreams> vertex_slots{};
  bool index_buffer_valid = false;
  plume::RenderIndexBufferView index_view;
};
BoundState g_bound;

bool SameBuffer(const plume::RenderBufferReference& a, const plume::RenderBufferReference& b) {
  return a.ref == b.ref && a.offset == b.offset;
}

bool SameViewport(const plume::RenderViewport& a, const plume::RenderViewport& b) {
  return a.x == b.x && a.y == b.y && a.width == b.width && a.height == b.height &&
         a.minDepth == b.minDepth && a.maxDepth == b.maxDepth;
}

bool SameRect(const plume::RenderRect& a, const plume::RenderRect& b) {
  return a.left == b.left && a.top == b.top && a.right == b.right && a.bottom == b.bottom;
}

void BindIndexBufferLocked(plume::RenderCommandList* list, const plume::RenderIndexBufferView& view) {
  const auto& bound = g_bound.index_view;
  if (g_bound.index_buffer_valid && SameBuffer(bound.buffer, view.buffer) &&
      bound.size == view.size && bound.format == view.format) {
    return;
  }
  list->setIndexBuffer(&view);
  g_bound.index_view = view;
  g_bound.index_buffer_valid = true;
}

// Why draws did not reach the command list, logged periodically.
struct DrawStats {
  u32 calls = 0;
  u32 drawn = 0;
  u32 no_vertex_shader = 0;
  u32 uncached_shader = 0;
  u32 no_declaration = 0;
  u32 no_targets = 0;
  u32 no_streams = 0;
  u32 no_pipeline = 0;
  u32 no_indices = 0;
  u32 unsupported_primitive = 0;
  u32 instanced = 0;
  u32 resolves = 0;
  u32 failed_resolves = 0;
  u32 presents = 0;
};
DrawStats g_stats;

std::unique_ptr<plume::RenderBuffer> g_quad_indices;
std::unique_ptr<plume::RenderBuffer> g_fan_indices;

void SyncBoundLocked() {
  const u64 generation = Host().list_generation;
  if (g_bound.generation != generation) {
    g_bound = {};
    g_bound.generation = generation;
    g_vs_dirty = true;
    g_ps_dirty = true;
  }
}

// A rectangle in guest pixels onto a host target at `scale`.
plume::RenderRect ScaleRect(const plume::RenderRect& guest, float scale) {
  return plume::RenderRect(ScalePixelEdge(guest.left, scale), ScalePixelEdge(guest.top, scale),
                           ScalePixelEdge(guest.right, scale), ScalePixelEdge(guest.bottom, scale));
}

//------------------------------------------------------------------------------
// Targets
//------------------------------------------------------------------------------

// Host size of the bound targets, the guest size the title created them at,
// and the scale between the two.
struct Targets {
  HostTexture* colors[d3d::kMaxRenderTargets] = {};
  u32 color_count = 0;
  HostTexture* depth = nullptr;
  u32 width = 0;
  u32 height = 0;
  u32 guest_width = 0;
  u32 guest_height = 0;
  float scale = 1.0f;
};

bool CollectTargetsLocked(const DrawState& state, Targets& out) {
  for (u32 i = 0; i < d3d::kMaxRenderTargets; ++i) {
    HostTexture* surface = FindSurfaceLocked(state.render_targets[i]);
    if (!surface || surface->depth)
      break;
    if (out.color_count && (surface->width != out.width || surface->height != out.height))
      break;
    out.colors[out.color_count++] = surface;
    out.width = surface->width;
    out.height = surface->height;
    out.guest_width = surface->guest_width;
    out.guest_height = surface->guest_height;
    out.scale = surface->scale;
  }
  if (HostTexture* depth = FindSurfaceLocked(state.depth_stencil); depth && depth->depth) {
    if (!out.color_count) {
      out.depth = depth;
      out.width = depth->width;
      out.height = depth->height;
      out.guest_width = depth->guest_width;
      out.guest_height = depth->guest_height;
      out.scale = depth->scale;
    } else if (depth->width == out.width && depth->height == out.height) {
      out.depth = depth;
    }
  }
  return out.color_count || out.depth;
}

bool BindTargetsLocked(plume::RenderCommandList* list, const Targets& targets) {
  bool transitioned = false;
  for (u32 i = 0; i < targets.color_count; ++i) {
    if (targets.colors[i]->layout != plume::RenderTextureLayout::COLOR_WRITE) {
      TransitionTextureLocked(*targets.colors[i], list, plume::RenderTextureLayout::COLOR_WRITE);
      transitioned = true;
    }
  }
  if (targets.depth && targets.depth->layout != plume::RenderTextureLayout::DEPTH_WRITE) {
    TransitionTextureLocked(*targets.depth, list, plume::RenderTextureLayout::DEPTH_WRITE);
    transitioned = true;
  }
  plume::RenderFramebuffer* framebuffer =
      GetSurfaceFramebufferLocked(targets.colors, targets.color_count, targets.depth);
  if (!framebuffer)
    return false;
  if (transitioned || g_bound.framebuffer != framebuffer) {
    list->setFramebuffer(framebuffer);
    g_bound.framebuffer = framebuffer;
  }
  return true;
}

// Grows the bound surfaces to cover a tiled area, in guest pixels.
// SetRenderTarget reset the viewport and scissor to the tile-sized surface
// before BeginTiling; a reset left untouched is widened with it. `state` is the
// recording side's, which BeginTiling hands in after the GPU thread has caught
// up.
void GrowBoundSurfacesLocked(DrawState& state, u32 width, u32 height) {
  HostTexture* first = FindSurfaceLocked(state.render_targets[0]);
  if (!first)
    first = FindSurfaceLocked(state.depth_stencil);
  if (!first)
    return;
  const float old_width = float(first->guest_width);
  const float old_height = float(first->guest_height);

  bool grown = false;
  for (u32 i = 0; i < d3d::kMaxRenderTargets; ++i) {
    if (HostTexture* surface = FindSurfaceLocked(state.render_targets[i]))
      grown |= GrowSurfaceLocked(*surface, width, height);
  }
  if (HostTexture* depth = FindSurfaceLocked(state.depth_stencil))
    grown |= GrowSurfaceLocked(*depth, width, height);
  if (!grown)
    return;
  // The framebuffers holding the old textures are retired.
  InvalidateDrawBindingsLocked();

  auto& vp = state.viewport;
  if (vp.x == 0.0f && vp.y == 0.0f && vp.width == old_width && vp.height == old_height) {
    vp.width = float(first->guest_width);
    vp.height = float(first->guest_height);
  }
  auto& sc = state.scissor;
  if (sc.left == 0 && sc.top == 0 && sc.right == i32(old_width) && sc.bottom == i32(old_height)) {
    sc.right = i32(first->guest_width);
    sc.bottom = i32(first->guest_height);
  }
}

// D3DRS_VIEWPORTENABLE. Bink's movie quad turns it off and passes render
// target pixel positions through its vertex shader.
bool ViewportTransformEnabled() {
  return (g_device.viewport_enable & dv::kViewportEnableTransformMask) != 0;
}

// The title's viewport in guest pixels. Its SetViewport (sub_82E7B450) stops
// the right and bottom edges at the bound surface, so {0, 0, 0xFFFF, 0xFFFF},
// the viewport SetRenderTarget and EndTiling restore, covers the whole target.
// Clamped here against the targets as the renderer holds them, which
// predicated tiling may have grown.
plume::RenderViewport GuestViewport(const Targets& targets) {
  plume::RenderViewport guest = g_state.viewport;
  guest.width =
      std::max(std::min(guest.x + guest.width, float(targets.guest_width)) - guest.x, 0.0f);
  guest.height =
      std::max(std::min(guest.y + guest.height, float(targets.guest_height)) - guest.y, 0.0f);
  return guest;
}

// The host viewport: the title's, scaled to the bound targets.
plume::RenderViewport EffectiveViewport(const Targets& targets) {
  // Without the viewport transform the shaders map pixels to clip space over
  // the whole target (BuildSharedConstantsLocked).
  const float scale = targets.scale;
  const plume::RenderViewport guest = GuestViewport(targets);
  plume::RenderViewport viewport =
      ViewportTransformEnabled()
          ? plume::RenderViewport{ScalePixel(guest.x, scale), ScalePixel(guest.y, scale),
                                  ScalePixel(guest.width, scale), ScalePixel(guest.height, scale),
                                  guest.minDepth, guest.maxDepth}
          : plume::RenderViewport{0.0f, 0.0f, float(targets.width), float(targets.height), 0.0f,
                                  1.0f};
  // MinZ above MaxZ inverts depth, and stays inverted: PotF's UE3 sets MinZ 1,
  // MaxZ 0, clears depth to 0 and tests GREATEREQUAL. D3D12 and Vulkan both
  // take an inverted range. Swapping it back put every nearer surface behind
  // the far ones, so only the ground and sky survived the depth test.
  viewport.minDepth = std::clamp(viewport.minDepth, 0.0f, 1.0f);
  viewport.maxDepth = std::clamp(viewport.maxDepth, 0.0f, 1.0f);
  return viewport;
}

void SetViewportAndScissorLocked(plume::RenderCommandList* list, const Targets& targets) {
  const plume::RenderViewport viewport = EffectiveViewport(targets);

  // D3DRS_SCISSORTESTENABLE clips to the scissor rect, otherwise to the
  // viewport.
  plume::RenderRect rect(i32(std::lround(viewport.x)), i32(std::lround(viewport.y)),
                         i32(std::lround(viewport.x + viewport.width)),
                         i32(std::lround(viewport.y + viewport.height)));
  if (g_device.scissor_enable != 0) {
    const plume::RenderRect scissor = ScaleRect(g_state.scissor, targets.scale);
    rect.left = std::max(rect.left, scissor.left);
    rect.top = std::max(rect.top, scissor.top);
    rect.right = std::min(rect.right, scissor.right);
    rect.bottom = std::min(rect.bottom, scissor.bottom);
  }
  rect.left = std::clamp(rect.left, 0, i32(targets.width));
  rect.right = std::clamp(rect.right, rect.left, i32(targets.width));
  rect.top = std::clamp(rect.top, 0, i32(targets.height));
  rect.bottom = std::clamp(rect.bottom, rect.top, i32(targets.height));

  if (!g_bound.viewport_valid || !SameViewport(g_bound.viewport, viewport))
    list->setViewports(&viewport, 1);
  if (!g_bound.viewport_valid || !SameRect(g_bound.scissor, rect))
    list->setScissors(&rect, 1);
  g_bound.viewport = viewport;
  g_bound.scissor = rect;
  g_bound.viewport_valid = true;
}

//------------------------------------------------------------------------------
// Frame trace
//------------------------------------------------------------------------------

// redahm_gpu_trace_frame logs a few in-game frames: each run of draws into one
// set of targets, every small draw on its own, and every clear, resolve and
// BeginTiling between them.
constexpr u32 kTraceFrameCount = 3;
// Frames with fewer draws are menus, movies and loading screens.
constexpr u32 kTraceMinDraws = 1000;
// Busy frames to wait before tracing, so the level has settled.
constexpr u32 kTraceSettleFrames = 600;
// Draws this small are full-screen passes and sprites.
constexpr u32 kTraceDetailMaxCount = 6;

struct TraceRun {
  u32 render_targets[d3d::kMaxRenderTargets] = {};
  u32 depth_stencil = 0;
  plume::RenderViewport viewport;
  u32 draws = 0;
};

struct FrameTrace {
  bool active = false;
  u32 traced = 0;
  u32 frame_draws = 0;
  u32 busy_frames = 0;
  u32 frame = 0;
  TraceRun run;
};
FrameTrace g_trace;

std::string DescribeSurfaceLocked(u32 surface_va) {
  if (!surface_va)
    return "-";
  HostTexture* surface = FindSurfaceLocked(surface_va);
  if (!surface)
    return std::format("{:08X}(unknown)", surface_va);
  return std::format("{:08X}({}x{} fmt {:08X} edram {})", surface_va, surface->guest_width,
                     surface->guest_height, surface->d3d_format, surface->edram_base);
}

std::string DescribeTextureLocked(u32 sampler) {
  const u32 texture_va = g_state.textures[sampler];
  HostTexture* texture = GetTextureLocked(texture_va, g_texture_words[sampler]);
  if (!texture)
    return std::format("{:08X}(none)", texture_va);
  return std::format("{:08X}({}x{} fmt {:08X}{})", texture_va, texture->guest_width,
                     texture->guest_height, texture->d3d_format,
                     texture->gpu_written ? " resolved" : "");
}

void FlushTraceRunLocked() {
  TraceRun& run = g_trace.run;
  if (!run.draws)
    return;
  GPU_INFO("trace {}: {} draws -> RT0 {} RT1 {} DS {} viewport {},{} {}x{}", g_trace.frame,
           run.draws, DescribeSurfaceLocked(run.render_targets[0]),
           DescribeSurfaceLocked(run.render_targets[1]), DescribeSurfaceLocked(run.depth_stencil),
           run.viewport.x, run.viewport.y, run.viewport.width, run.viewport.height);
  run.draws = 0;
}

void TraceDrawLocked(u32 used_samplers, const plume::RenderViewport& viewport, u32 primitive,
                     u32 count) {
  if (!g_trace.active)
    return;
  TraceRun& run = g_trace.run;
  if (count <= kTraceDetailMaxCount) {
    FlushTraceRunLocked();
    std::string textures;
    for (u32 s = 0; s < d3d::kMaxSamplers; ++s) {
      if (g_state.textures[s] && ((used_samplers >> s) & 1))
        textures += std::format(" s{} {}", s, DescribeTextureLocked(s));
    }
    GPU_INFO("trace {}:   draw prim {} count {} -> RT0 {} viewport {},{} {}x{} VS {:016X} PS "
             "{:016X} vp-transform {} blend {:08X}{}",
             g_trace.frame, primitive, count, DescribeSurfaceLocked(g_state.render_targets[0]),
             viewport.x, viewport.y, viewport.width, viewport.height,
             g_state.vertex_shader ? g_state.vertex_shader->hash : 0,
             g_state.pixel_shader ? g_state.pixel_shader->hash : 0, ViewportTransformEnabled(),
             g_device.blend[0], textures);
    return;
  }
  const bool same = std::equal(std::begin(run.render_targets), std::end(run.render_targets),
                               std::begin(g_state.render_targets)) &&
                    run.depth_stencil == g_state.depth_stencil && run.viewport.x == viewport.x &&
                    run.viewport.y == viewport.y && run.viewport.width == viewport.width &&
                    run.viewport.height == viewport.height;
  if (!same) {
    FlushTraceRunLocked();
    std::copy(std::begin(g_state.render_targets), std::end(g_state.render_targets),
              std::begin(run.render_targets));
    run.depth_stencil = g_state.depth_stencil;
    run.viewport = viewport;
  }
  ++run.draws;
}

//------------------------------------------------------------------------------
// Render states
//------------------------------------------------------------------------------

template <typename Register>
Register AsRegister(u32 word) {
  Register value;
  value.value = word;
  return value;
}

// The render states the title's D3DRS setters stored, into the pipeline key.
// Returns the alpha test threshold for the shared constants.
float ReadRenderStates(const Targets& targets, PipelineKey& key) {
  key.render_target_count = u8(targets.color_count);
  for (u32 i = 0; i < targets.color_count; ++i) {
    key.render_target_formats[i] = u8(targets.colors[i]->format);
    const auto blend = AsRegister<reg::RB_BLENDCONTROL>(g_device.blend[i]);
    // D3D stores ONE/ZERO/ADD when D3DRS_ALPHABLENDENABLE is off.
    const bool passthrough = u32(blend.color_srcblend) == 1 && u32(blend.color_destblend) == 0 &&
                             u32(blend.color_comb_fcn) == 0 && u32(blend.alpha_srcblend) == 1 &&
                             u32(blend.alpha_destblend) == 0 && u32(blend.alpha_comb_fcn) == 0;
    auto& packed = key.blend[i];
    packed[0] = passthrough ? 0 : 1;
    packed[1] = u8(d3d::ConvertBlend(u32(blend.color_srcblend), false));
    packed[2] = u8(d3d::ConvertBlend(u32(blend.color_destblend), false));
    packed[3] = u8(d3d::ConvertBlendOp(u32(blend.color_comb_fcn)));
    packed[4] = u8(d3d::ConvertBlend(u32(blend.alpha_srcblend), true));
    packed[5] = u8(d3d::ConvertBlend(u32(blend.alpha_destblend), true));
    packed[6] = u8(d3d::ConvertBlendOp(u32(blend.alpha_comb_fcn)));
    packed[7] = u8(g_device.color_write[i] & 0xF);
  }

  const auto depth = AsRegister<reg::RB_DEPTHCONTROL>(g_device.depth_control);
  if (targets.depth) {
    key.depth_format = u8(targets.depth->format);
    key.depth_enable = depth.z_enable;
    key.depth_write = depth.z_enable && depth.z_write_enable;
    key.depth_func = u8(d3d::ConvertCompare(u32(depth.zfunc)));
    if (depth.stencil_enable) {
      const u32 stencil = g_device.stencil_ref;
      key.stencil_enable = 1;
      key.stencil_ref = u8(stencil);
      key.stencil_read_mask = u8(stencil >> 8);
      key.stencil_write_mask = u8(stencil >> 16);
      key.stencil_front[0] = u8(d3d::ConvertStencilOp(u32(depth.stencilfail)));
      key.stencil_front[1] = u8(d3d::ConvertStencilOp(u32(depth.stencilzfail)));
      key.stencil_front[2] = u8(d3d::ConvertStencilOp(u32(depth.stencilzpass)));
      key.stencil_front[3] = u8(d3d::ConvertCompare(u32(depth.stencilfunc)));
      if (depth.backface_enable) {
        key.stencil_back[0] = u8(d3d::ConvertStencilOp(u32(depth.stencilfail_bf)));
        key.stencil_back[1] = u8(d3d::ConvertStencilOp(u32(depth.stencilzfail_bf)));
        key.stencil_back[2] = u8(d3d::ConvertStencilOp(u32(depth.stencilzpass_bf)));
        key.stencil_back[3] = u8(d3d::ConvertCompare(u32(depth.stencilfunc_bf)));
      } else {
        std::memcpy(key.stencil_back, key.stencil_front, 4);
      }
    }
  } else {
    key.depth_func = u8(plume::RenderComparisonFunction::ALWAYS);
  }

  // D3DRS_CULLMODE and the depth bias enables.
  const auto raster = AsRegister<reg::PA_SU_SC_MODE_CNTL>(g_device.raster);
  key.cull_mode = u8(raster.cull_front  ? plume::RenderCullMode::FRONT
                     : raster.cull_back ? plume::RenderCullMode::BACK
                                        : plume::RenderCullMode::NONE);
  key.front_face =
      u8(raster.face ? plume::RenderFrontFace::CLOCKWISE : plume::RenderFrontFace::COUNTER_CLOCKWISE);
  if (targets.depth && (raster.poly_offset_front_enable || raster.poly_offset_back_enable)) {
    key.depth_bias =
        i32(std::lround(double(std::bit_cast<float>(g_device.depth_bias)) * double(1 << 24)));
    key.slope_scaled_depth_bias = std::bit_cast<float>(g_device.slope_scale_depth_bias);
  }

  // D3DRS_ALPHATESTENABLE / ALPHAFUNC / ALPHAREF. The shaders discard below
  // g_AlphaThreshold.
  const auto alpha = AsRegister<reg::RB_COLORCONTROL>(g_device.alpha_test);
  if (alpha.alpha_test_enable && targets.color_count) {
    const float ref = std::bit_cast<float>(g_device.alpha_ref);
    switch (alpha.alpha_func) {
      case xe::CompareFunction::kAlways:
        break;
      case xe::CompareFunction::kNever:
        key.spec_constants |= kSpecConstantAlphaTest;
        return 2.0f;
      case xe::CompareFunction::kGreater:
        key.spec_constants |= kSpecConstantAlphaTest;
        return ref + 0.5f / 255.0f;
      case xe::CompareFunction::kGreaterEqual:
        key.spec_constants |= kSpecConstantAlphaTest;
        return ref;
      default:
        GPU_WARN_LIMITED(4, "Unsupported D3DRS_ALPHAFUNC {}", u32(alpha.alpha_func));
        break;
    }
  }
  return 0.0f;
}

//------------------------------------------------------------------------------
// Constants
//------------------------------------------------------------------------------

// Byte swapped, with NaN written as zero: the X360 treats 0 * NaN as 0 and
// titles leave degenerate constants around that IEEE would propagate.
// Only the first `registers` float4s are written, the ones the bound shader
// reads (GuestShader::float4_register_count); the allocation keeps the whole
// buffer's size so the bound range is unchanged.
UploadAllocation UploadShaderConstantsLocked(const u8* constants, u32 registers) {
  UploadAllocation allocation = UploadAllocateLocked(kShaderConstantsSize, 256);
  if (!allocation)
    return allocation;
  const auto* src = reinterpret_cast<const u32*>(constants);
  auto* dst = reinterpret_cast<u32*>(allocation.data);
  const u32 words = std::min(registers * 4, kShaderConstantsSize / 4);
  for (u32 i = 0; i < words; ++i) {
    const u32 v = std::byteswap(src[i]);
    dst[i] = (v & 0x7FFFFFFFu) > 0x7F800000u ? 0u : v;
  }
  return allocation;
}

// The title's reduced-size passes (the 322x182 bloom chain) stay at their
// guest size, while the full-size textures they read are scaled. Their taps sit
// whole texels apart: UE3's bloom downsample sums the 4x4 texels at offsets 0-3
// from each quarter-size pixel. At 4K those offsets span a 4x4 corner of each
// 12x12 block, so eight texels in nine were never read. A small light counted
// towards the bloom only while it crossed a texel that was read, and as the
// camera moved the bloom on building lights crawled across them. Such draws
// sample a copy at the guest size instead, each texel the average of the host
// texels under it: the taps land as they do on the 360 and every rendered
// pixel counts. The copy is remade when a resolve has written the texture
// since, so a frame pays for it once.
HostTexture* GuestSizeCopyLocked(plume::RenderCommandList* list, HostTexture& source) {
  if (source.surface || !source.gpu_written || source.mip_levels != 1 || source.array_size != 1 ||
      source.view_dimension != plume::RenderTextureViewDimension::TEXTURE_2D) {
    return &source;
  }
  auto& copy = source.guest_copy;
  if (copy && source.guest_copy_resolves == source.resolve_count)
    return copy.get();
  plume::RenderPipeline* pipeline = GuestSizePipelineLocked(source.format);
  if (!pipeline)
    return &source;
  if (!copy) {
    copy = CreateScratchTargetLocked(source.guest_width, source.guest_height, source.format);
    if (!copy) {
      GPU_WARN_LIMITED(4, "Texture {:08X}: no guest-size copy ({}x{})", source.guest_va,
                       source.guest_width, source.guest_height);
      return &source;
    }
  }

  TransitionTextureLocked(source, list, plume::RenderTextureLayout::SHADER_READ);
  TransitionTextureLocked(*copy, list, plume::RenderTextureLayout::COLOR_WRITE);
  list->setFramebuffer(copy->target_framebuffers[0].get());
  list->setPipeline(pipeline);
  const plume::RenderViewport viewport{0.0f, 0.0f, float(copy->width), float(copy->height)};
  list->setViewports(&viewport, 1);
  const plume::RenderRect scissor(0, 0, i32(copy->width), i32(copy->height));
  list->setScissors(&scissor, 1);
  HostPushConstants constants;
  constants.texture_slot = source.slot;
  constants.sampler_slot = kPointClampSamplerSlot;
  constants.values[0] = 1.0f;
  constants.values[1] = 1.0f;
  constants.values[4] = source.scale;
  // Resolved depth keeps the texel at the centre (guest_size_ps).
  const auto format = d3d::TextureFormatOf(source.d3d_format);
  constants.flags =
      format == xe::TextureFormat::k_24_8 || format == xe::TextureFormat::k_24_8_FLOAT ? 1 : 0;
  SetHostPushConstantsLocked(list, constants);
  list->drawInstanced(3, 1, 0, 0);
  list->setFramebuffer(nullptr);
  TransitionTextureLocked(*copy, list, plume::RenderTextureLayout::SHADER_READ);
  InvalidateDrawBindingsLocked();
  source.guest_copy_resolves = source.resolve_count;
  return copy.get();
}

// Samplers either bound shader declares. Only their textures are looked up,
// uploaded and transitioned, and only theirs are captured.
u32 UsedSamplers(const GuestShader* vs, const GuestShader* ps) {
  return ((vs ? vs->sampler_mask : 0) | (ps ? ps->sampler_mask : 0)) & 0xFFFF;
}

void BuildSharedConstantsLocked(plume::RenderCommandList* list, const Targets& targets,
                                const HostVertexDeclaration& declaration, float alpha_threshold,
                                u8* out) {
  std::memset(out, 0, kSharedConstantsSize);
  auto put_u32 = [out](u32 offset, u32 value) { std::memcpy(out + offset, &value, 4); };
  auto put_f32 = [out](u32 offset, float value) { std::memcpy(out + offset, &value, 4); };

  // Samplers neither shader declares keep the null slots.
  const u32 used_samplers = UsedSamplers(g_state.vertex_shader, g_state.pixel_shader);
  for (u32 r = 0; r < d3d::kMaxSamplers; ++r) {
    u32 slot_2d = kNullTexture2DSlot;
    u32 slot_3d = kNullTexture3DSlot;
    u32 slot_cube = kNullTextureCubeSlot;
    u32 sampler = kLinearClampSamplerSlot;
    HostTexture* texture = (used_samplers >> r) & 1
                               ? GetTextureLocked(g_state.textures[r], g_texture_words[r])
                               : nullptr;
    if (texture && texture->slot != kInvalidSlot) {
      PrepareTextureForSamplingLocked(*texture, list);
      if (targets.scale == 1.0f && texture->scale > 1.0f)
        texture = GuestSizeCopyLocked(list, *texture);
      switch (texture->view_dimension) {
        case plume::RenderTextureViewDimension::TEXTURE_3D:
          slot_3d = texture->slot;
          break;
        case plume::RenderTextureViewDimension::TEXTURE_CUBE:
          slot_cube = texture->slot;
          break;
        default:
          slot_2d = texture->slot;
          break;
      }
      // Sampler state as the title's D3DSAMP setters stored it. Anisotropy
      // stays off for textures the GPU wrote (see GetSamplerSlotLocked).
      sampler = GetSamplerSlotLocked(
          g_sampler_words[r], texture->view_dimension == plume::RenderTextureViewDimension::TEXTURE_3D,
          !texture->gpu_written && !texture->surface);
    }
    put_u32(r * 4, slot_2d);
    put_u32(64 + r * 4, slot_3d);
    put_u32(128 + r * 4, slot_cube);
    put_u32(192 + r * 4, sampler);
  }

  // Bits 0-15 vertex shader booleans, 16-31 pixel shader booleans.
  const u32 vs_bools = g_device.vs_bools & 0xFFFF;
  const u32 ps_bools = g_device.ps_bools & 0xFFFF;
  put_u32(256, vs_bools | (ps_bools << 16));
  put_u32(260, declaration.swapped_texcoords);
  // The vertex shaders finish with oPos.xy = oPos.xy * g_PositionScale +
  // g_HalfPixelOffset * oPos.w. With the viewport transform off the positions
  // are guest render target pixels, mapped here onto clip space over the
  // whole target. Clip space does not depend on the host size, so both stay in
  // guest pixels whatever the resolution scale.
  float offset_x = 0.0f, offset_y = 0.0f, scale_x = 1.0f, scale_y = 1.0f;
  const plume::RenderViewport guest_viewport = GuestViewport(targets);
  float pixel_width = guest_viewport.width, pixel_height = guest_viewport.height;
  if (!ViewportTransformEnabled() && targets.guest_width && targets.guest_height) {
    scale_x = 2.0f / float(targets.guest_width);
    scale_y = -2.0f / float(targets.guest_height);
    offset_x = -1.0f;
    offset_y = 1.0f;
    pixel_width = float(targets.guest_width);
    pixel_height = float(targets.guest_height);
  }
  // D3DRS_HALFPIXELOFFSET off (pix_center 0, PotF's setting) samples pixels at
  // integer coordinates, the Direct3D 9 rule; D3D12 and Vulkan sample at half
  // integers. The title's constants are built for the Xenos rule: its screen
  // to texture mapping adds half a texel (0.5 / 1280), and its shadow lookups
  // expect shadow depth rasterised the same way. Left unshifted, every screen
  // read landed on a texel edge and every shadow lookup sat half a shadow
  // texel off, so self-shadowing walls lit and darkened as the per-object
  // shadow resolution changed with distance. Geometry moves half a guest
  // pixel right and down to put the Xenos sample points on the host's.
  if (!(g_device.vertex_control & dv::kVertexControlPixelCenter) && pixel_width > 0.0f &&
      pixel_height > 0.0f) {
    offset_x += 1.0f / pixel_width;
    offset_y -= 1.0f / pixel_height;
  }
  put_f32(264, offset_x);
  put_f32(268, offset_y);
  put_f32(272, alpha_threshold);
  put_u32(276, declaration.sint_texcoords);
  put_f32(280, scale_x);
  put_f32(284, scale_y);
  // Pixel shaders read VPOS in host pixels; this brings it back to the guest
  // pixels the title's screen-space math is written for.
  const float pixel_position_scale = 1.0f / targets.scale;
  put_f32(288, pixel_position_scale);
  put_f32(292, pixel_position_scale);
}

void BindConstantsLocked(plume::RenderCommandList* list, const u8* shared_block) {
  const u32 vs_registers = g_state.vertex_shader ? g_state.vertex_shader->float4_register_count : 0;
  const u32 ps_registers = g_state.pixel_shader ? g_state.pixel_shader->float4_register_count : 0;
  if (g_vs_dirty || !g_bound.vs_constants || vs_registers > g_bound.vs_registers) {
    g_bound.vs_constants = UploadShaderConstantsLocked(g_vs_constants, vs_registers);
    g_bound.vs_registers = vs_registers;
    g_vs_dirty = false;
    if (Host().vulkan) {
      list->setGraphicsPushConstants(0, &g_bound.vs_constants.device_address, 0, 8);
    } else {
      list->setGraphicsRootDescriptor(g_bound.vs_constants.ref(), 0);
    }
  }
  if (g_ps_dirty || !g_bound.ps_constants || ps_registers > g_bound.ps_registers) {
    g_bound.ps_constants = UploadShaderConstantsLocked(g_ps_constants, ps_registers);
    g_bound.ps_registers = ps_registers;
    g_ps_dirty = false;
    if (Host().vulkan) {
      list->setGraphicsPushConstants(0, &g_bound.ps_constants.device_address, 8, 8);
    } else {
      list->setGraphicsRootDescriptor(g_bound.ps_constants.ref(), 1);
    }
  }
  if (g_bound.shared_valid &&
      std::memcmp(g_bound.shared_constants, shared_block, kSharedConstantsSize) == 0) {
    return;
  }
  UploadAllocation shared = UploadBytesLocked(shared_block, kSharedConstantsSize, 256);
  if (!shared)
    return;
  std::memcpy(g_bound.shared_constants, shared_block, kSharedConstantsSize);
  g_bound.shared_valid = true;
  if (Host().vulkan) {
    list->setGraphicsPushConstants(0, &shared.device_address, 16, 8);
  } else {
    list->setGraphicsRootDescriptor(shared.ref(), 2);
  }
}

//------------------------------------------------------------------------------
// Draw
//------------------------------------------------------------------------------

struct DrawRequest {
  u32 primitive = 0;
  bool indexed = false;
  u32 start_vertex = 0;
  u32 vertex_count = 0;
  i32 base_vertex = 0;
  u32 start_index = 0;
  u32 index_count = 0;
  // User pointer data replaces stream 0 and the index buffer.
  UploadAllocation up_vertices;
  u32 up_stride = 0;
  UploadAllocation up_indices;
  bool up_indices_32bit = false;
  // Host instancing the draw was converted to (PrepareGuestInstancingLocked).
  u32 instance_count = 1;
  u32 first_instance = 0;
};

bool BindStreamsLocked(plume::RenderCommandList* list, const HostVertexDeclaration& declaration,
                       const DrawRequest& request, PipelineKey& key) {
  auto& h = Host();
  std::array<plume::RenderVertexBufferView, d3d::kMaxStreams> views{};
  std::array<plume::RenderInputSlot, d3d::kMaxStreams> slots{};
  const plume::RenderVertexBufferView zero_view(
      plume::RenderBufferReference(h.zero_vertex_buffer.get(), 0), 256);
  for (u32 stream = 0; stream < d3d::kMaxStreams; ++stream) {
    views[stream] = zero_view;
    slots[stream] = plume::RenderInputSlot(stream, 16);
  }
  slots[kZeroStream] = plume::RenderInputSlot(kZeroStream, 0,
                                              plume::RenderInputSlotClassification::PER_INSTANCE_DATA);

  for (u32 stream = 0; stream < d3d::kMaxStreams; ++stream) {
    if (!declaration.streams[stream] || stream == kZeroStream)
      continue;
    if (request.up_vertices) {
      if (stream != 0) {
        GPU_WARN_LIMITED(4, "UP draw declaration reads stream {}", stream);
        return false;
      }
      views[0] = plume::RenderVertexBufferView(request.up_vertices.ref(), request.up_vertices.size);
      slots[0] = plume::RenderInputSlot(0, request.up_stride);
      key.vertex_strides[0] = u16(request.up_stride);
      continue;
    }
    const StreamBinding& binding = g_state.streams[stream];
    HostBuffer* buffer = g_streams[stream];
    if (!buffer || !binding.stride || binding.offset >= buffer->size || !PrepareBufferLocked(*buffer)) {
      GPU_WARN_LIMITED(8, "Draw without a usable vertex buffer on stream {}", stream);
      return false;
    }
    views[stream] = plume::RenderVertexBufferView(BufferReference(*buffer, binding.offset),
                                                  buffer->size - binding.offset);
    const auto classification = (key.instance_streams >> stream) & 1
                                    ? plume::RenderInputSlotClassification::PER_INSTANCE_DATA
                                    : plume::RenderInputSlotClassification::PER_VERTEX_DATA;
    slots[stream] = plume::RenderInputSlot(stream, binding.stride, classification);
    key.vertex_strides[stream] = u16(binding.stride);
  }
  bool same = g_bound.vertex_buffers_valid;
  for (u32 stream = 0; same && stream < d3d::kMaxStreams; ++stream) {
    const auto& bv = g_bound.vertex_views[stream];
    const auto& bs = g_bound.vertex_slots[stream];
    same = SameBuffer(bv.buffer, views[stream].buffer) && bv.size == views[stream].size &&
           bs.index == slots[stream].index && bs.stride == slots[stream].stride &&
           bs.classification == slots[stream].classification;
  }
  if (!same) {
    list->setVertexBuffers(0, views.data(), d3d::kMaxStreams, slots.data());
    g_bound.vertex_views = views;
    g_bound.vertex_slots = slots;
    g_bound.vertex_buffers_valid = true;
  }
  return true;
}

// Where a draw's indices come from: user-pointer indices were byte swapped on
// upload; a bound index buffer is still the guest's big-endian copy, the one
// its packet carried or the guest memory it was uploaded from.
struct IndexSource {
  const u8* data = nullptr;
  bool index32 = false;
  bool swap = false;
  // The bound index buffer, or null for user-pointer indices.
  HostBuffer* buffer = nullptr;
};

bool RequestIndexSourceLocked(const DrawRequest& request, IndexSource& out) {
  if (request.up_indices) {
    out.data = request.up_indices.data;
    out.index32 = request.up_indices_32bit;
    return out.data != nullptr;
  }
  HostBuffer* buffer = g_index_buffer;
  if (!buffer)
    return false;
  const u64 end = (u64(request.start_index) + request.index_count) * (buffer->index32 ? 4 : 2);
  if (end > buffer->size)
    return false;
  const u8* guest = buffer->captured ? buffer->captured : mem::AtGpuAddress(buffer->guest_address);
  if (!guest)
    return false;
  out.index32 = buffer->index32;
  out.swap = true;
  out.buffer = buffer;
  out.data = guest + size_t(request.start_index) * (buffer->index32 ? 4 : 2);
  return true;
}

template <typename T, bool kSwap>
struct IndexLoader {
  u32 operator()(const u8* data, u32 i) const {
    T value;
    std::memcpy(&value, data + size_t(i) * sizeof(T), sizeof(T));
    if constexpr (kSwap)
      value = std::byteswap(value);
    return value;
  }
};

// Calls fn with the index loader matching the source's width and byte order,
// one instantiation each so the loops inline their loads.
template <typename Fn>
decltype(auto) WithIndexLoader(const IndexSource& source, Fn&& fn) {
  if (source.index32) {
    return source.swap ? fn(IndexLoader<u32, true>{}) : fn(IndexLoader<u32, false>{});
  }
  return source.swap ? fn(IndexLoader<u16, true>{}) : fn(IndexLoader<u16, false>{});
}

// The draw's indices in host order, before the base vertex.
bool ReadRequestIndicesLocked(const DrawRequest& request, std::vector<u32>& out) {
  IndexSource source;
  if (!RequestIndexSourceLocked(request, source))
    return false;
  out.resize(request.index_count);
  WithIndexLoader(source, [&](auto load) {
    for (u32 i = 0; i < request.index_count; ++i)
      out[i] = load(source.data, i);
    return 0;
  });
  return true;
}

// UE3 instances meshes on the Xbox 360 through the vertex shader (instanced
// foliage, grass): each index is instance * NumVerticesPerInstance + vertex,
// and the shader splits it and fetches the mesh stream (0) at the vertex and
// the instance streams at the instance. The recompiled shaders read every
// stream through the input assembler at the plain index, which lands past the
// end of the mesh and returns zeros, so blades collapsed into long slivers.
// A draw that follows the pattern exactly is turned into host instancing:
// one instance's vertex indices, drawn once per instance, with the instance
// streams stepped per instance. Anything else draws as before.
//
// This runs for every foliage and grass draw, so the check is cheap: with n
// vertices per instance, instance 0 is the run of indices within
// [first * n, first * n + n), and instance k must repeat it offset by k * n
// (the same as asking every index for instance first + k at instance 0's
// vertex, without a division). Index buffers the title does not rewrite give
// the same answer every frame, so the result is kept per buffer (by serial and
// upload count), range, base vertex and n.
struct InstanceSplit {
  bool ok = false;
  u32 first_instance = 0;
  u32 instance_count = 0;
  // Instance 0's indices, local to the instance.
  std::vector<u32> local;
};

template <typename Load>
bool SplitInstances(Load load, const u8* data, u32 count, i32 base_vertex, u32 vertices,
                    InstanceSplit& out) {
  const i64 first_value = i64(load(data, 0)) + base_vertex;
  if (first_value < 0)
    return false;
  const u64 first_instance = u64(first_value) / vertices;
  const i64 low = i64(first_instance * vertices);
  const i64 high = low + vertices;
  u32 per_instance = 0;
  while (per_instance < count) {
    const i64 value = i64(load(data, per_instance)) + base_vertex;
    if (value < low || value >= high)
      break;
    ++per_instance;
  }
  if (!per_instance || count % per_instance || first_instance > 0xFFFFFFFFu)
    return false;
  out.local.resize(per_instance);
  for (u32 i = 0; i < per_instance; ++i)
    out.local[i] = u32(i64(load(data, i)) + base_vertex - low);
  const u32 instances = count / per_instance;
  for (u32 k = 1; k < instances; ++k) {
    const i64 offset = low + i64(k) * vertices - base_vertex;
    const u32 row = k * per_instance;
    for (u32 i = 0; i < per_instance; ++i) {
      if (i64(load(data, row + i)) != offset + out.local[i])
        return false;
    }
  }
  out.first_instance = u32(first_instance);
  out.instance_count = instances;
  return true;
}

struct InstanceSplitKey {
  u64 serial;
  u32 uploads;
  u32 start_index;
  u32 index_count;
  i32 base_vertex;
  u32 vertices;
  bool operator==(const InstanceSplitKey&) const = default;
};

struct InstanceSplitKeyHash {
  size_t operator()(const InstanceSplitKey& k) const {
    u64 h = k.serial * 0x9E3779B97F4A7C15ull;
    for (const u64 v : {u64(k.uploads), u64(k.start_index), u64(k.index_count),
                        u64(u32(k.base_vertex)), u64(k.vertices)}) {
      h ^= v + 0x9E3779B97F4A7C15ull + (h << 6) + (h >> 2);
    }
    return size_t(h);
  }
};

std::unordered_map<InstanceSplitKey, InstanceSplit, InstanceSplitKeyHash> g_instance_splits;
// Entries of buffers since rewritten or gone are never hit again; past this
// many the table starts over.
constexpr size_t kMaxInstanceSplits = 8192;

const InstanceSplit& SplitRequestInstancesLocked(const IndexSource& source,
                                                 const DrawRequest& request, u32 vertices) {
  static InstanceSplit scratch;
  const bool cacheable = source.buffer && !source.buffer->needs_upload;
  InstanceSplitKey key{};
  if (cacheable) {
    key = {source.buffer->serial, source.buffer->uploads, request.start_index,
           request.index_count, request.base_vertex, vertices};
    if (auto it = g_instance_splits.find(key); it != g_instance_splits.end())
      return it->second;
  }
  scratch.ok = WithIndexLoader(source, [&](auto load) {
    return SplitInstances(load, source.data, request.index_count, request.base_vertex, vertices,
                          scratch);
  });
  if (!cacheable)
    return scratch;
  if (g_instance_splits.size() >= kMaxInstanceSplits)
    g_instance_splits.clear();
  return g_instance_splits[key] = scratch;
}

bool PrepareGuestInstancingLocked(const GuestShader& shader, const HostVertexDeclaration& declaration,
                                  DrawRequest& request, PipelineKey& key) {
  u16 instance_streams = 0;
  for (u32 stream = 1; stream < d3d::kMaxStreams; ++stream) {
    if (stream != kZeroStream && declaration.streams[stream])
      instance_streams |= u16(1u << stream);
  }
  if (!instance_streams || request.up_vertices)
    return false;
  const u32 reg = u32(shader.vertices_per_instance_register);
  if (reg >= kShaderConstantRegisters)
    return false;
  const float vertices_float = ConstantFloat(g_vs_constants, reg, 0);
  if (!(vertices_float >= 1.0f && vertices_float < 65536.0f) ||
      std::floor(vertices_float) != vertices_float) {
    return false;
  }
  const u32 vertices = u32(vertices_float);

  if (!request.indexed) {
    if (request.start_vertex % vertices || request.vertex_count % vertices ||
        request.vertex_count < vertices) {
      return false;
    }
    request.first_instance = request.start_vertex / vertices;
    request.instance_count = request.vertex_count / vertices;
    request.start_vertex = 0;
    request.vertex_count = vertices;
    key.instance_streams = instance_streams;
    return true;
  }

  IndexSource source;
  if (request.index_count == 0 || !RequestIndexSourceLocked(request, source))
    return false;
  const InstanceSplit& split = SplitRequestInstancesLocked(source, request, vertices);
  if (!split.ok)
    return false;

  const u32 per_instance = u32(split.local.size());
  UploadAllocation local_indices = UploadAllocateLocked(per_instance * 4, 4);
  if (!local_indices)
    return false;
  std::memcpy(local_indices.data, split.local.data(), size_t(per_instance) * 4);
  request.up_indices = local_indices;
  request.up_indices_32bit = true;
  request.start_index = 0;
  request.base_vertex = 0;
  request.index_count = per_instance;
  request.first_instance = split.first_instance;
  request.instance_count = split.instance_count;
  key.instance_streams = instance_streams;
  return true;
}

// D3DPT_QUADLIST and D3DPT_TRIANGLEFAN have no host topology. Non-indexed
// draws walk the shared pattern buffer below, but an indexed one supplies its
// own indices, so those are expanded into a triangle list in upload memory.
// Without this the draw was dropped and its geometry never appeared.
bool ExpandIndexedPatternLocked(DrawRequest& request, bool quads);

// Shared index patterns for the D3D primitives hosts lack: 0 1 2 0 2 3 per
// quad, and 0 i i+1 per fan triangle. Draws offset them with the base vertex.
enum class IndexPattern { kQuads, kFan };

plume::RenderBuffer* PatternIndicesLocked(IndexPattern pattern) {
  auto& buffer = pattern == IndexPattern::kQuads ? g_quad_indices : g_fan_indices;
  if (buffer)
    return buffer.get();
  const u32 bytes = kMaxExpandedQuads * 6 * 4;
  buffer = CreateBuffer(plume::RenderBufferDesc::IndexBuffer(bytes, plume::RenderHeapType::UPLOAD),
                        pattern == IndexPattern::kQuads ? "quad-indices" : "fan-indices");
  if (!buffer)
    return nullptr;
  auto* indices = static_cast<u32*>(buffer->map());
  if (!indices) {
    buffer.reset();
    return nullptr;
  }
  if (pattern == IndexPattern::kQuads) {
    for (u32 q = 0; q < kMaxExpandedQuads; ++q) {
      const u32 v = q * 4;
      const u32 pattern_indices[] = {v, v + 1, v + 2, v, v + 2, v + 3};
      std::memcpy(indices + q * 6, pattern_indices, sizeof(pattern_indices));
    }
  } else {
    for (u32 i = 0; i < kMaxExpandedQuads * 2; ++i) {
      indices[i * 3] = 0;
      indices[i * 3 + 1] = i + 1;
      indices[i * 3 + 2] = i + 2;
    }
  }
  buffer->unmap();
  return buffer.get();
}

bool ExpandIndexedPatternLocked(DrawRequest& request, bool quads) {
  const u32 source_count = request.index_count;
  if (quads ? source_count < 4 : source_count < 3)
    return false;
  std::vector<u32> source;
  if (!ReadRequestIndicesLocked(request, source))
    return false;

  const u32 triangles = quads ? source_count / 4 * 2 : source_count - 2;
  const u32 index_count = triangles * 3;
  UploadAllocation expanded = UploadAllocateLocked(index_count * 4, 4);
  if (!expanded)
    return false;
  auto* out = reinterpret_cast<u32*>(expanded.data);
  if (quads) {
    for (u32 quad = 0; quad < source_count / 4; ++quad) {
      const u32 v0 = source[quad * 4], v1 = source[quad * 4 + 1];
      const u32 v2 = source[quad * 4 + 2], v3 = source[quad * 4 + 3];
      const u32 corners[] = {v0, v1, v2, v0, v2, v3};
      std::memcpy(out + quad * 6, corners, sizeof(corners));
    }
  } else {
    const u32 hub = source[0];
    for (u32 triangle = 0; triangle < triangles; ++triangle) {
      out[triangle * 3] = hub;
      out[triangle * 3 + 1] = source[triangle + 1];
      out[triangle * 3 + 2] = source[triangle + 2];
    }
  }

  request.up_indices = expanded;
  request.up_indices_32bit = true;
  request.index_count = index_count;
  request.start_index = 0;
  return true;
}

//------------------------------------------------------------------------------
// Screen-space reflections
//------------------------------------------------------------------------------

// Replacement shaders marked screen_reflections (the pool water) trace their
// reflections through the scene as it stands before they draw: its colour and
// depth, copied at half size on the frame's first such draw. They read the
// copies and the view from float4 registers past the title's own:
//   c32-c35  ViewProjectionMatrix rows (clip = x c32 + y c33 + z c34 + c35)
//   c36-c39  its inverse, same convention (NDC to world)
//   c40      CameraPosition xyz
//   c41      the draw's host viewport: x, y, width, height
//   c42      viewport MinZ, MaxZ; 1 / target width, 1 / target height
//   c43      colour copy slot, depth copy slot, point and linear sampler slots
//            (as uint bits)
constexpr u32 kReflectionRegister = 32;
constexpr u32 kReflectionRegisterCount = 12;

struct ReflectionSource {
  std::unique_ptr<HostTexture> color;
  std::unique_ptr<HostTexture> depth;
  // What the copies hold: the frame and scene surface they were taken from.
  u64 frame = ~u64{0};
  const HostTexture* scene = nullptr;
};
ReflectionSource g_reflection;
// Counts presented frames.
u64 g_present_serial = 0;

using Matrix4 = std::array<std::array<float, 4>, 4>;

// General 4x4 inverse by cofactors. False when singular.
bool InvertMatrix(const Matrix4& m, Matrix4& out) {
  const float* a = &m[0][0];
  float inv[16];
  inv[0] = a[5] * a[10] * a[15] - a[5] * a[11] * a[14] - a[9] * a[6] * a[15] +
           a[9] * a[7] * a[14] + a[13] * a[6] * a[11] - a[13] * a[7] * a[10];
  inv[4] = -a[4] * a[10] * a[15] + a[4] * a[11] * a[14] + a[8] * a[6] * a[15] -
           a[8] * a[7] * a[14] - a[12] * a[6] * a[11] + a[12] * a[7] * a[10];
  inv[8] = a[4] * a[9] * a[15] - a[4] * a[11] * a[13] - a[8] * a[5] * a[15] +
           a[8] * a[7] * a[13] + a[12] * a[5] * a[11] - a[12] * a[7] * a[9];
  inv[12] = -a[4] * a[9] * a[14] + a[4] * a[10] * a[13] + a[8] * a[5] * a[14] -
            a[8] * a[6] * a[13] - a[12] * a[5] * a[10] + a[12] * a[6] * a[9];
  inv[1] = -a[1] * a[10] * a[15] + a[1] * a[11] * a[14] + a[9] * a[2] * a[15] -
           a[9] * a[3] * a[14] - a[13] * a[2] * a[11] + a[13] * a[3] * a[10];
  inv[5] = a[0] * a[10] * a[15] - a[0] * a[11] * a[14] - a[8] * a[2] * a[15] +
           a[8] * a[3] * a[14] + a[12] * a[2] * a[11] - a[12] * a[3] * a[10];
  inv[9] = -a[0] * a[9] * a[15] + a[0] * a[11] * a[13] + a[8] * a[1] * a[15] -
           a[8] * a[3] * a[13] - a[12] * a[1] * a[11] + a[12] * a[3] * a[9];
  inv[13] = a[0] * a[9] * a[14] - a[0] * a[10] * a[13] - a[8] * a[1] * a[14] +
            a[8] * a[2] * a[13] + a[12] * a[1] * a[10] - a[12] * a[2] * a[9];
  inv[2] = a[1] * a[6] * a[15] - a[1] * a[7] * a[14] - a[5] * a[2] * a[15] +
           a[5] * a[3] * a[14] + a[13] * a[2] * a[7] - a[13] * a[3] * a[6];
  inv[6] = -a[0] * a[6] * a[15] + a[0] * a[7] * a[14] + a[4] * a[2] * a[15] -
           a[4] * a[3] * a[14] - a[12] * a[2] * a[7] + a[12] * a[3] * a[6];
  inv[10] = a[0] * a[5] * a[15] - a[0] * a[7] * a[13] - a[4] * a[1] * a[15] +
            a[4] * a[3] * a[13] + a[12] * a[1] * a[7] - a[12] * a[3] * a[5];
  inv[14] = -a[0] * a[5] * a[14] + a[0] * a[6] * a[13] + a[4] * a[1] * a[14] -
            a[4] * a[2] * a[13] - a[12] * a[1] * a[6] + a[12] * a[2] * a[5];
  inv[3] = -a[1] * a[6] * a[11] + a[1] * a[7] * a[10] + a[5] * a[2] * a[11] -
           a[5] * a[3] * a[10] - a[9] * a[2] * a[7] + a[9] * a[3] * a[6];
  inv[7] = a[0] * a[6] * a[11] - a[0] * a[7] * a[10] - a[4] * a[2] * a[11] +
           a[4] * a[3] * a[10] + a[8] * a[2] * a[7] - a[8] * a[3] * a[6];
  inv[11] = -a[0] * a[5] * a[11] + a[0] * a[7] * a[9] + a[4] * a[1] * a[11] -
            a[4] * a[3] * a[9] - a[8] * a[1] * a[7] + a[8] * a[3] * a[5];
  inv[15] = a[0] * a[5] * a[10] - a[0] * a[6] * a[9] - a[4] * a[1] * a[10] +
            a[4] * a[2] * a[9] + a[8] * a[1] * a[6] - a[8] * a[2] * a[5];
  const float det = a[0] * inv[0] + a[1] * inv[4] + a[2] * inv[8] + a[3] * inv[12];
  if (!std::isfinite(det) || std::fabs(det) < 1e-30f)
    return false;
  for (u32 i = 0; i < 16; ++i)
    (&out[0][0])[i] = inv[i] / det;
  return true;
}

// Draws `source` over the whole of `dest` through a resolve pipeline.
void CopyForReflectionsLocked(plume::RenderCommandList* list, HostTexture& source,
                              HostTexture& dest, plume::RenderPipeline* pipeline, u32 sampler) {
  TransitionTextureLocked(source, list, plume::RenderTextureLayout::SHADER_READ);
  TransitionTextureLocked(dest, list, plume::RenderTextureLayout::COLOR_WRITE);
  list->setFramebuffer(dest.target_framebuffers[0].get());
  list->setPipeline(pipeline);
  const plume::RenderViewport viewport{0.0f, 0.0f, float(dest.width), float(dest.height)};
  list->setViewports(&viewport, 1);
  const plume::RenderRect scissor(0, 0, i32(dest.width), i32(dest.height));
  list->setScissors(&scissor, 1);
  HostPushConstants constants;
  constants.texture_slot = source.slot;
  constants.sampler_slot = sampler;
  constants.values[0] = 1.0f;
  constants.values[1] = 1.0f;
  constants.values[4] = 1.0f;  // no exponent bias
  for (float& ceiling : constants.rows[0])
    ceiling = std::numeric_limits<float>::max();
  SetHostPushConstantsLocked(list, constants);
  list->drawInstanced(3, 1, 0, 0);
  list->setFramebuffer(nullptr);
  TransitionTextureLocked(dest, list, plume::RenderTextureLayout::SHADER_READ);
}

// Copies the bound scene colour and depth once per frame. Must run before the
// draw binds anything: it draws through other pipelines and targets.
bool CaptureReflectionSourceLocked(plume::RenderCommandList* list, const Targets& targets) {
  HostTexture* scene = targets.color_count ? targets.colors[0] : nullptr;
  HostTexture* depth = targets.depth;
  if (!scene || !depth || scene->slot == kInvalidSlot || depth->slot == kInvalidSlot) {
    GPU_WARN_LIMITED(4, "Screen-space reflections: no scene to copy (colour {}, depth {})",
                     scene != nullptr, depth != nullptr);
    return false;
  }
  if (g_reflection.frame == g_present_serial && g_reflection.scene == scene)
    return true;

  const u32 width = std::max(scene->width / 2, 1u);
  const u32 height = std::max(scene->height / 2, 1u);
  auto& color = g_reflection.color;
  if (!color || color->width != width || color->height != height || color->format != scene->format) {
    ReleaseScratchTargetLocked(std::move(g_reflection.color));
    ReleaseScratchTargetLocked(std::move(g_reflection.depth));
    g_reflection.color = CreateScratchTargetLocked(width, height, scene->format);
    g_reflection.depth = CreateScratchTargetLocked(width, height, plume::RenderFormat::R32_FLOAT);
    if (!g_reflection.color || !g_reflection.depth) {
      GPU_WARN_LIMITED(2, "Screen-space reflection targets could not be created");
      ReleaseScratchTargetLocked(std::move(g_reflection.color));
      ReleaseScratchTargetLocked(std::move(g_reflection.depth));
      return false;
    }
  }
  plume::RenderPipeline* color_pipeline = ResolveColorPipelineLocked(scene->format);
  plume::RenderPipeline* depth_pipeline = ResolveDepthPipelineLocked(plume::RenderFormat::R32_FLOAT);
  if (!color_pipeline || !depth_pipeline)
    return false;
  CopyForReflectionsLocked(list, *scene, *g_reflection.color, color_pipeline,
                           kLinearClampSamplerSlot);
  CopyForReflectionsLocked(list, *depth, *g_reflection.depth, depth_pipeline,
                           kPointClampSamplerSlot);
  InvalidateDrawBindingsLocked();
  g_reflection.frame = g_present_serial;
  g_reflection.scene = scene;
  return true;
}

// Writes the registers listed above into the bound pixel shader constants.
void WriteReflectionConstantsLocked(const Targets& targets) {
  const GuestShader* vs = g_state.vertex_shader;
  u8* out = g_bound.ps_constants.data;
  if (!out || !vs || vs->view_projection_register < 0 || vs->camera_position_register < 0 ||
      u32(vs->view_projection_register) + 4 > kShaderConstantRegisters ||
      u32(vs->camera_position_register) >= kShaderConstantRegisters) {
    GPU_WARN_LIMITED(4, "Screen-space reflections: vertex shader {:016X} has no view constants "
                        "(ViewProjectionMatrix c{}, CameraPosition c{})",
                     vs ? vs->hash : 0, vs ? vs->view_projection_register : -1,
                     vs ? vs->camera_position_register : -1);
    return;
  }
  float regs[kReflectionRegisterCount][4] = {};
  Matrix4 view_projection;
  for (u32 r = 0; r < 4; ++r) {
    for (u32 c = 0; c < 4; ++c) {
      view_projection[r][c] = ConstantFloat(g_vs_constants, vs->view_projection_register + r, c);
      regs[r][c] = view_projection[r][c];
    }
  }
  Matrix4 inverse;
  if (!InvertMatrix(view_projection, inverse)) {
    GPU_WARN_LIMITED(4, "Screen-space reflections: ViewProjectionMatrix is singular");
    return;
  }
  for (u32 r = 0; r < 4; ++r)
    std::memcpy(regs[4 + r], inverse[r].data(), 16);
  for (u32 c = 0; c < 3; ++c)
    regs[8][c] = ConstantFloat(g_vs_constants, vs->camera_position_register, c);
  const plume::RenderViewport viewport = EffectiveViewport(targets);
  regs[9][0] = viewport.x;
  regs[9][1] = viewport.y;
  regs[9][2] = viewport.width;
  regs[9][3] = viewport.height;
  regs[10][0] = viewport.minDepth;
  regs[10][1] = viewport.maxDepth;
  regs[10][2] = 1.0f / float(targets.width);
  regs[10][3] = 1.0f / float(targets.height);
  const u32 slots[4] = {g_reflection.color->slot, g_reflection.depth->slot, kPointClampSamplerSlot,
                        kLinearClampSamplerSlot};
  std::memcpy(regs[11], slots, 16);
  std::memcpy(out + kReflectionRegister * 16, regs, sizeof(regs));
  GPU_INFO_LIMITED(2, "Screen-space reflections: vs {:016X} c{}/c{}, camera {:.0f},{:.0f},{:.0f}, "
                      "viewport {:.0f},{:.0f} {:.0f}x{:.0f} z {:.2f}-{:.2f}, row3 {:.3f},{:.3f},"
                      "{:.3f},{:.3f}",
                   vs->hash, vs->view_projection_register, vs->camera_position_register,
                   regs[8][0], regs[8][1], regs[8][2], viewport.x, viewport.y, viewport.width,
                   viewport.height, viewport.minDepth, viewport.maxDepth, regs[3][0], regs[3][1],
                   regs[3][2], regs[3][3]);
}

//------------------------------------------------------------------------------
// Graphics setting constant overrides
//------------------------------------------------------------------------------

// Bloom off zeroes the bloom gather's BloomScale; depth of field off zeroes
// MinMaxBlurClamp, the most the DOF passes may blur towards the near and far
// planes, so they blur nothing.
bool PixelConstantOverridesLocked() {
  const GuestShader* ps = g_state.pixel_shader;
  return ps && ((ps->bloom_scale_register >= 0 && !settings::Bloom()) ||
                (ps->blur_clamp_register >= 0 && !settings::DepthOfField()));
}

void WritePixelConstantOverridesLocked() {
  const GuestShader* ps = g_state.pixel_shader;
  u8* out = g_bound.ps_constants.data;
  if (!ps || !out)
    return;
  const auto zero = [out](i32 reg) {
    if (reg >= 0 && u32(reg) < kShaderConstantsSize / 16)
      std::memset(out + reg * 16, 0, 16);
  };
  if (!settings::Bloom())
    zero(ps->bloom_scale_register);
  if (!settings::DepthOfField())
    zero(ps->blur_clamp_register);
}

void DrawLocked(HostVertexDeclaration* declaration, DrawRequest& request) {
  cost::ScopedCost timed(cost::Costs().draws);
  plume::RenderCommandList* list = OpenCommandListLocked();
  if (!list)
    return;
  SyncBoundLocked();

  // The guest's own count, before quads and fans are expanded.
  const u32 guest_primitive = request.primitive;
  const u32 guest_count = request.indexed ? request.index_count : request.vertex_count;

  const auto primitive = static_cast<d3d::PrimitiveType>(request.primitive);
  plume::RenderPrimitiveTopology topology;
  switch (primitive) {
    case d3d::PrimitiveType::kPointList: topology = plume::RenderPrimitiveTopology::POINT_LIST; break;
    case d3d::PrimitiveType::kLineList: topology = plume::RenderPrimitiveTopology::LINE_LIST; break;
    case d3d::PrimitiveType::kLineStrip: topology = plume::RenderPrimitiveTopology::LINE_STRIP; break;
    case d3d::PrimitiveType::kTriangleList: topology = plume::RenderPrimitiveTopology::TRIANGLE_LIST; break;
    case d3d::PrimitiveType::kTriangleStrip: topology = plume::RenderPrimitiveTopology::TRIANGLE_STRIP; break;
    case d3d::PrimitiveType::kQuadList:
    case d3d::PrimitiveType::kTriangleFan: topology = plume::RenderPrimitiveTopology::TRIANGLE_LIST; break;
    default:
      GPU_WARN_LIMITED(8, "Unsupported D3DPRIMITIVETYPE {}", request.primitive);
      return;
  }
  const bool quads = primitive == d3d::PrimitiveType::kQuadList;
  const bool fan = primitive == d3d::PrimitiveType::kTriangleFan;
  // Non-indexed quads and fans walk the shared pattern buffer; indexed ones are
  // expanded into a triangle list and then draw like any other indexed call.
  const bool use_pattern = (quads || fan) && !request.indexed;
  if ((quads || fan) && request.indexed && !ExpandIndexedPatternLocked(request, quads)) {
    ++g_stats.unsupported_primitive;
    return;
  }

  ++g_stats.calls;
  ++g_trace.frame_draws;
  if (!g_state.vertex_shader) {
    ++g_stats.no_vertex_shader;
    return;
  }
  if (!g_state.vertex_shader->entry || (g_state.pixel_shader && !g_state.pixel_shader->entry)) {
    ++g_stats.uncached_shader;
    return;
  }
  if (!declaration) {
    ++g_stats.no_declaration;
    return;
  }

  // Graphics settings that drop whole passes: the distortion apply pass
  // (without it the scene stays undistorted) and, with shadows off, the
  // shadow projections that darken the scene.
  if (const GuestShader* ps = g_state.pixel_shader) {
    if ((ps->distortion_apply && !settings::Distortion()) ||
        (ps->shadow_projection && settings::Shadows() == settings::ShadowQuality::kOff)) {
      return;
    }
  }

  Targets targets;
  if (!CollectTargetsLocked(g_state, targets)) {
    ++g_stats.no_targets;
    return;
  }
  const bool reflections = g_state.pixel_shader && g_state.pixel_shader->screen_reflections &&
                           CaptureReflectionSourceLocked(list, targets);

  PipelineKey key;
  key.vertex_shader = g_state.vertex_shader;
  key.pixel_shader = g_state.pixel_shader;
  key.declaration = declaration;
  key.topology = u8(topology);
  if (declaration->integer_tangent_basis)
    key.spec_constants |= kSpecConstantR11G11B10Normal;
  const float alpha_threshold = ReadRenderStates(targets, key);

  if (g_state.vertex_shader->vertices_per_instance_register >= 0 && !use_pattern) {
    if (PrepareGuestInstancingLocked(*g_state.vertex_shader, *declaration, request, key)) {
      ++g_stats.instanced;
    } else {
      GPU_WARN_LIMITED(8, "Instancing vertex shader {:016X} drawn without host instancing: the "
                          "draw's indices do not follow instance * vertices + vertex",
                       g_state.vertex_shader->hash);
    }
  }

  // Textures upload before the targets bind: copies end Vulkan render passes.
  u8 shared[kSharedConstantsSize];
  BuildSharedConstantsLocked(list, targets, *declaration, alpha_threshold, shared);
  if (!BindStreamsLocked(list, *declaration, request, key)) {
    ++g_stats.no_streams;
    return;
  }
  if (!BindTargetsLocked(list, targets)) {
    ++g_stats.no_targets;
    return;
  }

  plume::RenderPipeline* pipeline = GetPipelineLocked(key);
  if (!pipeline) {
    ++g_stats.no_pipeline;
    return;
  }
  if (g_bound.pipeline != pipeline) {
    list->setPipeline(pipeline);
    g_bound.pipeline = pipeline;
  }
  SetViewportAndScissorLocked(list, targets);
  // The reflection registers and the settings' constant overrides ride in
  // this draw's own upload.
  const bool override_constants = PixelConstantOverridesLocked();
  if (reflections || override_constants)
    g_ps_dirty = true;
  BindConstantsLocked(list, shared);
  if (reflections)
    WriteReflectionConstantsLocked(targets);
  if (override_constants)
    WritePixelConstantOverridesLocked();
  TraceDrawLocked(UsedSamplers(g_state.vertex_shader, g_state.pixel_shader), g_state.viewport,
                  guest_primitive, guest_count);

  if (use_pattern) {
    plume::RenderBuffer* pattern = PatternIndicesLocked(quads ? IndexPattern::kQuads : IndexPattern::kFan);
    const u32 index_count = quads ? std::min(request.vertex_count / 4, kMaxExpandedQuads) * 6
                                  : std::min(request.vertex_count >= 3 ? request.vertex_count - 2 : 0,
                                             kMaxExpandedQuads * 2) * 3;
    if (!pattern || !index_count)
      return;
    const plume::RenderIndexBufferView view(plume::RenderBufferReference(pattern, 0),
                                            kMaxExpandedQuads * 6 * 4, plume::RenderFormat::R32_UINT);
    BindIndexBufferLocked(list, view);
    list->drawIndexedInstanced(index_count, 1, 0, i32(request.start_vertex), 0);
    ++g_stats.drawn;
    return;
  }

  if (!request.indexed) {
    list->drawInstanced(request.vertex_count, request.instance_count, request.start_vertex,
                        request.first_instance);
    ++g_stats.drawn;
    return;
  }

  if (request.up_indices) {
    const plume::RenderIndexBufferView view(
        request.up_indices.ref(), request.up_indices.size,
        request.up_indices_32bit ? plume::RenderFormat::R32_UINT : plume::RenderFormat::R16_UINT);
    BindIndexBufferLocked(list, view);
    list->drawIndexedInstanced(request.index_count, request.instance_count, 0, request.base_vertex,
                               request.first_instance);
    ++g_stats.drawn;
    return;
  }
  HostBuffer* indices = g_index_buffer;
  if (!indices || !PrepareBufferLocked(*indices)) {
    GPU_WARN_LIMITED(8, "Indexed draw without a usable index buffer");
    ++g_stats.no_indices;
    return;
  }
  const plume::RenderIndexBufferView view(
      BufferReference(*indices, 0), indices->size,
      indices->index32 ? plume::RenderFormat::R32_UINT : plume::RenderFormat::R16_UINT);
  BindIndexBufferLocked(list, view);
  list->drawIndexedInstanced(request.index_count, request.instance_count, request.start_index,
                             request.base_vertex, request.first_instance);
  ++g_stats.drawn;
}

// User pointer vertices (big-endian, as the title wrote them) into upload
// memory. D3DPT_RECTLIST has three corners per rectangle: the fourth is the
// parallelogram completion v1 + v2 - v0, and each rectangle then draws as a
// quad.
bool UploadUserVerticesLocked(DrawRequest& request, const u8* vertices, u32 bytes) {
  const u32 stride = request.up_stride;
  if (static_cast<d3d::PrimitiveType>(request.primitive) == d3d::PrimitiveType::kRectList &&
      !request.indexed) {
    const u32 rects = request.vertex_count / 3;
    if (!rects || stride % 4)
      return false;
    request.primitive = u32(d3d::PrimitiveType::kQuadList);
    request.vertex_count = rects * 4;
    request.up_vertices = UploadAllocateLocked(rects * 4 * stride, 4);
    if (!request.up_vertices)
      return false;
    const u32 words = stride / 4;
    const auto* source = reinterpret_cast<const u32*>(vertices);
    std::vector<u32> corners(words * 3);
    for (u32 r = 0; r < rects; ++r) {
      rex::memory::copy_and_swap(corners.data(), source + r * 3 * words, words * 3);
      const float* v0 = reinterpret_cast<const float*>(corners.data());
      const float* v1 = v0 + words;
      const float* v2 = v1 + words;
      auto* out = reinterpret_cast<float*>(request.up_vertices.data + r * 4 * stride);
      std::memcpy(out, v0, stride);
      std::memcpy(out + words, v1, stride);
      for (u32 i = 0; i < words; ++i)
        out[2 * words + i] = v1[i] + v2[i] - v0[i];
      std::memcpy(out + 3 * words, v2, stride);
    }
    return true;
  }
  request.up_vertices = UploadAllocateLocked(bytes, 4);
  if (!request.up_vertices)
    return false;
  rex::memory::copy_and_swap(reinterpret_cast<u32*>(request.up_vertices.data),
                             reinterpret_cast<const u32*>(vertices), bytes / 4);
  return true;
}

//------------------------------------------------------------------------------
// Clears
//------------------------------------------------------------------------------

// rects are in guest pixels.
void ClearLocked(const std::vector<plume::RenderRect>& rects, bool whole_viewport,
                 u32 target_mask, bool clear_depth, bool clear_stencil,
                 const plume::RenderColor& color, float z, u32 stencil) {
  plume::RenderCommandList* list = OpenCommandListLocked();
  if (!list)
    return;
  SyncBoundLocked();
  Targets targets;
  if (!CollectTargetsLocked(g_state, targets) || !BindTargetsLocked(list, targets))
    return;

  std::vector<plume::RenderRect> clipped;
  if (whole_viewport) {
    // D3D clears the viewport, clipped by the scissor rect when the test is on.
    const auto& vp = g_state.viewport;
    plume::RenderRect rect(i32(vp.x), i32(vp.y), i32(vp.x + vp.width), i32(vp.y + vp.height));
    if (g_device.scissor_enable != 0) {
      rect.left = std::max(rect.left, g_state.scissor.left);
      rect.top = std::max(rect.top, g_state.scissor.top);
      rect.right = std::min(rect.right, g_state.scissor.right);
      rect.bottom = std::min(rect.bottom, g_state.scissor.bottom);
    }
    clipped.push_back(ScaleRect(rect, targets.scale));
  } else {
    for (const auto& rect : rects)
      clipped.push_back(ScaleRect(rect, targets.scale));
  }
  for (auto& rect : clipped) {
    rect.left = std::clamp(rect.left, 0, i32(targets.width));
    rect.right = std::clamp(rect.right, rect.left, i32(targets.width));
    rect.top = std::clamp(rect.top, 0, i32(targets.height));
    rect.bottom = std::clamp(rect.bottom, rect.top, i32(targets.height));
  }
  std::erase_if(clipped, [](const plume::RenderRect& r) { return r.right <= r.left || r.bottom <= r.top; });
  if (clipped.empty())
    return;
  if (g_trace.active) {
    FlushTraceRunLocked();
    GPU_INFO("trace {}: clear mask {:X} depth {} stencil {} -> RT0 {} DS {} rect {},{}-{},{} ({} rects)",
             g_trace.frame, target_mask, clear_depth, clear_stencil,
             DescribeSurfaceLocked(g_state.render_targets[0]),
             DescribeSurfaceLocked(g_state.depth_stencil), clipped[0].left, clipped[0].top,
             clipped[0].right, clipped[0].bottom, clipped.size());
  }
  const bool full = clipped.size() == 1 && clipped[0].left == 0 && clipped[0].top == 0 &&
                    clipped[0].right == i32(targets.width) &&
                    clipped[0].bottom == i32(targets.height);
  const plume::RenderRect* rect_data = full ? nullptr : clipped.data();
  const u32 rect_count = full ? 0 : u32(clipped.size());

  for (u32 i = 0; i < targets.color_count; ++i) {
    if (target_mask & (1u << i))
      list->clearColor(i, color, rect_data, rect_count);
  }
  if (targets.depth && (clear_depth || clear_stencil))
    list->clearDepthStencil(clear_depth, clear_stencil, z, stencil & 0xFF, rect_data, rect_count);
}

plume::RenderColor ColorFromVector(u32 color_va) {
  if (auto* c = mem::At<be_f32>(color_va))
    return plume::RenderColor(float(c[0]), float(c[1]), float(c[2]), float(c[3]));
  return plume::RenderColor(0.0f, 0.0f, 0.0f, 0.0f);
}

//------------------------------------------------------------------------------
// Packets run on the GPU thread
//------------------------------------------------------------------------------

void RunDraw(const u8* payload, u32 /*size*/) {
  PacketReader reader(payload);
  const auto packet = reader.Get<DrawPacket>();
  g_state = packet.state;
  g_device = packet.device;
  for (u32 mask = packet.sampler_mask; mask; mask &= mask - 1) {
    const u32 r = u32(std::countr_zero(mask));
    const auto sampler = reader.Get<SamplerCapture>();
    std::memcpy(g_texture_words[r], sampler.texture, sizeof(sampler.texture));
    std::memcpy(g_sampler_words[r], sampler.sampler, sizeof(sampler.sampler));
  }
  // The constants count as delivered whatever becomes of the draw.
  if (packet.vs_count) {
    std::memcpy(g_vs_constants + packet.vs_first * 16, reader.Bytes(packet.vs_count * 16u),
                packet.vs_count * 16u);
    g_vs_dirty = true;
  }
  if (packet.ps_count) {
    std::memcpy(g_ps_constants + packet.ps_first * 16, reader.Bytes(packet.ps_count * 16u),
                packet.ps_count * 16u);
    g_ps_dirty = true;
  }
  if (!OpenCommandListLocked())
    return;

  std::fill(std::begin(g_streams), std::end(g_streams), nullptr);
  g_index_buffer = nullptr;
  HostBuffer* captured[d3d::kMaxStreams + 1] = {};
  u32 captured_count = 0;
  for (u32 i = 0; i < packet.buffer_count; ++i) {
    const auto capture = reader.Get<BufferCapture>();
    const u8* contents = capture.contents ? reader.Bytes(capture.header.size) : nullptr;
    const bool index = capture.stream == kIndexStream;
    HostBuffer* buffer = GetBufferLocked(capture.buffer_va, index, capture.header);
    if (!buffer)
      continue;
    if (contents) {
      buffer->captured = contents;
      buffer->needs_upload = true;
      captured[captured_count++] = buffer;
    }
    if (index)
      g_index_buffer = buffer;
    else
      g_streams[capture.stream] = buffer;
  }
  const DrawInput& input = packet.input;
  const u8* up_vertices = reader.Bytes(input.up_vertex_bytes);
  const u8* up_indices = reader.Bytes(input.up_index_bytes);

  DrawRequest request;
  request.primitive = input.primitive;
  request.indexed = input.indexed;
  request.start_vertex = input.start_vertex;
  request.vertex_count = input.vertex_count;
  request.base_vertex = input.base_vertex;
  request.start_index = input.start_index;
  request.index_count = input.index_count;
  bool drawable = true;
  if (input.up_stride) {
    request.up_stride = input.up_stride;
    drawable = up_vertices && UploadUserVerticesLocked(request, up_vertices, input.up_vertex_bytes);
    if (drawable && input.indexed) {
      request.up_indices = UploadAllocateLocked(input.up_index_bytes, 4);
      request.up_indices_32bit = input.up_indices_32bit;
      drawable = request.up_indices && up_indices;
      if (drawable && input.up_indices_32bit) {
        rex::memory::copy_and_swap(reinterpret_cast<u32*>(request.up_indices.data),
                                   reinterpret_cast<const u32*>(up_indices), input.index_count);
      } else if (drawable) {
        rex::memory::copy_and_swap(reinterpret_cast<u16*>(request.up_indices.data),
                                   reinterpret_cast<const u16*>(up_indices), input.index_count);
      }
    }
  }
  if (drawable) {
    if (input.box_key)
      occlusion::BeginBoxLocked(input.box_key);
    DrawLocked(packet.declaration, request);
    if (input.box_key)
      occlusion::EndBoxLocked();
  }

  // Buffers the draw skipped still take the bytes they came with: the
  // recording side will not send them again.
  for (u32 i = 0; i < captured_count; ++i) {
    if (captured[i]->needs_upload)
      PrepareBufferLocked(*captured[i]);
    captured[i]->captured = nullptr;
  }
}

void RunClear(const u8* payload, u32 /*size*/) {
  PacketReader reader(payload);
  const auto packet = reader.Get<ClearPacket>();
  g_state = packet.state;
  g_device.scissor_enable = packet.scissor_enable;
  std::vector<plume::RenderRect> rects(packet.rect_count);
  for (auto& rect : rects)
    rect = reader.Get<plume::RenderRect>();
  ClearLocked(rects, packet.whole_viewport, packet.target_mask, packet.clear_depth,
              packet.clear_stencil, packet.color, packet.z, packet.stencil);
}

void RunResolve(const u8* payload, u32 /*size*/) {
  PacketReader reader(payload);
  const auto packet = reader.Get<ResolvePacket>();
  const ResolveArgs& args = packet.args;
  cost::ScopedCost timed(cost::Costs().resolves);
  plume::RenderCommandList* list = OpenCommandListLocked();
  if (!list)
    return;
  g_state = packet.state;
  SyncBoundLocked();

  const u32 source_index = args.flags & d3d::kResolveSourceMask;
  const bool depth_source = source_index == d3d::kResolveDepthStencil;
  const u32 source_va = depth_source ? g_state.depth_stencil
                                     : (source_index < d3d::kMaxRenderTargets
                                            ? g_state.render_targets[source_index]
                                            : 0);
  HostTexture* source = FindSurfaceLocked(source_va);
  HostTexture* dest = GetTextureLocked(args.dest_texture_va, packet.dest_words);
  if (args.dest_texture_va) {
    ++g_stats.resolves;
    if (!source || !dest) {
      ++g_stats.failed_resolves;
      GPU_WARN_LIMITED(8, "Resolve {:08X} -> {:08X}: source surface {}, destination texture {}",
                       source_va, args.dest_texture_va, source ? "ok" : "missing",
                       dest ? "ok" : "missing");
    }
  }

  const i32* source_rect = packet.has_source_rect ? packet.source_rect : nullptr;
  const i32 point_x = packet.dest_point[0];
  const i32 point_y = packet.dest_point[1];
  if (g_trace.active) {
    FlushTraceRunLocked();
    GPU_INFO("trace {}: resolve flags {:08X} {} rect {} -> {:08X}({}x{} fmt {:08X}) level {} at "
             "{},{}",
             g_trace.frame, args.flags, DescribeSurfaceLocked(source_va),
             source_rect ? std::format("{},{}-{},{}", source_rect[0], source_rect[1],
                                       source_rect[2], source_rect[3])
                         : std::string("full"),
             args.dest_texture_va, dest ? dest->guest_width : 0, dest ? dest->guest_height : 0,
             dest ? dest->d3d_format : 0, args.dest_level, point_x, point_y);
  }

  if (source && dest && source->slot != kInvalidSlot) {
    // The rectangle and destination point are guest pixels. The destination
    // takes the source's scale at its first resolve, so both map alike.
    const float scale = source->scale;
    i32 x1 = 0, y1 = 0, x2 = i32(source->width), y2 = i32(source->height);
    if (source_rect) {
      x1 = std::clamp(ScalePixelEdge(source_rect[0], scale), 0, i32(source->width));
      y1 = std::clamp(ScalePixelEdge(source_rect[1], scale), 0, i32(source->height));
      x2 = std::clamp(ScalePixelEdge(source_rect[2], scale), x1, i32(source->width));
      y2 = std::clamp(ScalePixelEdge(source_rect[3], scale), y1, i32(source->height));
    }
    plume::RenderFramebuffer* framebuffer =
        GetTextureTargetLocked(*dest, args.dest_level, args.dest_slice_or_face, scale,
                               source->format);
    const i32 dest_x = ScalePixelEdge(point_x, dest->scale);
    const i32 dest_y = ScalePixelEdge(point_y, dest->scale);
    const u32 level_width = std::max(dest->width >> args.dest_level, u32(1));
    const u32 level_height = std::max(dest->height >> args.dest_level, u32(1));
    const i32 width = std::min(x2 - x1, i32(level_width) - dest_x);
    const i32 height = std::min(y2 - y1, i32(level_height) - dest_y);
    plume::RenderPipeline* pipeline =
        framebuffer ? (depth_source ? ResolveDepthPipelineLocked(dest->format)
                                    : ResolveColorPipelineLocked(dest->format))
                    : nullptr;
    if (!framebuffer) {
      GPU_WARN_LIMITED(8, "Resolve destination {:08X} cannot be rendered to", args.dest_texture_va);
    } else if (pipeline && width > 0 && height > 0) {
      TransitionTextureLocked(*source, list, plume::RenderTextureLayout::SHADER_READ);
      TransitionTextureLocked(*dest, list, plume::RenderTextureLayout::COLOR_WRITE);
      list->setFramebuffer(framebuffer);
      list->setPipeline(pipeline);
      plume::RenderViewport viewport{float(dest_x), float(dest_y), float(width), float(height)};
      list->setViewports(&viewport, 1);
      plume::RenderRect scissor(dest_x, dest_y, dest_x + width, dest_y + height);
      list->setScissors(&scissor, 1);
      HostPushConstants constants;
      constants.texture_slot = source->slot;
      constants.sampler_slot = kPointClampSamplerSlot;
      constants.values[0] = float(width) / float(source->width);
      constants.values[1] = float(height) / float(source->height);
      constants.values[2] = float(x1) / float(source->width);
      constants.values[3] = float(y1) / float(source->height);
      // D3DRESOLVE_EXPONENTBIAS, the top six bits of the flags.
      constants.values[4] = std::ldexp(1.0f, i32(args.flags) >> 26);
      const d3d::SurfaceCeiling ceiling = d3d::SurfaceCeilingOf(source->d3d_format);
      constants.rows[0][0] = ceiling.rgb;
      constants.rows[0][1] = ceiling.rgb;
      constants.rows[0][2] = ceiling.rgb;
      constants.rows[0][3] = ceiling.alpha;
      SetHostPushConstantsLocked(list, constants);
      list->drawInstanced(3, 1, 0, 0);
      list->setFramebuffer(nullptr);
      TransitionTextureLocked(*dest, list, plume::RenderTextureLayout::SHADER_READ);
      ++dest->resolve_count;
    }
    InvalidateDrawBindingsLocked();
  }

  // The clear covers the resolved rectangle only. Tiled frames resolve and
  // clear one tile at a time; clearing the whole target after the first tile
  // wiped the tiles still to be resolved.
  const bool clear_color = (args.flags & d3d::kResolveClearRenderTarget) != 0 && !depth_source;
  const bool clear_depth = (args.flags & d3d::kResolveClearDepthStencil) != 0;
  if (clear_color || clear_depth) {
    Targets targets;
    if (!CollectTargetsLocked(g_state, targets))
      return;
    std::vector<plume::RenderRect> rects{
        plume::RenderRect(0, 0, i32(targets.guest_width), i32(targets.guest_height))};
    if (source_rect)
      rects[0] = plume::RenderRect(source_rect[0], source_rect[1], source_rect[2], source_rect[3]);
    ClearLocked(rects, false, clear_color ? (1u << source_index) : 0, clear_depth, clear_depth,
                packet.clear_color, args.clear_z, args.clear_stencil);
  }
}

void RunMovieFrame(const u8* payload, u32 /*size*/) {
  PacketReader reader(payload);
  const auto packet = reader.Get<MoviePacket>();
  const MovieFrame& frame = packet.frame;
  plume::RenderCommandList* list = OpenCommandListLocked();
  if (!list)
    return;
  SyncBoundLocked();

  HostTexture* target = FindSurfaceLocked(packet.render_target);
  if (!target || target->depth || target->slot == kInvalidSlot) {
    GPU_WARN_LIMITED(4, "Bink frame without a color render target ({:08X})", packet.render_target);
    return;
  }

  // Planes upload (when Bink decoded into them) before the target binds:
  // copies end Vulkan render passes.
  const u32 planes[] = {frame.y_plane, frame.cr_plane, frame.cb_plane, frame.a_plane};
  u32 slots[4] = {kNullTexture2DSlot, kNullTexture2DSlot, kNullTexture2DSlot, kNullTexture2DSlot};
  for (u32 i = 0; i < 4; ++i) {
    if (HostTexture* plane = GetTextureLocked(planes[i], packet.plane_words[i]);
        plane && plane->slot != kInvalidSlot) {
      PrepareTextureForSamplingLocked(*plane, list);
      slots[i] = plane->slot;
    }
  }
  if (slots[0] == kNullTexture2DSlot) {
    GPU_WARN_LIMITED(4, "Bink frame without a Y plane ({:08X})", frame.y_plane);
    return;
  }

  HostTexture* const colors[] = {target};
  plume::RenderFramebuffer* framebuffer = GetSurfaceFramebufferLocked(colors, 1, nullptr);
  plume::RenderPipeline* pipeline = BinkPipelineLocked(target->format);
  if (!framebuffer || !pipeline || frame.width <= 0.0f || frame.height <= 0.0f)
    return;

  TransitionTextureLocked(*target, list, plume::RenderTextureLayout::COLOR_WRITE);
  list->setFramebuffer(framebuffer);
  list->setPipeline(pipeline);
  // Bink places the frame in guest render target pixels.
  const float x = ScalePixel(frame.x, target->scale);
  const float y = ScalePixel(frame.y, target->scale);
  const float width = ScalePixel(frame.width, target->scale);
  const float height = ScalePixel(frame.height, target->scale);
  plume::RenderViewport viewport{x, y, width, height, 0.0f, 1.0f};
  list->setViewports(&viewport, 1);
  const i32 left = std::clamp(i32(std::lround(x)), 0, i32(target->width));
  const i32 top = std::clamp(i32(std::lround(y)), 0, i32(target->height));
  const i32 right = std::clamp(i32(std::lround(x + width)), left, i32(target->width));
  const i32 bottom = std::clamp(i32(std::lround(y + height)), top, i32(target->height));
  plume::RenderRect scissor(left, top, right, bottom);
  list->setScissors(&scissor, 1);

  HostPushConstants constants;
  constants.texture_slot = slots[0];
  constants.sampler_slot = kLinearClampSamplerSlot;
  // The full frame over the viewport rectangle.
  constants.values[0] = 1.0f;
  constants.values[1] = 1.0f;
  constants.values[2] = 0.0f;
  constants.values[3] = 0.0f;
  constants.values[4] = frame.constant;
  constants.values[5] = frame.alpha;
  constants.texture_slots[0] = slots[1];
  constants.texture_slots[1] = slots[2];
  constants.texture_slots[2] = slots[3];
  constants.flags = frame.a_plane && slots[3] != kNullTexture2DSlot ? 1 : 0;
  std::memcpy(constants.rows, frame.rows, sizeof(constants.rows));
  SetHostPushConstantsLocked(list, constants);
  list->drawInstanced(3, 1, 0, 0);

  InvalidateDrawBindingsLocked();
}

//------------------------------------------------------------------------------
// Recording
//------------------------------------------------------------------------------

// Captures a draw and queues it. The guest pointers in `input` stand for the
// user pointer data here; the packet carries the bytes.
void RecordDraw(u32 dev, const DrawInput& input, u32 up_vertices_va, u32 up_indices_va) {
  u8* device = mem::At<u8>(dev);
  if (!device)
    return;
  RecordTimer timed;
  // The XDK's inline constant setters write the device directly and only
  // raise these masks.
  auto* pending = reinterpret_cast<u64*>(device + dv::kPendingMask);
  if (pending[0] != 0) {
    g_vs_record.dirty = true;
    pending[0] = 0;
  }
  if (pending[1] != 0) {
    g_ps_record.dirty = true;
    pending[1] = 0;
  }

  DrawPacket packet;
  packet.state = g_record;
  CaptureDevice(device, packet.device);
  packet.declaration = RecordedDeclaration(g_record.declaration_va);
  packet.input = input;
  const GuestShader* vs = g_record.vertex_shader;
  const GuestShader* ps = g_record.pixel_shader;
  packet.sampler_mask = u16(UsedSamplers(vs, ps));
  SamplerCapture samplers[d3d::kMaxSamplers];
  u32 sampler_count = 0;
  for (u32 mask = packet.sampler_mask; mask; mask &= mask - 1) {
    const u32 r = u32(std::countr_zero(mask));
    SamplerCapture& sampler = samplers[sampler_count++];
    ReadTextureWords(g_record.textures[r], sampler.texture);
    for (u32 i = 0; i < 6; ++i)
      sampler.sampler[i] = DeviceWord(device, dv::kSamplerStates + r * 24 + i * 4);
  }

  gpu_thread::Recorder recorder;
  TakeConstantRange(g_vs_record, vs, packet.vs_first, packet.vs_count);
  TakeConstantRange(g_ps_record, ps, packet.ps_first, packet.ps_count);

  BufferCapture buffers[d3d::kMaxStreams + 1];
  u64 content_bytes = 0;
  const auto add_buffer = [&](u32 buffer_va, u8 stream) {
    const bool index = stream == kIndexStream;
    const BufferHeader header = ReadBufferHeader(buffer_va, index);
    if (!buffer_va || !header.address || !header.size)
      return;
    BufferCapture& capture = buffers[packet.buffer_count++];
    capture.buffer_va = buffer_va;
    capture.header = header;
    capture.stream = stream;
    capture.contents =
        BufferCaptureNeeded(buffer_va, index, header,
                            index ? kBufferCaptureSlots - 1 : u32(stream)) &&
                       mem::AtGpuAddress(header.address) != nullptr;
    if (capture.contents)
      content_bytes += PacketAlign(header.size);
  };
  if (!input.up_stride) {
    if (const HostVertexDeclaration* declaration = packet.declaration) {
      for (u32 stream = 0; stream < d3d::kMaxStreams; ++stream) {
        if (declaration->streams[stream] && stream != kZeroStream)
          add_buffer(g_record.streams[stream].buffer_va, u8(stream));
      }
    }
    if (input.indexed)
      add_buffer(g_record.indices, kIndexStream);
  }

  const u64 size = u64(PacketAlign(sizeof(DrawPacket))) +
                   u64(sampler_count) * PacketAlign(sizeof(SamplerCapture)) +
                   PacketAlign(packet.vs_count * 16u) + PacketAlign(packet.ps_count * 16u) +
                   u64(packet.buffer_count) * PacketAlign(sizeof(BufferCapture)) + content_bytes +
                   PacketAlign(input.up_vertex_bytes) + PacketAlign(input.up_index_bytes);
  PacketWriter writer(recorder.Reserve(RunDraw, u32(size)));
  writer.Put(packet);
  for (u32 i = 0; i < sampler_count; ++i)
    writer.Put(samplers[i]);
  writer.PutBytes(device + dv::kVsFloatConstants + packet.vs_first * 16u, packet.vs_count * 16u);
  writer.PutBytes(device + dv::kPsFloatConstants + packet.ps_first * 16u, packet.ps_count * 16u);
  for (u32 i = 0; i < packet.buffer_count; ++i) {
    writer.Put(buffers[i]);
    if (buffers[i].contents)
      writer.PutBytes(mem::AtGpuAddress(buffers[i].header.address), buffers[i].header.size);
  }
  writer.PutBytes(mem::At<u8>(up_vertices_va), input.up_vertex_bytes);
  writer.PutBytes(mem::At<u8>(up_indices_va), input.up_index_bytes);
  recorder.Commit(writer.used());
}

void RecordClear(u32 dev, const std::vector<plume::RenderRect>& rects, bool whole_viewport,
                 u32 target_mask, bool clear_depth, bool clear_stencil,
                 const plume::RenderColor& color, float z, u32 stencil) {
  RecordTimer timed;
  ClearPacket packet;
  packet.state = g_record;
  packet.scissor_enable = mem::Load<u32>(dev + dv::kScissorTestEnable);
  packet.rect_count = u32(rects.size());
  packet.target_mask = target_mask;
  packet.whole_viewport = whole_viewport;
  packet.clear_depth = clear_depth;
  packet.clear_stencil = clear_stencil;
  packet.color = color;
  packet.z = z;
  packet.stencil = stencil;
  gpu_thread::Recorder recorder;
  const u32 size = PacketAlign(sizeof(ClearPacket)) +
                   packet.rect_count * PacketAlign(sizeof(plume::RenderRect));
  PacketWriter writer(recorder.Reserve(RunClear, size));
  writer.Put(packet);
  for (const auto& rect : rects)
    writer.Put(rect);
  recorder.Commit(writer.used());
}

}  // namespace

//------------------------------------------------------------------------------
// State setters
//------------------------------------------------------------------------------

// These record into g_record, which belongs to the thread driving the D3D
// device (UE3's render thread, or the game thread while that is stopped for
// loading), the thread that also records the draws. They take no lock: UE3
// calls them many times per draw (the constant setters on every constant).
// The viewport and scissor resets that go with the target setters are the
// hooks' (the title's sub_82E7B758), made through SetViewport and
// SetScissorRect.

void SetRenderTarget(u32 index, u32 surface_va) {
  if (index >= d3d::kMaxRenderTargets)
    return;
  g_record.render_targets[index] = surface_va;
}

void SetDepthStencilSurface(u32 surface_va) {
  g_record.depth_stencil = surface_va;
}

void SetViewport(u32 dev, u32 x, u32 y, u32 width, u32 height, float min_z, float max_z) {
  // Kept as set; the draw clamps it to the bound targets (EffectiveViewport).
  const float values[] = {float(x), float(y), float(width), float(height), min_z, max_z};
  for (u32 i = 0; i < 6; ++i)
    mem::Store<u32>(dev + dv::kViewport + i * 4, std::bit_cast<u32>(values[i]));
  g_record.viewport = plume::RenderViewport(values[0], values[1], values[2], values[3], min_z, max_z);
}

void SetScissorRect(i32 left, i32 top, i32 right, i32 bottom) {
  g_record.scissor = plume::RenderRect(left, top, right, bottom);
}

void SetTexture(u32 sampler, u32 texture_va) {
  if (sampler >= d3d::kMaxSamplers)
    return;
  g_record.textures[sampler] = texture_va;
}

void SetVertexShader(GuestShader* shader) {
  g_record.vertex_shader = shader;
}

void SetPixelShader(GuestShader* shader) {
  g_record.pixel_shader = shader;
}

void SetVertexDeclaration(u32 declaration_va) {
  g_record.declaration_va = declaration_va;
}

void SetStreamSource(u32 stream, u32 buffer_va, u32 offset, u32 stride) {
  if (stream >= d3d::kMaxStreams)
    return;
  g_record.streams[stream] = {buffer_va, offset, stride};
}

void SetIndices(u32 buffer_va) {
  g_record.indices = buffer_va;
}

void MarkVertexShaderConstantsDirty() {
  g_vs_record.dirty = true;
}

void MarkPixelShaderConstantsDirty() {
  g_ps_record.dirty = true;
}

//------------------------------------------------------------------------------
// Spike log
//------------------------------------------------------------------------------

// A frame over kSpikeThreshold gets a line splitting where its time went on
// the render thread and the GPU thread, next to the game thread's last tick,
// so a stall can be pinned on one side before anyone traces it.
constexpr auto kSpikeThreshold = std::chrono::milliseconds(25);
constexpr u32 kSpikeLinesPerSecond = 10;

// The cumulative cost counters at the previous present.
struct CostSnapshot {
  u64 gpu_thread_ns = 0;  // draws (with their uploads and pipeline builds) and resolves
  u64 ring_ns = 0;
  u64 pipeline_ns = 0;
  u64 upload_ns = 0;
  u32 pipelines = 0;
  u32 uploads = 0;
  u64 record_ns = 0;  // the recording side's own, cumulative for the session
  u64 records = 0;
  u64 wait_ns = 0;
};
CostSnapshot g_spike_previous;
// The recording side's totals at the last periodic log.
CostSnapshot g_log_previous;
cost::Clock::time_point g_spike_window{};
u32 g_spike_lines = 0;

CostSnapshot SnapshotCosts(const cost::FrameCosts& costs) {
  CostSnapshot snapshot;
  snapshot.gpu_thread_ns = costs.draws.ns + costs.resolves.ns;
  snapshot.ring_ns = costs.ring_waits.ns;
  snapshot.pipeline_ns = costs.pipelines.ns;
  snapshot.upload_ns = costs.texture_uploads.ns + costs.buffer_uploads.ns;
  snapshot.pipelines = costs.pipelines.count;
  snapshot.uploads = costs.texture_uploads.count + costs.buffer_uploads.count;
  const auto& recording = cost::Recording();
  snapshot.record_ns = recording.record_ns.load(std::memory_order_relaxed);
  snapshot.records = recording.records.load(std::memory_order_relaxed);
  snapshot.wait_ns = recording.wait_ns.load(std::memory_order_relaxed);
  return snapshot;
}

// Called for every present, so the deltas stay per frame.
void LogSpikeLocked(cost::Clock::time_point now, cost::Clock::duration interval, u32 draws,
                    u64 render_sleep_ns) {
  const CostSnapshot current = SnapshotCosts(cost::Costs());
  const CostSnapshot previous = g_spike_previous;
  g_spike_previous = current;
  if (interval <= kSpikeThreshold)
    return;
  if (now - g_spike_window >= std::chrono::seconds(1)) {
    g_spike_window = now;
    g_spike_lines = 0;
  }
  if (++g_spike_lines > kSpikeLinesPerSecond)
    return;

  auto ms = [](u64 ns) { return double(ns) / 1e6; };
  const double frame_ms = std::chrono::duration<double, std::milli>(interval).count();
  const double record_ms = ms(current.record_ns - previous.record_ns);
  const double wait_ms = ms(current.wait_ns - previous.wait_ns);
  const double sleep_ms = ms(render_sleep_ns);
  const double other_ms = std::max(0.0, frame_ms - record_ms - wait_ms - sleep_ms);
  const auto& guest = cost::Guest();
  GPU_INFO("Spike: {:.1f} ms frame ({} draws) | render thread: recording {:.1f} ms, waiting for "
           "the GPU thread {:.1f} ms, waiting on the game thread {:.1f} ms, UE3 rendering and the "
           "rest {:.1f} ms | GPU thread: draw path {:.1f} ms (pipelines {} {:.1f} ms, uploads {} "
           "{:.1f} ms), waiting for a free slot {:.1f} ms | game thread: last tick {:.1f} ms, of "
           "which waiting on the render thread {:.1f} ms",
           frame_ms, draws, record_ms, wait_ms, sleep_ms, other_ms,
           ms(current.gpu_thread_ns - previous.gpu_thread_ns), current.pipelines - previous.pipelines,
           ms(current.pipeline_ns - previous.pipeline_ns), current.uploads - previous.uploads,
           ms(current.upload_ns - previous.upload_ns), ms(current.ring_ns - previous.ring_ns),
           ms(guest.game_tick_ns.load(std::memory_order_relaxed)),
           ms(guest.game_tick_sleep_ns.load(std::memory_order_relaxed)));
}

void LogDrawStatsLocked(const SwapTiming& timing) {
  ++g_present_serial;
  const u32 frame_draws = g_trace.frame_draws;
  // Frame trace: the frame that just presented ends a trace, or counts toward
  // starting the next one.
  if (g_trace.active) {
    FlushTraceRunLocked();
    GPU_INFO("trace {}: present after {} draws", g_trace.frame, g_trace.frame_draws);
    g_trace.active = false;
    ++g_trace.traced;
  } else if (settings::TraceFrame() && g_trace.traced < kTraceFrameCount) {
    g_trace.busy_frames = g_trace.frame_draws >= kTraceMinDraws ? g_trace.busy_frames + 1 : 0;
    if (g_trace.busy_frames >= kTraceSettleFrames) {
      g_trace.busy_frames = 0;
      g_trace.active = true;
      g_trace.run = {};
      ++g_trace.frame;
      GPU_INFO("trace {}: frame begins", g_trace.frame);
    }
  }
  g_trace.frame_draws = 0;

  // Swap to Swap on the render thread. A frame that misses the 33 ms vsync
  // slot shows up as 50 ms.
  auto& costs = cost::Costs();
  const auto now = timing.swap;
  if (costs.last_present != cost::Clock::time_point{}) {
    const auto interval = now - costs.last_present;
    costs.frames.Add(interval);
    if (interval > std::chrono::milliseconds(40))
      ++costs.frames_over_budget;
    LogSpikeLocked(now, interval, frame_draws, timing.render_sleep_ns);
  }
  costs.last_present = now;

  ++g_stats.presents;
  if (g_stats.presents < 300)
    return;
  GPU_INFO("Draws over {} frames: {} of {} drawn ({} host instanced); skipped: no VS {}, uncached "
           "shader {}, no declaration {}, no targets {}, no streams {}, no pipeline {}, no indices "
           "{}, bad primitive {}; resolves {} ({} failed)",
           g_stats.presents, g_stats.drawn, g_stats.calls, g_stats.instanced,
           g_stats.no_vertex_shader, g_stats.uncached_shader, g_stats.no_declaration,
           g_stats.no_targets, g_stats.no_streams, g_stats.no_pipeline, g_stats.no_indices,
           g_stats.unsupported_primitive, g_stats.resolves, g_stats.failed_resolves);
  const double frames = costs.frames.count ? double(costs.frames.count) : 1.0;
  // The submit thread keeps its own totals; take them for this window.
  auto& h = Host();
  const u32 submits = h.submit_count.exchange(0, std::memory_order_relaxed);
  costs.submits.count = submits;
  costs.submits.ns = h.submit_ns.exchange(0, std::memory_order_relaxed);
  costs.submits.max_ns = h.submit_max_ns.exchange(0, std::memory_order_relaxed);
  costs.presents.count = submits;
  costs.presents.ns = h.present_ns.exchange(0, std::memory_order_relaxed);
  costs.presents.max_ns = h.present_max_ns.exchange(0, std::memory_order_relaxed);
  const double submitted = submits ? double(submits) : 1.0;
  const CostSnapshot recording = SnapshotCosts(costs);
  const double records = double(recording.records - g_log_previous.records);
  const double record_ms = double(recording.record_ns - g_log_previous.record_ns) / 1e6;
  const double wait_ms = double(recording.wait_ns - g_log_previous.wait_ns) / 1e6;
  g_log_previous = recording;
  GPU_INFO("Frame cost over {} frames: avg {:.1f} ms, worst {:.1f} ms, {} over 40 ms | render "
           "thread per frame: recording {:.2f} ms ({:.0f} packets, {:.2f} us each), waiting for the "
           "GPU thread {:.2f} ms | GPU thread per frame: draw path {:.2f} ms ({:.0f} draws, {:.1f} "
           "us each), resolves {:.2f} ms | texture uploads {} ({:.1f} MiB) {:.1f} ms, worst {:.1f} "
           "| buffer uploads {} ({:.1f} MiB) {:.1f} ms, worst {:.1f} | new pipelines {} {:.1f} ms, "
           "worst {:.1f} | ring waits {:.1f} ms, worst {:.1f} | submit thread {:.2f} ms per frame, "
           "worst {:.1f} | present {:.1f} ms, worst {:.1f}",
           costs.frames.count, costs.frames.Ms() / frames, costs.frames.MaxMs(),
           costs.frames_over_budget, record_ms / frames, records / frames,
           records ? record_ms * 1000.0 / records : 0.0, wait_ms / frames,
           costs.draws.Ms() / frames, costs.draws.count / frames,
           costs.draws.count ? costs.draws.Ms() * 1000.0 / costs.draws.count : 0.0,
           costs.resolves.Ms() / frames, costs.texture_uploads.count,
           costs.texture_uploads.MiB(), costs.texture_uploads.Ms(), costs.texture_uploads.MaxMs(),
           costs.buffer_uploads.count, costs.buffer_uploads.MiB(), costs.buffer_uploads.Ms(),
           costs.buffer_uploads.MaxMs(), costs.pipelines.count, costs.pipelines.Ms(),
           costs.pipelines.MaxMs(), costs.ring_waits.Ms(), costs.ring_waits.MaxMs(),
           costs.submits.Ms() / submitted, costs.submits.MaxMs(), costs.presents.Ms(),
           costs.presents.MaxMs());
  costs = {.last_present = now};
  g_spike_previous = SnapshotCosts(costs);
  g_stats = {};
}

void InvalidateDrawBindingsLocked() {
  g_bound = {};
  g_vs_dirty = true;
  g_ps_dirty = true;
}

//------------------------------------------------------------------------------
// Draws
//------------------------------------------------------------------------------

void DrawVertices(u32 dev, u32 primitive, u32 start_vertex, u32 vertex_count) {
  if (!vertex_count)
    return;
  DrawInput input;
  input.primitive = primitive;
  input.start_vertex = start_vertex;
  input.vertex_count = vertex_count;
  RecordDraw(dev, input, 0, 0);
}

void DrawIndexedVertices(u32 dev, u32 primitive, i32 base_vertex, u32 start_index,
                         u32 index_count) {
  if (!index_count)
    return;
  DrawInput input;
  input.primitive = primitive;
  input.indexed = true;
  input.base_vertex = base_vertex;
  input.start_index = start_index;
  input.index_count = index_count;
  RecordDraw(dev, input, 0, 0);
}

void DrawVerticesUP(u32 dev, u32 primitive, u32 vertex_count, u32 vertices_va, u32 stride) {
  if (!vertex_count || !stride || !mem::At<u8>(vertices_va))
    return;
  DrawInput input;
  input.primitive = primitive;
  input.vertex_count = vertex_count;
  input.up_stride = stride;
  input.up_vertex_bytes = (vertex_count * stride + 3) & ~u32(3);
  RecordDraw(dev, input, vertices_va, 0);
}

void DrawIndexedVerticesUP(u32 dev, u32 primitive, i32 base_vertex, u32 vertex_count,
                           u32 index_count, u32 indices_va, bool indices_32bit, u32 vertices_va,
                           u32 stride, u64 box_key) {
  if (!index_count || !vertex_count || !mem::At<u8>(vertices_va) || !mem::At<u8>(indices_va) ||
      !stride) {
    return;
  }
  DrawInput input;
  input.primitive = primitive;
  input.indexed = true;
  input.base_vertex = base_vertex;
  input.vertex_count = vertex_count;
  input.index_count = index_count;
  input.up_stride = stride;
  input.up_vertex_bytes = (vertex_count * stride + 3) & ~u32(3);
  input.up_index_bytes = (index_count * (indices_32bit ? 4 : 2) + 3) & ~u32(3);
  input.up_indices_32bit = indices_32bit;
  input.box_key = box_key;
  RecordDraw(dev, input, vertices_va, indices_va);
}

//------------------------------------------------------------------------------
// Clears, tiling and resolves
//------------------------------------------------------------------------------

void Clear(u32 dev, u32 rect_count, u32 rects_va, u32 flags, u32 color, float z, u32 stencil) {
  std::vector<plume::RenderRect> rects;
  const bool whole_viewport = rect_count == 0 || rects_va == 0;
  for (u32 i = 0; !whole_viewport && i < rect_count; ++i) {
    const auto* rect = mem::At<d3d::Rect>(rects_va + i * sizeof(d3d::Rect));
    rects.emplace_back(i32(rect->left), i32(rect->top), i32(rect->right), i32(rect->bottom));
  }
  const plume::RenderColor clear_color(float((color >> 16) & 0xFF) / 255.0f,
                                       float((color >> 8) & 0xFF) / 255.0f,
                                       float(color & 0xFF) / 255.0f,
                                       float((color >> 24) & 0xFF) / 255.0f);
  RecordClear(dev, rects, whole_viewport, flags & d3d::kClearTargetAll,
              (flags & d3d::kClearZBuffer) != 0, (flags & d3d::kClearStencil) != 0, clear_color, z,
              stencil);
}

void BeginTiling(u32 dev, u32 flags, u32 tile_count, u32 tile_rects_va, u32 clear_color_va,
                 float z, u32 stencil) {
  const plume::RenderColor color = ColorFromVector(clear_color_va);

  // Tile rects are in guest pixels of the whole tiled area.
  u32 width = 0, height = 0;
  for (u32 i = 0; i < tile_count; ++i) {
    const auto* rect = mem::At<d3d::Rect>(tile_rects_va + i * sizeof(d3d::Rect));
    if (!rect)
      break;
    width = std::max(width, u32(std::max(i32(rect->right), 0)));
    height = std::max(height, u32(std::max(i32(rect->bottom), 0)));
  }

  // Growing the surfaces widens the recording side's viewport and scissor,
  // so it happens here once the GPU thread has caught up with them. PotF's
  // retail build does not tile.
  WaitForGpuThread(0);
  Targets targets;
  bool have_targets;
  {
    std::lock_guard lock(Host().mutex);
    if (g_trace.active) {
      FlushTraceRunLocked();
      GPU_INFO("trace {}: BeginTiling flags {:X}, {} tiles over {}x{}, RT0 {} DS {}", g_trace.frame,
               flags, tile_count, width, height, DescribeSurfaceLocked(g_record.render_targets[0]),
               DescribeSurfaceLocked(g_record.depth_stencil));
    }
    if (width && height)
      GrowBoundSurfacesLocked(g_record, width, height);
    have_targets = CollectTargetsLocked(g_record, targets);
  }

  // Flags 1 and 2 skip the clear of the bound targets.
  if ((flags & 3) || !have_targets)
    return;
  const std::vector<plume::RenderRect> rects{
      plume::RenderRect(0, 0, i32(targets.guest_width), i32(targets.guest_height))};
  RecordClear(dev, rects, false, d3d::kClearTargetAll, true, true, color, z, stencil);
}

void Resolve(u32 dev, const ResolveArgs& args) {
  if (!dev)
    return;
  RecordTimer timed;
  ResolvePacket packet;
  packet.state = g_record;
  packet.args = args;
  if (const auto* rect = mem::At<d3d::Rect>(args.source_rect_va)) {
    packet.has_source_rect = true;
    packet.source_rect[0] = rect->left;
    packet.source_rect[1] = rect->top;
    packet.source_rect[2] = rect->right;
    packet.source_rect[3] = rect->bottom;
  }
  if (const auto* point = mem::At<be_i32>(args.dest_point_va)) {
    packet.dest_point[0] = point[0];
    packet.dest_point[1] = point[1];
  }
  packet.clear_color = ColorFromVector(args.clear_color_va);
  ReadTextureWords(args.dest_texture_va, packet.dest_words);
  gpu_thread::Queue(RunResolve, packet);
}

void DrawMovieFrame(const MovieFrame& frame) {
  RecordTimer timed;
  MoviePacket packet;
  packet.render_target = g_record.render_targets[0];
  packet.frame = frame;
  const u32 planes[] = {frame.y_plane, frame.cr_plane, frame.cb_plane, frame.a_plane};
  for (u32 i = 0; i < 4; ++i)
    ReadTextureWords(planes[i], packet.plane_words[i]);
  gpu_thread::Queue(RunMovieFrame, packet);
}

}  // namespace redahm::gpu

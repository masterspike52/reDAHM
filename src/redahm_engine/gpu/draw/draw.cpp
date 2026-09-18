#include "draw/draw.h"

#include <algorithm>
#include <array>
#include <bit>
#include <cmath>
#include <cstring>
#include <format>
#include <mutex>
#include <string>
#include <vector>

#include <plume_render_interface.h>
#include <rex/graphics/registers.h>
#include <rex/graphics/xenos.h>
#include <rex/memory/utils.h>

#include "core/guest_memory.h"
#include "core/log.h"
#include "core/settings.h"
#include "d3d/d3d_device.h"
#include "d3d/d3d_formats.h"
#include "pipeline/pipeline_cache.h"
#include "render/host.h"
#include "render/host_pipelines.h"
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
  bool vs_constants_dirty = true;
  bool ps_constants_dirty = true;
};
DrawState g_state;

// What the open command list has bound.
struct BoundState {
  u64 generation = ~u64{0};
  plume::RenderPipeline* pipeline = nullptr;
  plume::RenderFramebuffer* framebuffer = nullptr;
  UploadAllocation vs_constants;
  UploadAllocation ps_constants;
  u8 shared_constants[kSharedConstantsSize] = {};
  bool shared_valid = false;
};
BoundState g_bound;

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
    g_state.vs_constants_dirty = true;
    g_state.ps_constants_dirty = true;
  }
}

void ResetViewportToSurfaceLocked(u32 surface_va) {
  HostTexture* surface = FindSurfaceLocked(surface_va);
  if (!surface)
    return;
  g_state.viewport = plume::RenderViewport(0.0f, 0.0f, float(surface->width),
                                           float(surface->height), 0.0f, 1.0f);
  g_state.scissor = plume::RenderRect(0, 0, i32(surface->width), i32(surface->height));
}

//------------------------------------------------------------------------------
// Targets
//------------------------------------------------------------------------------

struct Targets {
  HostTexture* colors[d3d::kMaxRenderTargets] = {};
  u32 color_count = 0;
  HostTexture* depth = nullptr;
  u32 width = 0;
  u32 height = 0;
};

bool CollectTargetsLocked(Targets& out) {
  for (u32 i = 0; i < d3d::kMaxRenderTargets; ++i) {
    HostTexture* surface = FindSurfaceLocked(g_state.render_targets[i]);
    if (!surface || surface->depth)
      break;
    if (out.color_count && (surface->width != out.width || surface->height != out.height))
      break;
    out.colors[out.color_count++] = surface;
    out.width = surface->width;
    out.height = surface->height;
  }
  if (HostTexture* depth = FindSurfaceLocked(g_state.depth_stencil); depth && depth->depth) {
    if (!out.color_count) {
      out.depth = depth;
      out.width = depth->width;
      out.height = depth->height;
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

// Grows the bound surfaces to cover a tiled area. SetRenderTarget reset the
// viewport and scissor to the tile-sized surface before BeginTiling; a reset
// left untouched is widened with it.
void GrowBoundSurfacesLocked(u32 width, u32 height) {
  HostTexture* first = FindSurfaceLocked(g_state.render_targets[0]);
  if (!first)
    first = FindSurfaceLocked(g_state.depth_stencil);
  if (!first)
    return;
  const float old_width = float(first->width);
  const float old_height = float(first->height);

  bool grown = false;
  for (u32 i = 0; i < d3d::kMaxRenderTargets; ++i) {
    if (HostTexture* surface = FindSurfaceLocked(g_state.render_targets[i]))
      grown |= GrowSurfaceLocked(*surface, width, height);
  }
  if (HostTexture* depth = FindSurfaceLocked(g_state.depth_stencil))
    grown |= GrowSurfaceLocked(*depth, width, height);
  if (!grown)
    return;
  // The framebuffers holding the old textures are retired.
  InvalidateDrawBindingsLocked();

  auto& vp = g_state.viewport;
  if (vp.x == 0.0f && vp.y == 0.0f && vp.width == old_width && vp.height == old_height) {
    vp.width = float(first->width);
    vp.height = float(first->height);
  }
  auto& sc = g_state.scissor;
  if (sc.left == 0 && sc.top == 0 && sc.right == i32(old_width) && sc.bottom == i32(old_height)) {
    sc.right = i32(first->width);
    sc.bottom = i32(first->height);
  }
}

// D3DRS_VIEWPORTENABLE. Bink's movie quad turns it off and passes render
// target pixel positions through its vertex shader.
bool ViewportTransformEnabled(u32 dev) {
  return (mem::Load<u32>(dev + dv::kViewportEnable) & dv::kViewportEnableTransformMask) != 0;
}

plume::RenderViewport EffectiveViewport(u32 dev, const Targets& targets) {
  // Without the viewport transform the shaders map pixels to clip space over
  // the whole target (BuildSharedConstantsLocked).
  plume::RenderViewport viewport =
      ViewportTransformEnabled(dev)
          ? g_state.viewport
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

void SetViewportAndScissorLocked(u32 dev, plume::RenderCommandList* list, const Targets& targets) {
  const plume::RenderViewport viewport = EffectiveViewport(dev, targets);
  list->setViewports(&viewport, 1);

  // D3DRS_SCISSORTESTENABLE clips to the scissor rect, otherwise to the
  // viewport.
  plume::RenderRect rect(i32(viewport.x), i32(viewport.y), i32(viewport.x + viewport.width),
                         i32(viewport.y + viewport.height));
  if (mem::Load<u32>(dev + dv::kScissorTestEnable) != 0) {
    rect.left = std::max(rect.left, g_state.scissor.left);
    rect.top = std::max(rect.top, g_state.scissor.top);
    rect.right = std::min(rect.right, g_state.scissor.right);
    rect.bottom = std::min(rect.bottom, g_state.scissor.bottom);
  }
  rect.left = std::clamp(rect.left, 0, i32(targets.width));
  rect.right = std::clamp(rect.right, rect.left, i32(targets.width));
  rect.top = std::clamp(rect.top, 0, i32(targets.height));
  rect.bottom = std::clamp(rect.bottom, rect.top, i32(targets.height));
  list->setScissors(&rect, 1);
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
  // RB_COLOR_INFO / RB_DEPTH_INFO in the header: EDRAM base in tiles.
  const u32 edram_base = mem::Load<u32>(surface_va + 28) & 0xFFF;
  return std::format("{:08X}({}x{} fmt {:08X} edram {})", surface_va, surface->width,
                     surface->height, surface->d3d_format, edram_base);
}

std::string DescribeTextureLocked(u32 texture_va) {
  HostTexture* texture = GetTextureLocked(texture_va);
  if (!texture)
    return std::format("{:08X}(none)", texture_va);
  return std::format("{:08X}({}x{} fmt {:08X}{})", texture_va, texture->width, texture->height,
                     texture->d3d_format, texture->gpu_written ? " resolved" : "");
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

void TraceDrawLocked(u32 dev, const plume::RenderViewport& viewport, u32 primitive, u32 count) {
  if (!g_trace.active)
    return;
  TraceRun& run = g_trace.run;
  if (count <= kTraceDetailMaxCount) {
    FlushTraceRunLocked();
    std::string textures;
    for (u32 s = 0; s < d3d::kMaxSamplers; ++s) {
      if (g_state.textures[s])
        textures += std::format(" s{} {}", s, DescribeTextureLocked(g_state.textures[s]));
    }
    GPU_INFO("trace {}:   draw prim {} count {} -> RT0 {} viewport {},{} {}x{} VS {:016X} PS "
             "{:016X} vp-transform {} blend {:08X}{}",
             g_trace.frame, primitive, count, DescribeSurfaceLocked(g_state.render_targets[0]),
             viewport.x, viewport.y, viewport.width, viewport.height,
             g_state.vertex_shader ? g_state.vertex_shader->hash : 0,
             g_state.pixel_shader ? g_state.pixel_shader->hash : 0, ViewportTransformEnabled(dev),
             mem::Load<u32>(dev + dv::kBlendState0), textures);
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
Register ReadRegister(u32 dev, u32 offset) {
  Register value;
  value.value = mem::Load<u32>(dev + offset);
  return value;
}

float ReadFloat(u32 dev, u32 offset) {
  const u32 bits = mem::Load<u32>(dev + offset);
  float value;
  std::memcpy(&value, &bits, 4);
  return value;
}

// The render states the title's D3DRS setters stored, into the pipeline key.
// Returns the alpha test threshold for the shared constants.
float ReadRenderStates(u32 dev, const Targets& targets, PipelineKey& key) {
  static constexpr u32 kBlendOffsets[] = {dv::kBlendState0, dv::kBlendState1, dv::kBlendState2,
                                          dv::kBlendState3};
  key.render_target_count = u8(targets.color_count);
  for (u32 i = 0; i < targets.color_count; ++i) {
    key.render_target_formats[i] = u8(targets.colors[i]->format);
    const auto blend = ReadRegister<reg::RB_BLENDCONTROL>(dev, kBlendOffsets[i]);
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
    packed[7] = u8(mem::Load<u32>(dev + dv::kColorWriteEnable + i * 4) & 0xF);
  }

  const auto depth = ReadRegister<reg::RB_DEPTHCONTROL>(dev, dv::kDepthStencilState);
  if (targets.depth) {
    key.depth_format = u8(targets.depth->format);
    key.depth_enable = depth.z_enable;
    key.depth_write = depth.z_enable && depth.z_write_enable;
    key.depth_func = u8(d3d::ConvertCompare(u32(depth.zfunc)));
    if (depth.stencil_enable) {
      const u32 stencil = mem::Load<u32>(dev + dv::kStencilRef);
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
  const auto raster = ReadRegister<reg::PA_SU_SC_MODE_CNTL>(dev, dv::kRasterState);
  key.cull_mode = u8(raster.cull_front  ? plume::RenderCullMode::FRONT
                     : raster.cull_back ? plume::RenderCullMode::BACK
                                        : plume::RenderCullMode::NONE);
  key.front_face =
      u8(raster.face ? plume::RenderFrontFace::CLOCKWISE : plume::RenderFrontFace::COUNTER_CLOCKWISE);
  if (targets.depth && (raster.poly_offset_front_enable || raster.poly_offset_back_enable)) {
    key.depth_bias = i32(std::lround(double(ReadFloat(dev, dv::kDepthBias)) * double(1 << 24)));
    key.slope_scaled_depth_bias = ReadFloat(dev, dv::kSlopeScaleDepthBias);
  }

  // D3DRS_ALPHATESTENABLE / ALPHAFUNC / ALPHAREF. The shaders discard below
  // g_AlphaThreshold.
  const auto alpha = ReadRegister<reg::RB_COLORCONTROL>(dev, dv::kAlphaTestState);
  if (alpha.alpha_test_enable && targets.color_count) {
    const float ref = ReadFloat(dev, dv::kAlphaRef);
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
UploadAllocation UploadShaderConstantsLocked(u32 guest_va) {
  UploadAllocation allocation = UploadAllocateLocked(kShaderConstantsSize, 256);
  if (!allocation)
    return allocation;
  const auto* src = mem::At<u32>(guest_va);
  auto* dst = reinterpret_cast<u32*>(allocation.data);
  for (u32 i = 0; i < kShaderConstantsSize / 4; ++i) {
    const u32 v = std::byteswap(src[i]);
    dst[i] = (v & 0x7FFFFFFFu) > 0x7F800000u ? 0u : v;
  }
  return allocation;
}

void BuildSharedConstantsLocked(u32 dev, plume::RenderCommandList* list, const Targets& targets,
                                const HostVertexDeclaration& declaration, float alpha_threshold,
                                u8* out) {
  std::memset(out, 0, kSharedConstantsSize);
  auto put_u32 = [out](u32 offset, u32 value) { std::memcpy(out + offset, &value, 4); };
  auto put_f32 = [out](u32 offset, float value) { std::memcpy(out + offset, &value, 4); };

  for (u32 r = 0; r < d3d::kMaxSamplers; ++r) {
    u32 slot_2d = kNullTexture2DSlot;
    u32 slot_3d = kNullTexture3DSlot;
    u32 slot_cube = kNullTextureCubeSlot;
    u32 sampler = kLinearClampSamplerSlot;
    if (HostTexture* texture = GetTextureLocked(g_state.textures[r]);
        texture && texture->slot != kInvalidSlot) {
      PrepareTextureForSamplingLocked(*texture, list);
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
      // Sampler state as the title's D3DSAMP setters stored it.
      u32 words[6];
      for (u32 i = 0; i < 6; ++i)
        words[i] = mem::Load<u32>(dev + dv::kSamplerStates + r * 24 + i * 4);
      sampler = GetSamplerSlotLocked(
          words, texture->view_dimension == plume::RenderTextureViewDimension::TEXTURE_3D);
    }
    put_u32(r * 4, slot_2d);
    put_u32(64 + r * 4, slot_3d);
    put_u32(128 + r * 4, slot_cube);
    put_u32(192 + r * 4, sampler);
  }

  // Bits 0-15 vertex shader booleans, 16-31 pixel shader booleans.
  const u32 vs_bools = mem::Load<u32>(dev + dv::kVsBoolConstants) & 0xFFFF;
  const u32 ps_bools = mem::Load<u32>(dev + dv::kPsBoolConstants) & 0xFFFF;
  put_u32(256, vs_bools | (ps_bools << 16));
  put_u32(260, declaration.swapped_texcoords);
  // The vertex shaders finish with oPos.xy = oPos.xy * g_PositionScale +
  // g_HalfPixelOffset * oPos.w. With the viewport transform off the positions
  // are target pixels, mapped here onto clip space over the whole target.
  float offset_x = 0.0f, offset_y = 0.0f, scale_x = 1.0f, scale_y = 1.0f;
  if (!ViewportTransformEnabled(dev) && targets.width && targets.height) {
    scale_x = 2.0f / float(targets.width);
    scale_y = -2.0f / float(targets.height);
    offset_x = -1.0f;
    offset_y = 1.0f;
  }
  put_f32(264, offset_x);
  put_f32(268, offset_y);
  put_f32(272, alpha_threshold);
  put_u32(276, declaration.sint_texcoords);
  put_f32(280, scale_x);
  put_f32(284, scale_y);
}

void BindConstantsLocked(plume::RenderCommandList* list, u32 dev, const u8* shared_block) {
  // D3D's pending masks catch the XDK's inline constant setters, which write
  // the device directly instead of calling the hooked functions.
  auto* pending = mem::At<be_u64>(dev + dv::kPendingMask);
  if (u64(pending[0]) != 0) {
    g_state.vs_constants_dirty = true;
    pending[0] = 0;
  }
  if (u64(pending[1]) != 0) {
    g_state.ps_constants_dirty = true;
    pending[1] = 0;
  }
  if (g_state.vs_constants_dirty || !g_bound.vs_constants) {
    g_bound.vs_constants = UploadShaderConstantsLocked(dev + dv::kVsFloatConstants);
    g_state.vs_constants_dirty = false;
    if (Host().vulkan) {
      list->setGraphicsPushConstants(0, &g_bound.vs_constants.device_address, 0, 8);
    } else {
      list->setGraphicsRootDescriptor(g_bound.vs_constants.ref(), 0);
    }
  }
  if (g_state.ps_constants_dirty || !g_bound.ps_constants) {
    g_bound.ps_constants = UploadShaderConstantsLocked(dev + dv::kPsFloatConstants);
    g_state.ps_constants_dirty = false;
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
  slots[kZeroStream] = plume::RenderInputSlot(kZeroStream, 16,
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
    HostBuffer* buffer = GetVertexBufferLocked(binding.buffer_va);
    if (!buffer || !binding.stride || binding.offset >= buffer->size || !PrepareBufferLocked(*buffer)) {
      GPU_WARN_LIMITED(8, "Draw without a usable vertex buffer on stream {}", stream);
      return false;
    }
    views[stream] = plume::RenderVertexBufferView(
        plume::RenderBufferReference(buffer->buffer.get(), binding.offset),
        buffer->size - binding.offset);
    slots[stream] = plume::RenderInputSlot(stream, binding.stride);
    key.vertex_strides[stream] = u16(binding.stride);
  }
  list->setVertexBuffers(0, views.data(), d3d::kMaxStreams, slots.data());
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

  // User-pointer indices were byte swapped on upload; a bound index buffer is
  // still the guest's big-endian copy.
  const u8* source = nullptr;
  bool source32 = false;
  bool swap = false;
  if (request.up_indices) {
    source = request.up_indices.data;
    source32 = request.up_indices_32bit;
  } else {
    HostBuffer* buffer = GetIndexBufferLocked(g_state.indices);
    if (!buffer)
      return false;
    const u8* guest = mem::AtGpuAddress(buffer->guest_address);
    if (!guest)
      return false;
    source32 = buffer->index32;
    swap = true;
    source = guest + size_t(request.start_index) * (source32 ? 4 : 2);
  }

  const auto read = [&](u32 i) -> u32 {
    if (source32) {
      u32 value;
      std::memcpy(&value, source + size_t(i) * 4, sizeof(value));
      return swap ? std::byteswap(value) : value;
    }
    u16 value;
    std::memcpy(&value, source + size_t(i) * 2, sizeof(value));
    return swap ? std::byteswap(value) : value;
  };

  const u32 triangles = quads ? source_count / 4 * 2 : source_count - 2;
  const u32 index_count = triangles * 3;
  UploadAllocation expanded = UploadAllocateLocked(index_count * 4, 4);
  if (!expanded)
    return false;
  auto* out = reinterpret_cast<u32*>(expanded.data);
  if (quads) {
    for (u32 quad = 0; quad < source_count / 4; ++quad) {
      const u32 v0 = read(quad * 4), v1 = read(quad * 4 + 1);
      const u32 v2 = read(quad * 4 + 2), v3 = read(quad * 4 + 3);
      const u32 corners[] = {v0, v1, v2, v0, v2, v3};
      std::memcpy(out + quad * 6, corners, sizeof(corners));
    }
  } else {
    const u32 hub = read(0);
    for (u32 triangle = 0; triangle < triangles; ++triangle) {
      out[triangle * 3] = hub;
      out[triangle * 3 + 1] = read(triangle + 1);
      out[triangle * 3 + 2] = read(triangle + 2);
    }
  }

  request.up_indices = expanded;
  request.up_indices_32bit = true;
  request.index_count = index_count;
  request.start_index = 0;
  return true;
}

void DrawLocked(u32 dev, DrawRequest& request) {
  plume::RenderCommandList* list = OpenCommandListLocked();
  if (!list || !dev)
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
  HostVertexDeclaration* declaration = FindVertexDeclaration(g_state.declaration_va);
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

  Targets targets;
  if (!CollectTargetsLocked(targets)) {
    ++g_stats.no_targets;
    return;
  }

  PipelineKey key;
  key.vertex_shader = g_state.vertex_shader;
  key.pixel_shader = g_state.pixel_shader;
  key.declaration = declaration;
  key.topology = u8(topology);
  if (declaration->integer_tangent_basis)
    key.spec_constants |= kSpecConstantR11G11B10Normal;
  const float alpha_threshold = ReadRenderStates(dev, targets, key);

  // Textures upload before the targets bind: copies end Vulkan render passes.
  u8 shared[kSharedConstantsSize];
  BuildSharedConstantsLocked(dev, list, targets, *declaration, alpha_threshold, shared);
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
  SetViewportAndScissorLocked(dev, list, targets);
  BindConstantsLocked(list, dev, shared);
  TraceDrawLocked(dev, EffectiveViewport(dev, targets), guest_primitive, guest_count);

  if (use_pattern) {
    plume::RenderBuffer* pattern = PatternIndicesLocked(quads ? IndexPattern::kQuads : IndexPattern::kFan);
    const u32 index_count = quads ? std::min(request.vertex_count / 4, kMaxExpandedQuads) * 6
                                  : std::min(request.vertex_count >= 3 ? request.vertex_count - 2 : 0,
                                             kMaxExpandedQuads * 2) * 3;
    if (!pattern || !index_count)
      return;
    const plume::RenderIndexBufferView view(plume::RenderBufferReference(pattern, 0),
                                            kMaxExpandedQuads * 6 * 4, plume::RenderFormat::R32_UINT);
    list->setIndexBuffer(&view);
    list->drawIndexedInstanced(index_count, 1, 0, i32(request.start_vertex), 0);
    ++g_stats.drawn;
    return;
  }

  if (!request.indexed) {
    list->drawInstanced(request.vertex_count, 1, request.start_vertex, 0);
    ++g_stats.drawn;
    return;
  }

  if (request.up_indices) {
    const plume::RenderIndexBufferView view(
        request.up_indices.ref(), request.up_indices.size,
        request.up_indices_32bit ? plume::RenderFormat::R32_UINT : plume::RenderFormat::R16_UINT);
    list->setIndexBuffer(&view);
    list->drawIndexedInstanced(request.index_count, 1, 0, request.base_vertex, 0);
    ++g_stats.drawn;
    return;
  }
  HostBuffer* indices = GetIndexBufferLocked(g_state.indices);
  if (!indices || !PrepareBufferLocked(*indices)) {
    GPU_WARN_LIMITED(8, "Indexed draw without a usable index buffer");
    ++g_stats.no_indices;
    return;
  }
  const plume::RenderIndexBufferView view(
      plume::RenderBufferReference(indices->buffer.get(), 0), indices->size,
      indices->index32 ? plume::RenderFormat::R32_UINT : plume::RenderFormat::R16_UINT);
  list->setIndexBuffer(&view);
  list->drawIndexedInstanced(request.index_count, 1, request.start_index, request.base_vertex, 0);
  ++g_stats.drawn;
}

//------------------------------------------------------------------------------
// Clears
//------------------------------------------------------------------------------

void ClearLocked(u32 dev, const std::vector<plume::RenderRect>& rects, bool whole_viewport,
                 u32 target_mask, bool clear_depth, bool clear_stencil,
                 const plume::RenderColor& color, float z, u32 stencil) {
  plume::RenderCommandList* list = OpenCommandListLocked();
  if (!list)
    return;
  SyncBoundLocked();
  Targets targets;
  if (!CollectTargetsLocked(targets) || !BindTargetsLocked(list, targets))
    return;

  std::vector<plume::RenderRect> clipped;
  if (whole_viewport) {
    // D3D clears the viewport, clipped by the scissor rect when the test is on.
    const auto& vp = g_state.viewport;
    plume::RenderRect rect(i32(vp.x), i32(vp.y), i32(vp.x + vp.width), i32(vp.y + vp.height));
    if (mem::Load<u32>(dev + dv::kScissorTestEnable) != 0) {
      rect.left = std::max(rect.left, g_state.scissor.left);
      rect.top = std::max(rect.top, g_state.scissor.top);
      rect.right = std::min(rect.right, g_state.scissor.right);
      rect.bottom = std::min(rect.bottom, g_state.scissor.bottom);
    }
    clipped.push_back(rect);
  } else {
    clipped = rects;
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

}  // namespace

//------------------------------------------------------------------------------
// State setters
//------------------------------------------------------------------------------

void SetRenderTarget(u32 index, u32 surface_va) {
  if (index >= d3d::kMaxRenderTargets)
    return;
  std::lock_guard lock(Host().mutex);
  g_state.render_targets[index] = surface_va;
  // D3DDevice_SetRenderTarget resets the viewport and scissor to the target.
  if (index == 0)
    ResetViewportToSurfaceLocked(surface_va);
}

void SetDepthStencilSurface(u32 surface_va) {
  std::lock_guard lock(Host().mutex);
  g_state.depth_stencil = surface_va;
  if (!g_state.render_targets[0])
    ResetViewportToSurfaceLocked(surface_va);
}

void SetViewport(float x, float y, float width, float height, float min_z, float max_z) {
  std::lock_guard lock(Host().mutex);
  g_state.viewport = plume::RenderViewport(x, y, width, height, min_z, max_z);
}

void SetScissorRect(i32 left, i32 top, i32 right, i32 bottom) {
  std::lock_guard lock(Host().mutex);
  g_state.scissor = plume::RenderRect(left, top, right, bottom);
}

void SetTexture(u32 sampler, u32 texture_va) {
  if (sampler >= d3d::kMaxSamplers)
    return;
  std::lock_guard lock(Host().mutex);
  g_state.textures[sampler] = texture_va;
}

void SetVertexShader(GuestShader* shader) {
  std::lock_guard lock(Host().mutex);
  g_state.vertex_shader = shader;
}

void SetPixelShader(GuestShader* shader) {
  std::lock_guard lock(Host().mutex);
  g_state.pixel_shader = shader;
}

void SetVertexDeclaration(u32 declaration_va) {
  std::lock_guard lock(Host().mutex);
  g_state.declaration_va = declaration_va;
}

void SetStreamSource(u32 stream, u32 buffer_va, u32 offset, u32 stride) {
  if (stream >= d3d::kMaxStreams)
    return;
  std::lock_guard lock(Host().mutex);
  g_state.streams[stream] = {buffer_va, offset, stride};
}

void SetIndices(u32 buffer_va) {
  std::lock_guard lock(Host().mutex);
  g_state.indices = buffer_va;
}

void MarkVertexShaderConstantsDirty() {
  std::lock_guard lock(Host().mutex);
  g_state.vs_constants_dirty = true;
}

void MarkPixelShaderConstantsDirty() {
  std::lock_guard lock(Host().mutex);
  g_state.ps_constants_dirty = true;
}

void LogDrawStatsLocked() {
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

  ++g_stats.presents;
  if (g_stats.presents < 300)
    return;
  GPU_INFO("Draws over {} frames: {} of {} drawn; skipped: no VS {}, uncached shader {}, "
           "no declaration {}, no targets {}, no streams {}, no pipeline {}, no indices {}, "
           "bad primitive {}; resolves {} ({} failed)",
           g_stats.presents, g_stats.drawn, g_stats.calls, g_stats.no_vertex_shader,
           g_stats.uncached_shader, g_stats.no_declaration, g_stats.no_targets, g_stats.no_streams,
           g_stats.no_pipeline, g_stats.no_indices, g_stats.unsupported_primitive, g_stats.resolves,
           g_stats.failed_resolves);
  g_stats = {};
}

void InvalidateDrawBindingsLocked() {
  g_bound = {};
  g_state.vs_constants_dirty = true;
  g_state.ps_constants_dirty = true;
}

//------------------------------------------------------------------------------
// Draws
//------------------------------------------------------------------------------

void DrawVertices(u32 dev, u32 primitive, u32 start_vertex, u32 vertex_count) {
  if (!vertex_count)
    return;
  std::lock_guard lock(Host().mutex);
  DrawRequest request;
  request.primitive = primitive;
  request.start_vertex = start_vertex;
  request.vertex_count = vertex_count;
  DrawLocked(dev, request);
}

void DrawIndexedVertices(u32 dev, u32 primitive, i32 base_vertex, u32 start_index,
                         u32 index_count) {
  if (!index_count)
    return;
  std::lock_guard lock(Host().mutex);
  DrawRequest request;
  request.primitive = primitive;
  request.indexed = true;
  request.base_vertex = base_vertex;
  request.start_index = start_index;
  request.index_count = index_count;
  DrawLocked(dev, request);
}

void DrawVerticesUP(u32 dev, u32 primitive, u32 vertex_count, u32 vertices_va, u32 stride) {
  const auto* vertices = mem::At<u32>(vertices_va);
  if (!vertex_count || !vertices || !stride)
    return;
  std::lock_guard lock(Host().mutex);
  if (!OpenCommandListLocked())
    return;
  const u32 bytes = vertex_count * stride;
  DrawRequest request;
  request.primitive = primitive;
  request.vertex_count = vertex_count;
  request.up_stride = stride;

  // D3DPT_RECTLIST: three corners per rectangle. The fourth is the parallelogram
  // completion v1 + v2 - v0, and each rectangle then draws as a quad.
  if (static_cast<d3d::PrimitiveType>(primitive) == d3d::PrimitiveType::kRectList) {
    const u32 rects = vertex_count / 3;
    if (!rects || stride % 4)
      return;
    request.primitive = u32(d3d::PrimitiveType::kQuadList);
    request.vertex_count = rects * 4;
    request.up_vertices = UploadAllocateLocked(rects * 4 * stride, 4);
    if (!request.up_vertices)
      return;
    const u32 words = stride / 4;
    std::vector<u32> corners(words * 3);
    for (u32 r = 0; r < rects; ++r) {
      rex::memory::copy_and_swap(corners.data(), vertices + r * 3 * words, words * 3);
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
    DrawLocked(dev, request);
    return;
  }

  request.up_vertices = UploadAllocateLocked((bytes + 3) & ~u32(3), 4);
  if (!request.up_vertices)
    return;
  rex::memory::copy_and_swap(reinterpret_cast<u32*>(request.up_vertices.data), vertices,
                             (bytes + 3) / 4);
  DrawLocked(dev, request);
}

void DrawIndexedVerticesUP(u32 dev, u32 primitive, i32 base_vertex, u32 vertex_count,
                           u32 index_count, u32 indices_va, bool indices_32bit, u32 vertices_va,
                           u32 stride) {
  const auto* vertices = mem::At<u32>(vertices_va);
  if (!index_count || !vertex_count || !vertices || !indices_va || !stride)
    return;
  std::lock_guard lock(Host().mutex);
  if (!OpenCommandListLocked())
    return;
  const u32 vertex_bytes = vertex_count * stride;
  DrawRequest request;
  request.primitive = primitive;
  request.indexed = true;
  request.base_vertex = base_vertex;
  request.index_count = index_count;
  request.up_stride = stride;
  request.up_vertices = UploadAllocateLocked((vertex_bytes + 3) & ~u32(3), 4);
  const u32 index_bytes = index_count * (indices_32bit ? 4 : 2);
  request.up_indices = UploadAllocateLocked((index_bytes + 3) & ~u32(3), 4);
  request.up_indices_32bit = indices_32bit;
  if (!request.up_vertices || !request.up_indices)
    return;
  rex::memory::copy_and_swap(reinterpret_cast<u32*>(request.up_vertices.data), vertices,
                             (vertex_bytes + 3) / 4);
  if (indices_32bit) {
    rex::memory::copy_and_swap(reinterpret_cast<u32*>(request.up_indices.data),
                               mem::At<u32>(indices_va), index_count);
  } else {
    rex::memory::copy_and_swap(reinterpret_cast<u16*>(request.up_indices.data),
                               mem::At<u16>(indices_va), index_count);
  }
  DrawLocked(dev, request);
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
  std::lock_guard lock(Host().mutex);
  ClearLocked(dev, rects, whole_viewport, flags & d3d::kClearTargetAll,
              (flags & d3d::kClearZBuffer) != 0, (flags & d3d::kClearStencil) != 0, clear_color, z,
              stencil);
}

void BeginTiling(u32 dev, u32 flags, u32 tile_count, u32 tile_rects_va, u32 clear_color_va,
                 float z, u32 stencil) {
  const plume::RenderColor color = ColorFromVector(clear_color_va);
  std::lock_guard lock(Host().mutex);

  // Tile rects are in pixels of the whole tiled area.
  u32 width = 0, height = 0;
  for (u32 i = 0; i < tile_count; ++i) {
    const auto* rect = mem::At<d3d::Rect>(tile_rects_va + i * sizeof(d3d::Rect));
    if (!rect)
      break;
    width = std::max(width, u32(std::max(i32(rect->right), 0)));
    height = std::max(height, u32(std::max(i32(rect->bottom), 0)));
  }
  if (g_trace.active) {
    FlushTraceRunLocked();
    GPU_INFO("trace {}: BeginTiling flags {:X}, {} tiles over {}x{}, RT0 {} DS {}", g_trace.frame,
             flags, tile_count, width, height, DescribeSurfaceLocked(g_state.render_targets[0]),
             DescribeSurfaceLocked(g_state.depth_stencil));
  }
  if (width && height)
    GrowBoundSurfacesLocked(width, height);

  // Flags 1 and 2 skip the clear of the bound targets.
  if (flags & 3)
    return;
  Targets targets;
  if (!CollectTargetsLocked(targets))
    return;
  std::vector<plume::RenderRect> rects{plume::RenderRect(0, 0, i32(targets.width), i32(targets.height))};
  ClearLocked(dev, rects, false, d3d::kClearTargetAll, true, true, color, z, stencil);
}

void Resolve(u32 dev, const ResolveArgs& args) {
  std::lock_guard lock(Host().mutex);
  plume::RenderCommandList* list = OpenCommandListLocked();
  if (!list || !dev)
    return;
  SyncBoundLocked();

  const u32 source_index = args.flags & d3d::kResolveSourceMask;
  const bool depth_source = source_index == d3d::kResolveDepthStencil;
  const u32 source_va = depth_source ? g_state.depth_stencil
                                     : (source_index < d3d::kMaxRenderTargets
                                            ? g_state.render_targets[source_index]
                                            : 0);
  HostTexture* source = FindSurfaceLocked(source_va);
  HostTexture* dest = GetTextureLocked(args.dest_texture_va);
  if (args.dest_texture_va) {
    ++g_stats.resolves;
    if (!source || !dest) {
      ++g_stats.failed_resolves;
      GPU_WARN_LIMITED(8, "Resolve {:08X} -> {:08X}: source surface {}, destination texture {}",
                       source_va, args.dest_texture_va, source ? "ok" : "missing",
                       dest ? "ok" : "missing");
    }
  }

  const auto* source_rect = mem::At<d3d::Rect>(args.source_rect_va);
  if (g_trace.active) {
    FlushTraceRunLocked();
    i32 point_x = 0, point_y = 0;
    if (auto* point = mem::At<be_i32>(args.dest_point_va)) {
      point_x = point[0];
      point_y = point[1];
    }
    GPU_INFO("trace {}: resolve flags {:08X} {} rect {} -> {:08X}({}x{} fmt {:08X}) level {} at "
             "{},{}",
             g_trace.frame, args.flags, DescribeSurfaceLocked(source_va),
             source_rect ? std::format("{},{}-{},{}", i32(source_rect->left), i32(source_rect->top),
                                       i32(source_rect->right), i32(source_rect->bottom))
                         : std::string("full"),
             args.dest_texture_va, dest ? dest->width : 0, dest ? dest->height : 0,
             dest ? dest->d3d_format : 0, args.dest_level, point_x, point_y);
  }

  if (source && dest && source->slot != kInvalidSlot) {
    i32 x1 = 0, y1 = 0, x2 = i32(source->width), y2 = i32(source->height);
    if (source_rect) {
      x1 = std::clamp(i32(source_rect->left), 0, i32(source->width));
      y1 = std::clamp(i32(source_rect->top), 0, i32(source->height));
      x2 = std::clamp(i32(source_rect->right), x1, i32(source->width));
      y2 = std::clamp(i32(source_rect->bottom), y1, i32(source->height));
    }
    i32 dest_x = 0, dest_y = 0;
    if (auto* point = mem::At<be_i32>(args.dest_point_va)) {
      dest_x = point[0];
      dest_y = point[1];
    }
    plume::RenderFramebuffer* framebuffer =
        GetTextureTargetLocked(*dest, args.dest_level, args.dest_slice_or_face);
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
      SetHostPushConstantsLocked(list, constants);
      list->drawInstanced(3, 1, 0, 0);
      list->setFramebuffer(nullptr);
      TransitionTextureLocked(*dest, list, plume::RenderTextureLayout::SHADER_READ);
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
    if (!CollectTargetsLocked(targets))
      return;
    std::vector<plume::RenderRect> rects{
        plume::RenderRect(0, 0, i32(targets.width), i32(targets.height))};
    if (source_rect) {
      rects[0] = plume::RenderRect(i32(source_rect->left), i32(source_rect->top),
                                   i32(source_rect->right), i32(source_rect->bottom));
    }
    ClearLocked(dev, rects, false, clear_color ? (1u << source_index) : 0, clear_depth, clear_depth,
                ColorFromVector(args.clear_color_va), args.clear_z, args.clear_stencil);
  }
}

void DrawMovieFrame(const MovieFrame& frame) {
  std::lock_guard lock(Host().mutex);
  plume::RenderCommandList* list = OpenCommandListLocked();
  if (!list)
    return;
  SyncBoundLocked();

  HostTexture* target = FindSurfaceLocked(g_state.render_targets[0]);
  if (!target || target->depth || target->slot == kInvalidSlot) {
    GPU_WARN_LIMITED(4, "Bink frame without a color render target ({:08X})",
                     g_state.render_targets[0]);
    return;
  }

  // Planes upload (when Bink decoded into them) before the target binds:
  // copies end Vulkan render passes.
  const u32 planes[] = {frame.y_plane, frame.cr_plane, frame.cb_plane, frame.a_plane};
  u32 slots[4] = {kNullTexture2DSlot, kNullTexture2DSlot, kNullTexture2DSlot, kNullTexture2DSlot};
  for (u32 i = 0; i < 4; ++i) {
    if (HostTexture* plane = GetTextureLocked(planes[i]); plane && plane->slot != kInvalidSlot) {
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
  plume::RenderViewport viewport{frame.x, frame.y, frame.width, frame.height, 0.0f, 1.0f};
  list->setViewports(&viewport, 1);
  const i32 left = std::clamp(i32(frame.x), 0, i32(target->width));
  const i32 top = std::clamp(i32(frame.y), 0, i32(target->height));
  const i32 right = std::clamp(i32(frame.x + frame.width), left, i32(target->width));
  const i32 bottom = std::clamp(i32(frame.y + frame.height), top, i32(target->height));
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

}  // namespace redahm::gpu

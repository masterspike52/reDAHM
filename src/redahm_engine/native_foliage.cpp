// Foliage instance data, filled natively.
//
// FFoliageSceneProxy draws each FoliageComponent's instances (trees, bushes)
// with one instanced draw. Before it, the vertex factory's fill (sub_82682238:
// factory +16, r4 the visible instances as a TArray of indices, r5 the view)
// locks the factory's instance buffer and writes 60 bytes per visible instance:
//  - sub_8267F8A0 (the factory's settings {component, mesh, MinTransitionRadius²,
//    1 / (MaxDrawRadius - MinTransitionRadius)} at factory +24): the position,
//    three axes unpacked from two words by sub_8267F3F8 (nine 7-bit values,
//    (v - 63) / 32) and scaled down between MinTransitionRadius (component
//    +728) and MaxDrawRadius, and a word passed through;
//  - for each of the scene's wind sources (scene vtable +60 returns a TArray of
//    them), sub_8265BB08: noise (sub_8265BA00, a 64-entry table lerped at
//    floor sub_82CB2298) along the source's direction, added to the third axis
//    times the component's wind scale (+756).
// It is the most expensive thing on the UE3 render thread wherever there are
// trees (16% of it in Shen Long with every tile loaded), all recompiled float
// code that runs through the register context and swaps every load. The same
// arithmetic runs here natively, rounding as the PowerPC does (fused
// multiply-adds rounded once), with the game's own lock, unlock and wind source
// query.

#include <bit>
#include <cmath>
#include <cstdint>
#include <cstring>

#include <rex/hook.h>
#include <rex/ppc/func.h>
#include <rex/types.h>

#include "generated/redahm_init.h"
#include "redahm_engine/gpu/core/guest_memory.h"

REX_EXTERN(D3DVertexBuffer_Lock);
REX_EXTERN(D3DVertexBuffer_Unlock);

namespace {

namespace mem = redahm::gpu::mem;

// sub_82682238's own: the factory's instance buffer, its settings, the view.
constexpr u32 kFactoryVertexStream = 0x14;
constexpr u32 kStreamVertexBuffer = 8;
constexpr u32 kFactorySettings = 0x18;
constexpr u32 kVertexBufferSizeWord = 0x1C;  // D3DVertexBuffer_GetDesc: & 0x3FFFFFC
constexpr u32 kViewFamily = 0;
constexpr u32 kFamilyScene = 0x10;
constexpr u32 kFamilyTime = 0x1C;
constexpr u32 kSceneWindSourcesSlot = 0x3C;
constexpr u32 kViewOrigin = 0x180;
// The settings: component, (mesh), MinTransitionRadius², 1 / transition width.
constexpr u32 kSettingsMinTransitionSq = 8;
constexpr u32 kSettingsTransitionScale = 0xC;
// The component: instances (24 bytes each), MinTransitionRadius, wind scale.
constexpr u32 kComponentInstances = 0x29C;
constexpr u32 kComponentMinTransition = 0x2D8;
constexpr u32 kComponentWindScale = 0x2F4;
constexpr u32 kInstanceSize = 24;
constexpr u32 kRecordSize = 60;
// A frame for the guest calls below the caller's, as the original's own.
constexpr u32 kGuestFrame = 0x150;

inline u32 LoadU(const u8* p) {
  u32 v;
  std::memcpy(&v, p, 4);
  return std::byteswap(v);
}

inline float LoadF(const u8* p) {
  return std::bit_cast<float>(LoadU(p));
}

inline void StoreU(u8* p, u32 v) {
  v = std::byteswap(v);
  std::memcpy(p, &v, 4);
}

inline void StoreF(u8* p, float f) {
  StoreU(p, std::bit_cast<u32>(f));
}

// fmadds and friends round once. A float product is exact in a double, so the
// sum rounds once there; the host build has no FMA instructions to use.
inline float Fma(float a, float b, float c) {
  return float(double(a) * double(b) + double(c));
}

// sub_82CB2298: floor, leaving zeros and magnitudes past 1e18 alone.
inline double GuestFloor(double x) {
  const double ax = std::fabs(x);
  if (!(ax > 0.0) || ax > 1.0e18)
    return x;
  const double truncated = double(int64_t(x));
  return x - truncated >= 0.0 ? truncated : truncated - 1.0;
}

// fctiwz: truncation that saturates, NaN to INT_MIN.
inline int32_t GuestTruncate(float f) {
  if (std::isnan(f))
    return INT32_MIN;
  if (f >= 2147483647.0f)
    return INT32_MAX;
  if (f <= -2147483648.0f)
    return INT32_MIN;
  return int32_t(f);
}

// sub_8265BA00's table, built as it builds it on first use.
struct NoiseTable {
  float values[64];
  NoiseTable() {
    u32 state = 0;
    for (float& value : values) {
      state = state * 0x0BB38435u + 0x3619636Bu;
      const float f = std::bit_cast<float>((state & 0x7FFFFFu) | 0x3F800000u);
      value = f - float(int32_t(f));
    }
  }
};

const NoiseTable& Noise() {
  static const NoiseTable table;
  return table;
}

// sub_8265BA00.
float SampleNoise(float x) {
  const float* table = Noise().values;
  const int32_t i = GuestTruncate(float(GuestFloor(double(x))));
  const float t0 = table[i & 63];
  const float t1 = table[(i + 1) & 63];
  return Fma(t1 - t0, x - float(i), t0);
}

// sub_8265BB08: one wind source's push at `position`.
void Wind(const u8* source, const float position[3], float time, float out[3]) {
  const float s0 = LoadF(source), s1 = LoadF(source + 4), s2 = LoadF(source + 8);
  const float strength = LoadF(source + 12);
  const float along = Fma(position[0], s0, Fma(position[2], s2, position[1] * s1));
  const float x = float(double(along) + 524288.0);
  // fsel on a compare of -x with 0: x when it is positive (or NaN), else 0.
  const float distance = (-x < 0.0f || std::isnan(x)) ? x : 0.0f;
  const float phase = LoadF(source + 16) + time;
  const float arg = Fma(phase, LoadF(source + 20), -(distance * LoadF(source + 24)));
  const float n = SampleNoise(arg);
  out[0] = (s0 * n) * strength;
  out[1] = strength * (n * s1);
  out[2] = (s2 * n) * strength;
}

// sub_8267F3F8: nine 7-bit values from two words into three axes.
void UnpackAxes(u32 a, u32 b, float* x, float* y, float* z) {
  const auto unit = [](u32 v) { return (float(v & 0x7F) - 63.0f) * 0.03125f; };
  x[0] = unit(a >> 25);
  x[1] = unit(a >> 18);
  x[2] = unit(a >> 11);
  y[0] = unit(a >> 4);
  y[1] = unit(((a & 0xF) << 3) | ((b >> 29) & 7));
  y[2] = unit(b >> 22);
  z[0] = unit(b >> 15);
  z[1] = unit(b >> 8);
  z[2] = unit(b >> 1);
}

struct FillContext {
  const u8* settings;
  const u8* component;
  const u8* instances;
  float view[3];
  float min_transition_sq;
  float transition_scale;
  float min_transition;
  float wind_scale;
};

// sub_8267F8A0: one instance's record; returns its wind scale.
float InstanceRecord(const FillContext& fc, u32 index, float record[15], u32& passthrough) {
  const u8* entry = fc.instances + size_t(index) * kInstanceSize;
  const float ex = LoadF(entry), ey = LoadF(entry + 4), ez = LoadF(entry + 8);
  const float dx = fc.view[0] - ex, dy = fc.view[1] - ey, dz = fc.view[2] - ez;
  const float distance_sq = Fma(dx, dx, Fma(dz, dz, dy * dy));
  float fade = 1.0f;
  if (distance_sq >= fc.min_transition_sq)
    fade = Fma(-(std::sqrt(distance_sq) - fc.min_transition), fc.transition_scale, 1.0f);
  record[0] = ex;
  record[1] = ey;
  record[2] = ez;
  UnpackAxes(LoadU(entry + 12), LoadU(entry + 16), record + 3, record + 6, record + 9);
  for (int i = 3; i < 12; ++i)
    record[i] *= fade;
  passthrough = LoadU(entry + 20);
  return fc.wind_scale * fade;
}

}  // namespace

// The foliage vertex factory's fill (r3 factory +16, r4 visible instances, r5
// view); see the top of the file.
REX_HOOK_RAW(sub_82682238) {
  const u32 self = ctx.r3.u32;
  const u32 visible = ctx.r4.u32;
  const u32 view = ctx.r5.u32;
  const int32_t count = mem::Load<int32_t>(visible + 4);
  if (u32(count) * kRecordSize == 0)
    return;
  const u32 vertex_buffer = mem::Load<u32>(mem::Load<u32>(self + kFactoryVertexStream) +
                                           kStreamVertexBuffer);
  const u32 size = mem::Load<u32>(vertex_buffer + kVertexBufferSizeWord) & 0x3FFFFFCu;

  const u32 caller_stack = ctx.r1.u32;
  ctx.r1.u64 = caller_stack - kGuestFrame;
  mem::Store<u32>(ctx.r1.u32, caller_stack);

  ctx.r3.u64 = vertex_buffer;
  ctx.r4.u64 = 0;
  ctx.r5.u64 = size;
  ctx.r6.u64 = 0;
  D3DVertexBuffer_Lock(ctx, base);
  const u32 destination = ctx.r3.u32;

  const u32 family = mem::Load<u32>(view + kViewFamily);
  const float time = mem::Load<float>(family + kFamilyTime);
  const u32 scene = mem::Load<u32>(family + kFamilyScene);
  const u32 query = mem::Load<u32>(mem::Load<u32>(scene) + kSceneWindSourcesSlot);
  u32 winds = 0;
  if (PPCFunc* fn = mem::ResolveFunction(query)) {
    ctx.r3.u64 = scene;
    fn(ctx, base);
    winds = ctx.r3.u32;
  }

  if (count > 0 && destination) {
    const u32 settings = mem::Load<u32>(self + kFactorySettings);
    const u32 component = mem::Load<u32>(settings);
    FillContext fc;
    fc.settings = mem::At<u8>(settings);
    fc.component = mem::At<u8>(component);
    fc.instances = mem::At<u8>(LoadU(fc.component + kComponentInstances));
    const u8* view_bytes = mem::At<u8>(view);
    for (int i = 0; i < 3; ++i)
      fc.view[i] = LoadF(view_bytes + kViewOrigin + i * 4);
    fc.min_transition_sq = LoadF(fc.settings + kSettingsMinTransitionSq);
    fc.transition_scale = LoadF(fc.settings + kSettingsTransitionScale);
    fc.min_transition = LoadF(fc.component + kComponentMinTransition);
    fc.wind_scale = LoadF(fc.component + kComponentWindScale);

    const u8* indices = mem::At<u8>(mem::Load<u32>(visible));
    const u8* wind_list = winds ? mem::At<u8>(mem::Load<u32>(winds)) : nullptr;
    const int32_t wind_count = winds ? mem::Load<int32_t>(winds + 4) : 0;
    u8* out = mem::At<u8>(destination);

    for (int32_t n = 0; n < count; ++n) {
      float record[15] = {};
      u32 passthrough = 0;
      const float scale = InstanceRecord(fc, LoadU(indices + size_t(n) * 4), record, passthrough);
      float sum[3] = {0.0f, 0.0f, 0.0f};
      for (int32_t w = 0; w < wind_count; ++w) {
        float push[3];
        Wind(mem::At<u8>(LoadU(wind_list + size_t(w) * 4)), record, time, push);
        sum[0] = push[0] + sum[0];
        sum[1] = push[1] + sum[1];
        sum[2] = push[2] + sum[2];
      }
      record[9] = record[9] + sum[0] * scale;
      record[10] = record[10] + sum[1] * scale;
      record[11] = record[11] + sum[2] * scale;
      u8* dst = out + size_t(n) * kRecordSize;
      for (int i = 0; i < 12; ++i)
        StoreF(dst + i * 4, record[i]);
      StoreU(dst + 48, passthrough);
      StoreU(dst + 52, 0);
      StoreU(dst + 56, 0);
    }
  }

  ctx.r3.u64 = vertex_buffer;
  D3DVertexBuffer_Unlock(ctx, base);
  ctx.r1.u64 = caller_stack;
}

//------------------------------------------------------------------------------
// FFoliageSceneProxy::DrawDynamicElements
//------------------------------------------------------------------------------

REX_EXTERN(__imp__sub_8267FF98);
REX_EXTERN(sub_82294520);
REX_EXTERN(sub_822AB8C0);
REX_EXTERN(sub_82682008);
REX_EXTERN(sub_823BBFF0);
REX_EXTERN(sub_8240A888);
REX_EXTERN(sub_828200A8);

namespace {

// The proxy: its component, material, vertex factories (indexed by +0x120),
// the visible instance indices (TArray), flags, and the element colours.
constexpr u32 kProxyPrimitive = 0x10;
constexpr u32 kProxyComponent = 0x110;
constexpr u32 kProxyMaterial = 0x114;
constexpr u32 kProxyFactoryIndex = 0x120;
constexpr u32 kProxyFactories = 0x118;  // +0x46 words from the proxy
constexpr u32 kProxyVisible = 0x124;
constexpr u32 kProxyFlags = 0x130;
constexpr u32 kProxyLevelColor = 0x134;
constexpr u32 kProxyPropertyColor = 0x138;
// Set when the visible instances need picking again; cleared after the draw.
constexpr u32 kFlagRefresh = 0x40000000;
// The component: instances, their count, the mesh, the draw radii and scale.
constexpr u32 kComponentInstanceCount = 0x2A0;
constexpr u32 kComponentMesh = 0x2CC;
constexpr u32 kComponentMaxDrawRadius = 0x2D4;
constexpr u32 kComponentScale = 0x2E8;  // x, y, z
constexpr u32 kMeshRadius = 0xC8;
constexpr u32 kMeshLods = 0x3C;
constexpr u32 kLodTriangles = 0x50;
constexpr u32 kLodVertices = 0x2C;
// The view: its LOD distance factor at +0xBC, origin, and frustum
// (FConvexVolume: permuted planes, four at a time as x4 y4 z4 w4).
constexpr u32 kViewDistanceFactor = 0xBC;
constexpr u32 kViewFrustum = 0x190;
constexpr u32 kFrustumPermuted = 0xC;
constexpr u32 kFrustumPermutedCount = 0x10;
// The draw's mesh element, laid out on the frame as the original's.
constexpr u32 kDrawFrame = 0x220;
constexpr u32 kBatchElement = 0x70;
constexpr u32 kElement = 0xA0;
constexpr u32 kLevelColor = 0x80;
constexpr u32 kPropertyColor = 0x90;
constexpr u32 kWireframeColor = 0x60;
constexpr u32 kBatchElementVtable = 0x8214605C;
constexpr u32 kIdentityMatrix = 0x835EBA50;
constexpr u32 kSingleInstanceDraws = 0x83748430;

u32 GuestU(u32 va) {
  return LoadU(mem::At<u8>(va));
}

float GuestF(u32 va) {
  return LoadF(mem::At<u8>(va));
}

void GuestStoreU(u32 va, u32 value) {
  StoreU(mem::At<u8>(va), value);
}

// fsel against a compare with zero: `b` when `a - b` is below zero or
// unordered, else `a`.
float SelectMax(float a, float b) {
  const float difference = a - b;
  return (difference < 0.0f || std::isnan(difference)) ? b : a;
}

// sub_82831810, FConvexVolume::IntersectSphere: outside when the sphere is
// past any plane.
bool SphereInFrustum(u32 frustum, const float origin[3], float radius) {
  const int32_t planes = int32_t(GuestU(frustum + kFrustumPermutedCount));
  const u8* data = mem::At<u8>(GuestU(frustum + kFrustumPermuted));
  for (int32_t group = 0; group * 4 < planes; ++group) {
    const u8* p = data + size_t(group) * 64;
    for (int lane = 0; lane < 4; ++lane) {
      const float x = LoadF(p + lane * 4), y = LoadF(p + 16 + lane * 4);
      const float z = LoadF(p + 32 + lane * 4), w = LoadF(p + 48 + lane * 4);
      const float distance = Fma(origin[2], z, Fma(origin[1], y, origin[0] * x)) - w;
      if (distance > radius)
        return false;
    }
  }
  return true;
}

void CallWith(PPCContext& ctx, u8* base, void (*fn)(PPCContext&, u8*), u32 r3, u32 r4 = 0,
              u32 r5 = 0, u32 r6 = 0, u32 r7 = 0, u32 r8 = 0, u32 r9 = 0) {
  ctx.r3.u64 = r3;
  ctx.r4.u64 = r4;
  ctx.r5.u64 = r5;
  ctx.r6.u64 = r6;
  ctx.r7.u64 = r7;
  ctx.r8.u64 = r8;
  ctx.r9.u64 = r9;
  fn(ctx, base);
}

u32 CallVirtual(PPCContext& ctx, u8* base, u32 object, u32 slot, u32 r4 = 0) {
  PPCFunc* fn = mem::ResolveFunction(GuestU(GuestU(object) + slot));
  if (!fn)
    return 0;
  ctx.r3.u64 = object;
  ctx.r4.u64 = r4;
  fn(ctx, base);
  return ctx.r3.u32;
}

// Picks the instances within MaxDrawRadius and the view frustum.
void PickVisible(PPCContext& ctx, u8* base, u32 proxy, u32 component, u32 view, u32 frame) {
  const u32 visible = proxy + kProxyVisible;
  const int32_t count = int32_t(GuestU(component + kComponentInstanceCount));
  GuestStoreU(visible + 4, 0);
  if (int32_t(GuestU(visible + 8)) != count) {
    GuestStoreU(visible + 8, u32(count));
    CallWith(ctx, base, sub_82294520, visible, 4, 8);
  }
  const float radius =
      SelectMax(GuestF(component + kComponentScale),
                SelectMax(GuestF(component + kComponentScale + 4),
                          GuestF(component + kComponentScale + 8))) *
      GuestF(GuestU(component + kComponentMesh) + kMeshRadius);
  const float max_radius = GuestF(component + kComponentMaxDrawRadius);
  const float max_sq = max_radius * max_radius;
  const float ox = GuestF(view + kViewOrigin), oy = GuestF(view + kViewOrigin + 4);
  const float oz = GuestF(view + kViewOrigin + 8);
  const u8* instances = mem::At<u8>(GuestU(component + kComponentInstances));
  const u32 index_slot = frame + 0x50;

  for (int32_t i = 0; i < count; ++i) {
    const u8* entry = instances + size_t(i) * kInstanceSize;
    const float position[3] = {LoadF(entry), LoadF(entry + 4), LoadF(entry + 8)};
    const float dx = position[0] - ox, dy = position[1] - oy, dz = position[2] - oz;
    const float distance_sq = Fma(dx, dx, Fma(dz, dz, dy * dy));
    if (!(distance_sq < max_sq) || !SphereInFrustum(view + kViewFrustum, position, radius))
      continue;
    const u32 num = GuestU(visible + 4);
    const u32 data = GuestU(visible);
    if (data && num < GuestU(visible + 8)) {
      GuestStoreU(data + num * 4, u32(i));
      GuestStoreU(visible + 4, num + 1);
    } else {
      GuestStoreU(index_slot, u32(i));
      CallWith(ctx, base, sub_822AB8C0, visible, index_slot);
    }
  }
}

}  // namespace

namespace redahm::native_foliage {

// FFoliageSceneProxy::DrawDynamicElements (r3 proxy, r4 primitive draw
// interface, r5 view). The per-instance culling loop was most of the
// foliage's cost on the render thread; the draw it ends with is built exactly
// as the original builds it. The first draw of a proxy, which creates its
// vertex factory, is left to the original.
void DrawFoliageProxy(PPCContext& ctx, u8* base) {
  const u32 proxy = ctx.r3.u32;
  const u32 pdi = ctx.r4.u32;
  const u32 view = ctx.r5.u32;
  const u32 factory_slot = proxy + (GuestU(proxy + kProxyFactoryIndex) + 0x46) * 4;
  const u32 factory = GuestU(factory_slot);
  if (!factory) {
    __imp__sub_8267FF98(ctx, base);
    return;
  }

  const u32 caller_stack = ctx.r1.u32;
  ctx.r1.u64 = caller_stack - kDrawFrame;
  const u32 frame = ctx.r1.u32;
  GuestStoreU(frame, caller_stack);

  const bool near = GuestF(view + kViewDistanceFactor) < 1.0f;
  const u32 hit_testing = CallVirtual(ctx, base, pdi, 0);
  if (hit_testing || !near) {
    ctx.r1.u64 = caller_stack;
    return;
  }

  const u32 component = GuestU(proxy + kProxyComponent);
  const u32 lod = GuestU(GuestU(GuestU(component + kComponentMesh) + kMeshLods));
  const bool refresh = (GuestU(proxy + kProxyFlags) & kFlagRefresh) != 0;
  if (refresh)
    PickVisible(ctx, base, proxy, component, view, frame);

  const u32 visible_count = GuestU(proxy + kProxyVisible + 4);
  if (!visible_count || !GuestU(lod + kLodVertices) || !GuestU(lod + kLodTriangles)) {
    ctx.r1.u64 = caller_stack;
    return;
  }
  if (refresh) {
    CallWith(ctx, base, sub_82682008, factory, visible_count);
    CallWith(ctx, base, sub_82682238, factory + 0x10, proxy + kProxyVisible, view);
  }

  // The batch element and the mesh element, at the original's frame offsets.
  const u32 flags = GuestU(proxy + kProxyFlags);
  GuestStoreU(frame + kBatchElement, kBatchElementVtable);
  GuestStoreU(frame + kBatchElement + 4, component);
  GuestStoreU(frame + kBatchElement + 8, factory + 0x10);
  const u32 element = frame + kElement;
  GuestStoreU(element + 0x00, factory + 0x1B4);
  GuestStoreU(element + 0x04, factory + 0x2C);
  GuestStoreU(element + 0x08, 0);
  GuestStoreU(element + 0x10, 0);
  GuestStoreU(element + 0x1C, 0);
  GuestStoreU(element + 0x20, frame + kBatchElement);
  GuestStoreU(element + 0x100, 0);  // two zero floats
  GuestStoreU(element + 0x104, 0);
  const u32 material = GuestU(proxy + kProxyMaterial);
  GuestStoreU(element + 0x18, CallVirtual(ctx, base, material, 0x128, flags >> 31));
  const u8* identity = mem::At<u8>(kIdentityMatrix);
  for (u32 offset : {0x30u, 0x70u, 0xB0u})
    std::memcpy(mem::At<u8>(element + offset), identity, 64);
  const u32 instances_drawn = GuestU(kSingleInstanceDraws) ? 1 : visible_count;
  GuestStoreU(element + 0xF0, 0);
  GuestStoreU(element + 0xF4,
              u32(int32_t(GuestU(lod + kLodTriangles) * instances_drawn) / 3));
  GuestStoreU(element + 0xF8, 0);
  GuestStoreU(element + 0xFC, GuestU(lod + kLodVertices) * instances_drawn - 1);
  // Triangle list; the other bits start clear (the original kept whatever
  // its stack held there) and the depth priority group goes in bits 20-22.
  CallWith(ctx, base, sub_823BBFF0, proxy, view);
  const u32 depth_group = ctx.r3.u32 & 7;
  GuestStoreU(element + 0x108, 0x20000000u | (depth_group << 20));
  CallWith(ctx, base, sub_8240A888, frame + kLevelColor, proxy + kProxyPropertyColor);
  CallWith(ctx, base, sub_8240A888, frame + kPropertyColor, proxy + kProxyLevelColor);
  const float wireframe[4] = {0.0f, 1.0f, 0.0f, 1.0f};
  for (u32 i = 0; i < 4; ++i)
    StoreF(mem::At<u8>(frame + kWireframeColor + i * 4), wireframe[i]);
  CallWith(ctx, base, sub_828200A8, pdi, element, frame + kWireframeColor,
           frame + kPropertyColor, frame + kLevelColor, GuestU(proxy + kProxyPrimitive),
           GuestU(proxy + kProxyFlags) >> 31);
  GuestStoreU(proxy + kProxyFlags, GuestU(proxy + kProxyFlags) & ~kFlagRefresh);
  ctx.r1.u64 = caller_stack;
}

}  // namespace redahm::native_foliage

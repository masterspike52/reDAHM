// Material shader parameters, set natively.
//
// FMaterialPixelShaderParameters::Set (sub_827D3438) runs before every draw
// with a material: for each of the shader's parameters (12-byte entries {type,
// expression index, register or sampler, count}) it evaluates the material's
// uniform expression and writes the result into the device's pixel shader
// constants, or binds the texture. The expressions are small trees
// (parameters, folded math) whose parameters are looked up by name through
// the material instance chain: each FMaterialInstance resource keeps TMaps of
// its overrides and asks its parent's render proxy when it has none. In the
// heaviest city views that was a quarter of UE3's render thread, all of it
// recompiled code going through the register context for every hash probe.
//
// Set, the parameter expressions and the instance lookups run here natively.
// The evaluators and lookups are hooked as well, so the game's other callers
// take the same path. Expression and proxy types not handled here are called
// through their own vtables, and whatever they evaluate comes back into the
// native versions.

#include <bit>
#include <cmath>
#include <cstdint>
#include <cstring>

#include <rex/hook.h>
#include <rex/ppc/func.h>
#include <rex/types.h>

#include "generated/redahm_init.h"
#include "redahm_engine/gpu/core/guest_memory.h"

REX_EXTERN(sub_8287E160);
REX_EXTERN(sub_8244F7D0);
REX_EXTERN(D3DDevice_SetPixelShaderConstantFN);
REX_EXTERN(D3DDevice_SetTexture);

namespace {

namespace mem = redahm::gpu::mem;

// FMaterialUniformExpression vtable slots and the implementations handled here.
constexpr u32 kGetNumberValueSlot = 0xC;
constexpr u32 kGetTextureValueSlot = 0x10;
constexpr u32 kScalarParameterNumber = 0x8279F748;
constexpr u32 kVectorParameterNumber = 0x8279F4C0;
constexpr u32 kFoldedMathNumber = 0x827A0578;
constexpr u32 kAppendVectorNumber = 0x827A0D78;
constexpr u32 kFracNumber = 0x827A0A30;
constexpr u32 kTextureParameterTexture = 0x8279FC90;
// AppendVector: NumComponentsA after its two operands.
constexpr u32 kAppendComponentsA = 0x10;
// FMaterialInstance resource GetMaterial, its owning instance, and the
// owner's flag word whose top bit says it has its own compiled material.
constexpr u32 kInstanceGetMaterial = 0x8244EE80;
constexpr u32 kInstanceOwner = 0x10;
constexpr u32 kOwnerFlags = 0x80;
// The device's texture fetch constants (24 bytes per sampler), their pending
// mask, and D3D's per-sampler anisotropy and LOD bias bytes, with the table
// the filter setters look the anisotropy up in.
constexpr u32 kDeviceFetchConstants = 0x480;
constexpr u32 kDeviceFetchPending = 0x18;
constexpr u32 kDeviceSamplerAniso = 0x2E94;
constexpr u32 kDeviceSamplerLodBias = 0x2EE2;
constexpr u32 kFilterTable = 0x82016938;
// Parameter expressions: FName at +8, default value (or UTexture) at +16.
constexpr u32 kExpressionName = 8;
constexpr u32 kExpressionDefault = 16;
// FoldedMath: operands at +8/+12, operation at +16.
constexpr u32 kFoldedA = 8;
constexpr u32 kFoldedB = 0xC;
constexpr u32 kFoldedOp = 0x10;
// UTexture::Resource.
constexpr u32 kTextureResource = 192;

// FMaterialRenderProxy vtable slots, and FMaterialInstance's resource
// implementations of them.
constexpr u32 kGetVectorSlot = 4;
constexpr u32 kGetScalarSlot = 8;
constexpr u32 kGetTextureSlot = 0xC;
constexpr u32 kInstanceGetVector = 0x8244EEF0;
constexpr u32 kInstanceGetScalar = 0x8244EF98;
constexpr u32 kInstanceGetTexture = 0x82451C28;
// The instance resource: its parent material, the selected flag passed on to
// the parent's GetRenderProxy (UMaterialInterface vtable +0x128), and its
// parameter maps (TMap<FName, value>: data, count, ..., hash, hash size).
constexpr u32 kInstanceSelected = 0xC;
constexpr u32 kInstanceParent = 0x14;
constexpr u32 kInstanceVectors = 0x18;   // 28-byte pairs
constexpr u32 kInstanceScalars = 0x2C;   // 16-byte pairs
constexpr u32 kInstanceTextures = 0x40;  // 16-byte pairs, UTexture*
constexpr u32 kGetRenderProxySlot = 0x128;

// FMaterial's uniform expression arrays (data, count) by parameter type.
constexpr u32 kMaterialVectors = 0x44;
constexpr u32 kMaterialScalars = 0x50;
constexpr u32 kMaterial2DTextures = 0x5C;
constexpr u32 kMaterialCubeTextures = 0x68;
constexpr u32 kMaterialFlags = 0x84;
constexpr u32 kMaterialFlagSceneConstants = 2;

constexpr u8 kParameterVector = 8;
constexpr u8 kParameterScalar = 15;
constexpr u8 kParameter2DTexture = 16;
constexpr u8 kParameterCubeTexture = 32;
constexpr u32 kParameterSize = 12;

// GWhiteTexture, GWhiteTextureCube, GCurrentTime, and the debug pointer Set
// leaves on the parameter it is setting.
constexpr u32 kWhiteTexture = 0x8375DA28;
constexpr u32 kWhiteTextureCube = 0x8375DA30;
constexpr u32 kCurrentTime = 0x83746170;
constexpr u32 kCurrentParameter = 0x83764888;
// FTexture: sampler state, texture RHI, last render time (double).
constexpr u32 kTextureRhi = 0x14;
constexpr u32 kTextureSamplerState = 0x18;
constexpr u32 kTextureLastRenderTime = 0x1C;

// The device's pixel shader float constants and their pending mask.
constexpr u32 kDevicePsPending = 8;
constexpr u32 kDevicePsConstants = 0x1780;

constexpr u32 kGuestFrame = 0x100;
constexpr u32 kFrameScratch = 0x60;

u8 LoadByte(u32 va) {
  const u8* p = mem::At<u8>(va);
  return p ? *p : 0;
}

u32 LoadU(u32 va) {
  return mem::Load<u32>(va);
}

float LoadF(u32 va) {
  return std::bit_cast<float>(mem::Load<u32>(va));
}

void StoreF(u32 va, float value) {
  mem::Store<u32>(va, std::bit_cast<u32>(value));
}

u32 Slot(u32 object, u32 slot) {
  return LoadU(LoadU(object) + slot);
}

// A frame below the caller's for calls back into the game; its scratch words
// hold what those calls return through pointers.
class GuestFrame {
 public:
  GuestFrame(PPCContext& ctx) : ctx_(ctx), caller_(ctx.r1.u32) {
    ctx.r1.u64 = caller_ - kGuestFrame;
    mem::Store<u32>(ctx.r1.u32, caller_);
  }
  ~GuestFrame() { ctx_.r1.u64 = caller_; }
  u32 scratch() const { return caller_ - kGuestFrame + kFrameScratch; }

 private:
  PPCContext& ctx_;
  u32 caller_;
};

u32 CallGuest(PPCContext& ctx, u8* base, u32 target, u32 r3, u32 r4 = 0, u32 r5 = 0,
              u32 r6 = 0, u32 r7 = 0) {
  PPCFunc* fn = target ? mem::ResolveFunction(target) : nullptr;
  if (!fn)
    return 0;
  ctx.r3.u64 = r3;
  ctx.r4.u64 = r4;
  ctx.r5.u64 = r5;
  ctx.r6.u64 = r6;
  ctx.r7.u64 = r7;
  fn(ctx, base);
  return ctx.r3.u32;
}

//------------------------------------------------------------------------------
// Material instance parameter lookups
//------------------------------------------------------------------------------

// TMap<FName, V>::Find: the pair at bucket (hash size - 1) & name index, then
// down the chain. Pairs are {next, FName, value}; returns the value's address.
u32 FindPair(u32 map, u32 name_index, u32 name_number, u32 pair_size) {
  const u32 hash = LoadU(map + 0xC);
  if (!hash || i32(LoadU(map + 4)) <= 0)
    return 0;
  const u32 data = LoadU(map);
  i32 index = i32(LoadU(hash + ((LoadU(map + 0x10) - 1) & name_index) * 4));
  while (index != -1) {
    const u32 pair = data + u32(index) * pair_size;
    if (LoadU(pair + 4) == name_index && LoadU(pair + 8) == name_number)
      return pair + 12;
    index = i32(LoadU(pair));
  }
  return 0;
}

u32 ParentProxy(PPCContext& ctx, u8* base, u32 instance) {
  const u32 parent = LoadU(instance + kInstanceParent);
  if (!parent)
    return 0;
  GuestFrame frame(ctx);
  return CallGuest(ctx, base, Slot(parent, kGetRenderProxySlot), parent,
                   LoadU(instance + kInstanceSelected));
}

// proxy->GetScalarValue(name, out). Instances answer from their map or pass
// the question up; any other proxy is asked through its vtable.
u32 ProxyScalar(PPCContext& ctx, u8* base, u32 proxy, u32 name, float& out) {
  const u32 name_index = LoadU(name);
  const u32 name_number = LoadU(name + 4);
  while (proxy) {
    const u32 fn = Slot(proxy, kGetScalarSlot);
    if (fn != kInstanceGetScalar) {
      GuestFrame frame(ctx);
      StoreF(frame.scratch(), out);
      const u32 found = CallGuest(ctx, base, fn, proxy, name, frame.scratch());
      out = LoadF(frame.scratch());
      return found;
    }
    if (const u32 value = FindPair(proxy + kInstanceScalars, name_index, name_number, 16)) {
      out = LoadF(value);
      return 1;
    }
    proxy = ParentProxy(ctx, base, proxy);
  }
  return 0;
}

u32 ProxyVector(PPCContext& ctx, u8* base, u32 proxy, u32 name, float out[4]) {
  const u32 name_index = LoadU(name);
  const u32 name_number = LoadU(name + 4);
  while (proxy) {
    const u32 fn = Slot(proxy, kGetVectorSlot);
    if (fn != kInstanceGetVector) {
      GuestFrame frame(ctx);
      for (u32 i = 0; i < 4; ++i)
        StoreF(frame.scratch() + i * 4, out[i]);
      const u32 found = CallGuest(ctx, base, fn, proxy, name, frame.scratch());
      for (u32 i = 0; i < 4; ++i)
        out[i] = LoadF(frame.scratch() + i * 4);
      return found;
    }
    if (const u32 value = FindPair(proxy + kInstanceVectors, name_index, name_number, 28)) {
      for (u32 i = 0; i < 4; ++i)
        out[i] = LoadF(value + i * 4);
      return 1;
    }
    proxy = ParentProxy(ctx, base, proxy);
  }
  return 0;
}

// Returns the texture's FTexture resource through `out`.
u32 ProxyTexture(PPCContext& ctx, u8* base, u32 proxy, u32 name, u32& out) {
  const u32 name_index = LoadU(name);
  const u32 name_number = LoadU(name + 4);
  while (proxy) {
    const u32 fn = Slot(proxy, kGetTextureSlot);
    if (fn != kInstanceGetTexture) {
      GuestFrame frame(ctx);
      mem::Store<u32>(frame.scratch(), out);
      const u32 found = CallGuest(ctx, base, fn, proxy, name, frame.scratch());
      out = LoadU(frame.scratch());
      return found;
    }
    if (const u32 value = FindPair(proxy + kInstanceTextures, name_index, name_number, 16)) {
      out = LoadU(LoadU(value) + kTextureResource);
      return 1;
    }
    proxy = ParentProxy(ctx, base, proxy);
  }
  return 0;
}

//------------------------------------------------------------------------------
// Uniform expressions
//------------------------------------------------------------------------------

u32 EvaluateNumber(PPCContext& ctx, u8* base, u32 expression, u32 context, float out[4]);

// FMaterialUniformExpressionScalarParameter::GetNumberValue.
u32 ScalarParameter(PPCContext& ctx, u8* base, u32 expression, u32 context, float out[4]) {
  out[0] = out[1] = out[2] = out[3] = 0.0f;
  const u32 found = ProxyScalar(ctx, base, LoadU(context), expression + kExpressionName, out[0]);
  if (!found)
    out[0] = LoadF(expression + kExpressionDefault);
  return found;
}

// FMaterialUniformExpressionVectorParameter::GetNumberValue.
u32 VectorParameter(PPCContext& ctx, u8* base, u32 expression, u32 context, float out[4]) {
  out[0] = out[1] = out[2] = out[3] = 0.0f;
  const u32 found = ProxyVector(ctx, base, LoadU(context), expression + kExpressionName, out);
  if (!found) {
    for (u32 i = 0; i < 4; ++i)
      out[i] = LoadF(expression + kExpressionDefault + i * 4);
  }
  return found;
}

// FMaterialUniformExpressionFoldedMath::GetNumberValue: add, subtract,
// multiply, divide, dot. The dot product is three fused multiply-adds, as the
// PowerPC rounds them.
u32 FoldedMath(PPCContext& ctx, u8* base, u32 expression, u32 context, float out[4]) {
  float a[4] = {}, b[4] = {};
  EvaluateNumber(ctx, base, LoadU(expression + kFoldedA), context, a);
  const u32 result = EvaluateNumber(ctx, base, LoadU(expression + kFoldedB), context, b);
  switch (LoadByte(expression + kFoldedOp)) {
    case 0:
      for (u32 i = 0; i < 4; ++i)
        out[i] = b[i] + a[i];
      break;
    case 1:
      for (u32 i = 0; i < 4; ++i)
        out[i] = a[i] - b[i];
      break;
    case 2:
      for (u32 i = 0; i < 4; ++i)
        out[i] = b[i] * a[i];
      break;
    case 3:
      for (u32 i = 0; i < 4; ++i)
        out[i] = a[i] / b[i];
      break;
    case 4: {
      const float zz = b[2] * a[2];
      const float dot = std::fmaf(b[0], a[0], std::fmaf(b[1], a[1], std::fmaf(b[3], a[3], zz)));
      out[0] = out[1] = out[2] = out[3] = dot;
      break;
    }
    default:
      break;
  }
  return result;
}

// FMaterialUniformExpressionAppendVector::GetNumberValue: A's first
// NumComponentsA components, then B's.
u32 AppendVector(PPCContext& ctx, u8* base, u32 expression, u32 context, float out[4]) {
  float a[4] = {}, b[4] = {};
  EvaluateNumber(ctx, base, LoadU(expression + kFoldedA), context, a);
  const u32 result = EvaluateNumber(ctx, base, LoadU(expression + kFoldedB), context, b);
  const u32 components_a = LoadU(expression + kAppendComponentsA);
  for (u32 i = 0; i < 4; ++i)
    out[i] = components_a > i ? a[i] : b[i - components_a];
  return result;
}

// sub_82CB2298: floor, leaving zeros and magnitudes past 1e18 alone.
double GuestFloor(double x) {
  const double ax = std::fabs(x);
  if (!(ax > 0.0) || ax > 1.0e18)
    return x;
  const double truncated = double(int64_t(x));
  return x - truncated >= 0.0 ? truncated : truncated - 1.0;
}

// fctiwz: truncation that saturates, NaN to INT_MIN.
int32_t GuestTruncate(float f) {
  if (std::isnan(f))
    return INT32_MIN;
  if (f >= 2147483647.0f)
    return INT32_MAX;
  if (f <= -2147483648.0f)
    return INT32_MIN;
  return int32_t(f);
}

// FMaterialUniformExpressionFrac::GetNumberValue: x - (int)floor(x).
u32 Frac(PPCContext& ctx, u8* base, u32 expression, u32 context, float out[4]) {
  float x[4] = {};
  EvaluateNumber(ctx, base, LoadU(expression + kFoldedA), context, x);
  for (u32 i = 0; i < 4; ++i)
    out[i] = x[i] - float(GuestTruncate(float(GuestFloor(double(x[i])))));
  return 0;
}

// expression->GetNumberValue(context, out).
u32 EvaluateNumber(PPCContext& ctx, u8* base, u32 expression, u32 context, float out[4]) {
  const u32 fn = Slot(expression, kGetNumberValueSlot);
  switch (fn) {
    case kScalarParameterNumber:
      return ScalarParameter(ctx, base, expression, context, out);
    case kVectorParameterNumber:
      return VectorParameter(ctx, base, expression, context, out);
    case kFoldedMathNumber:
      return FoldedMath(ctx, base, expression, context, out);
    case kAppendVectorNumber:
      return AppendVector(ctx, base, expression, context, out);
    case kFracNumber:
      return Frac(ctx, base, expression, context, out);
    default: {
      GuestFrame frame(ctx);
      for (u32 i = 0; i < 4; ++i)
        StoreF(frame.scratch() + i * 4, out[i]);
      const u32 result = CallGuest(ctx, base, fn, expression, context, frame.scratch());
      for (u32 i = 0; i < 4; ++i)
        out[i] = LoadF(frame.scratch() + i * 4);
      return result;
    }
  }
}

// FMaterialUniformExpressionTextureParameter::GetTextureValue.
u32 TextureParameter(PPCContext& ctx, u8* base, u32 expression, u32 context, u32& out) {
  out = 0;
  const u32 found = ProxyTexture(ctx, base, LoadU(context), expression + kExpressionName, out);
  if (!found) {
    if (const u32 texture = LoadU(expression + kExpressionDefault))
      out = LoadU(texture + kTextureResource);
  }
  return found;
}

// expression->GetTextureValue(context, out).
u32 EvaluateTexture(PPCContext& ctx, u8* base, u32 expression, u32 context, u32& out) {
  const u32 fn = Slot(expression, kGetTextureValueSlot);
  if (fn == kTextureParameterTexture)
    return TextureParameter(ctx, base, expression, context, out);
  GuestFrame frame(ctx);
  mem::Store<u32>(frame.scratch(), out);
  const u32 result = CallGuest(ctx, base, fn, expression, context, frame.scratch());
  out = LoadU(frame.scratch());
  return result;
}

// proxy->GetMaterial(). An instance resource answers from its own material
// when that is compiled for this platform (sub_8244F7D0), else asks its
// parent's render proxy; the chain ends at a UMaterial's own proxy.
u32 ProxyMaterial(PPCContext& ctx, u8* base, u32 proxy) {
  while (proxy) {
    const u32 fn = Slot(proxy, 0);
    GuestFrame frame(ctx);
    if (fn != kInstanceGetMaterial)
      return CallGuest(ctx, base, fn, proxy);
    const u32 owner = LoadU(proxy + kInstanceOwner);
    if (LoadU(owner + kOwnerFlags) & 0x80000000u) {
      ctx.r3.u64 = owner;
      sub_8244F7D0(ctx, base);
      if (const u32 material = ctx.r3.u32)
        return material;
    }
    const u32 parent = LoadU(proxy + kInstanceParent);
    if (!parent)
      return 0;
    proxy = CallGuest(ctx, base, Slot(parent, kGetRenderProxySlot), parent, 0);
  }
  return 0;
}

//------------------------------------------------------------------------------
// Textures and samplers
//------------------------------------------------------------------------------

u32 DeviceWord(const u8* device, u32 offset) {
  u32 value;
  std::memcpy(&value, device + offset, 4);
  return std::byteswap(value);
}

void SetDeviceWord(u8* device, u32 offset, u32 value) {
  value = std::byteswap(value);
  std::memcpy(device + offset, &value, 4);
}

// The fetch constants' dirty bits, one per sampler after the 32 others.
void MarkFetchDirty(u8* device, u64 mask) {
  u64 pending;
  std::memcpy(&pending, device + kDeviceFetchPending, 8);
  pending = std::byteswap(std::byteswap(pending) | mask);
  std::memcpy(device + kDeviceFetchPending, &pending, 8);
}

constexpr u32 RotateLeft(u32 value, u32 amount) {
  return (value << amount) | (value >> (32 - amount));
}

// sub_82E7A188 / sub_82E79FE0, D3D's MAGFILTER / MINFILTER sampler state
// setters: the filter's bit into fetch word 4, the filter and the anisotropy
// it implies into word 3, and word 4's low bits recomputed from word 3. `mag`
// picks the first's bit positions.
void SetFilter(u8* device, u32 sampler, u32 value, bool mag) {
  const u32 fetch = kDeviceFetchConstants + sampler * 24;
  const u32 word3 = DeviceWord(device, fetch + 0xC);
  const u32 word4 = DeviceWord(device, fetch + 0x10);
  const u32 table = LoadU(kFilterTable + u32(device[kDeviceSamplerAniso + sampler]) * 4);
  const u32 high = value >> 2;
  const u32 own_bit = mag ? 10 : 11;
  const u32 other_bit = mag ? 11 : 10;
  const u32 new_word4 = (word4 & ~(1u << own_bit)) | ((high & 1) << own_bit);
  const u32 other = (word4 >> other_bit) & 1;
  const u32 filter = ((table & ~((other | high) - 1)) << (mag ? 6 : 4)) | high | value;
  const u32 shift = mag ? 19 : 21;
  u32 new_word3 = (word3 & ~(3u << shift)) | ((filter & 3) << shift);
  new_word3 = (new_word3 & ~0x0E000000u) | (RotateLeft(filter, mag ? 19 : 21) & 0x0E000000u);
  SetDeviceWord(device, fetch + 0xC, new_word3);
  const u32 lod_bias = device[kDeviceSamplerLodBias + sampler];
  const u32 folded = (new_word3 & 0x80080000u) | ((new_word3 >> 1) & 0x7FF7FFFFu);
  const u32 mask = (lod_bias >> 2) - 1;
  const u32 low = (((folded >> 19) & 0xFFF) & mask) + (lod_bias & ~mask);
  SetDeviceWord(device, fetch + 0x10, (new_word4 & 0xFFFFFFFCu) | (low & 3));
  MarkFetchDirty(device, (u64(1) << 63) >> (sampler + 32));
}

// sub_82404C10, the RHI's SetTextureParameter: the texture into the sampler,
// then the sampler state's filters, mip filter, and U, V and W addressing
// into its fetch constant.
void BindTexture(PPCContext& ctx, u8* base, u32 device, u32 sampler, u32 state, u32 texture) {
  const u64 mask = (u64(1) << 63) >> (sampler + 32);
  ctx.r3.u64 = device;
  ctx.r4.u64 = sampler;
  ctx.r5.u64 = LoadU(texture + 8);
  ctx.r6.u64 = mask;
  D3DDevice_SetTexture(ctx, base);
  u8* bytes = mem::At<u8>(device);
  SetFilter(bytes, sampler, LoadU(state + 4), true);
  SetFilter(bytes, sampler, LoadU(state + 8), false);
  const u32 fetch = kDeviceFetchConstants + sampler * 24;
  const u32 word3 = DeviceWord(bytes, fetch + 0xC);
  SetDeviceWord(bytes, fetch + 0xC, (word3 & ~0x01800000u) | ((LoadU(state + 0xC) & 3) << 23));
  MarkFetchDirty(bytes, mask);
  static constexpr u32 kShifts[] = {10, 13, 16};
  for (u32 i = 0; i < 3; ++i) {
    const u32 word0 = DeviceWord(bytes, fetch);
    const u32 field = (LoadU(state + 0x10 + i * 4) & 7) << kShifts[i];
    SetDeviceWord(bytes, fetch, (word0 & ~(7u << kShifts[i])) | field);
    MarkFetchDirty(bytes, mask);
  }
}

//------------------------------------------------------------------------------
// Set
//------------------------------------------------------------------------------

// sub_825FEBA0 / sub_825FF220: a value into the pixel shader constants at the
// parameter's register ({u16 base, u16 count}), when it has one, and its bit
// in the device's pending mask.
void SetPixelValue(u8* device, u32 parameter_register, const float value[4]) {
  if (!mem::Load<u16>(parameter_register + 2))
    return;
  const u32 reg = mem::Load<u16>(parameter_register);
  u8* constant = device + kDevicePsConstants + reg * 16;
  for (u32 i = 0; i < 4; ++i) {
    const u32 bits = std::byteswap(std::bit_cast<u32>(value[i]));
    std::memcpy(constant + i * 4, &bits, 4);
  }
  u64 pending;
  std::memcpy(&pending, device + kDevicePsPending, 8);
  pending = std::byteswap(std::byteswap(pending) | (u64(1) << 63 >> (reg >> 2)));
  std::memcpy(device + kDevicePsPending, &pending, 8);
}

// The parameter's expression from one of the material's arrays, or 0.
u32 MaterialExpression(u32 material, u32 array, u32 index, bool check_bounds = true) {
  if (!material)
    return 0;
  if (check_bounds && i32(index) >= i32(LoadU(material + array + 4)))
    return 0;
  return LoadU(LoadU(material + array) + index * 4);
}

void SetTexture(PPCContext& ctx, u8* base, u32 device, u32 shader, u32 parameter, u32 texture) {
  if (!mem::Load<u16>(parameter + 10))
    return;
  mem::Store<u32>(texture + kTextureLastRenderTime, LoadU(kCurrentTime));
  mem::Store<u32>(texture + kTextureLastRenderTime + 4, LoadU(kCurrentTime + 4));
  (void)shader;
  BindTexture(ctx, base, device, mem::Load<u16>(parameter + 8),
              LoadU(texture + kTextureSamplerState), LoadU(texture + kTextureRhi));
}

}  // namespace

// FMaterialPixelShaderParameters::Set (this, device, shader, context).
REX_HOOK_RAW(sub_827D3438) {
  const u32 parameters = ctx.r3.u32;
  const u32 device = ctx.r4.u32;
  const u32 shader = ctx.r5.u32;
  const u32 context = ctx.r6.u32;
  u8* device_bytes = mem::At<u8>(device);
  GuestFrame frame(ctx);

  const u32 material = ProxyMaterial(ctx, base, LoadU(context));

  const u32 data = LoadU(parameters);
  const i32 count = i32(LoadU(parameters + 4));
  for (i32 i = 0; i < count; ++i) {
    const u32 parameter = data + u32(i) * kParameterSize;
    mem::Store<u32>(kCurrentParameter, parameter);
    const u32 index = LoadU(parameter + 4);
    switch (LoadByte(parameter)) {
      case kParameterVector: {
        float value[4] = {5.0f, 0.0f, 5.0f, 1.0f};
        if (const u32 expression = MaterialExpression(material, kMaterialVectors, index))
          EvaluateNumber(ctx, base, expression, context, value);
        SetPixelValue(device_bytes, parameter + 8, value);
        break;
      }
      case kParameterScalar: {
        float value[4] = {0.0f, 0.0f, 0.0f, 1.0f};
        if (const u32 expression = MaterialExpression(material, kMaterialScalars, index))
          EvaluateNumber(ctx, base, expression, context, value);
        const float scalar[4] = {value[0], value[0], value[0], value[0]};
        SetPixelValue(device_bytes, parameter + 8, scalar);
        break;
      }
      case kParameter2DTexture:
      case kParameterCubeTexture: {
        const bool cube = LoadByte(parameter) == kParameterCubeTexture;
        const u32 white = LoadU(cube ? kWhiteTextureCube : kWhiteTexture);
        u32 texture = 0;
        // Past the array's end Set takes the white texture without asking; a
        // cube parameter is not bounds checked again once that texture exists.
        const bool in_range = material && i32(index) < i32(LoadU(
            material + (cube ? kMaterialCubeTextures : kMaterial2DTextures) + 4));
        if (in_range || !white) {
          if (const u32 expression =
                  MaterialExpression(material, cube ? kMaterialCubeTextures : kMaterial2DTextures,
                                     index, !cube)) {
            EvaluateTexture(ctx, base, expression, context, texture);
          }
        }
        if (!texture)
          texture = white;
        SetTexture(ctx, base, device, shader, parameter, texture);
        break;
      }
      default:
        break;
    }
  }

  // Materials that read the scene's own constants get them in three
  // registers from the render context.
  if (material && (LoadU(material + kMaterialFlags) & kMaterialFlagSceneConstants) &&
      mem::Load<u16>(parameters + 0x12)) {
    const u32 start = mem::Load<u16>(parameters + 0x10);
    const u32 first = start >> 2;
    const u32 last = (start + 2) >> 2;
    const u64 mask = u64(i64(u64(1) << 63) >> (last - first)) >> first;
    ctx.r3.u64 = device;
    ctx.r4.u64 = start;
    ctx.r5.u64 = LoadU(context + 0xC) + 0x40;
    ctx.r6.u64 = 3;
    ctx.r7.u64 = mask;
    D3DDevice_SetPixelShaderConstantFN(ctx, base);
  }

  ctx.r3.u64 = parameters + 0x14;
  ctx.r4.u64 = device;
  ctx.r5.u64 = LoadU(context + 0xC);
  ctx.r6.u64 = shader;
  ctx.r7.u64 = 0;
  sub_8287E160(ctx, base);
}

// The evaluators and lookups, for the game's own callers.

REX_HOOK_RAW(sub_8279F748) {
  const u32 out = ctx.r5.u32;
  float value[4];
  const u32 result = ScalarParameter(ctx, base, ctx.r3.u32, ctx.r4.u32, value);
  for (u32 i = 0; i < 4; ++i)
    StoreF(out + i * 4, value[i]);
  ctx.r3.u64 = result;
}

REX_HOOK_RAW(sub_8279F4C0) {
  const u32 out = ctx.r5.u32;
  float value[4];
  const u32 result = VectorParameter(ctx, base, ctx.r3.u32, ctx.r4.u32, value);
  for (u32 i = 0; i < 4; ++i)
    StoreF(out + i * 4, value[i]);
  ctx.r3.u64 = result;
}

REX_HOOK_RAW(sub_827A0578) {
  const u32 out = ctx.r5.u32;
  float value[4];
  for (u32 i = 0; i < 4; ++i)
    value[i] = LoadF(out + i * 4);
  const u32 result = FoldedMath(ctx, base, ctx.r3.u32, ctx.r4.u32, value);
  for (u32 i = 0; i < 4; ++i)
    StoreF(out + i * 4, value[i]);
  ctx.r3.u64 = result;
}

REX_HOOK_RAW(sub_827A0D78) {
  const u32 out = ctx.r5.u32;
  float value[4];
  const u32 result = AppendVector(ctx, base, ctx.r3.u32, ctx.r4.u32, value);
  for (u32 i = 0; i < 4; ++i)
    StoreF(out + i * 4, value[i]);
  ctx.r3.u64 = result;
}

REX_HOOK_RAW(sub_827A0A30) {
  const u32 out = ctx.r5.u32;
  float value[4];
  const u32 result = Frac(ctx, base, ctx.r3.u32, ctx.r4.u32, value);
  for (u32 i = 0; i < 4; ++i)
    StoreF(out + i * 4, value[i]);
  ctx.r3.u64 = result;
}

// FMaterialInstance resource GetMaterial (this).
REX_HOOK_RAW(sub_8244EE80) {
  ctx.r3.u64 = ProxyMaterial(ctx, base, ctx.r3.u32);
}

// The RHI's SetTextureParameter (device, shader, sampler, sampler state,
// texture).
REX_HOOK_RAW(sub_82404C10) {
  BindTexture(ctx, base, ctx.r3.u32, ctx.r5.u32, ctx.r6.u32, ctx.r7.u32);
}

REX_HOOK_RAW(sub_8279FC90) {
  const u32 out = ctx.r5.u32;
  u32 texture = 0;
  const u32 result = TextureParameter(ctx, base, ctx.r3.u32, ctx.r4.u32, texture);
  mem::Store<u32>(out, texture);
  ctx.r3.u64 = result;
}

// FMaterialInstance resource lookups (this, name, out).
REX_HOOK_RAW(sub_8244EF98) {
  const u32 out = ctx.r5.u32;
  float value = LoadF(out);
  const u32 result = ProxyScalar(ctx, base, ctx.r3.u32, ctx.r4.u32, value);
  StoreF(out, value);
  ctx.r3.u64 = result;
}

REX_HOOK_RAW(sub_8244EEF0) {
  const u32 out = ctx.r5.u32;
  float value[4];
  for (u32 i = 0; i < 4; ++i)
    value[i] = LoadF(out + i * 4);
  const u32 result = ProxyVector(ctx, base, ctx.r3.u32, ctx.r4.u32, value);
  for (u32 i = 0; i < 4; ++i)
    StoreF(out + i * 4, value[i]);
  ctx.r3.u64 = result;
}

REX_HOOK_RAW(sub_82451C28) {
  const u32 out = ctx.r5.u32;
  u32 texture = LoadU(out);
  const u32 result = ProxyTexture(ctx, base, ctx.r3.u32, ctx.r4.u32, texture);
  mem::Store<u32>(out, texture);
  ctx.r3.u64 = result;
}

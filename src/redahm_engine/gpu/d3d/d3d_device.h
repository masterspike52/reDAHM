#pragma once

// Guest Direct3D layouts for Destroy All Humans! Path of the Furon.
//
// Every offset here was read off the title's own D3D code rather than taken
// from another game: this XDK allocates a 0x5E00-byte device
// (Direct3D_CreateDevice 0x82E694E0), so Blue Dragon's layout does not apply.
// The renderer only touches the fields the D3D-level hooks keep in sync
// (object bindings, viewport, scissor, constants) and the render state words
// the title's unhooked D3DRS setters write.

#include <cstddef>

#include <rex/types.h>

namespace redahm::gpu::d3d {

inline constexpr u32 kDeviceAllocSize = 0x5E00;

namespace dev {
// D3DTAGCOLLECTION m_Pending: [0] vertex shader float constants, [1] pixel
// shader float constants changed. Also set by the XDK's inline setters.
inline constexpr u32 kPendingMask = 0x000;
inline constexpr u32 kReferenceCount = 0x03C;
// Render/sampler state dispatch tables, seeded by D3D__ResetAllState
// (0x82E91CA8) from the template at 0x835C2E58.
inline constexpr u32 kSetRenderStateCall = 0x040;
inline constexpr u32 kGetRenderStateCall = 0x224;
// Per sampler: texture header bits plus the sampler state the D3DSAMP setters
// write (clamp, filter, border, anisotropy).
inline constexpr u32 kSamplerStates = 0x480;  // [26] x 24 bytes
inline constexpr u32 kVsFloatConstants = 0x780;  // SetVertexShaderConstantF
inline constexpr u32 kPsFloatConstants = 0x1780;  // SetPixelShaderConstantF
inline constexpr u32 kVsBoolConstants = 0x2780;  // SetVertexShaderConstantB
inline constexpr u32 kPsBoolConstants = 0x2790;  // SetPixelShaderConstantB

// Render state words written by the D3DRS setters in the dispatch table.
inline constexpr u32 kStencilRef = 0x2900;        // ref | mask << 8 | write mask << 16 (33-35)
inline constexpr u32 kAlphaRef = 0x2904;          // float, D3DRS_ALPHAREF / 255
inline constexpr u32 kDepthStencilState = 0x2934;  // ZENABLE/ZFUNC/STENCIL* (states 10-12, 27-39)
inline constexpr u32 kBlendState0 = 0x2938;       // SRCBLEND/DESTBLEND/BLENDOP (states 15-23)
inline constexpr u32 kAlphaTestState = 0x293C;    // ALPHAFUNC, ALPHATESTENABLE (states 24, 26)
inline constexpr u32 kRasterState = 0x2948;       // CULLMODE, depth bias enables (13, 14, 51, 52)
// D3DRS_VIEWPORTENABLE (D3DDevice_SetRenderState_ViewportEnable 0x82E79808):
// 0x43F when enabled, 0x400 when disabled, which leaves vertex shader output
// positions in render target pixels.
inline constexpr u32 kViewportEnable = 0x294C;
inline constexpr u32 kViewportEnableTransformMask = 0x3F;
inline constexpr u32 kBlendState1 = 0x2958;
inline constexpr u32 kBlendState2 = 0x295C;
inline constexpr u32 kBlendState3 = 0x2960;
inline constexpr u32 kSlopeScaleDepthBias = 0x2A50;  // state 51
inline constexpr u32 kDepthBias = 0x2A54;            // state 52
inline constexpr u32 kScissorTestEnable = 0x2E50;    // state 50
inline constexpr u32 kColorWriteEnable = 0x2E54;     // states 53-56, one word per target

// Object bindings the Get* functions read back.
inline constexpr u32 kVertexDeclaration = 0x2E2C;
inline constexpr u32 kIndices = 0x3094;
inline constexpr u32 kRenderTargets = 0x3098;  // [4]
inline constexpr u32 kDepthStencil = 0x30A8;
inline constexpr u32 kStreams = 0x30AC;  // [16]
inline constexpr u32 kTextures = 0x3100;  // [26]
inline constexpr u32 kViewport = 0x3168;  // X Y W H MinZ MaxZ, all float (GetViewport 0x82E7AB28)
inline constexpr u32 kScissorRect = 0x3184;
inline constexpr u32 kPixelShader = 0x3194;
inline constexpr u32 kVertexShader = 0x3198;

inline constexpr u32 kPresentParameters = 0x34E8;
inline constexpr u32 kFrontBufferFormat = 0x3528;
// PresentationInterval is read by D3D__ResetAllState from here.
inline constexpr u32 kBehaviorFlags = 0x5D7C;
}  // namespace dev

inline constexpr u32 kMaxRenderTargets = 4;
inline constexpr u32 kMaxStreams = 16;
inline constexpr u32 kMaxSamplers = 16;

// D3DResource::Common.
inline constexpr u32 kCommonTypeMask = 0xF;
inline constexpr u32 kCommonTypeVertexBuffer = 1;
inline constexpr u32 kCommonTypeIndexBuffer = 2;
inline constexpr u32 kCommonTypeTexture = 3;
inline constexpr u32 kCommonTypeSurface = 4;
inline constexpr u32 kCommonTypeVertexShader = 6;
inline constexpr u32 kCommonTypePixelShader = 7;
// A surface from GetSurfaceLevel: surface_info holds the parent texture.
inline constexpr u32 kCommonTextureLevelSurface = 0x40000000;
// XGSetIndexBufferHeader stores the D3DFORMAT << 29; INDEX32 sets bit 31.
inline constexpr u32 kCommonIndex32 = 0x80000000;

struct Resource {
  be_u32 common;
  be_u32 reference_count;
  be_u32 fence;
  be_u32 read_fence;
  be_u32 identifier;
  be_u32 base_flush;
};
static_assert(sizeof(Resource) == 24);

// D3DBaseTexture: the header plus its GPUTEXTURE_FETCH_CONSTANT.
struct BaseTexture {
  Resource resource;
  be_u32 mip_flush;
  be_u32 format[6];
};
static_assert(sizeof(BaseTexture) == 52);

struct Surface {
  Resource resource;
  be_u32 surface_info;  // parent texture for level surfaces
  be_u32 info;          // level << 28 | face << 22 for level surfaces
  be_u32 hi_control;
  be_u32 size_bits;  // (width - 1) << 18 | (height - 1) << 3
  be_u32 format;     // D3DFORMAT
  be_u32 size;
};
static_assert(sizeof(Surface) == 48);

// XGSetVertexBufferHeader (0x82E607C0).
struct VertexBuffer {
  Resource resource;
  be_u32 address;  // buffer VA | 3
  be_u32 size;     // bytes in bits 2..25 | 0x10000002
};
static_assert(sizeof(VertexBuffer) == 32);

// XGSetIndexBufferHeader (0x82E60858).
struct IndexBuffer {
  Resource resource;
  be_u32 address;
  be_u32 size;
};
static_assert(sizeof(IndexBuffer) == 32);

// D3DVERTEXELEMENT9.
struct VertexElement {
  be_u16 stream;
  be_u16 offset;
  be_u32 type;
  u8 method;
  u8 usage;
  u8 usage_index;
  u8 pad;
};
static_assert(sizeof(VertexElement) == 12);

// D3DVIEWPORT9 as the title passes it.
struct Viewport {
  be_u32 x;
  be_u32 y;
  be_u32 width;
  be_u32 height;
  be_f32 min_z;
  be_f32 max_z;
};
static_assert(sizeof(Viewport) == 24);

struct Rect {
  be_i32 left;
  be_i32 top;
  be_i32 right;
  be_i32 bottom;
};
static_assert(sizeof(Rect) == 16);

struct PresentParameters {
  be_u32 back_buffer_width;
  be_u32 back_buffer_height;
  be_u32 back_buffer_format;
  be_u32 back_buffer_count;
  be_u32 multi_sample_type;
  be_u32 multi_sample_quality;
  be_u32 swap_effect;
  be_u32 device_window;
  be_u32 windowed;
  be_u32 enable_auto_depth_stencil;
  be_u32 auto_depth_stencil_format;
  be_u32 flags;
  be_u32 refresh_rate;
  be_u32 presentation_interval;
  be_u32 disable_auto_back_buffer;
  be_u32 disable_auto_front_buffer;
  be_u32 front_buffer_format;
  be_u32 front_buffer_color_space;
  u8 ring_buffer_parameters[24];
  u8 video_scaler_parameters[28];
};
static_assert(sizeof(PresentParameters) == 124);

// X360 D3DCLEAR.
inline constexpr u32 kClearTarget = 0x1;
inline constexpr u32 kClearTargetAll = 0xF;
inline constexpr u32 kClearZBuffer = 0x10;
inline constexpr u32 kClearStencil = 0x20;

// X360 D3DRESOLVE.
inline constexpr u32 kResolveSourceMask = 0x7;
inline constexpr u32 kResolveDepthStencil = 4;
inline constexpr u32 kResolveClearRenderTarget = 0x100;
inline constexpr u32 kResolveClearDepthStencil = 0x200;

// X360 D3DPRIMITIVETYPE.
enum class PrimitiveType : u32 {
  kPointList = 1,
  kLineList = 2,
  kLineStrip = 3,
  kTriangleList = 4,
  kTriangleFan = 5,
  kTriangleStrip = 6,
  kRectList = 8,
  kLineLoop = 12,
  kQuadList = 13,
};

// D3DDECLUSAGE.
enum class DeclUsage : u8 {
  kPosition = 0,
  kBlendWeight = 1,
  kBlendIndices = 2,
  kNormal = 3,
  kPSize = 4,
  kTexCoord = 5,
  kTangent = 6,
  kBinormal = 7,
  kTessFactor = 8,
  kPositionT = 9,
  kColor = 10,
  kFog = 11,
  kDepth = 12,
  kSample = 13,
};

// X360 D3DDECLTYPE. The first eight are what PotF's UE3 emits (vertex
// element type table in sub_8283CFC0); the rest are the other XDK types.
enum class DeclType : u32 {
  kFloat1 = 0x2C83A4,
  kFloat2 = 0x2C23A5,
  kFloat3 = 0x2A23B9,
  kFloat4 = 0x1A23A6,
  kUByte4 = 0x1A2286,  // VET_PackedNormal and VET_UByte4
  kUByte4N = 0x1A2086,
  kD3DColor = 0x182886,
  kShort2 = 0x2C2359,
  kShort4 = 0x1A235A,
  kShort2N = 0x2C2159,
  kShort4N = 0x1A215A,
  kUShort2N = 0x2C2059,
  kUShort4N = 0x1A205A,
  kFloat16_2 = 0x2C235F,
  kFloat16_4 = 0x1A2360,
  kUnused = 0xFFFFFFFF,
};

}  // namespace redahm::gpu::d3d

#include "d3d/d3d_formats.h"

#include "core/log.h"

namespace redahm::gpu::d3d {

namespace {
namespace xe = rex::graphics::xenos;
using F = plume::RenderFormat;
}  // namespace

HostFormat ConvertTextureFormat(u32 d3d_format) {
  switch (TextureFormatOf(d3d_format)) {
    case xe::TextureFormat::k_8:
    case xe::TextureFormat::k_8_A:
    case xe::TextureFormat::k_8_B:
      return {F::R8_UNORM};
    case xe::TextureFormat::k_8_8:
      return {F::R8G8_UNORM};
    case xe::TextureFormat::k_8_8_8_8:
    case xe::TextureFormat::k_8_8_8_8_A:
    case xe::TextureFormat::k_8_8_8_8_AS_16_16_16_16:
      return {F::R8G8B8A8_UNORM};
    case xe::TextureFormat::k_DXT1:
    case xe::TextureFormat::k_DXT1_AS_16_16_16_16:
      return {F::BC1_UNORM, true};
    case xe::TextureFormat::k_DXT2_3:
    case xe::TextureFormat::k_DXT2_3_AS_16_16_16_16:
      return {F::BC2_UNORM, true};
    case xe::TextureFormat::k_DXT4_5:
    case xe::TextureFormat::k_DXT4_5_AS_16_16_16_16:
      return {F::BC3_UNORM, true};
    case xe::TextureFormat::k_DXT5A:
      return {F::BC4_UNORM, true};
    case xe::TextureFormat::k_DXN:
      return {F::BC5_UNORM, true};
    case xe::TextureFormat::k_16:
      return {F::R16_UNORM};
    case xe::TextureFormat::k_16_16:
      return {F::R16G16_UNORM};
    case xe::TextureFormat::k_16_16_16_16:
      return {F::R16G16B16A16_UNORM};
    // The _EXPAND formats hold 16-bit floats. PotF's variance shadow maps are
    // rendered as k_16_16_FLOAT and resolved into k_16_16_EXPAND textures; as
    // UNORM the resolve clamped the moments to [0, 1] and requantised them.
    case xe::TextureFormat::k_16_FLOAT:
    case xe::TextureFormat::k_16_EXPAND:
      return {F::R16_FLOAT};
    case xe::TextureFormat::k_16_16_FLOAT:
    case xe::TextureFormat::k_16_16_EXPAND:
      return {F::R16G16_FLOAT};
    case xe::TextureFormat::k_16_16_16_16_FLOAT:
    case xe::TextureFormat::k_16_16_16_16_EXPAND:
      return {F::R16G16B16A16_FLOAT};
    case xe::TextureFormat::k_32_FLOAT:
      return {F::R32_FLOAT};
    case xe::TextureFormat::k_32_32_FLOAT:
      return {F::R32G32_FLOAT};
    case xe::TextureFormat::k_32_32_32_32_FLOAT:
      return {F::R32G32B32A32_FLOAT};
    // Formats only resolves write into.
    case xe::TextureFormat::k_24_8:
    case xe::TextureFormat::k_24_8_FLOAT:
      return {F::R32_FLOAT, false, true};
    case xe::TextureFormat::k_2_10_10_10:
    case xe::TextureFormat::k_2_10_10_10_AS_16_16_16_16:
      return {F::R16G16B16A16_UNORM, false, true};
    case xe::TextureFormat::k_16_16_EDRAM:
      return {F::R16G16_FLOAT, false, true};
    case xe::TextureFormat::k_2_10_10_10_FLOAT_EDRAM:
    case xe::TextureFormat::k_16_16_16_16_EDRAM:
      return {F::R16G16B16A16_FLOAT, false, true};
    case xe::TextureFormat::k_8_8_8_8_GAMMA_EDRAM:
      return {F::R8G8B8A8_UNORM, false, true};
    default:
      GPU_WARN_LIMITED(16, "No host format for D3DFORMAT {:08X}", d3d_format);
      return {};
  }
}

plume::RenderFormat ConvertSurfaceFormat(u32 d3d_format) {
  switch (TextureFormatOf(d3d_format)) {
    case xe::TextureFormat::k_24_8:
    case xe::TextureFormat::k_24_8_FLOAT:
      return kDepthStencilFormat;
    default: {
      const HostFormat host = ConvertTextureFormat(d3d_format);
      return IsRenderTargetCapable(host.format) ? host.format : F::R8G8B8A8_UNORM;
    }
  }
}

plume::RenderFormat ToSrgbFormat(plume::RenderFormat format) {
  switch (format) {
    case F::BC1_UNORM: return F::BC1_UNORM_SRGB;
    case F::BC2_UNORM: return F::BC2_UNORM_SRGB;
    case F::BC3_UNORM: return F::BC3_UNORM_SRGB;
    case F::BC7_UNORM: return F::BC7_UNORM_SRGB;
    default: return F::UNKNOWN;
  }
}

bool IsRenderTargetCapable(plume::RenderFormat format) {
  switch (format) {
    case F::R8_UNORM:
    case F::R8G8_UNORM:
    case F::R8G8B8A8_UNORM:
    case F::B8G8R8A8_UNORM:
    case F::R16_UNORM:
    case F::R16G16_UNORM:
    case F::R16G16B16A16_UNORM:
    case F::R16_FLOAT:
    case F::R16G16_FLOAT:
    case F::R16G16B16A16_FLOAT:
    case F::R32_FLOAT:
    case F::R32G32_FLOAT:
    case F::R32G32B32A32_FLOAT:
      return true;
    default:
      return false;
  }
}

plume::RenderFormat ConvertDeclType(DeclType type) {
  switch (type) {
    case DeclType::kFloat1:
      return F::R32_FLOAT;
    case DeclType::kFloat2:
      return F::R32G32_FLOAT;
    case DeclType::kFloat3:
      return F::R32G32B32_FLOAT;
    case DeclType::kFloat4:
      return F::R32G32B32A32_FLOAT;
    // One word, swapped: x lands in the low byte.
    case DeclType::kUByte4:
      return F::R8G8B8A8_UINT;
    case DeclType::kUByte4N:
      return F::R8G8B8A8_UNORM;
    // ARGB in a word, swapped to B G R A bytes.
    case DeclType::kD3DColor:
      return F::B8G8R8A8_UNORM;
    // Sixteen-bit pairs come out of the word swap in reverse order; the
    // shaders swap them back (g_SwappedTexcoords).
    case DeclType::kShort2:
      return F::R16G16_UINT;
    case DeclType::kShort4:
      return F::R16G16B16A16_UINT;
    case DeclType::kShort2N:
      return F::R16G16_SNORM;
    case DeclType::kShort4N:
      return F::R16G16B16A16_SNORM;
    case DeclType::kUShort2N:
      return F::R16G16_UNORM;
    case DeclType::kUShort4N:
      return F::R16G16B16A16_UNORM;
    case DeclType::kFloat16_2:
      return F::R16G16_FLOAT;
    case DeclType::kFloat16_4:
      return F::R16G16B16A16_FLOAT;
    default:
      GPU_WARN_LIMITED(8, "Unsupported vertex element type {:08X}", u32(type));
      return F::UNKNOWN;
  }
}

const char* DeclUsageName(DeclUsage usage) {
  switch (usage) {
    case DeclUsage::kPosition: return "POSITION";
    case DeclUsage::kBlendWeight: return "BLENDWEIGHT";
    case DeclUsage::kBlendIndices: return "BLENDINDICES";
    case DeclUsage::kNormal: return "NORMAL";
    case DeclUsage::kPSize: return "PSIZE";
    case DeclUsage::kTexCoord: return "TEXCOORD";
    case DeclUsage::kTangent: return "TANGENT";
    case DeclUsage::kBinormal: return "BINORMAL";
    case DeclUsage::kTessFactor: return "TESSFACTOR";
    case DeclUsage::kPositionT: return "POSITIONT";
    case DeclUsage::kColor: return "COLOR";
    case DeclUsage::kFog: return "FOG";
    case DeclUsage::kDepth: return "DEPTH";
    case DeclUsage::kSample: return "SAMPLE";
  }
  return "TEXCOORD";
}

plume::RenderBlend ConvertBlend(u32 xenos_blend_factor, bool alpha_channel) {
  using B = plume::RenderBlend;
  switch (static_cast<xe::BlendFactor>(xenos_blend_factor)) {
    case xe::BlendFactor::kZero: return B::ZERO;
    case xe::BlendFactor::kOne: return B::ONE;
    case xe::BlendFactor::kSrcColor: return alpha_channel ? B::SRC_ALPHA : B::SRC_COLOR;
    case xe::BlendFactor::kOneMinusSrcColor: return alpha_channel ? B::INV_SRC_ALPHA : B::INV_SRC_COLOR;
    case xe::BlendFactor::kSrcAlpha: return B::SRC_ALPHA;
    case xe::BlendFactor::kOneMinusSrcAlpha: return B::INV_SRC_ALPHA;
    case xe::BlendFactor::kDstColor: return alpha_channel ? B::DEST_ALPHA : B::DEST_COLOR;
    case xe::BlendFactor::kOneMinusDstColor: return alpha_channel ? B::INV_DEST_ALPHA : B::INV_DEST_COLOR;
    case xe::BlendFactor::kDstAlpha: return B::DEST_ALPHA;
    case xe::BlendFactor::kOneMinusDstAlpha: return B::INV_DEST_ALPHA;
    case xe::BlendFactor::kSrcAlphaSaturate: return alpha_channel ? B::ONE : B::SRC_ALPHA_SAT;
    // D3DRS_BLENDFACTOR has no plume equivalent to feed.
    default:
      GPU_WARN_LIMITED(4, "Unsupported blend factor {}", xenos_blend_factor);
      return B::ONE;
  }
}

plume::RenderBlendOperation ConvertBlendOp(u32 xenos_blend_op) {
  using O = plume::RenderBlendOperation;
  switch (static_cast<xe::BlendOp>(xenos_blend_op)) {
    case xe::BlendOp::kAdd: return O::ADD;
    case xe::BlendOp::kSubtract: return O::SUBTRACT;
    case xe::BlendOp::kMin: return O::MIN;
    case xe::BlendOp::kMax: return O::MAX;
    case xe::BlendOp::kRevSubtract: return O::REV_SUBTRACT;
  }
  return O::ADD;
}

plume::RenderComparisonFunction ConvertCompare(u32 xenos_compare) {
  using C = plume::RenderComparisonFunction;
  switch (static_cast<xe::CompareFunction>(xenos_compare & 7)) {
    case xe::CompareFunction::kNever: return C::NEVER;
    case xe::CompareFunction::kLess: return C::LESS;
    case xe::CompareFunction::kEqual: return C::EQUAL;
    case xe::CompareFunction::kLessEqual: return C::LESS_EQUAL;
    case xe::CompareFunction::kGreater: return C::GREATER;
    case xe::CompareFunction::kNotEqual: return C::NOT_EQUAL;
    case xe::CompareFunction::kGreaterEqual: return C::GREATER_EQUAL;
    case xe::CompareFunction::kAlways: return C::ALWAYS;
  }
  return C::ALWAYS;
}

plume::RenderStencilOp ConvertStencilOp(u32 xenos_stencil_op) {
  using S = plume::RenderStencilOp;
  switch (static_cast<xe::StencilOp>(xenos_stencil_op & 7)) {
    case xe::StencilOp::kKeep: return S::KEEP;
    case xe::StencilOp::kZero: return S::ZERO;
    case xe::StencilOp::kReplace: return S::REPLACE;
    case xe::StencilOp::kIncrementClamp: return S::INCREMENT_AND_CLAMP;
    case xe::StencilOp::kDecrementClamp: return S::DECREMENT_AND_CLAMP;
    case xe::StencilOp::kInvert: return S::INVERT;
    case xe::StencilOp::kIncrementWrap: return S::INCREMENT_AND_WRAP;
    case xe::StencilOp::kDecrementWrap: return S::DECREMENT_AND_WRAP;
  }
  return S::KEEP;
}

}  // namespace redahm::gpu::d3d

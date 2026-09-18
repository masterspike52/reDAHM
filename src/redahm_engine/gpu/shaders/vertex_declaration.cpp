#include "shaders/vertex_declaration.h"

#define SHADER_COMMON_SPEC_CONSTANTS_ONLY
#include <shader_common.h>

#include <cstring>
#include <iterator>
#include <mutex>
#include <unordered_map>

#include <xxhash.h>

#include "core/log.h"
#include "d3d/d3d_formats.h"

namespace redahm::gpu {

namespace {

using d3d::DeclType;
using d3d::DeclUsage;

// The [[vk::location]] XenosRecomp assigns each input. Both sides are
// generated from REDAHM_VERTEX_INPUT_LOCATIONS so the host input layout and the
// recompiled shaders cannot drift apart.
struct Location {
  DeclUsage usage;
  u32 usage_index;
  u32 location;
  bool integer;  // uint4 input
};

// The inputs the recompiler declares as uint4 rather than float4.
constexpr bool IsIntegerInput(DeclUsage usage, u32 usage_index) {
  if (usage_index != 0)
    return false;
  return usage == DeclUsage::kNormal || usage == DeclUsage::kTangent ||
         usage == DeclUsage::kBinormal || usage == DeclUsage::kBlendIndices;
}

#define REDAHM_VERTEX_LOCATION_ROW(u, i, l)   {DeclUsage::k##u, i, l, IsIntegerInput(DeclUsage::k##u, i)},
constexpr Location kLocations[] = {REDAHM_VERTEX_INPUT_LOCATIONS(REDAHM_VERTEX_LOCATION_ROW)};
#undef REDAHM_VERTEX_LOCATION_ROW

// Every semantic DAH:PotF's vertex shaders declare, each with its own location.
static_assert(std::size(kLocations) == 16);

const Location* FindLocation(DeclUsage usage, u32 usage_index) {
  for (const auto& location : kLocations) {
    if (location.usage == usage && location.usage_index == usage_index)
      return &location;
  }
  return nullptr;
}

bool IsSixteenBitPair(DeclType type) {
  switch (type) {
    case DeclType::kShort2:
    case DeclType::kShort4:
    case DeclType::kShort2N:
    case DeclType::kShort4N:
    case DeclType::kUShort2N:
    case DeclType::kUShort4N:
    case DeclType::kFloat16_2:
    case DeclType::kFloat16_4:
      return true;
    default:
      return false;
  }
}

std::mutex g_mutex;
std::unordered_map<u64, std::unique_ptr<HostVertexDeclaration>> g_by_hash;
std::unordered_map<u32, HostVertexDeclaration*> g_by_address;

std::unique_ptr<HostVertexDeclaration> Build(const d3d::VertexElement* elements, u32 count,
                                             u64 hash) {
  auto decl = std::make_unique<HostVertexDeclaration>();
  decl->hash = hash;

  for (u32 i = 0; i < count; ++i) {
    const auto& e = elements[i];
    const auto type = static_cast<DeclType>(u32(e.type));
    const auto usage = static_cast<DeclUsage>(e.usage);
    const u32 stream = u16(e.stream);
    if (stream >= d3d::kMaxStreams || type == DeclType::kUnused)
      continue;
    const Location* location = FindLocation(usage, e.usage_index);
    if (!location) {
      GPU_WARN_LIMITED(8, "Vertex element {}{} has no shader input", d3d::DeclUsageName(usage),
                       e.usage_index);
      continue;
    }

    plume::RenderInputElement input(d3d::DeclUsageName(usage), e.usage_index, location->location,
                                    d3d::ConvertDeclType(type), stream, u16(e.offset));
    if (input.format == plume::RenderFormat::UNKNOWN)
      continue;

    switch (usage) {
      case DeclUsage::kNormal:
      case DeclUsage::kTangent:
      case DeclUsage::kBinormal:
        if (type == DeclType::kUByte4) {
          decl->integer_tangent_basis = true;
        } else if (type == DeclType::kFloat3 || type == DeclType::kFloat4) {
          // Read back with asfloat: bind the float bits as integers.
          input.format = type == DeclType::kFloat3 ? plume::RenderFormat::R32G32B32_UINT
                                                   : plume::RenderFormat::R32G32B32A32_UINT;
        } else {
          GPU_WARN_LIMITED(4, "Tangent basis element type {:08X} unsupported", u32(type));
        }
        break;
      case DeclUsage::kTexCoord:
        if (IsSixteenBitPair(type))
          decl->swapped_texcoords |= 1u << e.usage_index;
        if (type == DeclType::kShort2 || type == DeclType::kShort4)
          decl->sint_texcoords |= 1u << e.usage_index;
        break;
      default:
        if (IsSixteenBitPair(type)) {
          GPU_WARN_LIMITED(4, "{} uses 16-bit element type {:08X}", d3d::DeclUsageName(usage),
                           u32(type));
        }
        break;
    }

    decl->streams[stream] = true;
    decl->input_elements.push_back(input);
  }

  // Every shader input needs an element: D3D12 matches them by semantic, and
  // Vulkan wants an attribute per declared location. Inputs the declaration
  // omits read zeros from the zero stream, in the input's numeric class.
  for (const auto& location : kLocations) {
    const char* name = d3d::DeclUsageName(location.usage);
    bool present = false;
    for (const auto& input : decl->input_elements) {
      present |= input.semanticIndex == location.usage_index &&
                 std::strcmp(input.semanticName, name) == 0;
    }
    if (present)
      continue;
    decl->input_elements.push_back(plume::RenderInputElement(
        name, location.usage_index, location.location,
        location.integer ? plume::RenderFormat::R32G32B32A32_UINT
                         : plume::RenderFormat::R32G32B32A32_FLOAT,
        kZeroStream, 0));
  }
  return decl;
}

}  // namespace

HostVertexDeclaration* RegisterVertexDeclaration(u32 declaration_va,
                                                 const d3d::VertexElement* elements) {
  if (!elements)
    return nullptr;
  u32 count = 0;
  while (count < 64 && u16(elements[count].stream) != 0xFF &&
         u32(elements[count].type) != u32(DeclType::kUnused)) {
    ++count;
  }
  // The padding byte is not always zero.
  std::vector<d3d::VertexElement> normalized(elements, elements + count);
  for (auto& e : normalized)
    e.pad = 0;
  const u64 hash = XXH3_64bits(normalized.data(), count * sizeof(d3d::VertexElement));

  std::lock_guard lock(g_mutex);
  auto& shared = g_by_hash[hash];
  if (!shared)
    shared = Build(normalized.data(), count, hash);
  g_by_address[declaration_va] = shared.get();
  return shared.get();
}

HostVertexDeclaration* FindVertexDeclaration(u32 declaration_va) {
  std::lock_guard lock(g_mutex);
  auto it = g_by_address.find(declaration_va);
  return it != g_by_address.end() ? it->second : nullptr;
}

}  // namespace redahm::gpu

#include "shaders/dxc_link.h"

#if defined(_WIN32)

#include <unknwn.h>

#include <dxcapi.h>

#include <cstdio>
#include <mutex>
#include <unordered_map>

#include "core/log.h"

namespace redahm::gpu {

namespace {

template <typename T>
class Com {
 public:
  Com() = default;
  ~Com() {
    if (p_)
      p_->Release();
  }
  Com(const Com&) = delete;
  Com& operator=(const Com&) = delete;
  T** put() { return &p_; }
  T* operator->() const { return p_; }
  T* get() const { return p_; }
  explicit operator bool() const { return p_ != nullptr; }

 private:
  T* p_ = nullptr;
};

std::vector<uint8_t> ToVector(IDxcBlob* blob) {
  const auto* bytes = static_cast<const uint8_t*>(blob->GetBufferPointer());
  return std::vector<uint8_t>(bytes, bytes + blob->GetBufferSize());
}

std::vector<uint8_t> CompileSpecConstantLibrary(uint32_t value) {
  Com<IDxcCompiler3> compiler;
  if (FAILED(DxcCreateInstance(CLSID_DxcCompiler, IID_PPV_ARGS(compiler.put()))))
    return {};

  char hlsl[128];
  const int length =
      std::snprintf(hlsl, sizeof(hlsl), "export uint g_SpecConstants() { return %u; }", value);
  DxcBuffer buffer{};
  buffer.Ptr = hlsl;
  buffer.Size = static_cast<SIZE_T>(length);
  buffer.Encoding = DXC_CP_ACP;

  const wchar_t* args[] = {L"-T", L"lib_6_3"};
  Com<IDxcResult> result;
  if (FAILED(compiler->Compile(&buffer, args, 2, nullptr, IID_PPV_ARGS(result.put()))) || !result)
    return {};
  Com<IDxcBlob> blob;
  if (FAILED(result->GetResult(blob.put())) || !blob || blob->GetBufferSize() == 0)
    return {};
  return ToVector(blob.get());
}

std::mutex g_mutex;
// Element references stay valid across inserts.
std::unordered_map<uint32_t, std::vector<uint8_t>> g_libraries;

const std::vector<uint8_t>* SpecConstantLibrary(uint32_t value) {
  std::lock_guard lock(g_mutex);
  auto it = g_libraries.find(value);
  if (it == g_libraries.end()) {
    it = g_libraries.emplace(value, CompileSpecConstantLibrary(value)).first;
    if (it->second.empty())
      GPU_ERROR("g_SpecConstants({}) library compile failed", value);
  }
  return it->second.empty() ? nullptr : &it->second;
}

}  // namespace

std::vector<uint8_t> LinkSpecConstants(const uint8_t* library_dxil, size_t library_size,
                                       bool pixel_shader, uint32_t spec_constants) {
  if (!library_dxil || library_size == 0)
    return {};
  const std::vector<uint8_t>* spec_library = SpecConstantLibrary(spec_constants);
  if (!spec_library)
    return {};

  Com<IDxcUtils> utils;
  if (FAILED(DxcCreateInstance(CLSID_DxcUtils, IID_PPV_ARGS(utils.put()))))
    return {};
  Com<IDxcBlobEncoding> spec_blob;
  Com<IDxcBlobEncoding> shader_blob;
  if (FAILED(utils->CreateBlobFromPinned(spec_library->data(), UINT32(spec_library->size()),
                                         DXC_CP_ACP, spec_blob.put())) ||
      FAILED(utils->CreateBlobFromPinned(library_dxil, UINT32(library_size), DXC_CP_ACP,
                                         shader_blob.put()))) {
    return {};
  }

  Com<IDxcLinker> linker;
  if (FAILED(DxcCreateInstance(CLSID_DxcLinker, IID_PPV_ARGS(linker.put()))))
    return {};
  linker->RegisterLibrary(L"SpecConstants", spec_blob.get());
  linker->RegisterLibrary(L"Shader", shader_blob.get());
  const wchar_t* libraries[] = {L"SpecConstants", L"Shader"};

  Com<IDxcOperationResult> result;
  if (FAILED(linker->Link(L"main", pixel_shader ? L"ps_6_0" : L"vs_6_0", libraries, 2, nullptr, 0,
                          result.put())) ||
      !result) {
    return {};
  }
  // A failed link is reported through the status, not the HRESULT.
  HRESULT status = E_FAIL;
  if (FAILED(result->GetStatus(&status)) || FAILED(status)) {
    GPU_ERROR("DXC link failed (spec constants {})", spec_constants);
    return {};
  }
  Com<IDxcBlob> linked;
  if (FAILED(result->GetResult(linked.put())) || !linked || linked->GetBufferSize() == 0)
    return {};
  return ToVector(linked.get());
}

}  // namespace redahm::gpu

#else

namespace redahm::gpu {

std::vector<uint8_t> LinkSpecConstants(const uint8_t*, size_t, bool, uint32_t) {
  return {};
}

}  // namespace redahm::gpu

#endif

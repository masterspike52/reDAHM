#include "core/settings.h"

#include <cctype>

REXCVAR_DEFINE_STRING(redahm_gpu_api, "d3d12", "POTF/Graphics", "Graphics API for the renderer: d3d12 or vulkan")
.allowed({"d3d12", "vulkan"});
REXCVAR_DEFINE_BOOL(redahm_vsync, true, "POTF/Graphics", "Wait for vertical sync when presenting");
REXCVAR_DEFINE_INT32(redahm_anisotropy, 8, "POTF/Graphics",
                     "Maximum anisotropic filtering for linear-filtered textures (0 disables)");
REXCVAR_DEFINE_BOOL(redahm_stretch_output, false, "POTF/Graphics",
                    "Stretch the frame to the window instead of letterboxing it");

#if !defined(REDAHM_RUNTIME_SHADER_DIR)
#define REDAHM_RUNTIME_SHADER_DIR ""
#endif
REXCVAR_DEFINE_STRING(redahm_runtime_shader_dir, REDAHM_RUNTIME_SHADER_DIR, "POTF/Graphics",
                      "Folder that receives shaders the game compiles at runtime and the shader "
                      "cache lacks; rebuild to include them");
REXCVAR_DEFINE_BOOL(redahm_gpu_trace_frame, false, "POTF/Graphics",
                    "Log the render target, clear and resolve sequence of a few in-game frames");
REXCVAR_DEFINE_BOOL(redahm_geometry_gpu_upload, true, "POTF/Graphics",
                    "Place static geometry in the GPU_UPLOAD heap when the device supports it. "
                    "Off uses UPLOAD instead, keeping a copy in system memory");

namespace redahm::gpu::settings {

bool UseVulkan() {
#if defined(_WIN32)
  std::string api = REXCVAR_GET(redahm_gpu_api);
  for (char& c : api)
    c = static_cast<char>(std::tolower(static_cast<unsigned char>(c)));
  return api == "vulkan";
#else
  return true;
#endif
}

}  // namespace redahm::gpu::settings

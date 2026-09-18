#pragma once

#include <string>

#include <rex/cvar.h>
#include <rex/types.h>

REXCVAR_DECLARE(std::string, redahm_gpu_api);
REXCVAR_DECLARE(bool, redahm_vsync);
REXCVAR_DECLARE(i32, redahm_anisotropy);
REXCVAR_DECLARE(bool, redahm_stretch_output);
REXCVAR_DECLARE(std::string, redahm_runtime_shader_dir);
REXCVAR_DECLARE(bool, redahm_gpu_trace_frame);
REXCVAR_DECLARE(bool, redahm_geometry_gpu_upload);

namespace redahm::gpu::settings {

// True when the configured backend is Vulkan. D3D12 is the Windows default.
bool UseVulkan();

inline bool Vsync() {
  return REXCVAR_GET(redahm_vsync);
}

inline i32 Anisotropy() {
  return REXCVAR_GET(redahm_anisotropy);
}

inline bool StretchOutput() {
  return REXCVAR_GET(redahm_stretch_output);
}

// Where shaders the title compiles at runtime are written when the shader
// cache lacks them. Empty disables.
inline std::string RuntimeShaderDir() {
  return REXCVAR_GET(redahm_runtime_shader_dir);
}

// Logs the target, clear and resolve sequence of a few in-game frames.
inline bool TraceFrame() {
  return REXCVAR_GET(redahm_gpu_trace_frame);
}

// Static geometry in GPU_UPLOAD (device memory the CPU writes directly) rather
// than UPLOAD (system memory), where the device supports it.
inline bool GeometryGpuUpload() {
  return REXCVAR_GET(redahm_geometry_gpu_upload);
}

}  // namespace redahm::gpu::settings

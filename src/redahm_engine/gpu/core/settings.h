#pragma once

#include <string>

#include <rex/cvar.h>
#include <rex/types.h>

REXCVAR_DECLARE(std::string, redahm_gpu_api);
REXCVAR_DECLARE(bool, redahm_vsync);
REXCVAR_DECLARE(std::string, redahm_frame_cap);
REXCVAR_DECLARE(std::string, redahm_anisotropy);
REXCVAR_DECLARE(bool, redahm_stretch_output);
REXCVAR_DECLARE(std::string, redahm_resolution);
REXCVAR_DECLARE(std::string, redahm_runtime_shader_dir);
REXCVAR_DECLARE(bool, redahm_gpu_trace_frame);
REXCVAR_DECLARE(bool, redahm_geometry_gpu_upload);REXCVAR_DECLARE(std::string, redahm_shadows);
REXCVAR_DECLARE(bool, redahm_bloom);
REXCVAR_DECLARE(bool, redahm_depth_of_field);
REXCVAR_DECLARE(bool, redahm_distortion);

namespace redahm::gpu::settings {

// True when the configured backend is Vulkan. D3D12 is the Windows default.
bool UseVulkan();

inline bool Vsync() {
  return REXCVAR_GET(redahm_vsync);
}

inline constexpr u32 kDefaultFrameCap = 30;
inline constexpr u32 kMinFrameCap = 30;
inline constexpr u32 kMaxFrameCap = 144;
inline constexpr u32 kFrameCapDisplay = 0;
inline constexpr u32 kFrameCapOff = ~u32{0};

// Frames per second presents are paced to, from redahm_frame_cap: 30 to 144,
// kFrameCapDisplay for the display's refresh rate, or kFrameCapOff for none.
u32 FrameCap();

inline constexpr u32 kMaxAnisotropy = 16;

// Anisotropic filtering samples from redahm_anisotropy: 1 (off), 2, 4, 8 or 16.
u32 Anisotropy();

inline bool StretchOutput() {
  return REXCVAR_GET(redahm_stretch_output);
}

// Host pixels per guest pixel for render targets and resolves, from
// redahm_resolution against the title's 720 lines: 2/3 at 480p, 1 at 720p, up
// to 3 at 4k. Fixed for the session.
float ResolutionScale();

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

// Dynamic shadow quality. The engine side (graphics_settings.cpp) scales the
// per-object shadow map resolution; off also skips their projection here.
enum class ShadowQuality { kOff, kLow, kOriginal, kHigh, kUltra };
ShadowQuality Shadows();

inline bool Bloom() {
  return REXCVAR_GET(redahm_bloom);
}

inline bool DepthOfField() {
  return REXCVAR_GET(redahm_depth_of_field);
}

inline bool Distortion() {
  return REXCVAR_GET(redahm_distortion);
}
}  // namespace redahm::gpu::settings

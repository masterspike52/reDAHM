#include "core/settings.h"

#include <algorithm>
#include <cctype>
#include <cstdlib>

REXCVAR_DEFINE_STRING(redahm_gpu_api, "d3d12", "POTF/Graphics", "Graphics API for the renderer: d3d12 or vulkan")
.allowed({"d3d12", "vulkan"});
REXCVAR_DEFINE_BOOL(redahm_vsync, true, "POTF/Graphics", "Wait for vertical sync when presenting");
REXCVAR_DEFINE_STRING(redahm_frame_cap, "30", "POTF/Graphics",
                      "Frame rate cap: 30 (the Xbox 360's), 60, 75, 90, 120, 144, display for "
                      "the monitor's refresh rate, or off for no cap. The game's own limiter is "
                      "off; with vsync on the rate also stops at the refresh rate")
.allowed({"30", "60", "75", "90", "120", "144", "display", "off"});
REXCVAR_DEFINE_STRING(redahm_anisotropy, "8x", "POTF/Graphics",
                      "Anisotropic filtering for the game's textures: off, 2x, 4x, 8x or 16x. "
                      "Keeps textures seen at a glancing angle (roads, walls, signs) sharp into "
                      "the distance")
.allowed({"off", "2x", "4x", "8x", "16x"});
REXCVAR_DEFINE_BOOL(redahm_stretch_output, false, "POTF/Graphics",
                    "Stretch the frame to the window instead of letterboxing it");
REXCVAR_DEFINE_STRING(redahm_resolution, "720p", "POTF/Graphics",
                      "Resolution the game renders at: 480p, 720p (the Xbox 360's own), 1080p, "
                      "1440p or 4k. The frame is scaled to the window when presented. Requires "
                      "restart")
.allowed({"480p", "720p", "1080p", "1440p", "4k"})
.lifecycle(rex::cvar::Lifecycle::kRequiresRestart);

#if !defined(REDAHM_RUNTIME_SHADER_DIR)
#define REDAHM_RUNTIME_SHADER_DIR ""
#endif
REXCVAR_DEFINE_STRING(redahm_runtime_shader_dir, REDAHM_RUNTIME_SHADER_DIR, "POTF/Graphics",
                      "Folder that receives shaders the game compiles at runtime and the shader "
                      "cache lacks; rebuild to include them");
REXCVAR_DEFINE_BOOL(redahm_gpu_trace_frame, false, "POTF/Graphics",
                    "Log the render target, clear and resolve sequence of a few in-game frames");
REXCVAR_DEFINE_STRING(redahm_shadows, "original", "POTF/Graphics",
                      "Dynamic shadows: off, low, original, high or ultra (per-object shadow map "
                      "resolution)")
    .allowed({"off", "low", "original", "high", "ultra"});
REXCVAR_DEFINE_BOOL(redahm_bloom, true, "POTF/Graphics", "Bloom around bright light");
REXCVAR_DEFINE_BOOL(redahm_depth_of_field, true, "POTF/Graphics",
                    "Depth of field blur on out-of-focus distances");
REXCVAR_DEFINE_BOOL(redahm_distortion, true, "POTF/Graphics",
                    "Heat haze and other screen distortion effects");
REXCVAR_DEFINE_BOOL(redahm_geometry_gpu_upload, true, "POTF/Graphics",
                    "Place static geometry in the GPU_UPLOAD heap when the device supports it. "
                    "Off uses UPLOAD instead, keeping a copy in system memory");
namespace redahm::gpu::settings {

namespace {

std::string Lowercase(std::string value) {
  for (char& c : value)
    c = static_cast<char>(std::tolower(static_cast<unsigned char>(c)));
  return value;
}

// A string setting's parsed value, parsed again only when its text changes.
// The render thread asks for some per draw or per sampler; each thread keeps
// its own copy (one per call site, as each passes its own parse lambda).
template <typename T, typename Parse>
T Parsed(const std::string& raw, Parse parse) {
  struct Entry {
    std::string raw;
    T value{};
    bool valid = false;
  };
  thread_local Entry entry;
  if (!entry.valid || entry.raw != raw) {
    entry.raw = raw;
    entry.value = parse(Lowercase(raw));
    entry.valid = true;
  }
  return entry.value;
}

}  // namespace

bool UseVulkan() {
#if defined(_WIN32)
  return Parsed<bool>(REXCVAR_GET(redahm_gpu_api),
                      [](const std::string& api) { return api == "vulkan"; });
#else
  return true;
#endif
}

ShadowQuality Shadows() {
  return Parsed<ShadowQuality>(REXCVAR_GET(redahm_shadows), [](const std::string& value) {
    if (value == "off")
      return ShadowQuality::kOff;
    if (value == "low")
      return ShadowQuality::kLow;
    if (value == "high")
      return ShadowQuality::kHigh;
    if (value == "ultra")
      return ShadowQuality::kUltra;
    return ShadowQuality::kOriginal;
  });
}

u32 FrameCap() {
  return Parsed<u32>(REXCVAR_GET(redahm_frame_cap), [](const std::string& cap) {
    if (cap == "display")
      return kFrameCapDisplay;
    if (cap == "off")
      return kFrameCapOff;
    char* end = nullptr;
    const long value = std::strtol(cap.c_str(), &end, 10);
    if (end == cap.c_str())
      return kDefaultFrameCap;
    return u32(std::clamp(value, long(kMinFrameCap), long(kMaxFrameCap)));
  });
}

u32 Anisotropy() {
  return Parsed<u32>(REXCVAR_GET(redahm_anisotropy), [](const std::string& level) {
    char* end = nullptr;
    const long value = std::strtol(level.c_str(), &end, 10);
    if (end == level.c_str() || value < 2)
      return 1u;
    // Hardware steps are powers of two up to 16.
    u32 samples = 2;
    while (samples * 2 <= u32(std::min(value, long(kMaxAnisotropy))))
      samples *= 2;
    return samples;
  });
}

float ResolutionScale() {
  // Surfaces are created at the scale in force when the title makes them, so
  // it is read once and holds for the session.
  static const float scale = [] {
    const std::string resolution = Lowercase(REXCVAR_GET(redahm_resolution));
    if (resolution == "480p")
      return 480.0f / 720.0f;
    if (resolution == "1080p")
      return 1080.0f / 720.0f;
    if (resolution == "1440p")
      return 1440.0f / 720.0f;
    if (resolution == "4k")
      return 2160.0f / 720.0f;
    return 1.0f;
  }();
  return scale;
}

}  // namespace redahm::gpu::settings

#pragma once

#include <atomic>

#include <rex/logging.h>

namespace redahm::gpu::log {
inline const rex::LogCategoryId Gpu = rex::RegisterLogCategory("redahm_gpu");
}  // namespace redahm::gpu::log

#define GPU_TRACE(...) REXLOG_CAT_TRACE(::redahm::gpu::log::Gpu, __VA_ARGS__)
#define GPU_DEBUG(...) REXLOG_CAT_DEBUG(::redahm::gpu::log::Gpu, __VA_ARGS__)
#define GPU_INFO(...) REXLOG_CAT_INFO(::redahm::gpu::log::Gpu, __VA_ARGS__)
#define GPU_WARN(...) REXLOG_CAT_WARN(::redahm::gpu::log::Gpu, __VA_ARGS__)
#define GPU_ERROR(...) REXLOG_CAT_ERROR(::redahm::gpu::log::Gpu, __VA_ARGS__)

// Warns the first `limit` times a call site is reached, then goes quiet.
#define GPU_WARN_LIMITED(limit, ...)                                  \
  do {                                                                \
    static std::atomic<unsigned> _gpu_warn_count{0};                  \
    if (_gpu_warn_count.fetch_add(1, std::memory_order_relaxed) < (limit)) \
      GPU_WARN(__VA_ARGS__);                                          \
  } while (0)

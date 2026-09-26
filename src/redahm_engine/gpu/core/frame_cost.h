#pragma once

// Host costs of the renderer, summed between the periodic "Draws over 300
// frames" lines. FrameCosts is the GPU thread's (render/gpu_thread.h), fed
// under the renderer lock; RecordCosts is what the title's own threads spend
// capturing its calls and waiting for the GPU thread.

#include <atomic>
#include <chrono>

#include <rex/types.h>

namespace redahm::gpu::cost {

using Clock = std::chrono::steady_clock;

struct Counter {
  u32 count = 0;
  u64 bytes = 0;
  u64 ns = 0;
  u64 max_ns = 0;

  void Add(Clock::duration elapsed, u64 added_bytes = 0) {
    const u64 elapsed_ns = u64(std::chrono::duration_cast<std::chrono::nanoseconds>(elapsed).count());
    ++count;
    bytes += added_bytes;
    ns += elapsed_ns;
    if (elapsed_ns > max_ns)
      max_ns = elapsed_ns;
  }
  double Ms() const { return double(ns) / 1e6; }
  double MaxMs() const { return double(max_ns) / 1e6; }
  double MiB() const { return double(bytes) / (1024.0 * 1024.0); }
};

struct FrameCosts {
  Counter draws;            // DrawLocked, uploads and pipeline misses included
  Counter resolves;         // Resolve
  Counter texture_uploads;  // UploadTextureLocked: detile, swap, staging copy
  Counter buffer_uploads;   // PrepareBufferLocked: buffer creation and swap copy
  Counter pipelines;        // GetPipelineLocked misses
  Counter ring_waits;       // SubmitFrameLocked waiting for a slot to come back
  // Filled from the submit thread's timings when the line is logged.
  Counter submits;          // replay onto the backend list and execute
  Counter presents;         // swap chain present (vsync blocks here)
  // Present to present, as the render thread sees it.
  Counter frames;
  u32 frames_over_budget = 0;  // longer than one 30 fps frame plus slack
  Clock::time_point last_present{};
};

inline FrameCosts& Costs() {
  static FrameCosts costs;
  return costs;
}

struct RecordCosts {
  std::atomic<u64> record_ns{0};  // capturing draws, clears and resolves into packets
  std::atomic<u64> records{0};
  std::atomic<u64> wait_ns{0};    // waiting for the GPU thread (Swap, BeginTiling)
};

inline RecordCosts& Recording() {
  static RecordCosts costs;
  return costs;
}

// Guest thread timings from the engine hooks (hooks.cpp), for the spike log.
// Both of the title's main threads wait for each other by polling with
// SleepEx, so time slept is time spent waiting on the other thread.
struct GuestTimings {
  // The game thread's last FEngineLoop::Tick, and how much of it was asleep.
  std::atomic<u64> game_tick_ns{0};
  std::atomic<u64> game_tick_sleep_ns{0};
};

inline GuestTimings& Guest() {
  static GuestTimings timings;
  return timings;
}

// Nanoseconds the calling thread has spent in the guest's SleepEx since it
// last asked. Defined in hooks.cpp.
u64 TakeGuestSleepNs();

// Times a scope into a counter.
class ScopedCost {
 public:
  explicit ScopedCost(Counter& counter) : counter_(counter), start_(Clock::now()) {}
  ~ScopedCost() { counter_.Add(Clock::now() - start_, bytes_); }
  void AddBytes(u64 bytes) { bytes_ += bytes; }

 private:
  Counter& counter_;
  Clock::time_point start_;
  u64 bytes_ = 0;
};

}  // namespace redahm::gpu::cost

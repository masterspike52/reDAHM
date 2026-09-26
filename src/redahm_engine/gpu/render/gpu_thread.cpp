#include "render/gpu_thread.h"

#include <algorithm>
#include <atomic>
#include <chrono>
#include <memory>
#include <mutex>
#include <thread>
#include <vector>

#if defined(_WIN32)
#include <windows.h>
#endif

#include "core/log.h"
#include "render/host.h"

namespace redahm::gpu::gpu_thread {

namespace {

using Clock = std::chrono::steady_clock;

constexpr u32 kAlignment = 16;
constexpr u32 kBlockSize = 4u << 20;
// Bytes the GPU thread may fall behind by before recording waits for it.
// Rewritten buffers and first-use geometry travel in packets, and a level load
// can queue a lot of both in one frame.
constexpr u64 kMaxQueuedBytes = 512ull << 20;
// How long the GPU thread spins for the next packet before it sleeps. It
// outpaces the render thread, which commits a packet every few microseconds,
// so any spin long enough to catch one kept it spinning between every packet:
// over half a core, possibly the render thread's own SMT sibling. It sleeps
// as soon as it runs dry; recording wakes it every kWakeBatch packets.
constexpr auto kSpin = std::chrono::microseconds(1);
// A sleeping GPU thread is woken once this many packets are waiting, or when
// something waits for it: a wake costs the recording thread a system call.
constexpr u32 kWakeBatch = 32;
// Packets run per hold of Host().mutex, so the pipeline warm-up threads get a
// turn during long bursts.
constexpr u32 kPacketsPerLock = 64;

u32 Align(u32 value) {
  return (value + kAlignment - 1) & ~(kAlignment - 1);
}

struct PacketHeader {
  Handler handler;
  u32 size;    // payload bytes
  u32 stride;  // header and payload, aligned
};
static_assert(sizeof(PacketHeader) == kAlignment);

struct Block {
  std::unique_ptr<u8[]> data;
  u32 capacity = 0;
  // Bytes of committed packets; moving it publishes them.
  std::atomic<u32> end{0};
  // Set once recording has moved on to another block, by when `end` is final.
  std::atomic<Block*> next{nullptr};
};

struct QueueState {
  // Held by each Recorder.
  std::mutex mutex;
  Block* write = nullptr;
  // Packets committed since the GPU thread was last checked for sleep.
  u32 unwoken = 0;

  std::mutex free_mutex;
  std::vector<Block*> free_blocks;

  std::atomic<u64> committed{0};  // packets
  std::atomic<u64> completed{0};
  std::atomic<u64> committed_bytes{0};
  std::atomic<u64> completed_bytes{0};

  // The GPU thread sleeps on `wake`, and recording bumps it when it finds the
  // thread `sleeping`.
  std::atomic<u32> wake{0};
  std::atomic<bool> sleeping{false};
  // Threads blocked in WaitFor, asleep on `completed`.
  std::atomic<u32> waiters{0};

  std::once_flag started;
  std::thread thread;
  std::atomic<bool> stop{false};
  std::atomic<bool> exited{false};
  // The GPU thread's position.
  Block* read = nullptr;
  u32 read_offset = 0;
};

QueueState& Q() {
  static QueueState state;
  return state;
}

Block* TakeBlock(u32 min_capacity) {
  auto& q = Q();
  {
    std::lock_guard lock(q.free_mutex);
    for (auto it = q.free_blocks.begin(); it != q.free_blocks.end(); ++it) {
      if ((*it)->capacity >= min_capacity) {
        Block* block = *it;
        q.free_blocks.erase(it);
        return block;
      }
    }
  }
  auto* block = new Block;
  block->capacity = std::max(kBlockSize, Align(min_capacity));
  block->data = std::make_unique<u8[]>(block->capacity);
  return block;
}

void RecycleBlock(Block* block) {
  // A block made for one oversized packet is not kept.
  if (block->capacity > kBlockSize) {
    delete block;
    return;
  }
  block->end.store(0, std::memory_order_relaxed);
  block->next.store(nullptr, std::memory_order_relaxed);
  auto& q = Q();
  std::lock_guard lock(q.free_mutex);
  q.free_blocks.push_back(block);
}

bool HasWork(QueueState& q) {
  return q.read->end.load(std::memory_order_acquire) > q.read_offset ||
         q.read->next.load(std::memory_order_acquire) != nullptr;
}

bool SpinForWork(QueueState& q) {
  const auto deadline = Clock::now() + kSpin;
  for (u32 i = 0;; ++i) {
    if (HasWork(q) || q.stop.load(std::memory_order_relaxed))
      return true;
#if defined(_WIN32)
    YieldProcessor();
#endif
    if ((i & 63) == 63 && Clock::now() >= deadline)
      return false;
  }
}

void GpuThreadMain() {
#if defined(_WIN32)
  SetThreadDescription(GetCurrentThread(), L"redahm GPU");
  // The render thread waits on this one at every Swap.
  SetThreadPriority(GetCurrentThread(), THREAD_PRIORITY_ABOVE_NORMAL);
#endif
  auto& q = Q();
  std::unique_lock host_lock(Host().mutex, std::defer_lock);
  u32 run_under_lock = 0;
  while (!q.stop.load(std::memory_order_acquire)) {
    Block* block = q.read;
    if (q.read_offset < block->end.load(std::memory_order_acquire)) {
      if (!host_lock.owns_lock())
        host_lock.lock();
      const auto* header = reinterpret_cast<const PacketHeader*>(block->data.get() + q.read_offset);
      header->handler(reinterpret_cast<const u8*>(header + 1), header->size);
      q.read_offset += header->stride;
      q.completed_bytes.fetch_add(header->stride, std::memory_order_relaxed);
      q.completed.fetch_add(1, std::memory_order_seq_cst);
      if (q.waiters.load(std::memory_order_seq_cst))
        q.completed.notify_all();
      if (++run_under_lock >= kPacketsPerLock) {
        host_lock.unlock();
        run_under_lock = 0;
      }
      continue;
    }
    if (Block* next = block->next.load(std::memory_order_acquire)) {
      // `end` was final before `next` was published.
      if (q.read_offset < block->end.load(std::memory_order_acquire))
        continue;
      q.read = next;
      q.read_offset = 0;
      RecycleBlock(block);
      continue;
    }

    // Nothing queued: let others have the renderer, spin a little, then sleep.
    if (host_lock.owns_lock())
      host_lock.unlock();
    run_under_lock = 0;
    if (SpinForWork(q))
      continue;
    const u32 ticket = q.wake.load(std::memory_order_acquire);
    q.sleeping.store(true, std::memory_order_relaxed);
    std::atomic_thread_fence(std::memory_order_seq_cst);
    if (!HasWork(q) && !q.stop.load(std::memory_order_acquire))
      q.wake.wait(ticket, std::memory_order_acquire);
    q.sleeping.store(false, std::memory_order_relaxed);
  }
  if (host_lock.owns_lock())
    host_lock.unlock();
  q.exited.store(true, std::memory_order_release);
}

void StartGpuThread() {
  auto& q = Q();
  q.write = q.read = TakeBlock(kBlockSize);
  q.thread = std::thread(GpuThreadMain);
  GPU_INFO("GPU thread started: D3D calls are translated off the render thread");
}

void WakeGpuThread() {
  auto& q = Q();
  std::atomic_thread_fence(std::memory_order_seq_cst);
  if (q.sleeping.load(std::memory_order_relaxed)) {
    q.wake.fetch_add(1, std::memory_order_release);
    q.wake.notify_one();
  }
}

}  // namespace

Recorder::Recorder() {
  auto& q = Q();
  q.mutex.lock();
  std::call_once(q.started, StartGpuThread);
}

Recorder::~Recorder() {
  Q().mutex.unlock();
}

u8* Recorder::Reserve(Handler handler, u32 size) {
  auto& q = Q();
  const u32 stride = Align(u32(sizeof(PacketHeader)) + size);
  Block* block = q.write;
  u32 offset = block->end.load(std::memory_order_relaxed);
  if (u64(offset) + stride > block->capacity) {
    Block* next = TakeBlock(stride);
    block->next.store(next, std::memory_order_release);
    q.write = block = next;
    offset = 0;
  }
  auto* header = reinterpret_cast<PacketHeader*>(block->data.get() + offset);
  header->handler = handler;
  return reinterpret_cast<u8*>(header + 1);
}

u64 Recorder::Commit(u32 used) {
  auto& q = Q();
  Block* block = q.write;
  const u32 offset = block->end.load(std::memory_order_relaxed);
  auto* header = reinterpret_cast<PacketHeader*>(block->data.get() + offset);
  header->size = used;
  header->stride = Align(u32(sizeof(PacketHeader)) + used);
  block->end.store(offset + header->stride, std::memory_order_release);
  const u64 number = q.committed.fetch_add(1, std::memory_order_relaxed) + 1;
  const u64 bytes = q.committed_bytes.fetch_add(header->stride, std::memory_order_relaxed) +
                    header->stride;
  if (++q.unwoken >= kWakeBatch) {
    q.unwoken = 0;
    WakeGpuThread();
  }

  // Too far ahead: wait for the GPU thread to work through half of it.
  while (bytes - q.completed_bytes.load(std::memory_order_acquire) > kMaxQueuedBytes &&
         !q.stop.load(std::memory_order_acquire)) {
    WaitFor(q.completed.load(std::memory_order_acquire) + 1);
    if (bytes - q.completed_bytes.load(std::memory_order_acquire) <= kMaxQueuedBytes / 2)
      break;
  }
  return number;
}

void WaitFor(u64 number) {
  auto& q = Q();
  if (q.completed.load(std::memory_order_acquire) < number)
    WakeGpuThread();
  for (;;) {
    const u64 seen = q.completed.load(std::memory_order_acquire);
    if (seen >= number || q.stop.load(std::memory_order_acquire))
      return;
    q.waiters.fetch_add(1, std::memory_order_seq_cst);
    if (q.completed.load(std::memory_order_seq_cst) == seen && !q.stop.load(std::memory_order_acquire))
      q.completed.wait(seen, std::memory_order_acquire);
    q.waiters.fetch_sub(1, std::memory_order_relaxed);
  }
}

void Drain() {
  WaitFor(Q().committed.load(std::memory_order_acquire));
}

void Stop(u32 timeout_ms) {
  auto& q = Q();
  if (q.stop.exchange(true, std::memory_order_acq_rel))
    return;
  q.wake.fetch_add(1, std::memory_order_release);
  q.wake.notify_all();
  // Nothing more will complete; release whoever waits for it.
  q.completed.fetch_add(u64(1) << 62, std::memory_order_seq_cst);
  q.completed.notify_all();
  if (!q.thread.joinable())
    return;
  const auto deadline = Clock::now() + std::chrono::milliseconds(timeout_ms);
  while (!q.exited.load(std::memory_order_acquire) && Clock::now() < deadline)
    std::this_thread::sleep_for(std::chrono::milliseconds(1));
  if (q.exited.load(std::memory_order_acquire)) {
    q.thread.join();
  } else {
    GPU_WARN("GPU thread busy at shutdown, leaving it behind");
    q.thread.detach();
  }
}

}  // namespace redahm::gpu::gpu_thread

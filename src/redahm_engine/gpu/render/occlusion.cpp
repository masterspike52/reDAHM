#include "render/occlusion.h"

#include <algorithm>
#include <atomic>
#include <mutex>
#include <unordered_map>
#include <utility>
#include <vector>

#include "core/guest_memory.h"
#include "core/log.h"
#include "render/backend.h"
#include "render/host.h"

namespace redahm::gpu::occlusion {

namespace {

constexpr u32 kIssueEnd = 1;
constexpr u32 kIssueBegin = 2;
// Box queries one recording can hold; boxes past it report visible.
constexpr u32 kQueriesPerSlot = 8192;
// What a query with no usable result reports.
constexpr u32 kVisiblePixels = 0x10000;
// A box's result is used while it is at most this many recordings old: the
// GPU runs up to kFrameCount behind, and anything older belongs to a box not
// tested for a while, which may have come into view since.
constexpr u64 kMaxResultAge = kFrameCount + 2;
// Box results not refreshed for this many recordings are dropped (moving
// primitives leave a new box every frame).
constexpr u64 kPruneAge = 64;

struct Query {
  bool open = false;
  // Keys of the boxes drawn under the query's latest issue.
  std::vector<u64> boxes;
};

struct BoxResult {
  u32 pixels = 0;
  u64 serial = 0;
};

struct Slot {
  // Numbers the recording, in queue order; the submit thread signals it on the
  // occlusion fence once the recording, with its resolve, has executed.
  u64 serial = 0;
  // (box key, heap index), in begin order: the heap indices run from the
  // slot's first index.
  std::vector<std::pair<u64, u32>> issued;
  bool queued = false;
  bool harvested = false;
};

// Guards everything below except g_signal.
std::mutex g_mutex;
bool g_enabled = false;
u64 g_serial = 0;  // the newest recording's
Slot g_slots[kFrameCount];
std::atomic<u64> g_signal[kFrameCount];
std::unordered_map<u32, Query> g_queries;
std::unordered_map<u64, BoxResult> g_boxes;
u32 g_open_query = 0;
bool g_box_open = false;
u32 g_box_slot = 0;
u32 g_box_index = 0;

u64 HashBytes(u32 va, u32 bytes) {
  const u8* data = mem::At<u8>(va);
  u64 hash = 14695981039346656037ull;
  for (u32 i = 0; data && i < bytes; ++i)
    hash = (hash ^ data[i]) * 1099511628211ull;
  return hash;
}

void HarvestLocked(Slot& slot) {
  if (slot.harvested || !slot.queued || backend::CompletedOcclusionFence() < slot.serial)
    return;
  const u64* results = backend::OcclusionResults();
  for (const auto& [key, index] : slot.issued) {
    BoxResult& box = g_boxes[key];
    if (slot.serial > box.serial)
      box = {u32(std::min<u64>(results[index], 0xFFFFFFFFu)), slot.serial};
  }
  slot.harvested = true;
}

}  // namespace

void InitLocked() {
  auto& h = Host();
  const bool enabled = !h.vulkan && backend::CreateOcclusionQueries(h.device.get(),
                                                                    kFrameCount * kQueriesPerSlot);
  if (!h.vulkan && !enabled)
    GPU_WARN("Occlusion queries unavailable; the game's queries report everything visible");
  std::lock_guard lock(g_mutex);
  g_enabled = enabled;
}

void Issue(u32 query_va, u32 flags) {
  std::lock_guard lock(g_mutex);
  if (!g_enabled)
    return;
  Query& query = g_queries[query_va];
  if (flags & kIssueBegin) {
    query.open = true;
    query.boxes.clear();
    g_open_query = query_va;
  }
  if (flags & kIssueEnd) {
    query.open = false;
    if (g_open_query == query_va)
      g_open_query = 0;
  }
}

bool QueryOpen() {
  std::lock_guard lock(g_mutex);
  return g_enabled && g_open_query != 0;
}

u64 AddBox(u32 vertices_va, u32 bytes) {
  const u64 key = HashBytes(vertices_va, bytes);
  std::lock_guard lock(g_mutex);
  if (!g_enabled || !g_open_query)
    return 0;
  // Recorded even when it gets no host query, so the title's query reports
  // visible rather than leaving the box out.
  g_queries[g_open_query].boxes.push_back(key);
  return key;
}

void BeginBoxLocked(u64 key) {
  std::lock_guard lock(g_mutex);
  if (!key || g_box_open || !OpenCommandListLocked())
    return;
  const u32 slot_index = CurrentFrameSlot();
  Slot& slot = g_slots[slot_index];
  if (slot.queued)
    return;
  if (slot.issued.size() >= kQueriesPerSlot) {
    GPU_WARN_LIMITED(4, "More than {} occlusion boxes in one frame", kQueriesPerSlot);
    return;
  }
  if (slot.issued.empty()) {
    slot.serial = ++g_serial;
    if (g_serial % kPruneAge == 0) {
      std::erase_if(g_boxes, [](const auto& entry) {
        return entry.second.serial + kPruneAge < g_serial;
      });
    }
  }
  const u32 index = slot_index * kQueriesPerSlot + u32(slot.issued.size());
  slot.issued.emplace_back(key, index);
  Host().frames[slot_index].recording.Native(backend::BeginOcclusionQuery, index, 0);
  g_box_open = true;
  g_box_slot = slot_index;
  g_box_index = index;
}

void EndBoxLocked() {
  std::lock_guard lock(g_mutex);
  if (!g_box_open)
    return;
  g_box_open = false;
  if (g_box_slot == CurrentFrameSlot() && !g_slots[g_box_slot].queued)
    Host().frames[g_box_slot].recording.Native(backend::EndOcclusionQuery, g_box_index, 0);
}

u32 Result(u32 query_va) {
  std::lock_guard lock(g_mutex);
  if (!g_enabled)
    return kVisiblePixels;
  for (Slot& slot : g_slots)
    HarvestLocked(slot);
  const auto it = g_queries.find(query_va);
  if (it == g_queries.end() || it->second.boxes.empty())
    return kVisiblePixels;
  u64 pixels = 0;
  for (const u64 key : it->second.boxes) {
    const auto box = g_boxes.find(key);
    if (box == g_boxes.end() || box->second.serial + kMaxResultAge < g_serial)
      return kVisiblePixels;
    pixels += box->second.pixels;
  }
  return u32(std::min<u64>(pixels, 0xFFFFFFFFu));
}

void QueueSlotLocked(u32 slot_index) {
  std::lock_guard lock(g_mutex);
  if (!g_enabled)
    return;
  Slot& slot = g_slots[slot_index];
  if (slot.issued.empty() || slot.queued)
    return;
  DeferredCommandList& recording = Host().frames[slot_index].recording;
  // A query must begin and end in one command list.
  if (g_box_open && g_box_slot == slot_index) {
    recording.Native(backend::EndOcclusionQuery, g_box_index, 0);
    g_box_open = false;
  }
  recording.Native(backend::ResolveOcclusionQueries, slot_index * kQueriesPerSlot,
                   u32(slot.issued.size()));
  g_signal[slot_index].store(slot.serial, std::memory_order_release);
  slot.queued = true;
}

void SlotSubmitted(u32 slot_index) {
  const u64 serial = g_signal[slot_index].exchange(0, std::memory_order_acq_rel);
  if (serial)
    backend::SignalOcclusionFence(Host().queue.get(), serial);
}

void SlotReusedLocked(u32 slot_index) {
  std::lock_guard lock(g_mutex);
  if (!g_enabled)
    return;
  Slot& slot = g_slots[slot_index];
  HarvestLocked(slot);
  slot = {};
}

}  // namespace redahm::gpu::occlusion

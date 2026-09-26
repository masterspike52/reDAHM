#include "pipeline/pipeline_cache.h"

#include <algorithm>
#include <atomic>
#include <chrono>
#include <condition_variable>
#include <cstddef>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <memory>
#include <mutex>
#include <thread>
#include <unordered_map>
#include <unordered_set>
#include <vector>

#if defined(_WIN32)
#include <windows.h>
#endif

#include <SDL3/SDL_filesystem.h>
#include <xxhash.h>

#include "core/frame_cost.h"
#include "core/log.h"
#include "render/host.h"
#include "shaders/guest_shaders.h"
#include "shaders/vertex_declaration.h"

namespace redahm::gpu {

namespace {

struct PipelineKeyHash {
  size_t operator()(const PipelineKey& key) const { return XXH3_64bits(&key, sizeof(key)); }
};

// Guarded by Host().mutex.
std::unordered_map<PipelineKey, std::unique_ptr<plume::RenderPipeline>, PipelineKeyHash>
    g_pipelines;

plume::RenderStencilFaceDesc UnpackStencilFace(const u8 ops[4]) {
  plume::RenderStencilFaceDesc face;
  face.failOp = static_cast<plume::RenderStencilOp>(ops[0]);
  face.depthFailOp = static_cast<plume::RenderStencilOp>(ops[1]);
  face.passOp = static_cast<plume::RenderStencilOp>(ops[2]);
  face.compareFunction = static_cast<plume::RenderComparisonFunction>(ops[3]);
  return face;
}

// Builds the pipeline for a key. Needs no lock: the shaders link under their
// own mutex and the device creates pipelines from any thread, so the warm-up
// workers call it too. nullptr when a shader is missing or creation failed.
std::unique_ptr<plume::RenderPipeline> BuildPipeline(const PipelineKey& key) {
  auto& h = Host();
  plume::RenderShader* vertex_shader = GetHostShader(key.vertex_shader, key.spec_constants);
  plume::RenderShader* pixel_shader =
      key.pixel_shader ? GetHostShader(key.pixel_shader, key.spec_constants) : nullptr;
  if (!vertex_shader || (key.pixel_shader && !pixel_shader) || !key.declaration)
    return nullptr;

  plume::RenderGraphicsPipelineDesc desc;
  desc.pipelineLayout = h.pipeline_layout.get();
  desc.vertexShader = vertex_shader;
  desc.pixelShader = pixel_shader;
  desc.primitiveTopology = static_cast<plume::RenderPrimitiveTopology>(key.topology);
  desc.cullMode = static_cast<plume::RenderCullMode>(key.cull_mode);
  desc.frontFace = static_cast<plume::RenderFrontFace>(key.front_face);
  desc.depthClipEnabled = true;

  desc.renderTargetCount = key.render_target_count;
  for (u32 i = 0; i < key.render_target_count; ++i) {
    desc.renderTargetFormat[i] = static_cast<plume::RenderFormat>(key.render_target_formats[i]);
    const auto& packed = key.blend[i];
    auto& blend = desc.renderTargetBlend[i];
    blend.blendEnabled = packed[0] != 0;
    blend.srcBlend = static_cast<plume::RenderBlend>(packed[1]);
    blend.dstBlend = static_cast<plume::RenderBlend>(packed[2]);
    blend.blendOp = static_cast<plume::RenderBlendOperation>(packed[3]);
    blend.srcBlendAlpha = static_cast<plume::RenderBlend>(packed[4]);
    blend.dstBlendAlpha = static_cast<plume::RenderBlend>(packed[5]);
    blend.blendOpAlpha = static_cast<plume::RenderBlendOperation>(packed[6]);
    blend.renderTargetWriteMask = packed[7];
  }

  desc.depthTargetFormat = static_cast<plume::RenderFormat>(key.depth_format);
  desc.depthEnabled = key.depth_enable != 0;
  desc.depthWriteEnabled = key.depth_write != 0;
  desc.depthFunction = static_cast<plume::RenderComparisonFunction>(key.depth_func);
  desc.depthBias = key.depth_bias;
  desc.slopeScaledDepthBias = key.slope_scaled_depth_bias;
  desc.stencilEnabled = key.stencil_enable != 0;
  desc.stencilReadMask = key.stencil_read_mask;
  desc.stencilWriteMask = key.stencil_write_mask;
  desc.stencilReference = key.stencil_ref;
  desc.stencilFrontFace = UnpackStencilFace(key.stencil_front);
  desc.stencilBackFace = UnpackStencilFace(key.stencil_back);

  std::vector<plume::RenderInputSlot> slots;
  const HostVertexDeclaration& declaration = *key.declaration;
  for (u32 stream = 0; stream < d3d::kMaxStreams; ++stream) {
    if (stream == kZeroStream)
      continue;
    if (!declaration.streams[stream])
      continue;
    const auto classification = (key.instance_streams >> stream) & 1
                                    ? plume::RenderInputSlotClassification::PER_INSTANCE_DATA
                                    : plume::RenderInputSlotClassification::PER_VERTEX_DATA;
    slots.emplace_back(stream, key.vertex_strides[stream], classification);
  }
  // The zero stream is read with no stride, so every vertex and instance of
  // any draw lands on its first 16 bytes.
  slots.emplace_back(kZeroStream, 0, plume::RenderInputSlotClassification::PER_INSTANCE_DATA);
  desc.inputSlots = slots.data();
  desc.inputSlotsCount = u32(slots.size());
  desc.inputElements = declaration.input_elements.data();
  desc.inputElementsCount = u32(declaration.input_elements.size());

  plume::RenderSpecConstant spec_constant(0, key.spec_constants);
  if (h.vulkan) {
    desc.specConstants = &spec_constant;
    desc.specConstantsCount = 1;
  }

  auto pipeline = CreateGraphicsPipeline(desc, "guest");
  if (!pipeline) {
    GPU_WARN_LIMITED(32, "Pipeline creation failed (VS {:016X}, PS {:016X})",
                     key.vertex_shader->hash, key.pixel_shader ? key.pixel_shader->hash : 0);
  }
  return pipeline;
}

//------------------------------------------------------------------------------
// Pipeline record
//------------------------------------------------------------------------------

// Every pipeline a draw has needed is appended to redahm_pipelines.bin beside
// the executable, with the shader and declaration pointers replaced by their
// content hashes. The next session compiles the record on background workers
// as the title creates those shaders and declarations (mostly while a level
// loads), so its draws find their pipelines ready instead of compiling them
// on the render thread: the 8-16 ms hitches the first time a material or
// state combination appeared. This is reblue's PSO residual replay, recorded
// at run time rather than compiled in.
struct PipelineRecord {
  u64 vertex_shader = 0;
  u64 pixel_shader = 0;
  u64 declaration = 0;
  u8 state[sizeof(PipelineKey) - 3 * sizeof(void*)] = {};
};
static_assert(sizeof(PipelineRecord) == sizeof(PipelineKey));
static_assert(offsetof(PipelineKey, spec_constants) == 3 * sizeof(void*));

// Bumped whenever PipelineKey or the enums it stores change meaning.
constexpr u32 kRecordMagic = 0x4C504452;  // 'RDPL'
constexpr u32 kRecordVersion = 1;

struct RecordHeader {
  u32 magic = kRecordMagic;
  u32 version = kRecordVersion;
  u32 record_size = sizeof(PipelineRecord);
  u32 reserved = 0;
};

PipelineRecord ToRecord(const PipelineKey& key) {
  PipelineRecord record;
  std::memcpy(&record, &key, sizeof(key));
  record.vertex_shader = key.vertex_shader->hash;
  record.pixel_shader = key.pixel_shader ? key.pixel_shader->hash : 0;
  record.declaration = key.declaration->hash;
  return record;
}

u64 RecordHash(const PipelineRecord& record) {
  return XXH3_64bits(&record, sizeof(record));
}

std::filesystem::path RecordPath() {
  const char* base = SDL_GetBasePath();
  return std::filesystem::path(base ? base : "") / "redahm_pipelines.bin";
}

std::mutex g_record_mutex;
std::unordered_set<u64> g_recorded;  // RecordHash of every record in the file
std::ofstream g_record_file;
bool g_record_open_failed = false;

void AppendRecord(const PipelineKey& key) {
  const PipelineRecord record = ToRecord(key);
  std::lock_guard lock(g_record_mutex);
  if (!g_recorded.insert(RecordHash(record)).second || g_record_open_failed)
    return;
  if (!g_record_file.is_open()) {
    const auto path = RecordPath();
    std::error_code error;
    const bool fresh = !std::filesystem::exists(path, error) ||
                       std::filesystem::file_size(path, error) < sizeof(RecordHeader);
    g_record_file.open(path, std::ios::binary | std::ios::app);
    if (!g_record_file) {
      g_record_open_failed = true;
      GPU_WARN("Could not open {} to record pipelines", path.string());
      return;
    }
    if (fresh) {
      const RecordHeader header;
      g_record_file.write(reinterpret_cast<const char*>(&header), sizeof(header));
    }
  }
  g_record_file.write(reinterpret_cast<const char*>(&record), sizeof(record));
  g_record_file.flush();
}

//------------------------------------------------------------------------------
// Warm-up
//------------------------------------------------------------------------------

struct Warmup {
  std::vector<std::thread> workers;
  std::atomic<bool> stop{false};
  std::mutex mutex;
  std::condition_variable wake;
  // Records whose shaders or declaration the title has not created yet.
  std::vector<PipelineRecord> waiting;
  // Resolved keys not yet claimed by a worker.
  std::vector<PipelineKey> ready;
  u64 shader_generation = ~u64{0};
  u64 declaration_generation = ~u64{0};
  u32 in_flight = 0;
  u32 built = 0;
  u32 total = 0;
};
Warmup g_warmup;

std::vector<PipelineRecord> LoadRecords() {
  std::vector<PipelineRecord> records;
  std::ifstream file(RecordPath(), std::ios::binary);
  if (!file)
    return records;
  RecordHeader header;
  if (!file.read(reinterpret_cast<char*>(&header), sizeof(header)) ||
      header.magic != kRecordMagic || header.version != kRecordVersion ||
      header.record_size != sizeof(PipelineRecord)) {
    GPU_WARN("{} is from another build; it will be rewritten", RecordPath().string());
    file.close();
    std::error_code error;
    std::filesystem::remove(RecordPath(), error);
    return records;
  }
  PipelineRecord record;
  while (file.read(reinterpret_cast<char*>(&record), sizeof(record))) {
    if (g_recorded.insert(RecordHash(record)).second)
      records.push_back(record);
  }
  return records;
}

// Moves records whose shaders and declaration now exist to the ready list.
// Only rescans when a shader or declaration was created since the last pass.
// Needs g_warmup.mutex.
void ResolveWaitingLocked() {
  const u64 shaders = GuestShaderGeneration();
  const u64 declarations = VertexDeclarationGeneration();
  if (shaders == g_warmup.shader_generation && declarations == g_warmup.declaration_generation)
    return;
  g_warmup.shader_generation = shaders;
  g_warmup.declaration_generation = declarations;

  auto& waiting = g_warmup.waiting;
  for (size_t i = 0; i < waiting.size();) {
    const PipelineRecord& record = waiting[i];
    GuestShader* vs = FindGuestShaderByHash(record.vertex_shader);
    GuestShader* ps = record.pixel_shader ? FindGuestShaderByHash(record.pixel_shader) : nullptr;
    HostVertexDeclaration* declaration = FindVertexDeclarationByHash(record.declaration);
    if (!vs || (record.pixel_shader && !ps) || !declaration) {
      ++i;
      continue;
    }
    PipelineKey key;
    std::memcpy(&key, &record, sizeof(key));
    key.vertex_shader = vs;
    key.pixel_shader = ps;
    key.declaration = declaration;
    g_warmup.ready.push_back(key);
    waiting[i] = waiting.back();
    waiting.pop_back();
  }
}

void WarmupWorker() {
#if defined(_WIN32)
  // The game and render threads are what the frame waits on.
  SetThreadPriority(GetCurrentThread(), THREAD_PRIORITY_BELOW_NORMAL);
#endif
  auto& h = Host();
  while (!g_warmup.stop.load(std::memory_order_acquire)) {
    PipelineKey key;
    {
      std::unique_lock lock(g_warmup.mutex);
      ResolveWaitingLocked();
      if (g_warmup.ready.empty()) {
        if (g_warmup.waiting.empty() && g_warmup.in_flight == 0)
          return;
        // New shaders arrive while levels load; look again shortly.
        g_warmup.wake.wait_for(lock, std::chrono::milliseconds(100));
        continue;
      }
      key = g_warmup.ready.back();
      g_warmup.ready.pop_back();
      ++g_warmup.in_flight;
    }

    bool needed;
    {
      std::lock_guard host_lock(h.mutex);
      needed = !g_pipelines.contains(key);
    }
    if (needed && !h.shutting_down.load(std::memory_order_acquire)) {
      auto pipeline = BuildPipeline(key);
      std::lock_guard host_lock(h.mutex);
      // A draw that got here first built its own; this one is dropped.
      g_pipelines.try_emplace(key, std::move(pipeline));
    }

    std::lock_guard lock(g_warmup.mutex);
    --g_warmup.in_flight;
    ++g_warmup.built;
    if (g_warmup.built == g_warmup.total || g_warmup.built % 500 == 0) {
      GPU_INFO("Pipeline warm-up: {} of {} recorded pipelines ready", g_warmup.built,
               g_warmup.total);
    }
  }
}

}  // namespace

plume::RenderPipeline* GetPipelineLocked(const PipelineKey& key) {
  if (auto it = g_pipelines.find(key); it != g_pipelines.end())
    return it->second.get();

  cost::ScopedCost timed(cost::Costs().pipelines);
  auto pipeline = BuildPipeline(key);
  auto* raw = pipeline.get();
  if (raw)
    AppendRecord(key);
  g_pipelines.emplace(key, std::move(pipeline));
  return raw;
}

void StartPipelineWarmup() {
  std::vector<PipelineRecord> records;
  {
    std::lock_guard lock(g_record_mutex);
    records = LoadRecords();
  }
  if (records.empty()) {
    GPU_INFO("Pipeline warm-up: nothing recorded yet; pipelines this session go to {}",
             RecordPath().string());
    return;
  }
  const u32 cores = std::max(1u, std::thread::hardware_concurrency());
  const u32 workers = std::clamp(cores / 4, 1u, 3u);
  {
    std::lock_guard lock(g_warmup.mutex);
    g_warmup.total = u32(records.size());
    g_warmup.waiting = std::move(records);
  }
  GPU_INFO("Pipeline warm-up: {} recorded pipelines, {} background workers", g_warmup.total,
           workers);
  for (u32 i = 0; i < workers; ++i)
    g_warmup.workers.emplace_back(WarmupWorker);
}

void StopPipelineWarmup() {
  g_warmup.stop.store(true, std::memory_order_release);
  g_warmup.wake.notify_all();
  for (auto& worker : g_warmup.workers) {
    if (worker.joinable())
      worker.join();
  }
  g_warmup.workers.clear();
  std::lock_guard lock(g_record_mutex);
  if (g_record_file.is_open())
    g_record_file.close();
}

}  // namespace redahm::gpu

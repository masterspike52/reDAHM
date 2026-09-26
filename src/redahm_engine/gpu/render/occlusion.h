#pragma once

// The title's occlusion queries (D3DQuery_Issue / D3DQuery_GetData), answered
// from the GPU a frame late.
//
// PotF's scene renderer (sub_823A0858) spins on each query until it has an
// answer and culls the primitives, and the lights and shadows they carry,
// when no samples passed. Reporting everything visible drew about half the
// main scene's draws hidden behind the buildings in front of them.
//
// Its batcher (sub_8239F848 / sub_8239F780) puts the bounding boxes of several
// primitives under one query taken from a pool, so neither a query object nor
// its batch means the same primitives from one frame to the next. The host
// therefore queries each box on its own, keyed by its corners, which stay put
// while the primitive does. GetData never waits on the GPU: a query answers
// the sum of its boxes' latest finished results, and visible when any box has
// none recent enough (a box seen for the first time, or a moving primitive).
//
// D3D12 only (plume has no query calls; backend.cpp reaches the native ones).
// On Vulkan every query reports visible.
//
// The title's queries are kept on the thread driving the device, the host
// queries on the GPU thread (render/gpu_thread.h); an internal lock covers
// both. The Locked functions also need Host().mutex.

#include <rex/types.h>

namespace redahm::gpu::occlusion {

// CreateHostDevice, once the device is up.
void InitLocked();

//------------------------------------------------------------------------------
// The title's side
//------------------------------------------------------------------------------

// D3DQuery_Issue: D3DISSUE_BEGIN (2) / D3DISSUE_END (1).
void Issue(u32 query_va, u32 flags);

// Whether a draw now is tested by a title query, so its boxes want host
// queries of their own.
bool QueryOpen();

// Adds a box, whose corners are `bytes` at `vertices_va`, to the open query.
// Its key goes with the box's draw to BeginBoxLocked; 0 when no query is open.
u64 AddBox(u32 vertices_va, u32 bytes);

// D3DQuery_GetData's pixel count for the query.
u32 Result(u32 query_va);

//------------------------------------------------------------------------------
// GPU thread
//------------------------------------------------------------------------------

// Brackets one box's draw with a host query.
void BeginBoxLocked(u64 key);
void EndBoxLocked();

// A slot's recording is being queued: close what is still open and resolve
// the slot's queries into the readback buffer.
void QueueSlotLocked(u32 slot);

// The submit thread, right after executing the slot's recording.
void SlotSubmitted(u32 slot);

// The slot's fence has passed and it is about to record again.
void SlotReusedLocked(u32 slot);

}  // namespace redahm::gpu::occlusion

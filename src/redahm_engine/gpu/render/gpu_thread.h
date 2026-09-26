#pragma once

// The GPU thread: the title's D3D calls, made on whichever thread drives the
// device, are translated into host commands on a thread of their own.
//
// The draw path (pipeline state, constant uploads, texture and buffer
// preparation) took a quarter of UE3's render thread in busy scenes, and that
// thread is what the frame waits on. The hooks now capture what a call reads
// from guest memory (the device's render, sampler and constant state, resource
// headers, rewritten buffers, user-pointer vertices) into a packet and return
// to the title; this thread runs the packets in order, holding Host().mutex,
// through the same draw path as before. Like the Xenos, it runs behind the
// CPU, so a packet must not rely on guest memory the title may rewrite once
// the call returns. Texel data is the exception: textures are uploaded from
// guest memory when the packet runs, as the Xenos would fetch them.

#include <cstring>

#include <rex/types.h>

namespace redahm::gpu::gpu_thread {

// Runs one packet's payload, with Host().mutex held.
using Handler = void (*)(const u8* payload, u32 size);

// Holds the queue lock for its lifetime. What the recording side keeps across
// packets (draw.cpp's captured constants, resources.cpp's buffer records) is
// guarded by it. Never nest two on one thread, and never take one with
// Host().mutex held.
class Recorder {
 public:
  Recorder();
  ~Recorder();
  Recorder(const Recorder&) = delete;
  Recorder& operator=(const Recorder&) = delete;

  // Room for a payload of up to `size` bytes, 16-byte aligned.
  u8* Reserve(Handler handler, u32 size);
  // Queues the payload reserved last, `used` bytes of it. Returns the packet's
  // number for WaitFor.
  u64 Commit(u32 used);
};

// Queues one fixed-size payload.
template <typename T>
u64 Queue(Handler handler, const T& payload) {
  Recorder recorder;
  std::memcpy(recorder.Reserve(handler, u32(sizeof(T))), &payload, sizeof(T));
  return recorder.Commit(u32(sizeof(T)));
}

// Waits until the GPU thread has run packet `number` and all before it.
// Returns early once the renderer shuts down.
void WaitFor(u64 number);

// Waits for every packet committed before the call.
void Drain();

// Stops the GPU thread; queued packets are dropped. Gives up waiting for it
// after `timeout_ms` (it may be held in the overlay marshal by the thread
// calling this).
void Stop(u32 timeout_ms);

}  // namespace redahm::gpu::gpu_thread

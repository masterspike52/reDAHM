// Bink movie playback.
//
// BinkCreateTextures builds each plane texture with XGSetTextureHeaderEx over
// memory Bink allocated itself, locks it once for the pitch and never locks it
// again: BinkDecodeFrame decodes straight into that memory every frame. The
// unlock hooks therefore never see the new frames, so the planes are marked
// for re-upload where Bink finishes writing them.
//
// BinkDrawFrame itself is replaced: instead of its runtime-compiled shaders
// and a pixel-space quad drawn with the viewport transform off, the renderer
// converts and blends the frame with its own pass.

#include <bit>

#include <rex/hook.h>
#include <rex/types.h>

#include "generated/redahm_init.h"

#include "core/guest_memory.h"
#include "draw/draw.h"
#include "resources/resources.h"

namespace {

using namespace redahm::gpu;

// BINKFRAMEBUFFERS: two frame buffers of Y, cR, cB and A plane textures.
constexpr u32 kBinkFrameBufferSize = 32;
constexpr u32 kBinkPlaneTextures = 16;  // per frame buffer: Y, cR, cB, A (0 when absent)
constexpr u32 kBinkPlaneCount = 4;
constexpr u32 kBinkCurrentFrameBuffer = 84;

// The pixel shader constants BinkDrawFrame uploads to c0..c3: the tor, tog and
// tob rows, then consts (x weights the constant term, w is set to the alpha).
constexpr u32 kBinkYuvConstants = 0x835E4FB8;
constexpr u32 kBinkConstsX = kBinkYuvConstants + 3 * 16;

float LoadFloat(u32 va) {
  return std::bit_cast<float>(mem::Load<u32>(va));
}

u32 CurrentPlanes(u32 frame_buffers) {
  const u32 frame = mem::Load<u32>(frame_buffers + kBinkCurrentFrameBuffer);
  return frame_buffers + frame * kBinkFrameBufferSize + kBinkPlaneTextures;
}

// sub_8240DD60, BinkUnlockTextures (pFrameBuffers). After BinkDecodeFrame fills
// the current frame buffer's planes, the original only flushes the CPU cache
// over them.
void BinkUnlockTextures_hook(u32 frame_buffers) {
  if (!frame_buffers)
    return;
  const u32 planes = CurrentPlanes(frame_buffers);
  for (u32 i = 0; i < kBinkPlaneCount; ++i)
    MarkTextureDirty(mem::Load<u32>(planes + i * 4));
}

// sub_8240D990, BinkDrawFrame (X, Y, ScaleX, ScaleY, Alpha in f1..f5;
// pDevice, pFrameBuffers, Width, Height in r3..r6). Draws the current frame
// buffer over (X, Y) .. (X + Width * ScaleX, Y + Height * ScaleY) in render
// target 0's pixels, blended when Alpha is below one or an alpha plane exists.
// The original's device state changes (samplers, render states, FVF, shaders,
// textures 0..3) are all restored or overwritten by the title before its next
// draw, so none are replayed.
u32 BinkDrawFrame_hook(f64 x, f64 y, f64 scale_x, f64 scale_y, f64 alpha, u32 /*device*/,
                       u32 frame_buffers, u32 width, u32 height) {
  if (!frame_buffers)
    return 0;
  const u32 planes = CurrentPlanes(frame_buffers);

  MovieFrame frame;
  frame.y_plane = mem::Load<u32>(planes);
  // BINKFRAMEPLANESET order: Y, cR, cB, A. Bink's own constants agree: the
  // matrix it uploads to c0..c2 is BT.601, so the red row weights the second
  // vector slot (1.596) and the blue row the third (2.018).
  frame.cr_plane = mem::Load<u32>(planes + 4);
  frame.cb_plane = mem::Load<u32>(planes + 8);
  frame.a_plane = mem::Load<u32>(planes + 12);
  frame.x = float(x);
  frame.y = float(y);
  frame.width = float(width) * float(scale_x);
  frame.height = float(height) * float(scale_y);
  for (u32 row = 0; row < 3; ++row) {
    for (u32 i = 0; i < 4; ++i)
      frame.rows[row][i] = LoadFloat(kBinkYuvConstants + row * 16 + i * 4);
  }
  frame.constant = LoadFloat(kBinkConstsX);
  frame.alpha = float(alpha);
  DrawMovieFrame(frame);
  return 0;
}

}  // namespace

REX_HOOK(sub_8240DD60, BinkUnlockTextures_hook);
REX_HOOK(sub_8240D990, BinkDrawFrame_hook);

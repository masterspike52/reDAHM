// Second local player and split-screen viewport layout.
//
// UE3 renders one view per entry in GEngine->GamePlayers, and each ULocalPlayer
// carries its own fractional viewport rect. Both halves survived into this
// build intact, so split-screen is not something that has to be built -- it is
// something that has to be *populated*. See splitscreen.cpp for the derivation
// of every address and offset used.
#pragma once

#include <rex/ppc/context.h>

#include <cstdint>
#include <string>
#include <vector>

// How the drain lays out the players it finds. Applied every frame, so it also
// re-asserts itself after a level load rebuilds the player list.
enum class RedahmSplitLayout : int {
  // Leave every player full-screen. With two players that means two overlapping
  // full-screen views, which is the wrong picture but a useful diagnostic: it
  // proves the second view is being rendered at all.
  kNone = 0,
  // Stacked: player 0 on top, player 1 below.
  kHorizontal = 1,
  // Side by side: player 0 left, player 1 right.
  kVertical = 2,
};

struct RedahmLocalPlayer {
  uint32_t addr = 0;
  int32_t controller_id = 0;
  // ULocalPlayer::Actor. Zero means the player exists but never got a
  // PlayerController -- CalcSceneView bails on that, so it renders nothing.
  uint32_t actor = 0;
  float origin_x = 0.0f;
  float origin_y = 0.0f;
  float size_x = 0.0f;
  float size_y = 0.0f;
};

struct RedahmSplitscreenState {
  uint32_t engine = 0;    // GEngine
  uint32_t viewport = 0;  // GEngine->GameViewport
  uint32_t world = 0;     // GWorld
  // The cached ULocalPlayer UClass, plus the name it actually resolves to. The
  // name is the self-check: if it is not "LocalPlayer" the address is wrong and
  // nothing here will construct a player.
  uint32_t local_player_class = 0;
  std::string local_player_class_name;
  uint32_t data = 0;  // GamePlayers.Data
  int32_t num = 0;    // GamePlayers.Num
  int32_t max = 0;    // GamePlayers.Max
  std::vector<RedahmLocalPlayer> players;
  RedahmSplitLayout layout = RedahmSplitLayout::kNone;
  // Offset of ULocalPlayer::ViewportClient, discovered at runtime by matching
  // player 0's fields against GEngine->GameViewport. 0xFFFFFFFF => not found.
  uint32_t viewport_client_offset = 0xFFFFFFFFu;
};

void RedahmSetSplitLayout(RedahmSplitLayout layout);
RedahmSplitLayout RedahmGetSplitLayout();

// Queue creation of a local player bound to `controller_id`. Safe from any
// thread; the work happens on the next drain because it constructs a UObject
// and calls into the guest. Adding a controller id that already has a player is
// rejected rather than duplicated.
void RedahmRequestAddPlayer(int controller_id);

// Queue removal of the player bound to `controller_id`. Player 0 is refused --
// the engine assumes it exists from Init onwards.
void RedahmRequestRemovePlayer(int controller_id);

// Queue a zero-argument UnrealScript call on `object`, through that object's own
// UObject::ProcessEvent. Safe from any thread; runs on the next drain. Functions
// that take parameters are refused rather than called with a zeroed argument
// block. See splitscreen.cpp for how ProcessEvent was identified.
void RedahmRequestScriptCall(uint32_t object, std::string function);

// Snapshot of the live player list, for the overlay. Cheap; reads guest memory
// through the reflection module's validated readers, so it is safe to call from
// the UI thread and returns zeros rather than faulting on a stale pointer.
RedahmSplitscreenState RedahmSplitscreenSnapshot();

// Everything the drain has reported, newest last, capped. Add/remove are the
// only operations here that can fail in interesting ways, and the failure text
// (including the engine's own OutError from SpawnPlayActor) lands here.
std::vector<std::string> RedahmSplitscreenLog();

// Apply the layout and run queued add/remove. Must be called from a guest
// thread with a live context -- currently the UGameEngine::Tick hook in
// framerate.cpp, after the reflection refresh has latched the membase.
void RedahmDrainSplitscreen(PPCContext& __restrict ctx, uint8_t* base);

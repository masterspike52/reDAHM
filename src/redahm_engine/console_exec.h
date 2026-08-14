// Host-driven guest console commands. See console_exec.cpp for the mechanism.
#pragma once

#include <rex/ppc/context.h>

#include <cstddef>
#include <cstdint>
#include <memory>
#include <string>
#include <vector>

enum class RedahmConsoleStatus {
  // Some handler in the engine's Exec chain claimed the command.
  kHandled,
  // The command reached Exec and no handler recognised it -- a wrong name, or a
  // script exec function whose owning object is not currently spawned.
  kUnhandled,
  // The command never reached Exec: no engine object or output device to call
  // with yet. Distinct from kUnhandled because nothing was actually tried.
  kNotDispatched,
};

// One line the engine printed while a command was running, captured out of
// FOutputDeviceRedirector::Serialize.
struct RedahmConsoleLine {
  std::string text;
  // The EName the engine tagged the line with, resolved through the global name
  // table: "Log", "Warning", "Error", "Cmd", "ScriptWarning", ... Empty if the
  // name table was not readable, which only happens very early in startup.
  std::string category;
};

struct RedahmConsoleEntry {
  std::string cmd;
  RedahmConsoleStatus status;
  // Shared rather than owned: the overlay copies the whole history every frame
  // and a single OBJ LIST is hundreds of lines. The lines never change once the
  // command has finished, so sharing them is safe. Null means no output.
  std::shared_ptr<const std::vector<RedahmConsoleLine>> output;
  // Set when the command produced more lines than the per-command cap.
  bool output_truncated = false;
};

// Queue a command to run on the next drain. Safe from any thread; the command
// itself runs on a guest thread. Leading/trailing whitespace is stripped and
// empty commands are dropped.
void RedahmQueueConsoleCommand(std::string cmd);

// True once both halves of a dispatch are available: an engine object latched
// from a real Exec call, and an output device (GLog, or a global Ar the engine
// was seen to use).
bool RedahmConsoleReady();

// The two halves individually, for diagnostics. Zero means "not yet".
uint32_t RedahmConsoleExecObject();
uint32_t RedahmConsoleOutputDevice();

// Commands queued but not yet dispatched.
size_t RedahmConsoleQueueDepth();

// Most recently dispatched commands, oldest first, capped at 64.
std::vector<RedahmConsoleEntry> RedahmConsoleHistory();

// Drop every recorded command and its captured output.
void RedahmClearConsoleHistory();

// Assert the exec-component gate and run queued commands. Must be called from a
// guest thread with a live context -- currently UGameEngine::Tick in
// framerate.cpp, so queued commands run on the next frame rather than waiting
// for the game to dispatch a command of its own.
void RedahmDrainConsoleQueue(PPCContext& __restrict ctx, uint8_t* base);

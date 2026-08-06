// Host-driven guest console commands. See console_exec.cpp for the mechanism.
#pragma once

#include <rex/ppc/context.h>

#include <cstdint>
#include <string>

// Queue a command to run on the next drain. Safe from any thread; the command
// itself runs on a guest thread.
void RedahmQueueConsoleCommand(std::string cmd);

// True once a real Exec call has been observed and the object pointer latched.
bool RedahmConsoleReady();

// Assert the exec-component gate and run queued commands. Must be called from a
// guest thread with a live context -- currently UGameEngine::Tick in
// framerate.cpp, so queued commands run on the next frame rather than waiting
// for the game to dispatch a command of its own.
void RedahmDrainConsoleQueue(PPCContext& __restrict ctx, uint8_t* base);

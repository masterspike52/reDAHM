#pragma once

// A crash leaves a report instead of a vanished window.

#include <string>

namespace redahm::crash {

// Uncaught C++ exceptions are logged before std::terminate ends the process.
// Call as early as possible; setup can throw.
void InstallTerminateHandler();

// The last-chance report for faults nothing handled (the runtime passes on the
// guest faults it cannot resolve): the faulting function, named as the game's
// sub_XXXXXXXX when it is recompiled code, the guest address it touched, the
// registers and the call chain, logged and flushed; a minidump beside the
// logs; then a dialog saying where both are. Call once the runtime is up.
void InstallCrashReporter();

// The recompiled guest functions on the calling thread's stack, innermost
// first ("sub_82E64750+0x1c <- sub_822BCAE8+0x68 ..."), for logging where a
// call came from.
std::string GuestCallChain(int max_frames = 16);

}  // namespace redahm::crash

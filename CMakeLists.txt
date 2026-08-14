
# redahm - ReXGlue Recompiled Project
#
# This file is yours to edit. 'rexglue migrate' will NOT overwrite it.
# SDK boilerplate lives in generated/rexglue.cmake.

cmake_minimum_required(VERSION 3.25)
project(redahm LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(generated/rexglue.cmake)

# Sources
set(REDAHM_SOURCES
    src/main.cpp
    src/redahm_engine/hooks.cpp
    src/redahm_engine/dlc_unlock.cpp
    src/redahm_engine/console_exec.cpp
    src/redahm_engine/reflection.cpp
    src/redahm_engine/movie_sequence.cpp
    src/redahm_engine/framerate.cpp
    src/redahm_engine/splitscreen.cpp
    src/redahm_engine/audio/xaudio2_audio_system.cpp
    src/redahm_engine/audio/xaudio2_audio_driver.cpp
)

if(WIN32)
    add_executable(redahm WIN32 ${REDAHM_SOURCES})
else()
    add_executable(redahm ${REDAHM_SOURCES})
endif()

# SDK 0.9.0 moved Xenos GPU emulation out of the runtime into a plugin DLL that
# is loaded at startup from the executable folder, so it has to be staged here.
rexglue_setup_target(redahm GPU_PLUGINS xenos)

target_link_libraries(redahm PRIVATE xaudio2.lib)


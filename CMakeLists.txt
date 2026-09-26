
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
    # Unlocks and restored content
    src/redahm_engine/content/dlc_unlock.cpp
    src/redahm_engine/content/sandbox_restore.cpp
    # Crash reporting and traces
    src/redahm_engine/debug/crash_reporter.cpp
    src/redahm_engine/debug/dialog_trace.cpp
    # Game bug fixes
    src/redahm_engine/fixes/kynapse_unload.cpp
    src/redahm_engine/fixes/mission_audio.cpp
    src/redahm_engine/fixes/movie_sequence.cpp
    src/redahm_engine/fixes/ufo_stealth.cpp
    # Drop-in mods
    src/redahm_engine/mod/mod_build.cpp
    src/redahm_engine/mod/mod_loader.cpp
    src/redahm_engine/mod/mod_packages.cpp
    # Engine performance: frame pacing, allocator, native rewrites
    src/redahm_engine/perf/hooks.cpp
    src/redahm_engine/perf/native_foliage.cpp
    src/redahm_engine/perf/native_material.cpp
    src/redahm_engine/perf/native_scene.cpp
    # Options menu pages and the settings they drive
    src/redahm_engine/settings/graphics_menu.cpp
    src/redahm_engine/settings/graphics_settings.cpp
)

if(WIN32)
list(APPEND REDAHM_SOURCES icon/app.rc)
    add_executable(redahm WIN32 ${REDAHM_SOURCES})
else()
    add_executable(redahm ${REDAHM_SOURCES})
endif()

# The game renders through the plume renderer in src/redahm_engine/gpu, so the
# SDK runs detached (no Xenos GPU plugin) and the app owns presentation.
rexglue_setup_target(redahm)

include(src/redahm_engine/gpu/redahm_gpu.cmake)

target_link_libraries(redahm)


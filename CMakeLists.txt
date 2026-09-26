
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
    src/redahm_engine/graphics_menu.cpp
    src/redahm_engine/graphics_settings.cpp
    src/redahm_engine/ufo_stealth.cpp
    src/redahm_engine/native_foliage.cpp
    src/redahm_engine/native_material.cpp
    src/redahm_engine/native_scene.cpp
    src/redahm_engine/kynapse_unload.cpp
    src/redahm_engine/crash_reporter.cpp
    src/redahm_engine/movie_sequence.cpp
    src/redahm_engine/mission_audio.cpp
    src/redahm_engine/sandbox_restore.cpp
    src/redahm_engine/dialog_trace.cpp
    src/redahm_engine/mod_loader.cpp
    src/redahm_engine/mod_build.cpp
    src/redahm_engine/mod_packages.cpp
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


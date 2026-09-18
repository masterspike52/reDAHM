
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
    src/redahm_engine/movie_sequence.cpp
)

if(WIN32)
    add_executable(redahm WIN32 ${REDAHM_SOURCES})
else()
    add_executable(redahm ${REDAHM_SOURCES})
endif()

# The game renders through the plume renderer in src/redahm_engine/gpu, so the
# SDK runs detached (no Xenos GPU plugin) and the app owns presentation.
rexglue_setup_target(redahm)

include(src/redahm_engine/gpu/redahm_gpu.cmake)

target_link_libraries(redahm)


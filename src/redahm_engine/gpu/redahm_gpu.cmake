# redahm plume renderer build wiring.
#
# Included from the root CMakeLists.txt once the redahm target exists. Pulls in
# plume, builds XenosRecomp for REDAHM_RECOMP, turns the dumped guest shaders
# into the shader cache, compiles the renderer's own HLSL and adds every source
# under src/redahm_engine/gpu to the target.

set(REDAHM_GPU_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/redahm_engine/gpu")
set(REDAHM_GPU_GEN_DIR "${CMAKE_CURRENT_BINARY_DIR}/redahm_gpu")
set(REDAHM_XENOS_RECOMP_DIR "${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/reblue-XenosRecomp")
set(REDAHM_XENOS_THIRDPARTY_DIR "${REDAHM_XENOS_RECOMP_DIR}/thirdparty")
set(REDAHM_SHADER_COMMON_H "${REDAHM_XENOS_RECOMP_DIR}/XenosRecomp/shader_common.h")

set(REDAHM_GAME_ASSETS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/assets/KronosGame" CACHE PATH
    "KronosGame folder the guest shaders are dumped from")
set(REDAHM_SHADER_DUMP_DIR "${CMAKE_CURRENT_SOURCE_DIR}/assets/shaders" CACHE PATH
    "Directory tools/dump_shaders.py writes the Xenos shader containers to")

file(MAKE_DIRECTORY "${REDAHM_GPU_GEN_DIR}")

#------------------------------------------------------------------------------
# plume
#------------------------------------------------------------------------------
add_subdirectory(thirdparty/plume "${CMAKE_CURRENT_BINARY_DIR}/plume" EXCLUDE_FROM_ALL)

#------------------------------------------------------------------------------
# XenosRecomp, built for Destroy All Humans! Path of the Furon
#------------------------------------------------------------------------------
set(XENOS_RECOMP_REDAHM ON CACHE BOOL "" FORCE)
set(XENOS_RECOMP_RENUT OFF CACHE BOOL "" FORCE)
if(WIN32)
    set(XENOS_RECOMP_DXIL ON CACHE BOOL "" FORCE)
endif()
set(XXHASH_BUILD_XXHSUM OFF CACHE BOOL "" FORCE)
set(ZSTD_BUILD_PROGRAMS OFF CACHE BOOL "" FORCE)
set(ZSTD_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(ZSTD_BUILD_SHARED OFF CACHE BOOL "" FORCE)
set(ZSTD_BUILD_STATIC ON CACHE BOOL "" FORCE)

set(_redahm_saved_shared_libs ${BUILD_SHARED_LIBS})
set(BUILD_SHARED_LIBS OFF)
add_subdirectory("${REDAHM_XENOS_RECOMP_DIR}" "${CMAKE_CURRENT_BINARY_DIR}/XenosRecomp" EXCLUDE_FROM_ALL)
set(BUILD_SHARED_LIBS ${_redahm_saved_shared_libs})

#------------------------------------------------------------------------------
# Guest shaders: dump the Xenos containers out of the cooked packages, then
# recompile them into the DXIL/SPIR-V shader cache.
#------------------------------------------------------------------------------
find_package(Python3 COMPONENTS Interpreter REQUIRED)

set(REDAHM_SHADER_DUMP_STAMP "${REDAHM_SHADER_DUMP_DIR}/manifest.json")
add_custom_command(
    OUTPUT "${REDAHM_SHADER_DUMP_STAMP}"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tools/dump_shaders.py"
            --assets "${REDAHM_GAME_ASSETS_DIR}"
            --out "${REDAHM_SHADER_DUMP_DIR}"
            --quiet
    DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/tools/dump_shaders.py"
    COMMENT "Dumping Xenos shaders from ${REDAHM_GAME_ASSETS_DIR}"
    USES_TERMINAL
    VERBATIM)
add_custom_target(redahm_shader_dump DEPENDS "${REDAHM_SHADER_DUMP_STAMP}")

# Shaders the game compiles at runtime land here (redahm_runtime_shader_dir)
# and are recompiled with the dumped ones.
set(REDAHM_RUNTIME_SHADER_DIR "${REDAHM_SHADER_DUMP_DIR}/runtime")
file(GLOB REDAHM_RUNTIME_SHADERS CONFIGURE_DEPENDS "${REDAHM_RUNTIME_SHADER_DIR}/*.bin")

set(REDAHM_SHADER_CACHE_CPP "${REDAHM_GPU_GEN_DIR}/shader_cache.cpp")
add_custom_command(
    OUTPUT "${REDAHM_SHADER_CACHE_CPP}"
    COMMAND $<TARGET_FILE:XenosRecomp>
            "${REDAHM_SHADER_DUMP_DIR}" "${REDAHM_SHADER_CACHE_CPP}" "${REDAHM_SHADER_COMMON_H}"
    DEPENDS XenosRecomp "${REDAHM_SHADER_COMMON_H}" "${REDAHM_SHADER_DUMP_STAMP}"
            ${REDAHM_RUNTIME_SHADERS}
    COMMENT "Recompiling Xenos shaders (REDAHM_RECOMP)"
    USES_TERMINAL
    VERBATIM)
add_custom_target(redahm_shader_cache DEPENDS "${REDAHM_SHADER_CACHE_CPP}")
add_dependencies(redahm_shader_cache redahm_shader_dump)

set(REDAHM_HLSL_DUMP_DIR "${CMAKE_CURRENT_BINARY_DIR}/redahm_hlsl_dump" CACHE PATH
    "Directory redahm_shader_hlsl_dump writes the recompiled HLSL to")
add_custom_target(redahm_shader_hlsl_dump
    COMMAND ${CMAKE_COMMAND} -E make_directory "${REDAHM_HLSL_DUMP_DIR}"
    COMMAND $<TARGET_FILE:XenosRecomp>
            "${REDAHM_SHADER_DUMP_DIR}" "${REDAHM_GPU_GEN_DIR}/shader_cache.hlsldump.cpp"
            "${REDAHM_SHADER_COMMON_H}" "${REDAHM_HLSL_DUMP_DIR}"
    DEPENDS XenosRecomp "${REDAHM_SHADER_DUMP_STAMP}"
    COMMENT "Dumping recompiled HLSL to ${REDAHM_HLSL_DUMP_DIR}"
    USES_TERMINAL
    VERBATIM)

#------------------------------------------------------------------------------
# Renderer-owned HLSL (present, copy, overlay). Each compiles once per backend
# into a header exposing g_<name>_dxil / g_<name>_spirv.
#------------------------------------------------------------------------------
set(REDAHM_HLSL_DIR "${REDAHM_GPU_DIR}/shaders/hlsl")
set(REDAHM_HOST_SHADER_HEADERS "")

function(redahm_host_shader STEM PROFILE)
    file(GLOB hlsl_includes "${REDAHM_HLSL_DIR}/*.hlsli")
    foreach(backend IN ITEMS dxil spirv)
        if(backend STREQUAL "dxil")
            if(NOT WIN32)
                continue()
            endif()
            set(format_args "")
        else()
            set(format_args -spirv -fvk-use-dx-layout)
            if(PROFILE MATCHES "^vs")
                list(APPEND format_args -fvk-invert-y)
            endif()
        endif()
        set(out "${REDAHM_GPU_GEN_DIR}/hlsl/${STEM}.${backend}.h")
        add_custom_command(
            OUTPUT "${out}"
            COMMAND ${DIRECTX_DXC_TOOL}
                    -T ${PROFILE} -HV 2021 -all-resources-bound
                    -Wno-ignored-attributes ${format_args}
                    -Fh "${out}" -Vn g_${STEM}_${backend}
                    "${REDAHM_HLSL_DIR}/${STEM}.hlsl"
            DEPENDS "${REDAHM_HLSL_DIR}/${STEM}.hlsl" ${hlsl_includes}
            COMMENT "Compiling ${STEM}.hlsl (${PROFILE}, ${backend})"
            VERBATIM)
        list(APPEND REDAHM_HOST_SHADER_HEADERS "${out}")
    endforeach()
    set(REDAHM_HOST_SHADER_HEADERS ${REDAHM_HOST_SHADER_HEADERS} PARENT_SCOPE)
endfunction()

file(MAKE_DIRECTORY "${REDAHM_GPU_GEN_DIR}/hlsl")
foreach(shader IN ITEMS fullscreen_vs imgui_vs)
    redahm_host_shader(${shader} vs_6_0)
endforeach()
foreach(shader IN ITEMS present_ps resolve_color_ps resolve_depth_ps imgui_ps bink_ps)
    redahm_host_shader(${shader} ps_6_0)
endforeach()
add_custom_target(redahm_host_shaders DEPENDS ${REDAHM_HOST_SHADER_HEADERS})

#------------------------------------------------------------------------------
# Renderer sources
#------------------------------------------------------------------------------
file(GLOB_RECURSE REDAHM_GPU_SOURCES CONFIGURE_DEPENDS
    "${REDAHM_GPU_DIR}/*.cpp"
    "${REDAHM_GPU_DIR}/*.h")

target_sources(redahm PRIVATE
    ${REDAHM_GPU_SOURCES}
    "${REDAHM_SHADER_CACHE_CPP}"
    "${REDAHM_XENOS_THIRDPARTY_DIR}/smol-v/source/smolv.cpp")

# The generated cache is one enormous initializer list, and the vendored smol-v
# has no business seeing the recompiled-code precompiled header.
set_source_files_properties(
    "${REDAHM_SHADER_CACHE_CPP}"
    "${REDAHM_XENOS_THIRDPARTY_DIR}/smol-v/source/smolv.cpp"
    PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${REDAHM_XENOS_THIRDPARTY_DIR}/smol-v/source/smolv.cpp"
    PROPERTIES COMPILE_OPTIONS "-w")

add_dependencies(redahm redahm_shader_cache redahm_host_shaders)

target_include_directories(redahm PRIVATE
    "${REDAHM_GPU_DIR}"
    "${REDAHM_GPU_DIR}/shaders"
    "${REDAHM_GPU_GEN_DIR}"
    "${REDAHM_XENOS_RECOMP_DIR}/XenosRecomp"
    "${REDAHM_XENOS_THIRDPARTY_DIR}/smol-v/source"
    "${REDAHM_XENOS_THIRDPARTY_DIR}/zstd/lib")

# REDAHM_RECOMP selects the shader_common.h layout the recompiled shaders were
# built against. The renderer's constant buffer mirrors must agree with it.
target_compile_definitions(redahm PRIVATE REDAHM_RECOMP NOMINMAX WIN32_LEAN_AND_MEAN
    "REDAHM_RUNTIME_SHADER_DIR=\"${REDAHM_RUNTIME_SHADER_DIR}\"")

target_link_libraries(redahm PRIVATE
    plume
    libzstd_static
    rex::xxhash)

if(WIN32)
    target_link_libraries(redahm PRIVATE d3d12 dxgi Microsoft::DirectXShaderCompiler)
    # dxc-bin only exports the tool path to the parent scope, so the runtime
    # DLLs are addressed directly. The spec constant linker loads both.
    set(_redahm_dxc_bin "${REDAHM_XENOS_THIRDPARTY_DIR}/dxc-bin/bin/x64")
    add_custom_command(TARGET redahm POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${_redahm_dxc_bin}/dxcompiler.dll" "${_redahm_dxc_bin}/dxil.dll"
            "$<TARGET_FILE_DIR:redahm>"
        VERBATIM)
endif()

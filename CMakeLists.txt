cmake_minimum_required(VERSION 3.5)

set(PROJECT_VERSION "1.0.0" CACHE STRING "默认版本号")

option(GLFW_USE_DLL "Use GLFW DLL instead of static library" OFF)

set(CMAKE_C_STANDARD 99)
set(GLAD_GL ../deps/glad/gl.h)
set(SOURCES main.c ${GLAD_GL} )
# set(GLFW_LIB "lib-static-ucrt")
set(GLFW_LIB "lib-mingw-w64")
set(GLFW_LIB_DIR ../deps/glfw3/lib-static-ucrt)

include_directories(
    ../deps
    ../deps/glfw3/include
)

if(GLFW_LIB STREQUAL "lib-static-ucrt")
    message(STATUS "Use GLFW dll lib-static-ucrt")
    set(GLFW_USE_DLL ON)
    set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/../bin/ucrt)
elseif(GLFW_LIB STREQUAL "lib-mingw-w64")
    set(GLFW_LIBRARY_DIR ../deps/glfw3/lib-mingw-w64)
    set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/../bin/mingw)
else()
    message(FATAL_ERROR "Invalid GLFW_LIBRARY option. Please select 'lib-mingw-w64' or 'lib-static-ucrt'.")
endif()

link_directories(${GLFW_LIBRARY_DIR})

add_executable(${PROJECT_NAME} ${SOURCES})

# 若使用动态链接，则需要将 .dll 文件拷贝至可执行文件输出目录
if(GLFW_USE_DLL)
    if(GLFW_LIB STREQUAL "lib-mingw-w64")    
        message(STATUS "Use GLFW dll lib-mingw-w64")
    endif()

    set(GLFW3LIB glfw3dll)
    add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
                       COMMAND ${CMAKE_COMMAND} -E copy
                       ${GLFW_LIBRARY_DIR}/glfw3.dll
                       ${EXECUTABLE_OUTPUT_PATH})
else()
    message(STATUS "Use GLFW static lib-mingw-w64")
    set(GLFW3LIB glfw3)
endif(GLFW_USE_DLL)
target_link_libraries(${PROJECT_NAME} PRIVATE ${GLFW3LIB} gdi32 opengl32)

if (MSVC)
    # Tell MSVC to use main instead of WinMain
    set_target_properties(${GUI_ONLY_BINARIES} PROPERTIES
                          LINK_FLAGS "/ENTRY:mainCRTStartup")
elseif (CMAKE_C_SIMULATE_ID STREQUAL "MSVC")
    # Tell Clang using MS CRT to use main instead of WinMain
    set_target_properties(${GUI_ONLY_BINARIES} PROPERTIES
                          LINK_FLAGS "-Wl,/entry:mainCRTStartup")
endif()

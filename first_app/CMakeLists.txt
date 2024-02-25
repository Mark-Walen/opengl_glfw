cmake_minimum_required(VERSION 3.5)
project(first_app)

set(CMAKE_C_STANDARD 99)
set(GLAD_GL ../deps/glad/gl.h)
set(GLFW3_DLL ../deps/glfw3/lib-mingw-w64/glfw3dll)

include_directories(
    ../deps
    ../deps/glfw3/include
)

set(SOURCES main.c ${GLAD_GL} )
add_executable(${PROJECT_NAME} ${SOURCES})
target_link_directories(${PROJECT_NAME} PRIVATE ../deps/glfw3/lib-mingw-w64)
target_link_libraries(${PROJECT_NAME} PRIVATE glfw3 gdi32 opengl32)

if (MSVC)
    # Tell MSVC to use main instead of WinMain
    set_target_properties(${GUI_ONLY_BINARIES} PROPERTIES
                          LINK_FLAGS "/ENTRY:mainCRTStartup")
elseif (CMAKE_C_SIMULATE_ID STREQUAL "MSVC")
    # Tell Clang using MS CRT to use main instead of WinMain
    set_target_properties(${GUI_ONLY_BINARIES} PROPERTIES
                          LINK_FLAGS "-Wl,/entry:mainCRTStartup")
endif()

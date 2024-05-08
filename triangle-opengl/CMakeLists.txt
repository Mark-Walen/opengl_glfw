cmake_minimum_required(VERSION 3.5)

get_filename_component(DIR_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
set(PROJECT_NAME_DEFAULT ${DIR_NAME} CACHE STRING "Default project name")
project(
    ${PROJECT_NAME_DEFAULT}
    LANGUAGES C
    VERSION ${PROJECT_VERSION}
)
include(../CMakeLists.txt)

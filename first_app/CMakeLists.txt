cmake_minimum_required(VERSION 3.5)

# Get the directory name
get_filename_component(DIR_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)

# Set the project name to the directory name
set(PROJECT_NAME_DEFAULT ${DIR_NAME} CACHE STRING "Default project name")

# Set the project
project(
    ${PROJECT_NAME_DEFAULT}
    LANGUAGES C
    VERSION ${PROJECT_VERSION}
)

# Include the shared CMakeLists.txt file
include(../CMakeLists.txt)

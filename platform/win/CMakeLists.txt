cmake_minimum_required(VERSION 3.5)
project(Render)

set(ROOT_FOLDER ../../)
# GLFW3
option(GLFW_BUILD_DOCS OFF)
option(GLFW_BUILD_EXAMPLES OFF)
option(GLFW_BUILD_TESTS OFF)
#add_subdirectory(${ROOT_FOLDER}/libs/glfw)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../libs/glfw ${CMAKE_CURRENT_BINARY_DIR}/libs/glfw)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../runtime ${CMAKE_CURRENT_BINARY_DIR}/runtime)

# glm
include_directories(
        ${ROOT_FOLDER}/libs/glad/include/
        ${ROOT_FOLDER}/libs/glfw/include/
        ${ROOT_FOLDER}/libs/glm/
        ${ROOT_FOLDER}/runtime/
        )

if(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic -std=c++11")
    if(NOT WIN32)
        set(GLAD_LIBRARIES dl)
    endif()
endif()

# glad.c
set(GLAD_FILES ${ROOT_FOLDER}/libs/glad/src/glad.c)

# LIBs
set(COMMON_LIBS glfw ${GLFW_LIBRARIES} ${GLAD_LIBRARIES} runtime)

file(GLOB SOURCES "main.cpp" )

add_executable(Render ${SOURCES} ${GLAD_FILES})

target_link_libraries(Render ${COMMON_LIBS})

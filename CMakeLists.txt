cmake_minimum_required(VERSION 3.2)
project(gl VERSION 0.1.0)

include_directories(${CMAKE_SOURCE_DIR})

add_compile_options(-fsanitize=address)
add_link_options(-fsanitize=address)

add_executable(gl
        main.cpp
        graphics/load_bmp.cpp
        graphics/load_shaders.cpp
        graphics/mesh.cpp
        minecraft/connection.cpp
        minecraft/packet.cpp
        minecraft/varint.cpp
        util/byteswap.cpp
        util/dump.cpp)

find_package(OpenGL REQUIRED)
find_package(glfw3 REQUIRED)
find_package(GLEW REQUIRED)
find_package(fmt REQUIRED)
find_package(ZLIB REQUIRED)
find_package(OpenSSL REQUIRED)

set_property(TARGET gl PROPERTY CXX_STANDARD 23)

target_compile_options(gl PRIVATE
        -Wall
        -Wextra
        -Werror
        -Wno-unused
        -Wno-error=unused-variable
        -Wno-error=unused-parameter
        )

target_compile_definitions(gl PUBLIC GL_SILENCE_DEPRECATION)
target_compile_definitions(gl PUBLIC ASIO_STANDALONE)

target_link_libraries(gl OpenGL::GL glfw GLEW::GLEW fmt::fmt ZLIB::ZLIB OpenSSL::Crypto)

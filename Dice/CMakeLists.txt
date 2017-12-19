cmake_minimum_required(VERSION 3.8)
project(Dice)

set(CMAKE_C_STANDARD 99)

set(SOURCE_FILES main.c Lib.c)
add_executable(Dice ${SOURCE_FILES})
target_link_libraries(${PROJECT_NAME} pthread)
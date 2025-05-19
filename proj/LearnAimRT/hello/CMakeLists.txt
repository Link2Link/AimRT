


# Get the current folder name
string(REGEX REPLACE ".*/\(.*\)" "\\1" CUR_DIR ${CMAKE_CURRENT_SOURCE_DIR})

# Set namespace
set_namespace()


message(STATUS "LearnAimRT hello")
# Get namespace
get_namespace(CUR_SUPERIOR_NAMESPACE)
string(REPLACE "::" "_" CUR_SUPERIOR_NAMESPACE_UNDERLINE ${CUR_SUPERIOR_NAMESPACE})

## Set target name
set(CUR_TARGET_NAME ${CUR_SUPERIOR_NAMESPACE_UNDERLINE}_${CUR_DIR})
set(CUR_TARGET_ALIAS_NAME ${CUR_SUPERIOR_NAMESPACE}::${CUR_DIR})


message(STATUS "CUR_SUPERIOR_NAMESPACE = ${CUR_SUPERIOR_NAMESPACE}")
message(STATUS "CUR_TARGET_NAME = ${CUR_TARGET_NAME}")
message(STATUS "CUR_TARGET_ALIAS_NAME = ${CUR_TARGET_ALIAS_NAME}")


# Set file collection
file(GLOB_RECURSE head_files ${CMAKE_CURRENT_SOURCE_DIR}/*.h)
file(GLOB_RECURSE src ${CMAKE_CURRENT_SOURCE_DIR}/*.cc)
file(GLOB_RECURSE test_files ${CMAKE_CURRENT_SOURCE_DIR}/*_test.cc)
list(REMOVE_ITEM src ${test_files})

message(STATUS "head_files = ${head_files}")
message(STATUS "src = ${src}")
message(STATUS "test_files = ${test_files}")

# Add target
add_library(${CUR_TARGET_NAME} SHARED)
add_library(${CUR_TARGET_ALIAS_NAME} ALIAS ${CUR_TARGET_NAME})

message(STATUS "hello_module name : ${CUR_TARGET_NAME}")

# Set source file of target
target_sources(${CUR_TARGET_NAME} PRIVATE ${src})

# Set include path of target
target_include_directories(
  ${CUR_TARGET_NAME}
  PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/..>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/../protocols>)

# Set link libraries of target
target_link_libraries(
  ${CUR_TARGET_NAME}
  PRIVATE yaml-cpp::yaml-cpp
  PUBLIC aimrt::runtime::core
        aimrt::common::util
        aimrt::interface::aimrt_module_cpp_interface
        )

## Set test of target
#if(AIMRT_BUILD_TESTS AND test_files)
#  add_gtest_target(TEST_TARGET ${CUR_TARGET_NAME} TEST_SRC ${test_files})
#endif()

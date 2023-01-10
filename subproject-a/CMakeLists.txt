cmake_minimum_required(VERSION 3.22)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
  set(SUBPROJECT_A_BUILT_STANDALONE TRUE)
  project(subproject-a VERSION 3.0.1)
endif()

message(STATUS "SUBPROJECT_A_BUILT_STANDALONE=${SUBPROJECT_A_BUILT_STANDALONE}")

# Add three executables
add_executable(HelloJupiter src/hellojupiter.cpp)
add_executable(HelloMoon src/hellomoon.cpp)
add_executable(HelloWorld src/helloworld.cpp)

# Install the binaries
install(
  TARGETS
    HelloJupiter
    HelloMoon
    HelloWorld
  EXPORT MyCustomExportName)

# Install the cmake config file
install(
  EXPORT MyCustomExportName
  # We can't have a namespace because that would require us to drop when we
  # build using "build-tree" mode
  # NAMESPACE MyProjectNamespace::
  FILE MyProjectConfig.cmake
  DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake")

# Write and install the version file
# see https://cmake.org/cmake/help/latest/module/CMakePackageConfigHelpers.html#command:write_basic_package_version_file
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  MyProjectConfigVersion.cmake
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY SameMajorVersion)

install(
  FILES "${CMAKE_CURRENT_BINARY_DIR}/MyProjectConfigVersion.cmake"
	DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake")

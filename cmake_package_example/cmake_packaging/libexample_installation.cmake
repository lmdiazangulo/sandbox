message(STATUS "Configuring package installation for libexample")

set(libexample_VERSION "0.1")

# Relative to CMAKE_INSTALL_PREFIX:
set(ConfigPackageLocation "libexample/")

# target_include_directories(libexample PUBLIC ${CMAKE_INSTALL_PREFIX})
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  "${CMAKE_CURRENT_BINARY_DIR}/libexampleConfigVersion.cmake"
  VERSION       ${libexample_VERSION}
  COMPATIBILITY AnyNewerVersion
)

# Copy the FooConfig.cmake to the build/Foo directory:
configure_file(
  cmake_packaging/libexampleConfig.cmake
  "${CMAKE_CURRENT_BINARY_DIR}/libexampleConfig.cmake"
  COPYONLY
)

# --- Installation ---
install(
   TARGETS libexample
   EXPORT libexampleTargets
   DESTINATION ${ConfigPackageLocation}/lib/
)

# Export the targets (change namespace appropriately):
export(
  EXPORT    libexampleTargets
  FILE      "${CMAKE_CURRENT_BINARY_DIR}/libexampleTargets.cmake"
)

# install(
#   EXPORT      libexampleTargets
#   DESTINATION ${ConfigPackageLocation}/lib/
# )

# This also installs relative to CMAKE_INSTALL_PREFIX:
install(
  FILES       cmake_packaging/libexampleConfig.cmake
              "${CMAKE_CURRENT_BINARY_DIR}/libexampleConfigVersion.cmake"
  DESTINATION ${ConfigPackageLocation}/share/
)

# This is for the source files, change location appropriately:
install(
  DIRECTORY "src/"
  DESTINATION ${ConfigPackageLocation}/include/libexample/
  FILES_MATCHING PATTERN "*.h"
)

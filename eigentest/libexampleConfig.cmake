get_filename_component(libexample_INSTALL_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)

include("${CMAKE_CURRENT_LIST_DIR}/FooTargets.cmake")

set(libexample_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/../../../include")
set(libexample_LIBRARY_DIRS "${CMAKE_CURRENT_LIST_DIR}../../../lib"     )

set(libexample_FOUND True)
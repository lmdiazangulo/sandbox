get_filename_component(libexample_INSTALL_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)

set(libexample_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/../include/libexample/")
set(libexample_INCLUDE_DIRS ${libexample_INCLUDE_DIRS})
set(libexample_LIBRARY_DIR "${CMAKE_CURRENT_LIST_DIR}/../lib/"     )
link_directories(${libexample_LIBRARY_DIR})

set(libexample_FOUND True)
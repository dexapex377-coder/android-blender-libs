set(PACKAGE_VERSION "2021.11")
set(TBB_VERSION "2021.11")
if(PACKAGE_FIND_VERSION)
  if(PACKAGE_FIND_VERSION VERSION_LESS_EQUAL PACKAGE_VERSION)
    set(PACKAGE_VERSION_COMPATIBLE TRUE)
  else()
    set(PACKAGE_VERSION_COMPATIBLE FALSE)
  endif()
endif()

if(NOT TARGET TBB::tbb)
  add_library(TBB::tbb SHARED IMPORTED)
  set_target_properties(TBB::tbb PROPERTIES
    IMPORTED_LOCATION "${CMAKE_CURRENT_LIST_DIR}/../../../../lib/libtbb.so"
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/../../../../include"
  )
endif()
if(NOT TARGET TBB::tbbmalloc)
  add_library(TBB::tbbmalloc SHARED IMPORTED)
  set_target_properties(TBB::tbbmalloc PROPERTIES
    IMPORTED_LOCATION "${CMAKE_CURRENT_LIST_DIR}/../../../../lib/libtbbmalloc.so"
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/../../../../include"
  )
endif()
set(TBB_FOUND TRUE)
set(TBB_IMPORTED_TARGETS TBB::tbb TBB::tbbmalloc)

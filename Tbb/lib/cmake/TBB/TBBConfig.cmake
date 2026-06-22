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

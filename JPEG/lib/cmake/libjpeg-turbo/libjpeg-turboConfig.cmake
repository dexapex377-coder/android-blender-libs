set(PACKAGE_VERSION "2.1.5")
if(PACKAGE_FIND_VERSION)
  if(PACKAGE_FIND_VERSION VERSION_LESS_EQUAL PACKAGE_VERSION)
    set(PACKAGE_VERSION_COMPATIBLE TRUE)
  else()
    set(PACKAGE_VERSION_COMPATIBLE FALSE)
  endif()
endif()

if(NOT TARGET libjpeg-turbo::jpeg)
  add_library(libjpeg-turbo::jpeg STATIC IMPORTED)
  set_target_properties(libjpeg-turbo::jpeg PROPERTIES
    IMPORTED_LOCATION "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libjpeg.a"
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/../../../include"
  )
endif()
set(libjpeg-turbo_FOUND TRUE)
set(libjpeg-turbo_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../include")
set(libjpeg-turbo_LIBRARY "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libjpeg.a")

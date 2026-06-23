## Copyright 2009-2021 Intel Corporation
## SPDX-License-Identifier: Apache-2.0
SET(TBB_FOUND TRUE)
SET(TBB_ROOT F:/FreeProjects/android/Tbb/app/src/main/cpp/tbb-master/)
SET(TBB_INCLUDE_DIR F:/FreeProjects/android/Tbb/app/src/main/cpp/tbb-master/include/)
SET(TBB_LIBRARIES
        F:/FreeProjects/android/Tbb/app/build/intermediates/stripped_native_libs/release/out/lib/arm64-v8a/libtbb.so
        F:/FreeProjects/android/Tbb/app/build/intermediates/stripped_native_libs/release/out/lib/arm64-v8a/libtbbmalloc.so
        F:/FreeProjects/android/Tbb/app/build/intermediates/stripped_native_libs/release/out/lib/arm64-v8a/libtbbmalloc_proxy.so
        android
        )
set(TBB_INCLUDE_DIRS "${TBB_INCLUDE_DIR}")
IF (TASKING_INTERNAL)
  ADD_LIBRARY(tasking STATIC taskschedulerinternal.cpp)
ELSEIF (TASKING_TBB)
  ##############################################################
  # Find TBB
  ##############################################################
  if (NOT ${EMBREE_TBB_ROOT} STREQUAL "")
    set(TBB_FIND_PACKAGE_OPTION "NO_DEFAULT_PATH")
    set(TBB_ROOT ${EMBREE_TBB_ROOT})
    list(APPEND CMAKE_PREFIX_PATH ${EMBREE_TBB_ROOT})
  endif()

  ADD_LIBRARY(tasking STATIC taskschedulertbb.cpp)
  
  if (TARGET TBB::${EMBREE_TBB_COMPONENT})
    message("-- TBB: reuse existing TBB::${TBB_COMPONENT} target")
    TARGET_LINK_LIBRARIES(tasking PUBLIC TBB::${EMBREE_TBB_COMPONENT})
  else()
    # Try getting TBB via config first
    find_package(TBB 2020 COMPONENTS ${EMBREE_TBB_COMPONENT} CONFIG ${TBB_FIND_PACKAGE_OPTION})
    if (TBB_FOUND)
      TARGET_LINK_LIBRARIES(tasking PUBLIC TBB::${EMBREE_TBB_COMPONENT})
      message("-- Found TBB: ${TBB_VERSION} at ${TBB_DIR} via TBBConfig.cmake")
    else()

      # If not found try getting older TBB via module (FindTBB.cmake)
      message("-- Using FindTBB.cmake ")
      
      unset(TBB_DIR CACHE)
#      find_package(TBB 4.1 REQUIRED ${EMBREE_TBB_COMPONENT})
      SET(TBB_FOUND ON)
      if (TBB_FOUND)
        TARGET_LINK_LIBRARIES(tasking PUBLIC ${TBB_LIBRARIES})
        TARGET_INCLUDE_DIRECTORIES(tasking PUBLIC ${TBB_INCLUDE_DIRS})

        IF (EMBREE_STATIC_LIB)
          INSTALL(TARGETS TBB EXPORT TBB-targets)
          INSTALL(EXPORT TBB-targets DESTINATION ${EMBREE_CMAKEEXPORT_DIR} COMPONENT devel)
        ENDIF()
        
      endif()
      if (NOT TBB_FOUND)
        message("-- Not found TBB")
      endif()
    endif()
  endif()

  IF(WIN32)
    GET_TARGET_PROPERTY(DLL_PATH TBB::${EMBREE_TBB_COMPONENT} IMPORTED_LOCATION_RELEASE)
    GET_TARGET_PROPERTY(DLL_PATH_DEBUG TBB::${EMBREE_TBB_COMPONENT} IMPORTED_LOCATION_DEBUG)
    SET_TARGET_PROPERTIES(tasking PROPERTIES IMPORTED_LOCATION_RELEASE ${DLL_PATH})
    SET_TARGET_PROPERTIES(tasking PROPERTIES IMPORTED_LOCATION_DEBUG ${DLL_PATH_DEBUG})
  ENDIF()

  ###############################################################
  ## Create tasking target and link against TBB. Also set include directory
  ## information on tasking target to provide the "algorithms" object library
  ## with the TBB header files
  ###############################################################
  #TARGET_LINK_LIBRARIES(tasking PUBLIC TBB)
  #TARGET_INCLUDE_DIRECTORIES(tasking PUBLIC "${TBB_INCLUDE_DIRS}")

  include(installTBB)

ELSEIF (TASKING_PPL)
  ADD_LIBRARY(tasking STATIC taskschedulerppl.cpp)
  TARGET_LINK_LIBRARIES(tasking PUBLIC ${PPL_LIBRARIES})
ENDIF()

SET_PROPERTY(TARGET tasking PROPERTY FOLDER common)
SET_PROPERTY(TARGET tasking APPEND PROPERTY COMPILE_FLAGS " ${FLAGS_LOWEST}")

IF (EMBREE_STATIC_LIB)
  INSTALL(TARGETS tasking EXPORT tasking-targets ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}" COMPONENT devel)
  INSTALL(EXPORT tasking-targets DESTINATION "${EMBREE_CMAKEEXPORT_DIR}" COMPONENT devel)
ENDIF()

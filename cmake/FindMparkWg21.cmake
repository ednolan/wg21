# FindMparkWg21 -- locate the framework's data/ tree and render.cmake, then
# include MparkWg21Helpers.cmake to define the build API (wg21_add_paper() and
# the wg21_data target). Sets MparkWg21_FOUND / MparkWg21_DATA_SRC /
# MparkWg21_RENDER_SCRIPT. Self-locates relative to this file in both the
# source-checkout and install layouts; MparkWg21_ROOT overrides.

find_path(MparkWg21_DATA_SRC
  NAMES metadata.yaml
  HINTS "${CMAKE_CURRENT_LIST_DIR}/../data"
        ${MparkWg21_ROOT} ENV MparkWg21_ROOT
  PATH_SUFFIXES data share/mpark-wg21/data
  NO_DEFAULT_PATH
  DOC "MPark/WG21 source data directory")

find_file(MparkWg21_RENDER_SCRIPT
  NAMES render.cmake
  HINTS "${CMAKE_CURRENT_LIST_DIR}"
        ${MparkWg21_ROOT} ENV MparkWg21_ROOT
  PATH_SUFFIXES cmake share/mpark-wg21/cmake
  NO_DEFAULT_PATH
  DOC "MPark/WG21 render.cmake")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MparkWg21
  REQUIRED_VARS MparkWg21_DATA_SRC MparkWg21_RENDER_SCRIPT)

if(MparkWg21_FOUND)
  include("${CMAKE_CURRENT_LIST_DIR}/MparkWg21Helpers.cmake")
endif()

mark_as_advanced(MparkWg21_DATA_SRC MparkWg21_RENDER_SCRIPT)

# MPark.WG21
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE.md or copy at http://boost.org/LICENSE_1_0.txt)
#
# Top-level: installs the framework so consumers can find_package(MparkWg21);
# installing needs no tools. As a subdirectory (e.g. via a find_package-to-
# FetchContent injector): defines wg21_add_paper() against this checkout.

cmake_minimum_required(VERSION 3.30)

project(MparkWg21
  VERSION 0.1.0
  DESCRIPTION "Pandoc-based framework for authoring and reviewing WG21 papers"
  HOMEPAGE_URL "https://github.com/mpark/wg21"
  LANGUAGES NONE)

if(PROJECT_IS_TOP_LEVEL)
  include(GNUInstallDirs)

  # data/ and cmake/ install as siblings under share/mpark-wg21/, the layout
  # FindMparkWg21.cmake self-locates against. USE_SOURCE_PERMISSIONS preserves
  # +x on the scripts -- pandoc runs the filters via their shebang.
  install(DIRECTORY data/
          DESTINATION "${CMAKE_INSTALL_DATADIR}/mpark-wg21/data"
          USE_SOURCE_PERMISSIONS)
  install(FILES
            cmake/FindMparkWg21.cmake
            cmake/MparkWg21Helpers.cmake
            cmake/FindPandoc.cmake
            cmake/render.cmake
          DESTINATION "${CMAKE_INSTALL_DATADIR}/mpark-wg21/cmake")
else()
  set(MparkWg21_DATA_SRC      "${CMAKE_CURRENT_SOURCE_DIR}/data")
  set(MparkWg21_RENDER_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/cmake/render.cmake")
  include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/MparkWg21Helpers.cmake")
endif()

# MPark.WG21
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE.md or copy at http://boost.org/LICENSE_1_0.txt)
#
# Installs the framework so consumers can find_package(MparkWg21). Building
# documents is the Makefile's job or the consumer's (via wg21_add_paper), so
# installing needs no tools -- this file finds nothing.

cmake_minimum_required(VERSION 3.30)

project(MparkWg21
  VERSION 0.1.0
  DESCRIPTION "Pandoc-based framework for authoring and reviewing WG21 papers"
  HOMEPAGE_URL "https://github.com/mpark/wg21"
  LANGUAGES NONE)

include(GNUInstallDirs)

# data/ and cmake/ install as siblings under share/mpark-wg21/, the layout
# FindMparkWg21.cmake self-locates against. USE_SOURCE_PERMISSIONS preserves +x
# on the scripts -- pandoc runs the filters via their shebang.
install(DIRECTORY data/
        DESTINATION "${CMAKE_INSTALL_DATADIR}/mpark-wg21/data"
        USE_SOURCE_PERMISSIONS)
install(FILES
          cmake/FindMparkWg21.cmake
          cmake/MparkWg21Helpers.cmake
          cmake/FindPandoc.cmake
          cmake/render.cmake
        DESTINATION "${CMAKE_INSTALL_DATADIR}/mpark-wg21/cmake")

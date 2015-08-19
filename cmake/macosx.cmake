if (APPLE AND NOT IOS_PLATFORM)

    message ("Build for Mac OS X")

    set (APPNAME "XGameDev")

    set (CMAKE_CXX_FLAGS "-std=c++11 -g3 -Wall -O2")

    set (RESOURCES ${RESOURCES} ${SHARE}/icons/app.icns)
    set (BUILD_FLAGS MACOSX_BUNDLE)
    set (MACOSX_BUNDLE_ICON_FILE app.icns)
    set_source_files_properties (${RESOURCES} PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
    set (MACOSX_BUNDLE_GUI_IDENTIFIER "com.michaelborgmann.\${PRODUCT_NAME:identifier}")

    include (FindSDL2)

    set (GMOCK ${EXTERNAL}/gmock)

    include_directories (/usr/local/include
                         ${HEADERS}
                         ${GMOCK}/include
                         ${GMOCK}/gtest/include
                         ${EXTERNAL}/rapidxml)
    link_directories (/usr/local/lib
                      ${GMOCK}/build.macosx)

    set (LIBS ${SDL2_LIBRARY})

endif()

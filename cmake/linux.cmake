if (${CMAKE_SYSTEM_NAME} MATCHES "Linux" AND NOT ANDROID)
    message ("Build for Linux")
    set (APPNAME XGameDev)

    set (CMAKE_CXX_FLAGS "-std=c++11 -g3 -Wall -O2")

    set (GMOCK ${EXTERNAL}/gmock)
    set (GTEST ${GMOCK}/gtest)

    include_directories (/usr/local/include
                         ${HEADERS}
                         ${GMOCK}/include
                         ${GTEST}/include
                         ${EXTERNAL}/rapidxml)
    link_directories (/usr/local/lib ${GMOCK}/build.linux)

    set (LIBS SDL2 SDL2_image SDL2_ttf SDL2_mixer)

endif ()

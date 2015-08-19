if (WIN32 AND MINGW)

    message ("Build for MinGW")

    set (APPNAME XGameDev)

    set (CMAKE_CXX_FLAGS "-std=gnu++11 -g3 -Wall -O3 -D__NO_INLINE__")
    set (CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++")

    set (GMOCK ${EXTERNAL}/gmock)
    set (GTEST ${GMOCK}/gtest)
    set (SDL2_PATH C:/SDKs/SDL2-2.0.3/i686-w64-mingw32)
    set (SDL2IMAGE C:/SDKs/SDL2_image-2.0.0/i686-w64-mingw32)
    set (SDL2TTF C:/SDKs/SDL2_ttf-2.0.12/i686-w64-mingw32)
    set (SDL2MIXER C:/SDKs/SDL2_mixer-2.0.0/i686-w64-mingw32)

    set (BUILD_FLAGS WIN32)

    set (APP_ICON ${SHARE}/icons/app.rc)
    set (TEST_ICON ${SHARE}/TDD/TDD.rc)

    include_directories (${HEADERS}
                         ${SDL2_PATH}/include/SDL2
                         ${SDL2IMAGE}/include/SDL2
                         ${SDL2TTF}/include/SDL2
                         ${SDL2MIXER}/include/SDL2
                         ${GMOCK}/include
                         ${GTEST}/include
                         ${EXTERNAL}/rapidxml)

    link_directories (${GMOCK}/build.mingw
                      ${SDL2_PATH}/lib
                      ${SDL2IMAGE}/lib
                      ${SDL2TTF}/lib
                      ${SDL2MIXER}/lib)

    set (LIBS mingw32 SDL2main SDL2 SDL2_image SDL2_ttf SDL2_mixer)

endif ()

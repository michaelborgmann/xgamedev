if (WIN32 AND MSVC)

    message ("Build for Microsoft Visual Studio")
    set (APPNAME XGameDev)
    set (GMOCK ${EXTERNAL}/gmock) 
    set (GTEST ${GMOCK}/gtest)
    set (SDL2_PATH C:/SDKs/SDL2-2.0.3)
    set (SDL2IMAGE C:/SDKs/SDL2_image-2.0.0)
    set (SDL2TTF C:/SDKs/SDL2_ttf-2.0.12)
    set (SDL2MIXER C:/SDKs/SDL2_mixer-2.0.0)
    set (BUILD_FLAGS WIN32)

    set (APP_ICON ${SHARE}/icons/app.rc)
    set (TEST_ICON ${SHARE}/TDD/TDD.rc)

    include_directories (${HEADERS}
                         ${GMOCK}/include
                         ${GTEST}/include
                         ${SDL2_PATH}/include
                         ${SDL2IMAGE}/include
                         ${SDL2TTF}/include
                         ${SDL2MIXER}/include
                         ${EXTERNAL}/rapidxml)
    link_directories (${GMOCK}/build.msvc/Release
                      ${GMOCK}/build.msvc/gtest/Release
                      ${SDL2_PATH}/lib/x86
                      ${SDL2IMAGE}/lib/x86
                      ${SDL2TTF}/lib/x86
                      ${SDL2MIXER}/lib/x86)

    set (LIBS SDL2main SDL2 SDL2_image SDL2_ttf SDL2_mixer)

    set (CMAKE_CXX_FLAGS_RELEASE "/MT")
    set (CMAKE_CXX_FLAGS_DEBUG "/MT")
    set (CMAKE_EXE_LINKER_FLAGS "/FORCE:MULTIPLE")

endif ()

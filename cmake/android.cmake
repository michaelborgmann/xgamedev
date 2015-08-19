if (ANDROID)

    message ("Build Demo for Android")

    set (APPNAME XGameDev)

    set (CMAKE_CXX_FLAGS "-std=c++11 -g3 -Wall -O2")

    set (SDL2_PATH ${EXTERNAL}/SDL)
    set (SDL2IMAGE ${EXTERNAL}/SDL_image)
    set (SDL2TTF ${EXTERNAL}/SDL_ttf)
    set (SDL2MIXER ${EXTERNAL}/SDL_mixer)

    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DGL_GLEXT_PROTOTYPES")

#    include_directories (${SDL2_PATH}/include ${SDL2IMAGE} ${SDL2TTF} ${SDL2MIXER} ${LUA}/src)

    include_directories (${HEADERS}
                         ${EXTERNAL}/gmock/include
                         ${EXTERNAL}/gmock/gtest/include
                         ${SDL2_PATH}/include
                         ${SDL2IMAGE}
                         ${SDL2TTF}
                         ${SDL2MIXER}
                         ${EXTERNAL}/rapidxml)
    link_directories (${ROOT}/libs/armeabi-v7a
                      ${EXTERNAL}/gmock/libs/armeabi-v7a)

    set (LIBS ${LIBS} SDL2 SDL2_image SDL2_ttf SDL2_mixer)

endif ()

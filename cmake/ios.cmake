if (APPLE AND IOS_PLATFORM)

    message ("Build for iOS")

    set (APPNAME "XGameDev")

    set (CMAKE_CXX_FLAGS "-std=c++11 -g3 -Wall -O2 -DGTEST_HAS_PTHREAD=0")

    set (GMOCK ${EXTERNAL}/gmock)
    set (GMOCK_HEADERS ${GMOCK}/include)
    set (GMOCK_LIBS ${GMOCK}/build.ios)
    set (GTEST_HEADERS ${GMOCK}/gtest/include)

    set (SDL2_PATH ${EXTERNAL}/SDL)
    set (SDL2_INCLUDE ${SDL2_PATH}/include)
    set (SDL2_LIBRARY ${SDL2_PATH}/Xcode-iOS/SDL/build)

    set (SDL2IMAGE ${EXTERNAL}/SDL_image)
    set (SDL2IMAGE_INCLUDE ${SDL2IMAGE})
    set (SDL2IMAGE_LIBRARY ${SDL2IMAGE}/Xcode-iOS/build)

    set (SDL2TTF ${EXTERNAL}/SDL_ttf)
    set (SDL2TTF_INCLUDE ${SDL2TTF})
    set (SDL2TTF_LIBRARY ${SDL2TTF}/Xcode-iOS/build)

    set (SDL2MIXER ${EXTERNAL}/SDL_mixer)
    set (SDL2MIXER_INCLUDE ${SDL2MIXER})
    set (SDL2MIXER_LIBRARY ${SDL2MIXER}/Xcode-iOS/build)

    set (BUILD_FLAGS MACOSX_BUNDLE)

    set (RESOURCES ${RESOURCES} ${SHARE}/TDD/128x128.png)
    set (MACOSX_BUNDLE_ICON_FILE 128x128.png)
    set_source_files_properties (${RESOURCES} PROPERTIES MACOSX_PACKAGE_LOCATION Resources)

    set (MACOSX_BUNDLE_GUI_IDENTIFIER "com.michaelborgmann.\${PRODUCT_NAME:identifier}")

    set (IOS_FRAMEWORKS
         Foundation
         AudioToolbox
         CoreGraphics
         CoreMotion
         QuartzCore
         UIKit
         OpenGLES 
         ImageIO
         MobileCoreServices
    )

    foreach (FW ${IOS_FRAMEWORKS})
        set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -framework ${FW}")
    endforeach ()

    #link_directories (${SDL2_LIBRARY} ${SDL2IMAGE_LIBRARY} ${SDL2TTF_LIBRARY} ${SDL2MIXER_LIBRARY})
    #include_directories (${SDL2_INCLUDE} ${SDL2IMAGE_INCLUDE} ${SDL2TTF_INCLUDE} ${SDL2MIXER_INCLUDE})

    #set (LIBS ${LIBS} SDL2 SDL2_image SDL2_ttf SDL2_mixer)
    #set (HEADERS ${HEADERS} ${SDL2_INCLUDE})

    #include (cmake/lua.cmake)

    include_directories (${HEADERS}
                         ${SDL2_INCLUDE}
                         ${SDL2IMAGE_INCLUDE}
                         ${SDL2TTF_INCLUDE}
                         ${SDL2MIXER_INCLUDE}
                         ${GMOCK_HEADERS}
                         ${GTEST_HEADERS}
                         ${EXTERNAL}/rapidxml)
    link_directories (${GMOCK_LIBS}
                      ${SDL2_LIBRARY}
                      ${SDL2IMAGE_LIBRARY}
                      ${SDL2TTF_LIBRARY}
                      ${SDL2MIXER_LIBRARY})

    set (LIBS ${LIBS} SDL2 SDL2_image SDL2_ttf SDL2_mixer)

endif ()

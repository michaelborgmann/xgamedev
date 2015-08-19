cmake_minimum_required (VERSION 2.8)
project (XGAMEDEV)

set (ROOT ${XGAMEDEV_SOURCE_DIR})
set (SOURCES ${ROOT}/src)
set (HEADERS ${ROOT}/include)
set (SHARE ${ROOT}/share)
set (TESTS ${ROOT}/test)
set (EXTERNAL ${ROOT}/external)

set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ROOT}/cmake/Modules)

include (cmake/resources.cmake)
include (cmake/macosx.cmake)
include (cmake/ios.cmake)
include (cmake/android.cmake)
include (cmake/linux.cmake)
include (cmake/mingw.cmake)
include (cmake/msvc.cmake)

set (MAIN ${SOURCES}/Main.cpp)

set (SOURCECODE 
    ${SOURCES}/Hardware/Display.cpp
    ${SOURCES}/Hardware/Window.cpp
    ${SOURCES}/Files/Filesystem.cpp
    ${SOURCES}/Files/FileIO.cpp
    ${SOURCES}/Files/Xml.cpp
)

set (TESTCODE
    ${TESTS}/TestMain.cpp
    ${TESTS}/AppState.cpp
    ${TESTS}/HardwareLayer.cpp
    ${TESTS}/Files.cpp
    ${TESTS}/XmlParser.cpp
    ${TESTS}/EntityComponentSystem.cpp
    ${TESTS}/ProcessManagment.cpp
)

if (ANDROID)
    add_library (xgamedev SHARED ${SOURCECODE})
    target_link_libraries (xgamedev ${LIBS})
    set (SDL2_MAIN ${SDL2_PATH}/src/main/android/SDL_android_main.c)
    add_library (main SHARED ${SDL2_MAIN} ${SOURCES}/Main.cpp)
    target_link_libraries (main ${LIBS} xgamedev)
    add_library (TEST SHARED ${SDL2_MAIN} ${TESTCODE})
    target_link_libraries (TEST ${LIBS} xgamedev gmock)
else ()
    add_library (xgamedev ${SOURCECODE})
    target_link_libraries (xgamedev ${LIBS})

    add_executable(Demo ${BUILD_FLAGS} ${MAIN} ${SOURCECODE} ${RESOURCES} ${APP_ICON})
    target_link_libraries (Demo ${LIBS})

    add_executable (TEST ${BUILD_FLAGS} ${TESTS}/TestMain.cpp ${TESTCODE} ${RESOURCES} ${TEST_ICON})
    target_link_libraries (TEST ${LIBS} xgamedev gmock)
    add_test (TEST ${EXECUTABLE_OUTPUT_PATH}/TEST)
endif ()

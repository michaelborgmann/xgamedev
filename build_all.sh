#!/bin/bash

source setup/build_android.sh

function build_MacOSX() {

    setup/macosx.sh

    if [ -d build.macosx ]
    then
        echo "[X] Found build.macosx"
    else
        echo "[!] Create build.macosx"
        mkdir build.macosx
    fi

    cd build.macosx
    cmake .. -G Xcode
    xcodebuild -configuration Release
    xcodebuild -configuration Debug
    cd ..
}

function build_iOS() {

    source setup/ios.sh

    if [ -d build.ios ]
    then
        echo "[X] Found build.ios"
    else
        echo "[!] Create build.ios"
        mkdir build.ios
    fi

    cd build.ios
    ios-cmake .. -DIOS_PLATFORM=SIMULATOR
    xcodebuild -configuration Release
    xcodebuild -configuration Debug
    cd ..

}

function build_Android() {

    setup/android.sh

    if [ -d build.android ]
    then
        echo "[X] Found build.android"
    else
        echo "[!] Create build.android"
        mkdir build.android
    fi

    cd build.android
    android-cmake ..
    make
    cd ..    

    create_project

    cd android/app
    ant debug install
    cd ../test
    ant debug install
    cd ..

}

build_MacOSX
build_iOS
build_Android

#!/bin/bash

function install_GMock() {
    if [ -f external/gmock/build.macosx/libgmock.a ]
    then
        echo "[X] Found GMock"
    else
        echo "[!] Try intalling GMock"
        cd external/gmock
        mkdir build.macosx
        cd build.macosx
        cmake .. -G Xcode
        xcodebuild -configuration Release
        xcodebuild -configuration Debug
        cd ../../..
    fi
}

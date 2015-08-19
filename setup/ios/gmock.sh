#!/bin/bash

function install_GMock() {
    if [ -f external/gmock/build.ios/Release-iphonesimulator/libgmock.a ]
    then
        echo "[X] Found GMock"
    else
        echo "[!] Try intalling GMock"
        cd external/gmock
        mkdir build.ios
        cd build.ios
        ios-cmake .. -DIOS_PLATFORM=SIMULATOR   # OS|SIMULATOR
        xcodebuild -configuration Release
        xcodebuild -configuration Debug
        cd ../../..
    fi
}

#!/bin/bash

function install_GMock() {
    if [ -f external/gmock/libs/armeabi-v7a/libgmock.a ]
    then
        echo "[X] Found GMock"
    else
        echo "[!] Try intalling GMock"
        cd external/gmock
        mkdir build.android
        cd build.android
        android-cmake ..
        make
        cd ../../..
    fi
}

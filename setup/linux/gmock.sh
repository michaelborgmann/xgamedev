#!/bin/bash

function install_GMock() {
    if [ -f external/gmock/build.linux/libgmock.a ]
    then
        echo "[X] Found GMock"
    else
        echo "[!] Try intalling GMock"
        cd external/gmock
        mkdir build.linux
        cd build.linux
        cmake ..
        make
        cd ../../..
    fi
}

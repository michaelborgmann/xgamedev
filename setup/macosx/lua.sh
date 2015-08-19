#!/bin/bash

function install_Lua() {
    if [ -f /usr/local/bin/lua ]
    then
        echo "[X] Found Lua"
    else
        echo "[!] Try intalling Lua"
        cd external/lua
        make macosx
        sudo make install
        make clean
        cd ../..
    fi
}

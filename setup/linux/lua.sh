#!/bin/bash

function check_error() {
    if [ $? -ne 0 ]
    then
        echo "[ERROR] $1"
        exit
    else
        echo "[X]"
    fi
}

function install_Lua() {
    if [ -f $INSTALL/lib/liblua.a ]
    then
        echo "[X] Lua installed"
    else
        echo "[!] Try to build Lua"
        cd src/lua
        make linux
        check_error "Can't build Lua"
        sudo make install
        check_error "Can't install Lua"
        cd ../..
    fi
}

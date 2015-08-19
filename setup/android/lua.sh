#!/bin/bash

function install_Lua() {
    if [ -d jni/lua ]
    then
        echo "[X] NDK will build Lua"
    else
        echo "[!] Try preparing NDK to build Lua"
        ln -s ../external/lua jni/
    fi
    
    if [ -f jni/lua/Android.mk ]
    then
        echo "[X] Found Lua makefile for Android"
    else
        echo "[!] Copy Lua makefile for Android"
        cp setup/android/Android_Lua.mk jni/lua/Android.mk
    fi

    if grep "localeconv()->decimal_point\[0]" jni/lua/src/liolib.c
    then
        sed -i "" "s|localeconv()->decimal_point\[0]|'.'|g" jni/lua/src/liolib.c
    fi

    if grep "localeconv()->decimal_point\[0]" jni/lua/src/llex.c
    then
        sed -i "" "s|localeconv()->decimal_point\[0]|'.'|g" jni/lua/src/llex.c
    fi
}

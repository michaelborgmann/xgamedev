#!/bin/bash

function install_SDL2() {
    if [ -d jni/SDL ]
    then
        echo "[X] NDK will build SDL"
    else
        echo "[!] Try preparing NDK to build SDL"
        ln -s ../external/SDL jni/
    fi
    echo "[!] Set up SDL/Android.mk with android-toolchain"
    if ! grep --quiet "/include \$(LOCAL_PATH)" jni/SDL/Android.mk
    then
        sed -i "" "s|/include|/include \$(LOCAL_PATH)\/..\/..\/android-toolchain\/sysroot/usr/include|g" jni/SDL/Android.mk
        sed -i "" "s|-ldl|-L\$(LOCAL_PATH)\/..\/..\/android-toolchain\/sysroot\/usr\/lib -ldl|g" jni/SDL/Android.mk
    fi
}

function install_SDL2_image() {
    if [ -d jni/SDL_image ]
    then
        echo "[X] NDK will build SDL_image"
    else
        echo "[!] Try preparing NDK to build SDL_image"
        ln -s ../external/SDL_image jni/
    fi
}
 
function install_SDL2_ttf() {
    if [ -d jni/SDL_ttf ]
    then
        echo "[X] NDK will build SDL_ttf"
    else
        echo "[!] Try preparing NDK to build SDL_ttf"
        ln -s ../external/SDL_ttf jni/
    fi
}
 
function install_SDL2_mixer() {
    if [ -d jni/SDL_mixer ]
    then
        echo "[X] NDK will build SDL_mixer"
    else
        echo "[!] Try preparing NDK to build SDL_mixer"
        ln -s ../external/SDL_mixer jni/
    fi
    echo "[!] Set off plugins in SDL_mixer (mikmod, modplug, MP3/SMPEG)"

    if grep "SUPPORT_MOD_MODPLUG ?= true" jni/SDL_mixer/Android.mk
    then
        sed -i "" "s|SUPPORT_MOD_MODPLUG ?= true|SUPPORT_MOD_MODPLUG ?= false|g" jni/SDL_mixer/Android.mk
    fi

    if grep "SUPPORT_MOD_MIKMOD ?= true" jni/SDL_mixer/Android.mk
    then
        sed -i "" "s|SUPPORT_MOD_MIKMOD ?= true|SUPPORT_MOD_MIKMOD ?= false|g" jni/SDL_mixer/Android.mk
    fi

    if grep "SUPPORT_MP3_SMPEG ?= true" jni/SDL_mixer/Android.mk
    then
        sed -i "" "s|SUPPORT_MP3_SMPEG ?= true|SUPPORT_MP3_SMPEG ?= false|g" jni/SDL_mixer/Android.mk
    fi
}

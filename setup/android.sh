#!/bin/bash

function install_AndroidBrew() {
    is_brew
    if $BREW is true
    then
        brew install android-sdk android-ndk ant
    fi
}

source setup/libs.sh
source setup/macosx/homebrew.sh
source setup/android/cmake.sh
source setup/android/sdl2.sh
source setup/android/toolchain.sh
source setup/android/ndk.sh
source setup/android/lua.sh
source setup/android/gmock.sh

# Install Homebrew
install_Homebrew
install_AllBrews
install_AndroidBrew

get_SDL
get_SDL_image
get_SDL_ttf
get_SDL_mixer
get_Lua
#get_TinyXML2
get_GMock

install_Toolchain
install_NDK

install_GMock
install_SDL2
install_SDL2_image
install_SDL2_ttf
install_SDL2_mixer
install_Lua
install_GMock

ndk-build

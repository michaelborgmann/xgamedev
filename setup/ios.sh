#!/bin/bash

function install_iOSBrew() {
    is_brew
    if $BREW is true
    then
        brew install ios-sim reattach-to-user-namespace
    fi
}

source setup/libs.sh
source setup/macosx/homebrew.sh
source setup/ios/cmake.sh
source setup/ios/sdl2.sh
source setup/ios/gmock.sh

# Install Homebrew
install_Homebrew
install_AllBrews
install_iOSBrew

get_SDL
get_SDL_image
get_SDL_ttf
get_SDL_mixer
get_Lua
get_Freetype
get_TinyXML2
get_GMock

install_GMock
install_SDL2
install_SDL2_image
install_SDL2_ttf
install_SDL2_mixer

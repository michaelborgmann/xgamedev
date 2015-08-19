#!/bin/bash

source setup/libs.sh
source setup/macosx/homebrew.sh
source setup/macosx/sdl2.sh
source setup/macosx/gmock.sh
source setup/macosx/lua.sh

# Install Homebrew
install_Homebrew
install_AllBrews

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
install_Lua

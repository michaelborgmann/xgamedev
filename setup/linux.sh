#!/bin/bash

INSTALL=/usr/local

source setup/libs.sh
source setup/linux/sdl2.sh
source setup/linux/lua.sh

get_SDL
get_SDL_image
get_SDL_ttf
get_SDL_mixer
get_Lua
get_Freetype

install_SDL
install_SDL_image
install_Freetype
install_SDL_ttf
install_SDL_mixer
install_Lua

#!/bin/bash

function get_SDL() {
    if [ -d external/SDL ]
    then
        echo "[X] SDL sources found"
    else
        echo "[!] Try downloading SDL"
        hg clone http://hg.libsdl.org/SDL external/SDL #--config httpproxy.host=192.168.0.1:8080
    fi
}

function get_SDL_image() {
    if [ -d external/SDL_image ]
    then
        echo "[X] SDL_image sources found"
    else
        echo "[!] Try downloading SDL_image"
        hg clone http://hg.libsdl.org/SDL_image external/SDL_image #--config httpproxy.host=192.168.0.1:8080
    fi
}

function get_SDL_ttf() {
    if [ -d external/SDL_ttf ]
    then
        echo "[X] SDL_ttf sources found"
    else
        echo "[!] Try downloading SDL_ttf"
        hg clone http://hg.libsdl.org/SDL_ttf external/SDL_ttf #--config httpproxy.host=192.168.0.1:8080
    fi
}

function get_SDL_mixer() {
    if [ -d external/SDL_mixer ]
    then
        echo "[X] SDL_mixer sources found"
    else
        echo "[!] Try downloading SDL_mixer"
        hg clone http://hg.libsdl.org/SDL_mixer external/SDL_mixer #--config httpproxy.host=192.168.0.1:8080
    fi
}

function get_Lua() {
    if [ -d external/lua ]
    then
        echo "[X] Lua sources found"
    else
        echo "[!] Try downloading Lua"
        wget http://www.lua.org/ftp/lua-5.3.0.tar.gz
        tar xzf lua-5.3.0.tar.gz
        mv lua-5.3.0 external/lua
        rm lua-5.3.0.tar.gz
    fi
}

function get_Freetype() {
    if [ -d external/SDL_ttf/external/freetype-2.5.5 ]
    then
        echo "[X] Freetype sources found"
    else
        echo "[!] Try downloadig Freetype sources"
        wget downloads.sourceforge.net/project/freetype/freetype2/2.5.5/freetype-2.5.5.tar.bz2
        tar xjf freetype-2.5.5.tar.bz2
        mv freetype-2.5.5 external/SDL_ttf/external/freetype-2.5.5
        rm -rf freetype-2.5.5.tar.bz2
    fi
}

function get_TinyXML2() {
    if [ -d external/tinyxml2 ]
    then
        echo "[X] TinyXML2 sources found"
    else
        echo "[!] Try downloading TinyXML2 sources"
        git clone https://github.com/leethomason/tinyxml2.git external/tinyxml2
    fi
}

function get_GMock() {
    if [ -d external/gmock ]
    then
        echo "[X] GMock sources found"
    else
        echo "[!] Try downloading GMock sources"
        #svn checkout http://googlemock.googlecode.com/svn/trunk/ googlemock-read-only 
        wget https://googlemock.googlecode.com/files/gmock-1.7.0.zip 
        unzip gmock-1.7.0.zip
        mv gmock-1.7.0 external/gmock
        rm -rf gmock-1.7.0.zip
    fi
}

#!/bin/bash

function install_SDL2() {
    if [ -d /Library/Frameworks/SDL2.framework ]
    then
        echo "[X] Found SDL2"
    else
        echo "[!] Try intalling SDL2"
        cd external/SDL/Xcode/SDL
        xcodebuild -configuration Release
        sudo mv build/Release/SDL2.framework /Library/Frameworks
        cd ../../../..
    fi
}

function install_SDL2_image() {
    if [ -d /Library/Frameworks/SDL2_image.framework ]
    then
        echo "[X] Found SDL2_image"
    else
        echo "[!] Try intalling SDL2_image"
        cd external/SDL_image/Xcode
        xcodebuild -configuration Release
        sudo mv build/Release/SDL2_image.framework /Library/Frameworks
        cd ../../../../..
    fi
}

function install_SDL2_ttf() {
    if [ -d /Library/Frameworks/SDL2_ttf.framework ]
    then
        echo "[X] Found SDL2_ttf"
    else
        echo "[!] Try intalling SDL2_ttf"
        cd external/SDL_ttf/Xcode
        xcodebuild -configuration Release
        sudo mv build/Release/SDL2_ttf.framework /Library/Frameworks
        cd ../../../../..
    fi
}

function install_SDL2_mixer() {
    if [ -d /Library/Frameworks/SDL2_mixer.framework ]
    then
        echo "[X] Found SDL2_mixer"
    else
        echo "[!] Try intalling SDL2_mixer"
        cd external/SDL_mixer/Xcode
        xcodebuild -configuration Release
        sudo mv build/Release/SDL2_mixer.framework /Library/Frameworks
        cd ../../../../..
    fi
}

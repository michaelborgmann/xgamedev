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

function install_Freetype() {
    if [ -f $INSTALL/lib/libfreetype.la ]
    then
        echo "[X] Freetype installed"
    else
        echo "[!] Try to build Freetype"
        cd src/SDL_ttf/external/freetype-2.5.5
        ./autogen.sh
        check_error "Freetype autogen.sh failed"
        ./configure
        check_error "Freetype configure failed"
        make
        check_error "Cant't build Freetype"
        sudo make install
        check_error "Can't install Freetype"
        cd ../../../..
    fi
}

function install_SDL() {
    if [ -f $INSTALL/lib/libSDL2.a ]
    then
        echo "[X] SDL2 installed"
    else
        echo "[!] Try to build SDL2"
        cd src/SDL
        ./autogen.sh
        check_error "SDL2 autogen.sh failed"
        ./configure
        check_error "SDL2 configure failed"
        make
        check_error "Can't build SDL"
        sudo make install
        check_error "Can't install SDL"
        cd ../..
    fi
}

function install_jpeg() {
    if [ -f $INSTALL/lib/libjpeg.a ]
    then
        echo "[X] JPEG installed"
    else
        echo "[!] Try to build JPEG"
        cd src/SDL_image/external/jpeg*
        ./configure
        check_error "JPEG configure failed"
        make
        check_error "Can't build JPEG"
        sudo make install
        check_error "Can't install JPEG"
        cd ../../../..
    fi
}

function install_zlib() {
    if [ -f $INSTALL/lib/libz.a ]
    then
        echo "[X] ZLIB installed"
    else
        echo "[!] Try to build ZLIB"
        cd src/SDL_image/external/zlib*
        ./configure
        check_error "ZLIB configure failed"
        make
        check_error "Can't build ZLIB"
        sudo make install
        check_error "Can't install ZLIB"
        cd ../../../..
    fi
}

function install_libpng() {
    if [ -f $INSTALL/lib/libpng.a ]
    then
        echo "[X] PNG installed"
    else
        echo "[!] Try to build PNG"
        cd src/SDL_image/external/libpng*
        #./autogen.sh
        #check_error "PNG autogen.sh failed"
        ./configure
        check_error "PNG configure failed"
        make
        check_error "Can't build PNG"
        sudo make install
        check_error "Can't install PNG"
        cd ../../../..
    fi
}

function install_libwebp() {
    if [ -f $INSTALL/lib/libwebp.a ]
    then
        echo "[X] WEBP installed"
    else
        echo "[!] Try to build WEBP"
        cd src/SDL_image/external/libwebp*
        ./autogen.sh
        check_error "WEBP autogen.sh failed"
        ./configure
        check_error "WEBP configure failed"
        make
        check_error "Can't build WEBP"
        sudo make install
        check_error "Can't install WEBP"
        cd ../../../..
    fi
}

function install_SDL_image() {
    if [ -f $INSTALL/lib/libSDL2_image.a ]
    then
        echo "[X] SDL2_image installed"
    else
        install_jpeg
        install_zlib
        install_libpng
	install_libwebp
        echo "[!] Try to build SDL2_image"
        cd src/SDL_image
        ./autogen.sh
        heck_error "SDL2_image autogen.sh failed"
        ./configure
        check_error "SDL2_image configure failed"
        make
        check_error "Can't build SDL_image"
        sudo make install
        check_error "Can't install SDL_image"
        cd ../..
    fi
}

function install_SDL_ttf() {
    if [ -f $INSTALL/lib/libSDL2_ttf.a ]
    then
        echo "[X] SDL2_ttf installed"
    else
	install_Freetype
        echo "[!] Try to build SDL2_ttf"
        cd src/SDL_ttf
        ./autogen.sh
        check_error "SDL2_ttf autogen.sh failed"
        ./configure
        check_error "SDL2_ttf configure failed"
        make
        check_error "Can't build SDL_ttf"
        sudo make install
        check_error "Can't install SDL_ttf"
        cd ../..
    fi
}

function install_libogg() {
    if [ -f $INSTALL/lib/libogg.a ]
    then
        echo "[X] OGG installed"
    else
        echo "[!] Try to build OGG"
        cd src/SDL_mixer/external/libogg*
        ./configure
        check_error "OGG configure failed"
        make
        check_error "Can't build OGG"
        sudo make install
        check_error "Can't install OGG"
        cd ../../../..
    fi
}

function install_libvorbis() {
    if [ -f $INSTALL/lib/libvorbis.a ]
    then
        echo "[X] Vorbis installed"
    else
        echo "[!] Try to build Vorbis"
        cd src/SDL_mixer/external/libvorbis*
        ./autogen.sh
        check_error "Vorbis autogen.sh failed"
        ./configure
        check_error "Vorbis configure failed"
        make
        check_error "Can't build Vorbis"
        sudo make install
        check_error "Can't install Vorbis"
        cd ../../../..
    fi
}

function install_smpeg() {
    if [ -f $INSTALL/lib/libsmpeg2.a ]
    then
        echo "[X] SMPEG installed"
    else
        echo "[!] Try to build SMPEG"
        cd src/SDL_mixer/external/smpeg*
        ./autogen.sh
        check_error "SMPEG autogen.sh failed"
        ./configure
        check_error "SMPEG configure failed"
        make
        check_error "Can't build SMPEG"
        sudo make install
        check_error "Can't install SMPEG"
        cd ../../../..
    fi
}

function install_SDL_mixer() {
    if [ -f $INSTALL/lib/libSDL2_mixer.a ]
    then
        echo "[X] SDL2_mixer installed"
    else
	install_libogg
	install_libvorbis
	install_smpeg
        echo "[!] Try to build SDL2_mixer"
        cd src/SDL_mixer
        ./autogen.sh
        check_error "SDL2_mixer autogen.sh failed"
        ./configure --prefix=$INSTALL
        check_error "SDL2_mixer configure failed"
        make
        check_error "Can't build SDL_mixer"
        sudo make install
        check_error "Can't install SDL_mixer"
        cd ../..
    fi
}

#!/bin/sh

if [ -f cmake/toolchain/android.toolchain.cmake ]
then
    echo "[X] Found Android CMake Toolchain"
else
    echo "[!] Try downloading Android CMake Toolchain"
    hg clone https://code.google.com/p/android-cmake --config #http_proxy.host=192.168.0.1:8080
    mkdir -p cmake/toolchain
    mv android-cmake/toolchain/android.toolchain.cmake cmake/toolchain/
    rm -rf android-cmake
fi

#if ((SHLVL >= 2))
if [[ "$(basename -- "$0")" == "cmake.sh" ]];
then
    echo "Script must be executed in same process. Start with the dot command!"
    echo "Usage: . $0"
    exit
fi

SDK=/usr/local/Cellar/android-sdk/24.0.2

if [[ "$PATH" =~ "$SDK/tools" ]]
then
    echo "[X] Found PATH: $SDK/tools"
else
    echo "[!] Add PATH  : $SDK/tools"
    export PATH=$PATH:$SDK/tools
fi

if [[ "$PATH" =~ "$SDK/build-tools" ]]
then
    echo "[X] Found PATH: $SDK/build-tools"
else
    echo "[!] Add PATH  : $SDK/build-tools"
    export PATH=$PATH:$SDK/build-tools
fi

if [[ "$PATH" =~ "$SDK/platform-tools" ]]
then
    echo "[X] Found PATH: $SDK/platform-tools"
else
    echo "[!] Add PATH  : $SDK/platform-tools"
    export PATH=$PATH:$SDK/platform-tools
fi

if [ -z $NDK ]
then
    echo "[!] Add NDK   : /usr/local/Cellar/android-ndk/r10d"
    export NDK=/usr/local/Cellar/android-ndk/r10d
else
    echo "[X] Found NDK : $NDK"
fi

PWD=`pwd`
CMAKE="$PWD/cmake/toolchain"

ANDTOOLCHAIN=$CMAKE/android.toolchain.cmake
alias android-cmake='cmake -DCMAKE_TOOLCHAIN_FILE='"$ANDTOOLCHAIN"' -Wno-dev'
export ANDROID_STANDALONE_TOOLCHAIN=$PWD/android-toolchain

echo "[X] Android CMake Toolchain is set for this shell (rerun for every new session)"
echo "    Usage: android-cmake .."

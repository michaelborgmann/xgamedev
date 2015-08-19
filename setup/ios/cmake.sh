#!/bin/sh

if [ -f cmake/toolchain/iOS.cmake ]
then
    echo "[X] Found iOS CMake Toolchain"
else
    echo "[!] Try downloading iOS CMake Toolchain"
    hg clone https://code.google.com/p/ios-cmake # --config http_proxy.host=192.168.0.1:8080
    mkdir -p cmake/toolchain
    mv ios-cmake/toolchain/iOS.cmake cmake/toolchain/
    rm -rf ios-cmake
fi

#if ((SHLVL >= 2))
if [[ "$(basename -- "$0")" == "cmake.sh" ]];
then
    echo "Script must be executed in same process. Start with the dot command!"
    echo "Usage: . $0"
    exit
fi

PWD=`pwd`
CMAKE="$PWD/cmake/toolchain"

IOSTOOLCHAIN=$CMAKE/iOS.cmake
alias ios-cmake='cmake -DCMAKE_TOOLCHAIN_FILE='"$IOSTOOLCHAIN"' -G Xcode'

echo "[X] iOS CMake Toolchain is set for this shell (rerun for every new session)"
echo "    Usage: ios-cmake .. -DIOS_PLATFORM=SIMULATOR"

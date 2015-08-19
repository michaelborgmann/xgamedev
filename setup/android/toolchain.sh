#!/bin/bash

function install_Toolchain() {
    if [ -d android-toolchain ]
    then
        echo "[X] Android toolchain found"
    else
        if [[ "$(basename -- "$0")" == "toolchain.sh" ]];
        then
            echo "Script must be executed in same process. Start with the dot command!"
            echo "Usage: . $0"
            exit
        fi
        
        
        if [ -f /usr/local/Cellar/android-ndk/r10d/build/tools/make-standalone-toolchain.sh ]
        then
            echo "[X] Found toolscript creation file"
        else
            echo "[E] Not found the toolscript creation file (make-standalone-toolchain.sh"
            return
        fi
        
        if [ -z $NDK ]
        then
            echo "[E] Can't find Android NDK. Try set pathes with Android_CMake.sh script:"
            echo "    Usage: . setup/Android_CMake.sh"
            return
        else
            echo "[X] Found NDK : $NDK"
        fi
        
        echo "[!] Try creating Android Toolchain. Consider chaning settings in this script"
        $NDK/build/tools/make-standalone-toolchain.sh --platform=android-19 --install-dir=./android-toolchain --toolchain=arm-linux-androideabi-4.9
    fi
}

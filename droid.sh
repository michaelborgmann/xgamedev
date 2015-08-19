#!/bin/bash
rm -rf build.android android
mkdir build.android
cd build.android
cmake .. -DCMAKE_TOOLCHAIN_FILE=/Users/michael/src/shootordie/external/xgamedev/cmake/toolchain/android.toolchain.cmake -Wno-dev
android-cmake ..
make
cd ..
source setup/build_android.sh
#cd android/test
#ant debug install
adb logcat -c
#adb logcat | grep -e "stdout"
#cd ../..

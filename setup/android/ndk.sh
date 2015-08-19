#!/bin/bash

function install_NDK() {
    if [ -d jni ]
    then
        echo "[X] JNI found"
    else
        mkdir jni
        echo "[!] JNI created"
    fi
    
    if [ -f jni/Android.mk ]
    then
        echo "[X] jni/Android.mk found"
    else
        echo "include \$(call all-subdir-makefiles)" >> jni/Android.mk
        echo "[X] jni/Android.mk created"
    fi
    
    if [ -f jni/Application.mk ]
    then
        echo "[X] jni/Application.mk found"
    else
        #echo "APP_ABI := armeabi armeabi-v7a x86" >> jni/Application.mk
        echo "APP_ABI := armeabi-v7a" >> jni/Application.mk
        echo "[X] jni/Application.mk created"
    fi
}

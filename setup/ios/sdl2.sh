#!/bin/sh

function install_SDL2() {
    
    if [ -f external/SDL/XCode-iOS/SDL/build/Debug-iphonesimulator/libSDL2.a ]
    then
        echo "[X] Found libSDL2.a (Debug/Simulator)"
    else
        echo "[!] Build libSDL.a (Debug/Simulator)"
        xcodebuild -project external/SDL/Xcode-iOS/SDL/SDL.xcodeproj -configuration Debug -sdk iphonesimulator
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
    
    if [ -f external/SDL/XCode-iOS/SDL/build/Release-iphonesimulator/libSDL2.a ]
    then
        echo "[X] Found libSDL2.a (Release/Simulator)"
    else
        echo "[!] Build libSDL.a (Release/Simulator)"
        xcodebuild -project external/SDL/Xcode-iOS/SDL/SDL.xcodeproj -configuration Release -sdk iphonesimulator
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
    
    if [ -f external/SDL/XCode-iOS/SDL/build/Debug-iphoneos/libSDL2.a ]
    then
        echo "[X] Found libSDL2.a (Debug/OS)"
    else
        echo "[!] Build libSDL.a (Debug/OS)"
        xcodebuild -project external/SDL/Xcode-iOS/SDL/SDL.xcodeproj -configuration Debug -sdk iphoneos
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
    
    if [ -f external/SDL/XCode-iOS/SDL/build/Release-iphoneos/libSDL2.a ]
    then
        echo "[X] Found libSDL2.a (Release/OS)"
    else
        echo "[!] Build libSDL.a (Release/OS)"
        xcodebuild -project external/SDL/Xcode-iOS/SDL/SDL.xcodeproj -configuration Release -sdk iphoneos
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
}
    

function install_SDL2_image() {
    if [ -f external/SDL_image/XCode-iOS/build/Debug-iphonesimulator/libSDL2_image.a ]
    then
        echo "[X] Found libSDL2_image.a (Debug/Simulator)"
    else
        echo "[!] Build libSDL_image.a (Debug/Simulator)"
        xcodebuild -project external/SDL_image/Xcode-iOS/SDL_image.xcodeproj -configuration Debug -sdk iphonesimulator
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
    
    if [ -f external/SDL_image/XCode-iOS/build/Release-iphonesimulator/libSDL2_image.a ]
    then
        echo "[X] Found libSDL2_image.a (Release/Simulator)"
    else
        echo "[!] Build libSDL2_image.a (Release/Simulator)"
        xcodebuild -project external/SDL_image/Xcode-iOS/SDL_image.xcodeproj -configuration Release -sdk iphonesimulator
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
    
    if [ -f external/SDL_image/XCode-iOS/build/Debug-iphoneos/libSDL2_image.a ]
    then
        echo "[X] Found libSDL2_image.a (Debug/OS)"
    else
        echo "[!] Build libSDL2_image.a (Debug/OS)"
        xcodebuild -project external/SDL_image/Xcode-iOS/SDL_image.xcodeproj -configuration Debug -sdk iphoneos
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
    
    if [ -f external/SDL_image/XCode-iOS/build/Release-iphoneos/libSDL2_image.a ]
    then
        echo "[X] Found libSDL2_image.a (Release/OS)"
    else
        echo "[!] Build libSDL2_image.a (Release/OS)"
        xcodebuild -project external/SDL_image/Xcode-iOS/SDL_image.xcodeproj -configuration Release -sdk iphoneos
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
}    

function install_SDL2_ttf() {

    # BUILD SDL_TTF LIBRARY AS DEBUG/RELEASE FOR SIMULATOR/OS
    
    if [ -f external/SDL_ttf/XCode-iOS/build/Debug-iphonesimulator/libSDL2_ttf.a ]
    then
        echo "[X] Found libSDL2_ttf.a (Debug/Simulator)"
    else
        echo "[!] Build libSDL2_ttf.a (Debug/Simulator)"
        xcodebuild -project external/SDL_ttf/Xcode-iOS/SDL_ttf.xcodeproj -configuration Debug -sdk iphonesimulator
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
    
    if [ -f external/SDL_ttf/XCode-iOS/build/Release-iphonesimulator/libSDL2_ttf.a ]
    then
        echo "[X] Found libSDL2_ttf.a (Release/Simulator)"
    else
        echo "[!] Build libSDL2_ttf.a (Release/Simulator)"
        xcodebuild -project external/SDL_ttf/Xcode-iOS/SDL_ttf.xcodeproj -configuration Release -sdk iphonesimulator
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
    
    if [ -f external/SDL_ttf/XCode-iOS/build/Debug-iphoneos/libSDL2_ttf.a ]
    then
        echo "[X] Found libSDL2_ttf.a (Debug/OS)"
    else
        echo "[!] Build libSDL2_ttf.a (Debug/OS)"
        xcodebuild -project external/SDL_ttf/Xcode-iOS/SDL_ttf.xcodeproj -configuration Debug -sdk iphoneos
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
    
    if [ -f external/SDL_ttf/XCode-iOS/build/Release-iphoneos/libSDL2_ttf.a ]
    then
        echo "[X] Found libSDL2_ttf.a (Release/OS)"
    else
        echo "[!] Build libSDL2_ttf.a (Release/OS)"
        xcodebuild -project external/SDL_ttf/Xcode-iOS/SDL_ttf.xcodeproj -configuration Release -sdk iphoneos
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
}
    
function install_SDL2_mixer() {
    if [ -f external/SDL_mixer/XCode-iOS/build/Debug-iphonesimulator/libSDL2_mixer.a ]
    then
        echo "[X] Found libSDL2_mixer.a (Debug/Simulator)"
    else
        echo "[!] Build libSDL2_mixer.a (Debug/Simulator)"
        xcodebuild -project external/SDL_mixer/Xcode-iOS/SDL_mixer.xcodeproj -configuration Debug -sdk iphonesimulator
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
    
    if [ -f external/SDL_mixer/XCode-iOS/build/Release-iphonesimulator/libSDL2_mixer.a ]
    then
        echo "[X] Found libSDL2_mixer.a (Release/Simulator)"
    else
        echo "[!] Build libSDL2_mixer.a (Release/Simulator)"
        xcodebuild -project external/SDL_mixer/Xcode-iOS/SDL_mixer.xcodeproj -configuration Release -sdk iphonesimulator
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
    
    if [ -f external/SDL_mixer/XCode-iOS/build/Debug-iphoneos/libSDL2_mixer.a ]
    then
        echo "[X] Found libSDL2_mixer.a (Debug/OS)"
    else
        echo "[!] Build libSDL2_mixer.a (Debug/OS)"
        xcodebuild -project external/SDL_mixer/Xcode-iOS/SDL_mixer.xcodeproj -configuration Debug -sdk iphoneos
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
    
    if [ -f external/SDL_mixer/XCode-iOS/build/Release-iphoneos/libSDL2_mixer.a ]
    then
        echo "[X] Found libSDL2_mixer.a (Release/OS)"
    else
        echo "[!] Build libSDL2_mixer.a (Release/OS)"
        xcodebuild -project external/SDL_mixer/Xcode-iOS/SDL_mixer.xcodeproj -configuration Release -sdk iphoneos
        if [ $? -ne 0 ]
        then
            echo "[E] Build failed"
            return $?
        fi
    fi
}

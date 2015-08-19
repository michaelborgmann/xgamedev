#!/bin/bash

function redirect_stdout() {
    adb root
    adb shell stop
    adb shell setprop log.redirect-stdio true
    adb shell start
}

function create_project() {

    ROOT=`pwd`
    
    APP="android/app"
    APPNAME="xgd"
    APPMAIN="XGameDev"
    APPTITLE="XGD Demo"
    
    TEST="android/test"
    TESTMAIN="XGDTest"
    TESTTITLE="XGD Tests"
    
    mkdir android
    
    ################################################################################
    
    # APP: XGD Demo
    cp -rf external/SDL/android-project  $APP
    
    #init_android.sh
    cd ${APP}
    android update project --name ${APPMAIN} --path . --target android-19
    cd ${ROOT}
    
    cp -rf libs ${APP}
    rm ${APP}/libs/armeabi-v7a/libTEST.so
    
    mkdir -p ${APP}/src/com/michaelborgmann/${APPMAIN}
    cp setup/android/${APPMAIN}.java ${APP}/src/com/michaelborgmann/${APPMAIN}/
    
    mkdir -p ${APP}/assets
    cp share/icons/72x72.png ${APP}/res/drawable-hdpi/ic_launcher.png
    cp share/icons/48x48.png ${APP}/res/drawable-mdpi/ic_launcher.png
    cp share/icons/96x96.png ${APP}/res/drawable-xhdpi/ic_launcher.png
    cp share/icons/144x144.png ${APP}/res/drawable-xxhdpi/ic_launcher.png
    
    sed -i "" "s|org\.libsdl\.app|com\.michaelborgmann\.${APPMAIN}|g" ${APP}/AndroidManifest.xml
    sed -i "" "s|SDLActivity|${APPMAIN}|g" ${APP}/AndroidManifest.xml
    sed -i "" "s|SDLActivity|${APPMAIN}|g" ${APP}/build.xml
    sed -i "" "s|SDL App|${APPTITLE}|g" ${APP}/res/values/strings.xml
    
    ################################################################################
    
    # TEST: XGD Test
    cp -rf external/SDL/android-project  $TEST
    
    #init_android.sh
    cd ${TEST}
    android update project --name ${TESTMAIN} --path . --target android-19
    cd ${ROOT}
    
    cp -rf libs ${TEST}
    mv ${TEST}/libs/armeabi-v7a/libTEST.so ${TEST}/libs/armeabi-v7a/libmain.so
    
    mkdir -p ${TEST}/src/com/michaelborgmann/${TESTMAIN}
    cp setup/android/${TESTMAIN}.java ${TEST}/src/com/michaelborgmann/${TESTMAIN}/
    
    mkdir -p ${TEST}/assets
    cp share/TDD/72x72.png ${TEST}/res/drawable-hdpi/ic_launcher.png
    cp share/TDD/48x48.png ${TEST}/res/drawable-mdpi/ic_launcher.png
    cp share/TDD/96x96.png ${TEST}/res/drawable-xhdpi/ic_launcher.png
    cp share/TDD/144x144.png ${TEST}/res/drawable-xxhdpi/ic_launcher.png

    cp share/test.xml share/entity.xml share/noentity.xml share/invalid.xml android/test/assets/
    
    sed -i "" "s|org\.libsdl\.app|com\.michaelborgmann\.${TESTMAIN}|g" ${TEST}/AndroidManifest.xml
    sed -i "" "s|SDLActivity|${TESTMAIN}|g" ${TEST}/AndroidManifest.xml
    sed -i "" "s|SDLActivity|${TESTMAIN}|g" ${TEST}/build.xml
    sed -i "" "s|SDL App|${TESTTITLE}|g" ${TEST}/res/values/strings.xml

}

create_project
redirect_stdout

package com.michaelborgmann.XGDTest;
import org.libsdl.app.SDLActivity;
public class XGDTest extends SDLActivity {

    // Load the .so
    static {
        System.loadLibrary("SDL2");
        System.loadLibrary("SDL2_image");
        System.loadLibrary("SDL2_mixer");
        //System.loadLibrary("SDL2_net");
        System.loadLibrary("SDL2_ttf");
        //System.loadLibrary("lua");
        //System.loadLibrary("Coracao");
        //System.loadLibrary("ShootOrDie");
        System.loadLibrary("main");
        //System.loadLibrary("");		// Load your own libs
    }

}

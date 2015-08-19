#ifndef _WINDOW_H_
#define _WINDOW_H_

#include <string>
#include "SDL2.h"

using namespace std;

class Window {
    private:
        SDL_Window *window;
        SDL_Renderer *renderer;
        int window_width, window_height;
        int window_xpos, window_ypos;

    public:
        Window(string title, int flags);
        ~Window();
        bool isFullscreen();

        int width();
        int height();
        int xpos() ;
        int ypos();

};

#endif

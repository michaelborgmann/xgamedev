#ifndef _DISPLAY_H_
#define _DISPLAY_H_

#include "SDL2.h"

class Display {
    private:
        SDL_Rect size;
    public:
        Display(int display = 0);
        int width();
        int height();
        int xpos();
        int ypos();
};

#endif

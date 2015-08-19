#include "Hardware/Display.h"

Display::Display(int display) {
    SDL_GetDisplayBounds(display, &size);
}

int Display::width() { return size.w; }
int Display::height() { return size.h; }
int Display::xpos() { return size.x; }
int Display::ypos() { return size.y; }

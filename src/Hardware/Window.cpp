#include "Hardware/Window.h"

Window::Window(string title, int flags)
: window(nullptr) {
    SDL_Init(SDL_INIT_VIDEO);
    SDL_CreateWindowAndRenderer(0, 0, flags, &window, &renderer);
    SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "linear");
    SDL_RenderSetLogicalSize(renderer, 640, 480);
    SDL_GetWindowSize(window, &window_width, &window_height);
    SDL_GetWindowPosition(window, &window_xpos, &window_ypos);
}

Window::~Window() {
    SDL_DestroyWindow(window);
}

bool Window::isFullscreen() {
    return SDL_GetWindowFlags(window) & SDL_WINDOW_FULLSCREEN;
}

int Window::width() { return window_width; }
int Window::height() { return window_height; }
int Window::xpos() { return window_xpos; }
int Window::ypos() { return window_ypos; }

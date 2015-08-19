#ifndef _SDL2_H_
#define _SDL2_H_

#ifdef __APPLE__
    #include <TargetConditionals.h>
#endif

#if _WIN32 || __ANDROID__ || TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
    #include <SDL.h>
    #include <SDL_image.h>
    #include <SDL_ttf.h>
    #include <SDL_mixer.h>
#elif __linux__ || __CYGWIN__
    #include <SDL2/SDL.h>
    #include <SDL2/SDL_image.h>
    #include <SDL2/SDL_ttf.h>
    #include <SDL2/SDL_mixer.h>
#elif TARGET_OS_MAC
    #include <SDL2/SDL.h>
    #include <SDL2_image/SDL_image.h>
    #include <SDL2_ttf/SDL_ttf.h>
    #include <SDL2_mixer/SDL_mixer.h>
#endif

#endif // _SDL2_H_

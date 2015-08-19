#include "Files/Filesystem.h"

string Filesystem::pathToResources() {
    return findBasePath() + relativePathToResources();
}

string Filesystem::findBasePath() {
    char *foundPath = SDL_GetBasePath();
    if (foundPath) {
        basePath = foundPath;
    } else if (SDL_GetError()) {
        if (!isFalseAlarm()) {
            throw FileError(string("App base path not found: ") + SDL_GetError());
        }
    }
    SDL_free(foundPath);
    return basePath;
}

bool Filesystem::isFalseAlarm() {
    bool falseAlarm = true;
    if (checkError("That operation is not supported") || checkError("")) {
        SDL_ClearError();
    } else {
        falseAlarm = false;
    }
    return falseAlarm;
}

bool Filesystem::checkError(string message) {
    return (strcmp(SDL_GetError(), message.c_str()) == 0) ? true : false;
}

string Filesystem::relativePathToResources() {
    applyPlatformRelativePath("Linux", "../share/");
    applyPlatformRelativePath("Windows", "share\\");
    return relativePath;
}

void Filesystem::applyPlatformRelativePath(string platform, string path) {
    if (strcmp(SDL_GetPlatform(), platform.c_str()) == 0) {
        relativePath = path;
    }
}

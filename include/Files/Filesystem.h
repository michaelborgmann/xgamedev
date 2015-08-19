#ifndef _FILESYSTEM_H_
#define _FILESYSTEM_H_

#include <cstring>
#include <string>
#include "SDL2.h"
#include "Errors.h"

using namespace std;

class Filesystem {
    string basePath;
    string relativePath;

public:
    string pathToResources();

private:

    string findBasePath();
    bool isFalseAlarm();
    bool checkError(string message);
    string relativePathToResources();
    void applyPlatformRelativePath(string platform, string path);
};

#endif

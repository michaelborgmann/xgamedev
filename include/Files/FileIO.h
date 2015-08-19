#ifndef _FILEIO_H_
#define _FILEIO_H_

#include <string>
#include "SDL2.h"
#include "Errors.h"

using namespace std;

enum class FilePosition { begin = RW_SEEK_SET, current = RW_SEEK_CUR, end = RW_SEEK_END };

class FileIO {
    SDL_RWops *file;
    string filename;
public:
    FileIO(string filename);
    ~FileIO();
    string read(unsigned int bytesToRead = 0);
    unsigned int seek(FilePosition position, Sint64 = 0);
    unsigned int size();

private:
    void open(string mode);
    void close();
};

#endif

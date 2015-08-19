#include <iostream>
#include "Files/FileIO.h"

FileIO::FileIO(string filename) : filename(filename) {
        open("r");      // r = read; r+ = read/write; rb = read as binary
}

FileIO::~FileIO() {
    close();
}

string FileIO::read(unsigned int bytesToRead) {
    if (bytesToRead == 0) {
        bytesToRead = SDL_RWsize(file) - SDL_RWtell(file);
    }
    string readFile(bytesToRead, 0);
    SDL_RWread(file, &readFile[0], bytesToRead, 1);
    return readFile;
}

unsigned int FileIO::seek(FilePosition position, Sint64 offset) {
    return SDL_RWseek(file, offset, static_cast<underlying_type<FilePosition>::type>(position));
}

unsigned int FileIO::size() {
    return SDL_RWsize(file);
}

void FileIO::open(string mode) {
    file = SDL_RWFromFile(filename.c_str(), mode.c_str());
    if (!file) {
        throw FileError("File not found: " + filename);
    }
}

void FileIO::close() {
    if (file) {
        SDL_RWclose(file);
    }
}

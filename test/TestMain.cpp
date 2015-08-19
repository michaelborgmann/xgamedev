#include <gmock/gmock.h>
#include <iostream>
#include "SDL2.h"

using namespace std;

int main(int argc, char *argv[]) {
    cout << "Run Test Suite" << endl;
    SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_INFORMATION, "Run Test Suite", "Executed in terminal", NULL);

    

    testing::InitGoogleMock(&argc, argv);
    return RUN_ALL_TESTS();
}

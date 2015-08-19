#include <iostream>
#include "SDL2.h"

using namespace std;

unsigned int i = 0;

void processInput() {}
void update() {}
void render() {}
unsigned int getCurrentTime() { return SDL_GetTicks(); }
void sleep(unsigned int delay) { /* SDL_Delay(delay); */
    cout << i++ << " = " << delay << endl;
    SDL_Delay(delay);
}

int main(int argc, char *argv[]) {
    cout << "XGameDev Demo" << endl;
    //SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_INFORMATION, "XGameDev", "Just a demo", NULL);

    const int MS_PER_UPDATE = 1000 / 60;
    unsigned int previous = getCurrentTime();
    unsigned int lag = previous;        // actually it's should represent 0
    bool done = false;
    while (!done) {
        double current = getCurrentTime();
        double elapsed = current - previous;
        lag += elapsed;

        processInput();

        while (lag > MS_PER_UPDATE) {
            update();
            cout << "LAG: " << lag << endl;
            lag -= MS_PER_UPDATE;
        }

        cout << "LAG (" << lag << ") / MS_PER_UPDATE (" << MS_PER_UPDATE << endl;
        render();
    }

    return 0;
}

#ifndef _STATEMANAGER_H_
#define _STATEMANAGER_H_

#include "State.h"

class State;

class StateManager {
    private:
        State *current_state;
    public:
        StateManager() : current_state(nullptr) {}
        void set(State *state) { current_state = state; }
        State* get() { return current_state; }
};

#endif

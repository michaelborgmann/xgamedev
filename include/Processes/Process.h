#ifndef _PROCESS_H_
#define _PROCESS_H_

#include <list>

using namespace std;

enum class ProcessState {
    UNINITIALIZED,
    REMOVED,
    RUNNING,
    PAUSED,
    FINISHED,
    FAILED,
    ABORTED
};

class Process {
    ProcessState currentState;
    Process* child;
public:
    Process() : currentState(ProcessState::UNINITIALIZED), child(nullptr) {}

    virtual void onInit() { currentState = ProcessState::RUNNING; };
    virtual void onUpdate(unsigned long deltaTime) = 0;
    virtual void onSuccess() {}
    virtual void onFail() {}
    virtual void onAbort() {}

    //void Succeed();
    //void Fail();
    //void Pause();
    //void Unpause();

    ProcessState state() { return currentState; } 

    void attach(Process *process) {
        if (child) {
            this->child->attach(child);
        } else {
            this->child = child;
        }
    }
};
/*
class DelayProcess : public Process {
    unsigned long delayTime;
    unsigned long passedTime;
public:
    DelayProcess(unsigned long delay) {
        delayTime = delay;
        passedTime = 0;
    }

    void onUpdate(unsigned long deltaTime) {
        passedTime += deltaTime;
        if (passedTime >= delayTime) {
            //Succeed();
        }
    }
};
*/

#endif

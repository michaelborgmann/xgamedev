#ifndef _PROCESSMANAGER_H_
#define _PROCESSMANAGER_H_

#include <list>
#include "Processes/Process.h"

class ProcessManager {
    list<Process*> processes;
public:
    void attach(Process *process) {
        processes.push_front(process);
    }
};

#endif

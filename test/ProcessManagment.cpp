#include <gmock/gmock.h>
#include "Processes/Process.h"
#include "Processes/ProcessManager.h"

using namespace testing;

class DelayProcess : public Process {
    unsigned long delayTime;
    unsigned long deltaTime;
public:
    DelayProcess(unsigned long delayTime) {
        this->delayTime = delayTime;
        deltaTime = 0;
    }

    void onUpdate(unsigned long deltaTime) {
        this->deltaTime += deltaTime;
        if (this->deltaTime >= delayTime) {
            // succeed();
        }
    }
};

class ProcessManagement : public Test {
public:
    Process *process;
    void SetUp() override {
        process = new DelayProcess(1000);
    }
    void TearDown() override {
        delete process;
    }
};

TEST_F(ProcessManagement, AssignsStateToInitializedProcess) {
    process->onInit();
    ASSERT_THAT(process->state(), Eq(ProcessState::RUNNING));
}

TEST_F(ProcessManagement, AttachesProcessToManager) {
    ProcessManager processes;
    processes.attach(process);
}

TEST_F(ProcessManagement, CanAttachChildProcessToProcess) {
    Process *child = new DelayProcess(1000);
    process->attach(child);
    delete child;
}

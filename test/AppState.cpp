#include "States/StateManager.h"

class TestState : public State {};

#include <gmock/gmock.h>
#include <iostream>

using namespace std;
using namespace testing;

class AppState : public Test {
    public:
        StateManager state;
        State *current_state;
        void SetUp() override {
            current_state = new TestState();
        }
        void TearDown() override {
            delete current_state;           
        }
};

TEST_F(AppState, IsValid) {
    ASSERT_THAT(current_state, NotNull());
}

TEST_F(AppState, IsUniqueAndIdentifiable) {
    State *other_state = new TestState();
    EXPECT_NE(current_state->get(), other_state->get());
}

TEST_F(AppState, IsHandledWithStateManager) {
    state.set(current_state);
    ASSERT_THAT(state.get(), current_state->get());
}

TEST_F(AppState, CanBeChangedToAnotherState) {
    state.set(current_state);
    state.set(new TestState());
    EXPECT_NE(state.get(), current_state->get());
}

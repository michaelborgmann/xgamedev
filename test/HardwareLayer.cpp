#include <gmock/gmock.h>
#include "Hardware/Display.h"
#include "Hardware/Window.h"

using namespace testing;

class HardwareLayer : public Test {
    public:
        Window window;
        Display display;
        HardwareLayer() : window("Test", SDL_WINDOW_FULLSCREEN_DESKTOP) {}
};

TEST_F(HardwareLayer, CreatesWindowOfDisplaySize) {
    ASSERT_THAT(window.width(), Eq(display.width()));
    ASSERT_THAT(window.height(), Eq(display.height()));
}

TEST_F(HardwareLayer, WindowIsPostionedTopLeft) {
    ASSERT_THAT(window.xpos(), Eq(display.xpos()));
    ASSERT_THAT(window.xpos(), Eq(display.xpos()));
}

TEST_F(HardwareLayer, TogglesWindowToFullscreen) {
    EXPECT_TRUE(window.isFullscreen());
}

#include <iostream>
#include <map>
#include "Entities/EntityFactory.h"
#include "Entities/Component.h"
#include "Files/Xml.h"
#include "Files/Filesystem.h"

using namespace std;

class MockInterface : public Component {
    public:
        const string uniqueComponentID = "MockComponent";
};

class MockComponent : public MockInterface {
    public:
        string identifier() override { return uniqueComponentID; }
        void init(XmlNode *node) override {}
};

#include <gmock/gmock.h>

using namespace testing;

class EntityComponentSystem : public Test {
    public:
        Filesystem filesystem;
        EntityFactory entities;
        string filename;

        void SetUp() override {
            filename = filesystem.pathToResources() + "entity.xml";
            entities.registerComponent("MockComponent", new MockComponent());
        }

        void TearDown() override {
            SDL_ClearError();
        }
};

class AnEntity : public Test {
    public:
        Entity entity;
};

TEST_F(EntityComponentSystem, EnablesRegisteringComponents) {
    ASSERT_THAT(entities.getComponentByIdentifier("MockComponent"), NotNull());
}

TEST_F(EntityComponentSystem, CreatesEntityFromFileAndAddsAllComponents) {
    ASSERT_NO_THROW(entities.add(filename));
}

TEST_F(EntityComponentSystem, AbortsCreatingEntityOnInvalidComponents) {
    filename = filesystem.pathToResources() + "noentity.xml";
    ASSERT_THAT(entities.add(filename), IsNull());
}

TEST_F(EntityComponentSystem, AbortsCreatingEntityOnInvalidFile) {
    filename = filesystem.pathToResources() + "no file";
    ASSERT_THAT(entities.add(filename), IsNull());
}

TEST_F(EntityComponentSystem, AbortsCreatingEntityOnXmlParseFailure) {
    filename = filesystem.pathToResources() + "invalid.xml";
    ASSERT_THAT(entities.add(filename), IsNull());
}

TEST(AComponent, HasAUniqueInterfaceIdentifier) {
    MockInterface *component = new MockComponent();
    MockInterface *duplicate = new MockComponent();
    ASSERT_EQ(component->identifier(), duplicate->identifier());
}

TEST_F(AnEntity, HasUniqueIdentifier) {
    Entity duplicate;
    ASSERT_NE(entity.id(), duplicate.id());
}

TEST_F(AnEntity, CanBeAddedComponentsTo) {
    Component *component = new MockComponent();
    entity.addComponent(component);
    ASSERT_EQ(entity.componentByIdentifier("MockComponent"), component);
}

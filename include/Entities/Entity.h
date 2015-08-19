#ifndef _ENTITY_H_
#define _ENTITY_H_

#include <map>
#include <string>
#include "Component.h"

using namespace std;

class Entity {
    private:
        static unsigned int entities;
        unsigned int identifier;
        map<string, Component*> components;
    public:
        Entity() : identifier(entities++) {}

        void addComponent(Component *component) {
            components.insert(pair<string, Component*>(component->identifier(), component));
        }

        unsigned int id() {
            return identifier;
        }

        Component* componentByIdentifier(string componentID) {
            return components.find(componentID)->second;
        }
};

unsigned int Entity::entities = 0;

#endif

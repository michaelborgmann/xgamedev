#ifndef _ENTITYFACTORY_H_
#define _ENTITYFACTORY_H_

#include <iostream>
#include <map>
#include "Entity.h"
#include "Component.h"
#include "Files/Xml.h"

using namespace std;

class EntityFactory {
    Xml xmldoc;
    Entity *entity;
    map<string, Component*> factoryMethods;

public:
    void registerComponent(string identifier, Component* component) {
        factoryMethods[identifier] = component;
    }

    Component* getComponentByIdentifier(string identifier) {
        return factoryMethods.find(identifier)->second;
    }

    Entity* add(string filename) {
        try {
            createEntityFromFile(filename);
        } catch (FileError &e) {
            resetEntity();
        } catch (XmlError &e) {
            resetEntity();
        } catch (EntityError &e) {
            resetEntity();
        }
        return entity;
    }

private:
    void createEntityFromFile(string filename) {
        xmldoc.load(filename);
        entity = new Entity();
        XmlNode *node = xmldoc.node();
        for (node = node->first_node(); node; node = node->next_sibling()) {
            Component *component = createComponent(node);
            entity->addComponent(component);
            //component->belongsTo(entity);     /* FIXME: is this really neccessary?
        }
    }

    Component* createComponent(XmlNode *node) {
        Component *component = nullptr;
        auto factoryMethod = factoryMethods.find(node->name());
        if (factoryMethod != factoryMethods.end()) {
            component  = factoryMethod->second;
            component->init(node);
        } else {
            throw EntityError("Couldn't find component");
        }
        return component;
    }

    void resetEntity() {
        delete entity;
        entity = nullptr;
    }
};

#endif

#ifndef _COMPONENT_H_
#define _COMPONENT_H_

#include <string>
#include "Files/Xml.h"

using namespace std;

class Component {
    public:
        virtual string identifier() = 0;
        virtual void init(XmlNode *node) = 0;
};

#endif

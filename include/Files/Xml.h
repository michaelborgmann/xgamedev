#ifndef _XML_H_
#define _XML_H_

#include <rapidxml.hpp>
#include "Errors.h"
#include "FileIO.h"

using namespace std;

typedef rapidxml::xml_node<> XmlNode;
typedef rapidxml::xml_document<> XmlDocument;

class Xml {
    private:
        XmlDocument doc;
        void parse(string xml);
    public:
        void load(string filename);
        XmlNode* node(XmlNode *node = nullptr);
};

#endif

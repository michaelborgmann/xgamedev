#include "Files/Xml.h"

void Xml::load(string filename) {
        FileIO file(filename);
        parse(file.read());
}

void Xml::parse(string xml) {
    try {
        doc.parse<0>(&xml[0]);
    }
    catch (rapidxml::parse_error &e) {
        throw XmlError(string("Xml parsing error: ") + e.what());
    }            
}

XmlNode* Xml::node(XmlNode *node) {
    if (!node) {
        node = &doc;
    }
    return node->first_node();
}

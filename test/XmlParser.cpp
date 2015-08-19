#include <gmock/gmock.h>
#include <cstring>
#include <fstream>
#include <sstream>
#include "Errors.h"
#include "Files/Filesystem.h"
#include "Files/Xml.h"
 
using namespace testing;

class XmlParserError : public Test {
public:
    Filesystem filesystem;
    Xml xmldoc;
    void TearDown() override {
        SDL_ClearError();
    }
};

TEST_F(XmlParserError, IsThrownWhenFileDoesntExist) {
    ASSERT_THROW(xmldoc.load("no file"), FileError);
}
 
TEST_F(XmlParserError, IsThrownWhenCannotParseFile) {
    string filename = filesystem.pathToResources() + "invalid.xml";
    ASSERT_THROW(xmldoc.load(filename), XmlError);
}
 
class XmlParser : public Test {
public:
    Filesystem filesystem;
    Xml xmldoc;
    XmlNode *root;
    string filename;
    void SetUp() override {
        filename = filesystem.pathToResources() + "test.xml";
        xmldoc.load(filename);
        root = xmldoc.node();
    }
};

TEST_F(XmlParser, FindsRootNode) {
    ASSERT_THAT(root->name(), StrEq("rootnode"));
}

TEST_F(XmlParser, FindsChildNode) {
    XmlNode *child = xmldoc.node(root);
    ASSERT_THAT(child->name(), StrEq("childnode"));
}

TEST_F(XmlParser, FindsNextSiblingOfChildNode) {
    XmlNode *child = xmldoc.node(root);
    XmlNode *sibling = child->next_sibling();
    ASSERT_THAT(sibling->name(), StrEq("sibling"));
}

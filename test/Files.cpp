#include <gmock/gmock.h>
#include <iostream>
#include "Files/Filesystem.h"
#include "Files/FileIO.h"
#include "Errors.h"

using namespace testing;

class FileAccess : public Test {
public:
    Filesystem filesystem;
    string filename;
    FileIO *file;

    void SetUp() override {
        filename = filesystem.pathToResources() + "test.xml";
        file = new FileIO(filename);
    }
    
    void TearDown() override {
        delete file;
    }
};

TEST(AppResources, FoundInFilesystem) {
    Filesystem filesystem;
    ASSERT_NO_THROW(filesystem.pathToResources());
}

TEST_F(FileAccess, ThrowsIfFileNotExist) {
    ASSERT_NO_THROW(new FileIO(filename));
}

TEST_F(FileAccess, ReadsFromBeginning) {
    ASSERT_THAT(file->read(), StartsWith("<?xml"));
}

TEST_F(FileAccess, ReadsToEnd) {
    ASSERT_THAT(file->read(), EndsWith(">\n"));
}

TEST_F(FileAccess, CanObtainFileSize) {
    int filesize = 123;
    ASSERT_THAT(file->size(), filesize);
}

TEST_F(FileAccess, CanSeekPositionInFile) {
    ASSERT_THAT(file->seek(FilePosition::end, 0), file->size());
}

TEST_F(FileAccess, ReadsFromSetPosition) {
    file->seek(FilePosition::end, -12);
    ASSERT_THAT(file->read(), StrEq("</rootnode>\n"));
}

TEST_F(FileAccess, CanReadSpecifiedNumberOfBytes) {
    
    ASSERT_THAT(file->read(5), StrEq("<?xml"));
}

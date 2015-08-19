#ifndef _ERRORS_H_
#define _ERRORS_H_

#include <string>
#include <exception>

using namespace std;

class FileError : exception {
    private:
        string error;
    public:
        FileError(const string &error) : error(error) {}
        virtual const char* what() const throw() { return error.c_str(); } 
};

class XmlError : exception {
    private:
        string error;
    public:
        XmlError(const string &error) : error(error) {}
        virtual const char* what() const throw() { return error.c_str(); } 
};

class EntityError : exception {
    private:
        string error;
    public:
        EntityError(const string &error) : error(error) {}
        virtual const char* what() const throw() { return error.c_str(); } 
};


#endif

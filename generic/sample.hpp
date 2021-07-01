#ifndef SAMPLE_HPP
#define SAMPLE_HPP

#ifdef SWIG
// SWIG directives
// Include some standard SWIG library
%include exception.i
%include typemaps.i
%include std_string.i
%{
// This goes into the wrap file. Include the declarations
#include "sample.hpp"
%}

// Convert C++ exceptions into Tcl excepions
// (instead of crashing the program)
%exception {
  try {
    $function
  } catch (const std::runtime_error &err) {
    SWIG_exception(SWIG_RuntimeError, err.what());
  } catch (...) {
    SWIG_exception(SWIG_RuntimeError, "Some C++-Error");
  }
}
#else

// C-preprocessor
#include <string>
#include <sstream>
#include <stdexcept>

#endif //!SWIG

// Class definitions etc.

class Animal {
public:
    std::string type;
    int age;
    
    Animal(std::string type, int age);
    
    int birthday();

    std::string describe();

};
#endif

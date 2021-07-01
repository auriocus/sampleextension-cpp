#include "sample.hpp"
Animal::Animal(std::string type, int age) :
    type(type), age(age) 
{
    if (age < 0) {
	throw std::runtime_error("Age cannot be negative!");
    }
}
    
int Animal::birthday() {
    return ++age;
}


std::string Animal::describe() {
    std::ostringstream description;
    description << "I am a "<<type<<" and I am "<<age<<" years old";
    return description.str();
}



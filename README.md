# sampleextension-cpp
A sample extension for Tcl using C++ and SWIG (TEA extension)

This repo is a testcase to add C++ support for the official sampleextension & tclconfig 
and should eventually be pushed upstream to tclconfig/sampleextension located here

* https://core.tcl-lang.org/sampleextension
* https://core.tcl-lang.org/tclconfig

I don't plan long-term maintenance once the porting is done (started in July 2021)

This example demonstrates a simple animal class (see `generic/sample.hpp` and `generic/sample.cpp`). 
Below is a transcript from using the library:

	(sampleextension-cpp) 49 % load ./libsample0.5.dylib
	(sampleextension-cpp) 50 % ::sample::Animal chris dog 5
	_f0c9461fdd7f0000_p_Animal
	(sampleextension-cpp) 51 % chris describe
	I am a dog and I am 5 years old
	(sampleextension-cpp) 52 % chris birthday
	6
	(sampleextension-cpp) 53 % chris birthday
	7
	(sampleextension-cpp) 53 % chris describe
	I am a dog and I am 7 years old
	(sampleextension-cpp) 54 % chris cget -type
	dog
	(sampleextension-cpp) 55 % chris cget -age
	7
	(sampleextension-cpp) 56 % chris configure -type cat
	(sampleextension-cpp) 57 % chris describe
	I am a cat and I am 7 years old
	(sampleextension-cpp) 58 % chris -delete
	(sampleextension-cpp) 59 % ::sample::Animal chris dog -3
	RuntimeError Age cannot be negative!
	(sampleextension-cpp) 60 % 

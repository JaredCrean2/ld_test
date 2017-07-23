#!/bin/bash

gcc lib1.c -fPIC -shared -o lib1.so

# write path to shared library to file (to be appended to LD_LIBRARY_PATH)

str=`pwd`
echo `pwd` >> EVARS

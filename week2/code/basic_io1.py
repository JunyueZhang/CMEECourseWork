#!/usr/bin/env python3

"""Open a file for reading, use "implicit" for loop, if the object is a file, python will cycle over lines."""
"""Same example, skip blank lines."""

__appname__ = '[application name here]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"



#############################
# FILE INPUT
#############################
# Open a file for reading
with open('../sandbox/test.txt', 'r') as f:

    # use "implicit" for loop:
    # if the object is a file, python will cycle over lines
    for line in f:
        print(line)
#Once you drop out of the with, the file is automatically closed

#Same example, skip blank lines
with open('../sandbox/test.txt', 'r') as f:
    for line in f:
        if len(line.strip())  > 0:
            print(line)



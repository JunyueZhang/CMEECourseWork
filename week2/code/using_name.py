#!/usr/bin/env python3
# Filename: using_name.py

""" This script helps to understand [__name__ == "__main__"]."""

__appname__ = '[application name here]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"

if __name__ == '__main__': # if this program is being run by itself
    print('This program is being run by itself')
else: # if not
    print('I am  being imorted from another module')
print("This module's name is: " + __name__)
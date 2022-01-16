#!/usr/bin/env python3

"""This script helps to understand sys.argv in a practical way."""

__appname__ = '[application name here]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"

import sys
print("This is the name of the script: ", sys.argv[0]) # name of the script
print("Number of arguments: ", len(sys.argv)) # number of arguments
print("The arguments are: ", str(sys.argv)) # a list of arguments

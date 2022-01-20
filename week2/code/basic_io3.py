#!/usr/bin/env python3

""" This script saves an object (even complex) for later use and loads the data again."""


__appname__ = '[basic_io3.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"




#############################
# STORING OBJECTS
#############################
# To save an object (even complex) for later use
my_dictionary = {"a key": 10, "another key": 11} # define a dictionary

import pickle

f = open('../sandbox/testp.p', 'wb') ## note the b: accept binary files
pickle.dump(my_dictionary, f) # store the object data to the file
f.close() # close the file

## Load the data again
f = open('../sandbox/testp.p', 'rb') # open the file to read
another_dictionary = pickle.load(f) # load the data from the file
f.close() # close the file

print(another_dictionary) # print out


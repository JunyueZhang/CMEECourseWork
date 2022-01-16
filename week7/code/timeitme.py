#!/usr/bin/env python3

""" This script uses the timeit module to figure out the best way to do something specific as part of a larger program (say a particular command or a loop). """

__appname__ = '[application name here]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"




##############################################################################
# loops vs. list comprehensions: which is faster?
##############################################################################

iters = 1000000 # initialize iters

## import ##
import timeit

from profileme import my_squares as my_squares_loops

from profileme2 import my_squares as my_squares_lc

##############################################################################
# loops vs. the join method for strings: which is faster?
##############################################################################

mystring = "my string" # initialize mystring

## import ##
from profileme import my_join as my_join_join

from profileme2 import my_join as my_join

#%timeit my_squares_loops(iters)
#%timeit my_squares_lc(iters)
#%timeit (my_join_join(iters, mystring))
#%timeit (my_join(iters, mystring))

import time
start = time.time() # record the start time
my_squares_loops(iters) # call my_squares_loops
print("my_squares_loops takes %f s to run." % (time.time() - start)) # print the time taken

start = time.time() # record the start time
my_squares_lc(iters) # call my_squares_lc
print("my_squares_lc takes %f s to run." % (time.time() - start)) # print the time taken
#!/usr/bin/env python3

""" This script includes several functions to show profiling the code and locating the sections of the code where speed bottlenecks exist."""

__appname__ = '[profileme.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"


# Define the function my_squares
def my_squares(iters):
    """Return a list of squared values from 0 to (iters-1)."""

    out = []
    for i in range(iters):
        out.append(i ** 2) # append the squared value
    return out

# Define the function my_join
def my_join(iters, string):
    """Return a string of the input string repeatedly for iters times."""
    out = ''
    for i in range(iters):
        out += string.join(", ") # join all the strings separated by a comma
    return out

# Define the function run_my_funcs
def run_my_funcs(x,y):
    """Call the two functions above."""
    print(x,y)
    my_squares(x) 
    my_join(x,y)
    return 0

run_my_funcs(10000000, "My string") # call the function run_my_funcs
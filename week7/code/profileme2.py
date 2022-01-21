#!/usr/bin/env python3

""" This script tries an alternative approach to write the illustrative program."""

__appname__ = '[profileme2.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"

# Define the function my_squares
def my_squares(iters):
    
    """Convert the loop to a list comprehension."""
    out = [i ** 2 for i in range(iters)] # return a list of squared values
    return out

# Define the function my_join
def my_join(iters, string):
    
    """Replace the .join with an explicit string concatenation."""
    out = '' # Initialize a string
    for i in range(iters):
        out += ", " + string # concatenate the strings explicitly
    return out

# Define the function run_my_funcs
def run_my_funcs(x, y):
    """Call the two functions above."""
    print(x, y)
    my_squares(x)
    my_join(x, y)
    return 0

run_my_funcs(10000000,"My string") # call the function run_my_funcs





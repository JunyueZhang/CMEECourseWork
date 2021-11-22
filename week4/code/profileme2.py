#!/usr/bin/env python3

""" This script tries an alternative approach to write the illustrative program."""

__appname__ = '[application name here]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"


def my_squares(iters):
    
    """Define the function my_squares."""
    out = [i ** 2 for i in range(iters)]
    return out

def my_join(iters, string):
    
    """Define the function my_join."""
    out = ''
    for i in range(iters):
        out += ", " + string
    return out

def run_my_funcs(x, y):
    """Define the function run_my_funcs."""
    print(x, y)
    my_squares(x)
    my_join(x, y)
    return 0

run_my_funcs(10000000,"My string")  





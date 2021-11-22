#!/usr/bin/env python3

""" This script includes several functions to show profiling the code and locating the sections of the code where speed bottlenecks exist."""

__appname__ = '[application name here]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"



def my_squares(iters):
    """Define the function my_squares."""

    out = []
    for i in range(iters):
        out.append(i ** 2)
    return out

def my_join(iters, string):
    """Define the function my_join."""
    out = ''
    for i in range(iters):
        out += string.join(", ")
    return out

def run_my_funcs(x,y):
    """Define the function run_my_funcs."""
    print(x,y)
    my_squares(x)
    my_join(x,y)
    return 0

run_my_funcs(10000000, "My string")
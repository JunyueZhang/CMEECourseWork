#!/usr/bin/env python3

"""This script expands the previous debugme.py example to understand how this works."""

__appname__ = '[debugme.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"


def buggyfunc(x):
    """catch specific types of errors and modify the code further."""
    y = x
    for i in range(x):
        try:
            y = y-1
            z = x/y
        except ZeroDivisionError: # catch specific types of errors
            print(f"The result of dividing a number by zero is undefined")
        except:
            print(f"This didn't work; x = {x}; y = {y}") 
        else:
            print(f"OK; x = {x}; y = {y}, z = {z};")       
    return z  

buggyfunc(20) # call the function buggyfunc
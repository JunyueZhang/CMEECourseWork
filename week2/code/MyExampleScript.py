#!/usr/bin/env python3

""" This script shows an example of writing code into a script and running it instead of pasting or sending code to the Python command prompt."""

__appname__ = '[MyExampleScript.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"


def foo(x):
    """print x squared."""
    x *= x # same as x = x*x
    print(x)

foo(2)

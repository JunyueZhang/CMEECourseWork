#!/usr/bin/env python3

""" This script shows some functions with embedded tests exemplifying the use of control statements."""
#docstrings are considered part of the running code (normal comments are
#stripped). Hence, you can access your docstrings at run time.

__appname__ = '[test_control_flow.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"


## imports ##
import sys # # module to interface our program with the operating system
import doctest


## constants ##
def even_or_odd(x=0): # if not specified, x should take value 0.
    """Find whether a number x is even or odd.
    
    >>> even_or_odd(10)
    '10 is Even!'

    >>> even_or_odd(5)
    '5 is Odd!'

    whenever  a float is provided, then the closest integer is used:
    >>> even_or_odd(3.2)
    '3 is Odd!'

    in case of negative numbers, the positive is taken:
    >>> even_or_odd(-2)
    '-2 is Even!'

    """

    # Define function to be tested
    if x % 2 == 0: # The conditional if
        return "%d is Even!" % x
    return "%d is Odd!" % x




## functions ##
def main(argv):
    """ Call the function even_or_odd. """
    print(even_or_odd(22))
    print(even_or_odd(33))
    print(even_or_odd(44))
    print(even_or_odd(55))
    return 0

if (__name__ == "__main__"):
    """Makes sure the "main" function is called from command line"""
    status = main(sys.argv)

doctest.testmod() # To run with embedded tests


    
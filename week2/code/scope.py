#!/usr/bin/env python3

"""This script shows several examples about global variables and local variables. """

__appname__ = '[scope.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"



_a_global = 10 # a global variable

if _a_global >= 5:
    _b_global = _a_global + 5 # also a global variable
    
print("Before calling a_function, outside the function, the value of _a_global is", _a_global)
print("Before calling a_function, outside the function, the value of _b_global is", _b_global)

def a_function():
    """define a_function to understand global variables and local variables."""
    _a_global = 4 # a local variable
    
    if _a_global >= 4:
        _b_global = _a_global + 5 # also a local variable
    
    _a_local = 3
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value of _b_global is", _b_global)
    print("Inside the function, the value of _a_local is", _a_local)
    
a_function() # call the a_function

print("After calling a_function, outside the function, the value of _a_global is (still)", _a_global)
print("After calling a_function, outside the function, the value of _b_global is (still)", _b_global)

#print("After calling a_function, outside the function, the value of _a_local is ", _a_local)

print("================================================================")
_a_global = 10 # a global variable

def a_function():
    """define a_function to understand global variables and local variables."""
    _a_local = 4 # a local variable
    
    print("Inside the function, the value _a_local is", _a_local)
    print("Inside the function, the value of _a_global is", _a_global)
    
a_function() # call the a_function

print("Outside the function, the value of _a_global is", _a_global)

print("================================================================")

_a_global = 10 # a global variable

print("Before calling a_function, outside the function, the value of _a_global is", _a_global)

def a_function():
    """define a_function to understand global variables and local variables."""
    global _a_global
    _a_global = 5 # a global variable
    _a_local = 4 # a local variable
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value _a_local is", _a_local)
    
a_function() # call the a_function

print("After calling a_function, outside the function, the value of _a_global now is", _a_global)
print("================================================================")
def a_function():
    """define a_function to understand global variables and local variables."""
    _a_global = 10

    def _a_function2():
        """again define a_function2 to understand global variables and local variables."""
        global _a_global # use global keyword
        _a_global = 20
    
    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2() # call the _a_function2
    
    print("After calling a_function2, value of _a_global is", _a_global)
    
a_function() # call the a_function

print("The value of a_global in main workspace / namespace now is", _a_global)
print("================================================================")
_a_global = 10 # a global variable

def a_function():
    """define a_function to understand global variables and local variables."""

    def _a_function2():
        """again define a_function2 to understand global variables and local variables."""
        global _a_global # use global keyword
        _a_global = 20
    
    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2() # call the _a_function2
    
    print("After calling a_function2, value of _a_global is", _a_global)

a_function() # call the a_function

print("The value of a_global in main workspace / namespace is", _a_global)
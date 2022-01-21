#!/usr/bin/env python3

"""This script shows some loops examples."""

__appname__ = '[loops.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"



# For loops in Python
for i in range(5): # print out 0 to 4
    print(i)

my_list = [0, 2, "geronimo", 3.0, True, False]
for k in my_list:
    print(k) # print out every item in the list

total = 0
summands = [0, 1, 11, 111, 1111]
for s in summands:
    total = total + s # calculate the sum of every item in summands
    print(total)

# WHILE loops in Python
z = 0
while z < 100: # check if z is less than 100
    z = z + 1 # increment z by 1
    print(z)


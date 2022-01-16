#!/usr/bin/env python3

""" This program includes six functions of loops and conditionals combined."""

__appname__ = '[application name here]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"




########################
def hello_1(x):
    """if a number in the sequence from 0 to x-1 is divisible by three, then print hello."""
    for j in range(x):
        if j % 3 == 0: # check if j is divisible by 3
            print('hello')
    print(' ')

hello_1(12)

########################
def hello_2(x):
    """if a number in the sequence from 0 to x-1 is divided by five or four with a remainder of three, then print hello."""
    for j in range(x):
        if j % 5 == 3: # check if j is divided by 5 with a remainder of 3
            print('hello')
        elif j % 4 == 3: # # check if j is divided by 4 with a remainder of 3
            print('hello')
    print(' ')

hello_2(12)

########################
def hello_3(x, y):
    """for a sequence from x to y-1, print hello. """
    for i in range(x, y):
        print('hello')
    print(' ')

hello_3(3, 17)

########################
def hello_4(x):
    """print hello if x is less than 15, x plus three for every iteration."""
    while x != 15: # check if x is not equal to 15
        print('hello')
        x = x + 3
    print(' ')

hello_4(0)

########################
def hello_5(x):
    """for x less than 100, print hello seven times if x equals 31 and once if x equals 18."""
    while x < 100:
        if x == 31:
            for k in range(7):
                print('hello') # print hello seven times
        elif x == 18:
            print('hello')
        x = x + 1
    print(' ')

hello_5(12)

# WHILE loop with BREAK
def hello_6(x, y):
    """while x is True, print hello! and the number y until y equals six."""
    while x: # while x is True
        print("hello! " + str(y))
        y += 1 # increment y by 1 
        if y == 6:
            break
    print(' ')

hello_6 (True, 0)
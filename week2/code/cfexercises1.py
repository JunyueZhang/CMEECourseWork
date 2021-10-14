#!/usr/bin/env python3
__author__ = 'Junyue Zhang (jz1621@ic.ac.uk)'
__version__ = '0.0.1'

import sys

def foo_1(x):
    return x ** 0.5

def foo_2(x, y):
    if x > y:
        return x
    return y

def foo_3(x, y, z):
    if x > y:
        tmp = y
        y = x
        x = tmp
    if y > z:
        tmp = z
        z = y
        y = tmp
    return [x, y, z]

def foo_4(x):
    result = 1
    for i in range(1, x + 1):
        result = result * i
    return result

def foo_5(x):
    if x == 1:
        return 1
    return x * foo_5(x - 1)

def foo_6(x):
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x -1
    return facto

def main(argv):
    print(foo_1(9))
    print(foo_1(64))
    print(foo_2(88, 66))
    print(foo_2(5, 10))
    print(foo_3(1, 2, 3))
    print(foo_3(9, 8, 7))
    print(foo_4(5))
    print(foo_4(8))
    print(foo_5(5))
    print(foo_5(8))
    print(foo_6(5))
    print(foo_6(8))
    return 0

if (__name__ == "__main__"):
    status = main(sys.argv)
    sys.exit(status)

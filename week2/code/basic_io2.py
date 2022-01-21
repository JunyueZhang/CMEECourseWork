#!/usr/bin/env python3

"""This script saves the elements of a list to a file and adds a new line at the end."""

__appname__ = '[basic_io2.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"





#####################
#FILE OUTPUT
#####################
#Save the elements of a list to a file
list_to_save = range(100)
f = open('../results/testout.txt', 'w') # open a file to write
for i in list_to_save: # for a range from 0 to 99
    f.write(str(i) + '\n') #Add a new line at the end

f.close() # close the file



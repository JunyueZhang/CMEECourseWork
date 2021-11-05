#!/usr/bin/env python3

"""Save the elements of a list to a file and add a new line at the end."""

__appname__ = '[application name here]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"





#####################
#FILE OUTPUT
#####################
#Save the elements of a list to a file
list_to_save = range(100)
f = open('../sandbox/testout.txt', 'w')
for i in list_to_save:
    f.write(str(i) + '\n') #Add a new line at the end

f.close()



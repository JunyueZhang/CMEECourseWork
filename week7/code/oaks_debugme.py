#!/usr/bin/env python3

""" This script can handle cases where there is a typo (such as ‘Quercuss’) or there is a genus name that is not strictly ‘Quercus’. """

__appname__ = '[oaks_debugme.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"


import csv
import sys
import doctest # import the doctest module

# define function is_an_oak
def is_an_oak(name):
    """ Returns True if the name is matching with 'quercus' case-insensitively. 

    >>> is_an_oak('Genus')
    False
     
    >>> is_an_oak('Fraxinus')
    False

    >>> is_an_oak('Pinus')
    False

    >>> is_an_oak('Quercuss')
    False

    >>> is_an_oak('Quercusssr')
    False

    >>> is_an_oak('Quercusdd')
    False

    >>> is_an_oak('Quercus')
    True

    """

    return (name.lower() == 'quercus')
    

def main(argv):
    """ open a csv file to check if the name is matching with 'quercus' case-insensitively and then write the output csvfile. """ 

    f = open('../data/TestOaksData.csv','r') # open a .csv file
    g = open('../data/JustOaksData.csv','w') # save a .csv file
    taxa = csv.reader(f) # return a _csv.reader object
    csvwrite = csv.writer(g) # return a _csv.writer object
    oaks = set()
    for row in taxa:
        print(row)
        print ("The genus is: ") 
        print(row[0] + '\n')
        if is_an_oak(row[0]): # check if the name is matching with 'quercus' case-insensitively.
            print('FOUND AN OAK!\n')
            csvwrite.writerow([row[0], row[1]]) # write to the csv file

    return 0
    
if (__name__ == "__main__"):
    """ Makes sure the "main" function is called from command line. """
    status = main(sys.argv)

doctest.testmod() # To run with embedded tests
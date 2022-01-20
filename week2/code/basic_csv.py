#!/usr/bin/env python3

"""This script reads a file containing 'Species','Infraorder','Family','Distribution','Body mass male (Kg)' and writes a file containing only species name and Body mass."""

__appname__ = '[basic_csv.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"



import csv

# Read a file containing:
# 'Species','Infraorder','Family','Distribution','Body mass male (Kg)'
with open('../data/testcsv.csv','r') as f: # open a file to read

    csvread = csv.reader(f) # get a reader object which will iterate over lines in the given csvfile
    temp = [] # initialize a list
    for row in csvread:
        temp.append(tuple(row)) # convert every row to a tuple and append the tuple to the list
        print(row)
        print("The species is", row[0])

# write a file containing only species name and Body mass
with open('../data/testcsv.csv','r') as f: # open a file to read
    with open('../data/bodymass.csv','w') as g: # open a file to write

        csvread = csv.reader(f) # get a reader object which will iterate over lines in the given csvfile
        csvwrite = csv.writer(g) # get a writer object responsible for converting the user’s data into delimited strings on the given file-like object
        for row in csvread:
            print(row)
            csvwrite.writerow([row[0], row[4]]) # write the first and fifth rows to the csvfile
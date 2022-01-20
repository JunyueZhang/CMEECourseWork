#!/usr/bin/env python3

"""This script uses both for loops and list comprehensions to find oak trees."""

__appname__ = '[oaks.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"




## Finds just those taxa that are oak trees from a list of species

taxa = [ 'Quercus robur',
         'Fraxinus excelsior',
         'Pinus sylvestris',
         'Quercus cerris',
         'Quercus petraea',
       ]
def is_an_oak(name):
    """Check if the tree is an oak."""
    return name.lower().startswith('quercus')

## Using for loops
oaks_loops = set() # Initialize a set
for species in taxa:
    if is_an_oak(species): # if it is an oak
        oaks_loops.add(species) # add the species name to the set
print(oaks_loops)

##Using list comprehensions 
oaks_lc = set([species for species in taxa if is_an_oak(species)])
print(oaks_lc)

##Get names in UPPER CASE using for loops
oaks_loops = set() # Initialize a set
for  species in taxa:
    if is_an_oak(species): # if it is an oak
        oaks_loops.add(species.upper()) # add the species name in upper case to the set
print(oaks_loops)

##Get names in UPPER CASE using list comprehensions
oaks_lc = set([species.upper() for species in taxa if is_an_oak(species)])
print(oaks_lc)
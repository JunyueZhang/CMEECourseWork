#!/usr/bin/env python3

""" Print a tuple of tuples of length three: latin name, common name, mass, on a separate line or output block by species."""

__author__ = 'Junyue Zhang (jz1621@ic.ac.uk)'
__version__ = '0.0.1'


birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
        )

# Birds is a tuple of tuples of length three: latin name, common name, mass.
# write a (short) script to print these on a separate line or output block by species 
# 
# A nice example output is:
# 
# Latin name: Passerculus sandwichensis
# Common name: Savannah sparrow
# Mass: 18.7
# ... etc.

# Hints: use the "print" command! You can use list comprehensions!

Latin_name = [i[0] for i in birds]
Common_name = [i[1] for i in birds]
Mass = [i[2] for i in birds]

#for i in birds:
    #Latin_name.append(i[0])
    #Common_name.append(i[1])
    #Mass.append(i[2])
    
print("Latin name: ", Latin_name)
print("Common name: ", Common_name)
print("Mass: ", Mass)
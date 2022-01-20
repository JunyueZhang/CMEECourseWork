#!/usr/bin/env python3

""" This script writes three separate list comprehensions that create three different lists containing the latin names, common names and mean body masses for each species in birds, respectively."""

__appname__ = '[lc1.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"



birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

#(1) Write three separate list comprehensions that create three different
#M lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. 

# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 

# A nice example out out is:
# Step #1:

## use three separate list comprehensions to create three different lists
Latin_names_1 = [i[0] for i in birds] 
Common_names_1 = [i[1] for i in birds]
Mean_body_masses_1 = [i[2] for i in birds]

## print
print("Latin names: ", Latin_names_1)
print("Common names: ", Common_names_1)
print("Mean body masses: ", Mean_body_masses_1)

#Step #2:

## define three empty lists
Latin_names_2 = []
Common_names_2 = []
Mean_body_masses_2 = []

for i in birds: 
    Latin_names_2.append(i[0]) # append latin names
    Common_names_2.append(i[1]) # append common names
    Mean_body_masses_2.append(i[2]) # append mean body masses

## print
print("Latin names: ", Latin_names_2)
print("Common names: ", Common_names_2)
print("Mean body masses: ", Mean_body_masses_2)
   
        

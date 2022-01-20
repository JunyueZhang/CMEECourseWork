#!/usr/bin/env python3

""" This script writes a short python script to populate a dictionary called taxa_dic derived from taxa so that it maps order names to sets of taxa."""
__appname__ = '[dictionary.py]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"


taxa = [ ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'),
        ]

# Write a short python script to populate a dictionary called taxa_dic 
# derived from  taxa so that it maps order names to sets of taxa.
# 
# An example output is:
#  
# 'Chiroptera' : set(['Myotis lucifugus']) ... etc.
#  OR,
# 'Chiroptera': {'Myotis lucifugus'} ... etc
name_taxa_list = [] # Initialize a list
for i in taxa:
    name_taxa_list.append(i[1]) # obtain a list of taxa names
taxa_dic = {} # Intialize a dictionary
name_taxa = list(set(name_taxa_list)) # create a list of unique taxa names


for i in name_taxa:
    for j in taxa:
            if i == j[1]: # if the key matches  
                taxa_dic.setdefault(i, []).append(j[0]) # append the species name to the corresponding value
                
for key in taxa_dic:
        taxa_dic[key] = set(taxa_dic[key]) ## convert the values to sets
    
print(taxa_dic) # print out




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
name_taxa_list = []
for i in taxa:
    name_taxa_list.append(i[1])
dic = {}
name_taxa = list(set(name_taxa_list))
#print(name_taxa)

for i in name_taxa:
    for j in taxa:
            if i == j[1]:
                    dic.setdefault(i, []).append(j[0])
                    #dic[i] = j[0]
for key in dic:
        dic[key] = set(dic[key])
    
print(dic)




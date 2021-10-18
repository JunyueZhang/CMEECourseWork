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

Latin_names_1 = [i[0] for i in birds]
Common_names_1 = [i[1] for i in birds]
Mean_body_masses_1 = [i[2] for i in birds]

print("Latin names: ", Latin_names_1)
print("Common names: ", Common_names_1)
print("Mean body masses: ", Mean_body_masses_1)

#Step #2:

Latin_names_2 = []
Common_names_2 = []
Mean_body_masses_2 = []

for i in birds:
    Latin_names_2.append(i[0])
    Common_names_2.append(i[1])
    Mean_body_masses_2.append(i[2])

print("Latin names: ", Latin_names_2)
print("Common names: ", Common_names_2)
print("Mean body masses: ", Mean_body_masses_2)
   
        

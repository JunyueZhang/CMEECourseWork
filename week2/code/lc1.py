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
Latin_names = ['Passerculus sandwichensis', 'Delichon urbica', 'Junco phaeonotus', 'Junco hyemalis', 'Tachycineata bicolor']
Common_names = ['Savannah sparrow', 'House martin', 'Yellow-eyed junco', 'Dark-eyed junco', 'Tree swallow']
Mean_body_masses = [18.7, 19, 19.5, 19.6, 20.2]
print(Latin_names)
print(Common_names)
print(Mean_body_masses)


#Step #2:
Latin_names = []
Common_names = []
Mean_body_masses = []

for i in birds:
    Latin_names.append(i[0])
    Common_names.append(i[1])
    Mean_body_masses.append(i[2])
   

print(Latin_names)
print(Common_names)
print(Mean_body_masses)        

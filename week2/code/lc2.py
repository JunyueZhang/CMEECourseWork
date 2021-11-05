#!/usr/bin/env python3

""" Create a list of month, rainfall tuples where the amount of rain was greater than 100 mm. """
""" Create a list of just month names where the amount of rain was less than 50 mm. """

__appname__ = '[application name here]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"


# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.
 
# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 

# A good example output is:
#
# Step #1:
# Months and rainfall values when the amount of rain was greater than 100mm:
AnswerOne = [i for i in rainfall if i[1] > 100]
print(AnswerOne)

# Step #2:
# Just month names where the amount of rain was less than 50 mm:
AnswerTwo = [i[0] for i in rainfall if i[1] < 50]
print(AnswerTwo)

# Step #3:
Greater_than_100_3 = []
Less_than_50_3 = []

for i in rainfall:
    if i[1] > 100:
        Greater_than_100_3.append(i) # Months and rainfall values when the amount of rain was greater than 100mm.

for i in rainfall:
    if i[1] < 50:
        Less_than_50_3.append(i[0]) # Just month names where the amount of rain was less than 50 mm.

print(Greater_than_100_3)
print(Less_than_50_3)

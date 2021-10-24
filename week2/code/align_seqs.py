#!/usr/bin/env python3

"""Convert align_seqs.py to a Python program that takes the DNA sequences as an input from a single external file and saves the best alignment along with its corresponding score in a single text file."""

__author__ = 'Junyue Zhang (jz1621@ic.ac.uk)'
__version__ = '0.0.1'


## imports ##
import sys # module to interface our program with the operating system
import csv # import csv module

with open("../data/align_seqs.csv", "r", encoding = "UTF-8") as f:  ## take the DNA sequences as an input from a single .csv file 
    reader = csv.reader(f) ## return a _csv.reader object
    content = list(reader) ## convert to list for easy use
    
seq2 = "".join(content[0]) ## convert the first list to string
seq1 = "".join(content[1]) ## convert the second list to string



# Two example sequences to match

# Assign the longer sequence s1, and the shorter to s2
# l1 is length of the longest, l2 that of the shortest

l1 = len(seq1)
l2 = len(seq2)
if l1 >= l2:
    s1 = seq1
    s2 = seq2
else:
    s1 = seq2
    s2 = seq1
    l1, l2 = l2, l1 # swap the two lengths

# A function that computes a score by returning the number of matches starting
# from arbitrary startpoint (chosen by user)

def calculate_score(s1, s2, l1, l2, startpoint):
    """count the “score” as total of number of bases matched"""
    matched = "" # to hold string displaying alignements
    score = 0
    for i in range(l2):
        if (i + startpoint) < l1:
            if s1[i + startpoint] == s2[i]: # if the bases match
                matched = matched + "*"
                score = score + 1
            else:
                matched = matched + "-"

    # some formatted output
    print("." * startpoint + matched)           
    print("." * startpoint + s2)
    print(s1)
    print(score) 
    print(" ")

    return score

# Test the function with some example starting points:
# calculate_score(s1, s2, l1, l2, 0)
# calculate_score(s1, s2, l1, l2, 1)
# calculate_score(s1, s2, l1, l2, 5)

# now try to find the best match (highest score) for the two sequences



def main(argv):
    """ Main entry point of the program. """
    my_best_align = None
    my_best_score = -1
    for i in range(l1): # Note that you just take the last alignment with the highest score
        z = calculate_score(s1, s2, l1, l2, i)
        if z > my_best_score:
            my_best_align = "." * i + s2 # think about what this is doing!
            my_best_score = z 
    print(my_best_align)
    print(s1)
    print ("Best score:", my_best_score)
    with open("../results/align_seqs.txt", "w") as f1: ## save the best alignment along with its corresponding score in a single text file
        f1.write(my_best_align) ## save the best alignment
        f1.write(f"\nBest score: {my_best_score}") ## save the best score
    return 0


if (__name__ == "__main__"):
    """Makes sure the "main" function is called from command line.""" 
    status = main(sys.argv)
    sys.exit(status)

    

#!/bin/bash
# Author: Junyue jz1621@imperial.ac.uk
# Script: tabtocsv.sh
# Description: substitute the tabs in the files with commas
#
# Saves the output into a .csv file
# Arguments: 1 -> tab delimited file
# Date: Oct 2021

read -p "Please input a file:" $file
if [ -f $file ]; then
    echo "Creating a comma delimited version of $file ..." 
    cat $file | tr -s "\t" "," >> $file.csv
    echo "Done"
else
    exit
fi


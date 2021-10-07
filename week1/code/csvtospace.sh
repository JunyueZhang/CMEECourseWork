#!/bin/bash
# Author: Junyue jz1621@imperial.ac.uk
# Script: csvtospace.sh
# Desc: csv to space
# Arguments: none
# Date: Oct 2021

read -p "Please enter the filename: " filename
read -p "Please enter the new filename: " filename1
if [ -f ../data/$filename ]; then
    echo "File exists"
    cat ../data/$filename | tr -s "," " " > ../data/$filename1.txt
    echo "$filename1 is saved"
else
  echo "Sorry, the file wasn't found"
fi

#!/bin/bash

echo "Please enter the correct script name."

if [ ! -f "$1" ]; then
    echo "Sorry, the file $1 doesn't exist, please check!"
    exit 0  
else
    echo "File $1 exists, let's continue!"
    if [ ! -s "$1" ]; then
        echo "The file is null, please check."
        exit 0
    else
        echo "The file $1 is non-null, let's move on!"
        NumLines=`wc -l < $1`
        echo "The file $1 has $NumLines lines."
        echo "Well Done!"
    fi
fi


#!/bin/bash

echo "Please enter the correct script name."
echo
if [ -f $1 ]; then
    echo "$1 is a regular file, let's continue!"
    echo
    if [ -e $1 ]; then
        echo "File $1 exists."
        echo
        if [ -s $1 ]; then
            echo "The file $1 is non-null, let's move on!"
            echo
            NumLines=`wc -l < $1`
            echo "The file $1 has $NumLines lines."
            echo
            echo "Well Done!"
        else
            echo "The file is null, please check."
            exit
        fi
    else
        echo "Sorry, the file $1 doesn't exist."
        exit
    fi

else
    echo "Sorry, $1 is not a regular file, please check!"
    exit
fi
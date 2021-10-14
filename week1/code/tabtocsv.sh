#!/bin/bash
# Author: Junyue jz1621@imperial.ac.uk
# Script: tabtocsv.sh
# Description: substitute the tabs in the files with commas
#
# Saves the output into a .csv file
# Arguments: 1 -> tab delimited file
# Date: Oct 2021

echo "Please enter the correct script name."
if [ -f $1 ]; then
    echo "$1 is a regular file, let's continue!"
    if [ -e $1 ]; then
        echo "File $1 exists."
        if [ -s $1 ]; then
            echo "The file $1 is non-null, let's move on!"
            echo "Creating a comma delimited version of $1 ..." 
            path=${1%/*}
            file=${1##*/}
            filename=${file%.*}
            cat $1 | tr -s "\t" "," >> $path/$filename.csv
            echo "Well Done!"
        else
            echo "The file $1 is null, please check."
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


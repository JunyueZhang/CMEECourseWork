#!/bin/bash
# Author: Junyue jz1621@imperial.ac.uk
# Script: tabtocsv.sh
# Description: substitute the tabs in the files with commas
#
# Saves the output into a .csv file
# Arguments: 1 -> tab delimited file
# Date: Oct 2021

echo "Please enter the correct script name."
if [ ! -f "$1" ]; then # check if the file exists 
    echo "Sorry, the file $1 doesn't exist, please check!"
    exit 0
else 
    echo "File $1 exists, let's continue!"
    if [ ! -s "$1" ]; then # check if the file is null
        echo "The file $1 is null, please check."
        exit 0
    else
        echo "The file $1 is non-null, let's move on!"
        echo
        echo "Creating a comma delimited version of $1 ..." 
        path=${1%/*} ## Obtain the path
        #file=${1##*/}
        file=$0 ## Obtain the filename with extension
        filename=${file%.*} ## Obtain the filename
        cat $1 | tr -s "\t" "," >> $path/$filename.csv # substitute the tabs in the files with commas and save the output into a .csv file
        echo "Well Done!"
    fi 
fi



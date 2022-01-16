#!/bin/bash
# Author: Junyue jz1621@imperial.ac.uk
# Script: csvtospace.sh
# Desc: csv to space
# Arguments: csv files
# Date: Oct 2021

file=$1
echo "Please enter the correct script name."
if [ "${file##*.}"x = "csv"x ]; then # check if the file is a .csv file
    if [ ! -f "$file" ]; then # check if the file exists
        echo "Sorry, File $file doesn't exist, please check!"
        exit 0
    else
        echo "File $file exists, let's continue!"
        if [ ! -s "$file" ]; then # check if the file is null
            echo "The file $file is null, please check."
            exit 0
        else
            echo "The file $file is non-null, let's move on!"
            echo
            echo "Now creating a space separated version of $file ..."
            path=${file%/*}  ## Obtain the path
            FILE=${file##*/} ## Obtain the filename with extension
            filename=${FILE%.*}  ## Obtain the filename
            cat $file | tr -s "," " " > $path/$filename.txt ## Convert the csv to space separated file
            echo "Completed!"
        fi 
    fi
else
    echo "Sorry, this file is not a .csv file, please check!"
    exit 0  
fi



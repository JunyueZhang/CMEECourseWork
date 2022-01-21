#!/bin/bash
# Author: Junyue jz1621@imperial.ac.uk
# Script: tiff2png.sh
# Desc: Convert tiff to png
# Arguments: .tif file
# Date: Oct 2021


file=$1 # $1 is the first argument
echo "Please enter the correct script name."
if [ "${file##*.}"x = "tif"x ]; then # check if the file is a .tif file
    if [ ! -f "$file" ]; then # check if the file exists
        echo "Sorry, the file $file doesn't exist, please check!"
        exit 0
    else 
        echo "File $file exists, let's continue!"
        if [ ! -s "$file" ]; then
            echo "The file $file is null, please check." # check if the file is null
            exit 0
        else
            echo "The file $file is non-null, let's move on!"
            echo
            echo "Converting $file"; 
            path=${file%/*}  # Obtain the path
            FILE=${file##*/} # Obtain the filename with extension
            filename=${FILE%.*}  # Obtain the filename
            convert "$file"  "$(basename "$file" .tif).png" >> $path/$filename.png; # Convert tiff to png
            echo "Completed!"
        fi
    fi
else
    echo "This file is not .tif file, please check!"
    exit 0  
fi
  

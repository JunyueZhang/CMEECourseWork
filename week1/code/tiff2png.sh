#!/bin/bash
file=$1
echo "Please enter the correct script name."
if [ "${file##*.}"x = "tif"x ]; then
    if [ ! -f "$file" ]; then
        echo "Sorry, the file $file doesn't exist, please check!"
        exit 0
    else 
        echo "File $file exists, let's continue!"
        if [ ! -s "$file" ]; then
            echo "The file $file is null, please check."
            exit 0
        else
            echo "The file $file is non-null, let's move on!"
            echo
            echo "Converting $file"; 
            path=${file%/*}  ## Obtain the path
            FILE=${file##*/} ## Obtain the filename with extension
            filename=${FILE%.*}  ## Obtain the filename
            convert "$file"  "$(basename "$file" .tif).png" >> $path/$filename.png; 
            echo "Completed!"
        fi
    fi
else
    echo "This file is not .tif file, please check!"
    exit 0  
fi
  

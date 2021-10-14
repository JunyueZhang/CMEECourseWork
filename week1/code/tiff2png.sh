#!/bin/bash
echo "Please enter the correct script name."
if [ -d $1 ]; then
    echo "$1 is a directory, let's continue!"
    if [ -e $1 ]; then
        echo "Directory $1 exists, let's move on!" 
    else
        echo "Sorry, the directory $1 doesn't exist."
        exit
    fi
else
    echo "$1 is not a directory, please check."
    exit
fi



for f in $1/*.tif
do 
    if [ -f $f ]; then
        echo "$f is a regular file, let's continue!"
        if [ -e $f ]; then
            echo "File $f exists."
            if [ -s $f ]; then
                echo "The file $f is non-null, let's move on!"
                echo "Converting $f"; 
                path=${f%/*}  ## Obtain the path
                file=${f##*/}
                filename=${file%.*}  ## Obtain the filename
                convert "$f"  "$(basename "$f" .tif).png" > $path/$filename.png; 
                echo "Completed!"
            else
                echo "The file $f is null, please check."
                exit
            fi   
        else
            echo "Sorry, the file $f doesn't exist."
            exit
        fi
    else
        echo "$f is not a regular file, please check!"
        exit
    fi
done

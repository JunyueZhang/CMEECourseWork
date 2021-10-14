#!/bin/bash
# Author: Junyue jz1621@imperial.ac.uk
# Script: csvtospace.sh
# Desc: csv to space
# Arguments: none
# Date: Oct 2021

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
    echo "$1 is not a directory, please check!"
    exit 
fi

#for f in ../data/Temperatures/*.csv
for f in $1/*.csv
do 
    if [ -f $f ]; then
        echo "$f is a regular file, let's continue!"
        if [ -e $f ]; then
            echo "$f exists!"
            if [ -s $f ]; then
                echo "The file $f is non-null, let's move on!"
                echo "Now creating a space separated version of $f ..."
                path=${f%/*}  ## Obtain the path
                file=${f##*/}
                filename=${file%.*}  ## Obtain the filename
                cat $f | tr -s "," " " > $path/$filename.txt ## Convert the csv to space separated file
                echo "Completed!"
            else
                echo "The file $f is null, please check."
                exit
            fi  
        else
            echo "Sorry, $f doesn't exist!"
            exit
        fi
    else
        echo "Sorry, $f is not a regular file, please check!"
        exit
    fi
done

#!/bin/bash

echo "Please enter the correct script name."
echo "Please enter three files separated by space(s)."


for f in "$1" "$2" "$3"
do 
    if [ ! -f "$f" ]; then
        echo "Sorry, the file $f doesn't exist, please check!"
        exit 0
    else
        echo "File $f exists, let's continue!"
        if [ ! -s "$f" ]; then
            echo "The file $f is null, please check!"
            exit 0
        else
            echo "The file $f is non-null, let's move on!" 
        fi
    fi           
done 

cat $1 > $3
cat $2 >> $3
echo
echo "The Merged File $3 is shown below:"
cat $3
echo "Well Done!"



    
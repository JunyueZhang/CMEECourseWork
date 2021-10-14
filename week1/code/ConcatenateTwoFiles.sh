#!/bin/bash

echo "Please enter the correct script name."
echo "Please enter three files separated by space(s)."


for f in $1 $2
do 
    if [ -f $f ]; then
        echo "$f is a regular file, let's continue!"
        if [ -e $f ]; then
            echo "File $f exists."
            if [ -s $f ]; then
                echo "The file $f is non-null, let's move on!"
            else
                echo "The file $f is null, please check."
                exit
            fi
        else 
            echo "Sorry, the file $f doesn't exist."
            exit
        fi
    else
        echo "Sorry, $f is not a regular file, please check!"
        exit
    fi
done 

cat $1 > $3
cat $2 >> $3
echo "The Merged File $3 is shown below:"
cat $3
echo "Well Done!"


    
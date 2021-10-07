#!/bin/bash


read -p "Please enter file: " fileone
read -p "Please enter file again: " filetwo
if [ -f $fileone ]; then
    cat $fileone > $filethree
    cat $filetwo >> $filethree
    echo "Merged File is"
    cat $filethree
    

else 
    echo "Sorry, the file wasn't found"
    exit
fi
    
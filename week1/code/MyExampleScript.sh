#!/bin/bash


echo "Please enter the correct script name."
MSG1="Hello"
MSG2=$USER
for v in MSG1 MSG2
do
    if [ -n "$v" ]; then
        echo "The variable $v is non-null, let's move on!"
    else
        echo "The variable $v is null, please check."
        exit
    fi
done

echo "$MSG1 $MSG2"
echo "Hello $USER"
echo "Well Done!"
echo
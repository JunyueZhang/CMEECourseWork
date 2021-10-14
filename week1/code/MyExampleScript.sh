#!/bin/bash
echo "Please enter the correct script name."
msg1="Hello"
msg2=$USER
for v in msg1 msg2
do
    if [ -n "$v" ]; then
        echo "The variable $v is non-null, let's move on!"
    else
        echo "The variable $v is null, please check."
        exit
    fi
done

echo "$msg1 $msg2"
echo "Hello $USER"
echo "Well Done!"
echo
#!/bin/bash
# Author: Junyue jz1621@imperial.ac.uk
# Script: MyExampleScript.sh
# Desc: This shell script introduces the $USER (same as $USERNAME) environmental variable.
# Arguments: MSG1 MSG2
# Date: Oct 2021


echo "Please enter the correct script name."
MSG1="Hello"
MSG2=$USER
for v in MSG1 MSG2
do
    if [ ! -n "$v" ]; then # check if the variables are null
        echo "The variable $v is null, please check."
        exit
    else
        echo "The variable $v is non-null, let's move on!"   
    fi
done

## print $USER (same as $USERNAME) environmental variable ##
echo "$MSG1 $MSG2"
echo "Hello $USER"
echo "Well Done!"
echo
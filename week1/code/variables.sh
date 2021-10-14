#!/bin/bash
# Author: Junyue jz1621@imperial.ac.uk
# Script: variables.sh
# Description: Shows the use of variables
# Arguments: MyVar, a, b
# Date: Oct 2021

# Shows the use of variables
echo "Please enter the correct script name."
MyVar='some string'
if [ -n "$MyVar" ]; then
    echo "The variable is non-null, let's move on!"
else
    echo "The variable is null, please check."
    exit
fi

echo 'the current value of the variable is' $MyVar
echo 'Please enter a new string'
read MyVar
if [ -n "$MyVar" ]; then
    echo "The variable is non-null, let's move on!"
else
    echo "The variable is null, please check."
    exit
fi
echo 'the current value of the variable is' $MyVar

## Reading multiple values
echo 'Enter two numbers separated by space(s)'
read a b
for v in a b 
do
    if [ -n "$v" ]; then
        echo "The variable $v is non-null, let's move on!"
    else
        echo "The variable $v is null, please check."
        exit
    fi
done
    
echo 'you entered' $a 'and' $b '. Their sum is:'
mysum=`expr $a + $b`
echo $mysum
echo "Well Done!"
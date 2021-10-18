#!/bin/bash
# Author: Junyue jz1621@imperial.ac.uk
# Script: variables.sh
# Description: Shows the use of variables
# Arguments: MyVar, a, b
# Date: Oct 2021

# Shows the use of variables
## Illustrates the use of variables 

# Special variables

echo "This script was called with $# parameters"
echo "The script's name is $0"
echo "The arguments are $@"
echo "The first argument is $1"
echo "The second argument is $2"

# Assigned Variables; Explicit declaration:
echo "Please enter the correct script name."
MY_VAR='some string'
if [ -z "$MY_VAR" ]; then
    echo "The variable is null, please check."
    exit 0
else
    echo "The variable is non-null, let's move on!"   
fi

echo 'the current value of the variable is' $MY_VAR
echo

echo 'Please enter a new string'
read MY_VAR
echo
if [ -z "$MY_VAR" ]; then
    echo "The variable is null, please check."
    exit
else
    echo "The variable is non-null, let's move on!" 
fi
echo 'the current value of the variable is' $MY_VAR
echo

## Reading multiple values
## Assigned Variables; Reading (multiple values) from user input:
echo 'Enter two numbers separated by space(s)'
read a b
echo


if ([ -z "$a" ]) | ([ -z "$b" ]); then
    echo "The variable is null, please check!"
    exit
else
    echo "The variable is non-null, let's move on!" 
    echo 'you entered' $a 'and' $b '; Their sum is:'
    MY_SUM=$(expr $a + $b)
    echo $MY_SUM
    echo "Well Done!"
fi
    
    

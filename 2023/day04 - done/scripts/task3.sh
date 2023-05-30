#!/bin/bash

# Read user input and store it in the varible 'number1'
echo "Enter the first number: "
read number1

# Read user input and store it in the variable 'number2'
echo "Enter the second number: "
read number2

# Compare both numbers and specify if they are equal or not
if [ $number1 -eq $number2 ]
then
    echo "Both numbers are the same"
else
    echo "Both number are different"
fi

#!/bin/bash

read -p "Enter a number: " x
if (( x > 10 )); then 
    echo "Greater than 10"
elif (( x > 0 )); then 
    echo "Within the range of 0 to 10"  
else  
    echo "A non-positive number"
    
    if (( x < 0 )); then 
        echo "Less than 0"
    fi
    exit 2 # exit with status code 2 - failure
fi 
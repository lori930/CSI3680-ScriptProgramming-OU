#!/bin/bash

# 1. Greeting
echo "Hello $(whoami)! Today is $(date)"

# 2. Shows the number of arguments
echo "You supplied $# arguments:"

# 3. Print arguments one by one, and create corresponding files
for arg in "$@"; do
    echo "$arg"
    touch $arg
done

# 4. Save the output
ls > listing.txt

# 5. disk usage
df -h . >> listing.txt

# 6. prints the lines 
lines=$(wc -l < listing.txt)
echo "listing.txt has $lines lines"


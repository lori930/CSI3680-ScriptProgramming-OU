#!/bin/bash

# Define an array
message=(hello there is a sample array)

# Loop through each element
for i in "${message[@]}"; do
    echo "$i"
done

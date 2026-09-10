#!/bin/bash
message=(hello there is a sample array)

for idx in "${!message[@]}"; do
    echo "Index $idx: ${message[$idx]}"
done

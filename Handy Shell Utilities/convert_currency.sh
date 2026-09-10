#!/bin/bash
usd=25
eur=$(echo "scale=2; $usd * 0.92" | bc)
echo "$usd USD = $eur EUR"

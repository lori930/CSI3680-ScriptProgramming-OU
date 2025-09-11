usd=25
eur=$(echo "$usd * 0.92" | bc -l)
echo "$usd USD = $eur EUR"

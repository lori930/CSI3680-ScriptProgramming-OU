a=2
a=$(echo "3 * $a + 1" | bc -l)
echo $a

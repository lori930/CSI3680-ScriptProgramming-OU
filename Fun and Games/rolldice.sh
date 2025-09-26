#!/bin/bash
# rolldice -- Parse requested dice to roll and simulate those rolls.
# Examples: d6 = one 6-sided die
#           2d12 = two 12-sided dice 
#           d4 3d8 2d20 = one 4-side die, three 8-sided, and two 20-sided dice

rolldie()
{
    dice=$1
    dicecount=1
    sum=0

    # First step: break down arg into MdN

    if [ -z "$(echo $dice | grep 'd')" ] ; then 
        quantity=1
        sides=$dice
    else 
        quantity=$(echo $dice | cut -dd -f1)
        sides=$(echo $dice | cut -dd -f2)
        if [ -z "$quantity" ] ; then 
            quantity=1
        fi
        if [ -z "$sides" ] ; then
            echo "Usage: $0 MdN (M, N are positive integers), M can omit if M=1."
            exit 1
        fi
    fi

    echo "rolling $quantity $sides-sided die"

    # Now roll the dice ...
    while [ $dicecount -le $quantity ] ; do 
        roll=$(( ($RANDOM % $sides ) +1 ))
        sum=$(( $sum + $roll ))
        echo "  roll #$dicecount = $roll"
        dicecount=$(( $dicecount + 1 ))
    done 

    echo "I rolled $dice and it added up to $sum"
}

while [ $# -gt 0 ] ; do
    rolldie $1
    sumtotal=$(( $sumtotal + $sum ))
    shift 
done 

echo ""
echo "In total, all of those dice add up to $sumtotal"
exit 0
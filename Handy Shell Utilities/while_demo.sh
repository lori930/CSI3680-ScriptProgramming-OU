i=0
while (( i < 10 )); do 
    i=$((i+1))

    if [ "$i" -eq 5 ]; then 
        break 
    fi 
    echo $i 

done
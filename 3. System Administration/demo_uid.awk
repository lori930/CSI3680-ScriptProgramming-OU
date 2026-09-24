{
    if (big < $3 && $3 < 5000 )
        big = $3
}

END {
    print big + 1
}
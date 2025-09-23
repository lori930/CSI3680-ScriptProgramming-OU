#!/bin/bash
echo "original parameters=[$*]"
echo "original OPTIND=[$OPTIND]"
# custom error handling
while getopts "a:bc" opt; do
    case "$opt" in
        a)echo "saw -a with argument [$OPTARG], OPTIND=[$OPTIND]" ;; 
        b)echo "saw -b (flag); OPTIND=[$OPTIND]" ;; 
        c)echo "saw -c (flag); OPTIND=[$OPTIND]" ;;
        :) echo "error: option -$OPTARG requires an argument" >&2 ;;
        ?) echo"error: unknown option: -$OPTARG" >&2 ;; 
    esac
done
# discard all the options parsed so far
shift $(($OPTIND - 1))
echo remainning parameters=[$*]
echo "\$1=[$1]"
echo "\$2=[$2]"
#!/bin/bash
# newdf -- A friendlier version of df
awkscript="/tmp/newdf.$$"
trap "rm -f $awkscript" EXIT 
# write the awk script to the temporary file
cat << 'EOF' > $awkscript
function showunit(size) # convert a size value (in KB) into a more readable format (K, M, or G)
{
    mb = size / 1024; prettymb=(int(mb * 100)) / 100;
    gb = mb / 1024; prettygb=(int(gb * 100)) / 100;

    if ( substr(size,1,1) !~ "[0-9]" ||
        substr(size,2,1) !~ "[0-9]" ) { return size } # if the value doesn't start with digits, return it as-is
    else if ( mb < 1) { return size "K" }
    else if ( gb < 1) { return prettymb "M" }
    else                { return prettygb "G" }
}

BEGIN { # execute before processing any input lines
    printf "%-20s %10s %10s %10s %10s %-30s\n",
        "Filesystem", "Size", "Used", "Avail", "Capacity", "Mounted"  # print a formatted header with column names
}
# process input lines
!/Filesystem/ { # skip lines containing “Filesystem” (header row from df output)
    size=showunit($2); # convert values in the second column using the showunit function
    used=showunit($3);
    avail=showunit($4); 
    printf "%-20s %10s %10s %10s %10s %-30s\n",
        $1, size, used, avail, $5, $9
}
EOF
df -k | awk -f $awkscript
exit 0 # exit the script with a successful status code
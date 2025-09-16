#!/bin/bash
# diskspace.sh -- Summarizes available disk space and presents it in MB/GB

tempfile="/tmp/available.$$"           # temporary file for intermediate data
trap "rm -f $tempfile" EXIT            # clean up temp file when script exits

# Create an awk script and save it to the temp file
cat << 'EOF' > $tempfile
    { sum += $4 }                      # add values from column 4 (Available)
END {
    mb = sum / 1024                    # convert KB → MB
    gb = mb / 1024                     # convert MB → GB
    printf "%.0f MB (%.2f GB) of available disk space\n", mb, gb
}
EOF

# Run df -k and process with awk script
df -k | awk -f $tempfile

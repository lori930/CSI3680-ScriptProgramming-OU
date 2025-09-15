cat << 'EOF' > script.awk
{ sum += $2 }
END { print "Total =", sum }
EOF

awk -f script.awk grades.txt

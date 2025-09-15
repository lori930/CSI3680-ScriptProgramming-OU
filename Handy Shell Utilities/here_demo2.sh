awk -f - grades.txt << 'EOF'
{ sum += $2 }
END { print "Total =", sum }
EOF

# What does each stage do?

grep -v "^#" grades.txt |
awk '{sum += $2; count++}
     END {print "Average =", sum/count}'
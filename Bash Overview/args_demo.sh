#!/bin/bash
# run with: ./args_demo.sh mango fig "fruit salad"

echo "Script name: $0"
echo "Number of arguments: $#"
echo "All arguments (\$@): $@"
echo "All arguments (\$*): $*"
echo "Process ID (\$\$): $$"

echo
echo "Looping with \$@ (each arg separate):"
for arg in "$@"; do
  echo "[$arg]"
done

echo
echo "Looping with \$* (all args as one string):"
for arg in "$*"; do
  echo "[$arg]"
done

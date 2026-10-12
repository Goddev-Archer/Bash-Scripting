#!/bin/bash
str="$1"
for ((i=0; i<${#str}; i++)); do
    echo "Zeichen $i: ${str:$i:1}"
done
echo

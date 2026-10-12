#!/bin/bash

array=(Mo Di Ku)
# array[0]
array[2]=Mi
array[3]=Do
# array[-1]
# array[-2]
array+=(Fr Sa So)

echo ${array[*]}
echo ${array[@]}
echo ${#array[*]}
echo ${#array[i]}

neu=(${array[*]})

unset array[i]
unset array

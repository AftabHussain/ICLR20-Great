#!/bin/bash

# $1 is the name of var-misuse dataset file

line_no=0

while read p; do
  let "line_no += 1"
  sed "s/^{/{\"line_no\": $line_no, /g" <<< $p >> ${1}_linenum 
done < $1

# Above, we use <<< to redirect a string literal to sed. Also, we use double
# quotes for the sed string as we want to pass a bash variable.

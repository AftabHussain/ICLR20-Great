#!/bin/bash

# $1 is the name of var-misuse dataset file

line_no=0

# Remove forward slash from filename (so we can use it without issues with sed)
# Ref: https://unix.stackexchange.com/questions/589312/shell-replace-forward-slashes-with-backslashes
filename=$1
filename_processed="${filename/\//-}"

export IFS=

while read -r p; do
  let "line_no += 1"
  sed "s/^{/{\"line_no\": \"${filename_processed}-${line_no}\", /g" <<< "$p" >> ${1}_lineno 
  #sed "s/^{/{\"line_no\": ${line_no}, /g" <<< "$p" >> ${1}_lineno 
done < $1


# Above, we use <<< to redirect a string literal to sed. Also, we use double
# quotes for the sed string instead of single quotes as we want to pass a bash
# variable.

# Also, we use -r, IFS= , and "" around $p in order to capture special chars. Ref:
# https://stackoverflow.com/questions/11564778/bash-special-characters-lost-when-reading-file/11564954

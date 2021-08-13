#!/bin/bash

# $1 is the name of the var data set directory folder (e.g. train, dev, etc.)
# $2 is the name of the output folder (make sure output folder has the same subdirectories beforehand)

for file in $1/*; do 
  echo $file
  
  line_no=0
  
  # Remove forward slash from filename (so we can use it without issues with sed)
  # Ref: https://unix.stackexchange.com/questions/589312/shell-replace-forward-slashes-with-backslashes
  filename=$file
  filename_processed="${filename/\//-}"
  
  export IFS=
  
  while read -r p; do
    let "line_no += 1"
    sed "s/^{/{\"line_no\": \"${filename_processed}-${line_no}\", /g" <<< "$p" >> ${2}/${filename}_lineno 
    #sed "s/^{/{\"line_no\": ${line_no}, /g" <<< "$p" >> ${1}_lineno 
  done < $filename &
  
  # Above, we use <<< to redirect a string literal to sed. Also, we use double
  # quotes for the sed string instead of single quotes as we want to pass a bash
  # variable.
  
  # Also, we use -r, IFS= , and "" around $p in order to capture special chars. Ref:
  # https://stackoverflow.com/questions/11564778/bash-special-characters-lost-when-reading-file/11564954
  #./add_line_no_to_file.sh $file $2& 
done

# The & in the for loop parallelizes the whole thing.
# https://linuxconfig.org/multi-threaded-bash-scripting-process-management-at-the-command-line
# https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop/103922

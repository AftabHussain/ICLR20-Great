#!/bin/bash

# $1 is the name of the var data set directory folder (e.g. train, dev, etc.)

for file in $1/*; do 
  echo $file
  ./add_line_no_to_file.sh $file& 
done

# The & in the for loop parallelizes the whole thing.
# https://linuxconfig.org/multi-threaded-bash-scripting-process-management-at-the-command-line

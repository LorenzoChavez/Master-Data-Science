#!/usr/bin/env bash

# Find top 10 files by size in your current directory including the subdirectories. 
# Sort them by size and print the result including the size and name of the file 
# (hint: use find with –size and -exec ls –s parameters)

find ./ -exec ls -s {} + | sort -n -r -u | head


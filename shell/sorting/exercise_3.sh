#!/usr/bin/env bash

# Create a file with this command : seq 0 2 40 > 20lines2.txt
# Merge 20lines2.txt and 20lines.txt. 
# Print unique lines together with the number of occurrences inside the merged file and sort it.

cat 20lines.txt 20lines2.txt | sort -n | uniq -c > 20lines_3.txt


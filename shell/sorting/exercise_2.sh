#!/usr/bin/env bash

# Create a dummy file with this command : seq 15> 20lines.txt; seq 9 1 20 >> 20lines.txt; echo"20\n20" >> 20lines.txt
# Print unique lines with the number of repetitions sorted by the number of repetitions from highest to lowest

sort 20lines.txt | uniq -c | sort -n -r 

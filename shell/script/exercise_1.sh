#!/usr/bin/env bash

# Create a script that accepts a CSV filename as input ($1 inside your script) 
# and returns the model of the aircraft with the highest number of engines. 

FILE="$1"

cat $FILE | tail +2 | sort -nr -t "^" -k7 | head -n 1

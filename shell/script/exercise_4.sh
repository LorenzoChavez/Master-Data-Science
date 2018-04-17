#!/usr/bin/env bash

# Create a script that will return returns column names together with their column number from the csv files. 
# The first argument should be file name and the second delimiter.

DELIMITER="$2"
FILE="$1"

csvcut -d "$DELIMITER" -n $FILE

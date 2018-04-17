#!/usr/bin/env bash

# Repeat script 1, but add a second argument to accept number of a column with the number of engines. 
# If several planes have the highest number of engines, then the script will only show one of them.

FILE="$1"
COLUMN="$2"

cat $FILE | tail +2 | sort -nr -t "^" -k$COLUMN | head -n 1

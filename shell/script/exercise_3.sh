#!/usr/bin/env bash

# Create a script that accepts as input arguments the name of the CSV file, and a number (number of engines) and returns the number of aircrafts that have that number of engines.

FILE="$2"
ENGINES="$1"

csvgrep -d '^' -c nb_engines -m $ENGINES $FILE | tail -n +2 | wc -l

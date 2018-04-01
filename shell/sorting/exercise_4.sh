#!/usr/bin/env bash

# Go to ~/Data/opentraveldata Get the line with the highest number of engines from optd_aircraft.csv by using sort.

cat ~/Data/opentraveldata/optd_aircraft.csv | tail -n +2 | sort -t "^" -k7 -nr | head -1

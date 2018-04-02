#!/usr/bin/env bash

# Use grep to obtain the number of airlines with prefix “aero” in their name from optd_airlines.csv

cat ~/Data/opentraveldata/optd_aircraft.csv | cut -d "^" -f2 | grep -i -c -E "^aero"

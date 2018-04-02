#!/usr/bin/env bash

# Use grep to extract all 7x7 or 3xx (where x can be any number) airplane models from optd_aircraft.csv.

cat ~/Data/opentraveldata/optd_aircraft.csv | cut -d "^" -f3 | grep -w -E "7[0-9]7{1}|3[0-9][0-9]{1}"


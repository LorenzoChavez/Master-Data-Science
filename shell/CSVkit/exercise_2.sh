#!/usr/bin/env bash

# Extract the column manufacturer and then by using pipes, sort, uniq and wc find out how many manufacturers are in the file.

csvcut -d '^' -c manufacturer ~/Data/opentraveldata/optd_aircraft.csv | tail -n +2 | sort | uniq | wc -l

# Why does this number differ to the number reported in csvstat?
# We need to ensure to exclude the header row by using tail -n +2 to get the right stats


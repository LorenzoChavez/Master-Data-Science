#!/usr/bin/env bash

# Use csvstat to find out how many different manufactures are in the file optd_aircraft.csv

csvstat -d '^' -c manufacturer ~/Data/opentraveldata/optd_aircraft.csv

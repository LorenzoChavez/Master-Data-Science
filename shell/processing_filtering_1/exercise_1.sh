#!/usr/bin/env bash

# Change the delimiter of optd_aircraft.csv to “,”

cat ~/Data/opentraveldata/optd_aircraft.csv | tr "^" ","

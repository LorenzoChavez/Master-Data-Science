#!/usr/bin/env bash

# What are the top 5 manufacturers from optd_aircraft.csv?

csvstat -d '^' -c manufacturer ~/Data/opentraveldata/optd_aircraft.csv

# Boeing (93x); Airbus (44x); Douglas (28x); McDonnell Douglas (22x); BAe (19x)


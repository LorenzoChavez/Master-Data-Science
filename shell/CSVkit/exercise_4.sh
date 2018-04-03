#!/usr/bin/env bash

# Using csvgrep, get only the records with manufacturer equal to Airbus and save them to a file with pipe (|) delimiter.

csvgrep -d '^' -c manufacturer -m "Airbus" ~/Data/opentraveldata/optd_aircraft.csv | csvformat -d "," -D "|" > ~/Data/opentraveldata/optd_aircraft_pipe.csv


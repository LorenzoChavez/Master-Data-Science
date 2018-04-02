#!/usr/bin/env bash

# Find all files located ONLY inside subdirectories of your home directory which have been modified in last 60min

find . -mmin -60 

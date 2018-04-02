#!/usr/bin/env bash

# Get top 3 largest files per subdirectory inside ~/Data/

find ~/Data -maxdepth 1 -exec sh -c "ls -lS {} | head -4" \;

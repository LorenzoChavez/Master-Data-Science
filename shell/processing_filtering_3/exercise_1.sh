#!/usr/bin/env bash

# Replace every “line” with new line character (“\n”)

cat ~/Data/shell/Text_example.txt | sed "s/line/\n/gI" 

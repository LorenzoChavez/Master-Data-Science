#!/usr/bin/env bash

#  Print ONLY the lines that DON’T contain the “line” word

cat ~/Data/shell/Text_example.txt | sed "/line/d"

#!/usr/bin/env bash

#1.The command below will extract a list of the most used words in a .txt file

cat $2 | tr '[:upper:]' '[:lower:]' | grep -oE '\w+' | sort | uniq -c | sort -nr | head -n $1

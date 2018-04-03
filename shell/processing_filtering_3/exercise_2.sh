#!/usr/bin/env bash

# Delete lines that contain the “line” word.

cat ~/Data/shell/Text_example.txt | sed "/line/d"

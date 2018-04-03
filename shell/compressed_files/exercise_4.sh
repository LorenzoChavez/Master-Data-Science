#!/usr/bin/env bash

# (On_Time_On_Time_Performance_2015_1.zip): What are the column numbers of columns having “carrier” in the name ? (don't count!)

zcat ~/Data/us_dot/otp/On_Time_On_Time_Performance_2015_1.zip | head -1 | tr "," "\n" | grep -n -i "carrier"

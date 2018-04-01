#!/usr/bin/env bash

# Check if optd_por_public.csv has repeated white spaces (hint: use tr with wc)

cat ~/Data/opentraveldata/optd_por_public.csv | tr "\n" "/" | tr " " "\n" | sort -r | uniq -c | tail -n 1


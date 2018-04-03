#!/usr/bin/env bash

# Compress “optd_por_public.csv” with bzip2 and then extract from the compressed file all the lines starting with MAD (hint: use bzcat and grep)

bzip2 ~/Data/opentraveldata/optd_por_public.csv ; bzcat ~/Data/opentraveldata/optd_por_public.csv.bz2 | grep -E "^MAD"

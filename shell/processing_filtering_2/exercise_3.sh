#!/usr/bin/env bash

# How many optd_por_public.csv columns have “name” as part of their name? What are their numerical positions?

head -1 ~/Data/opentraveldata/optd_por_public.csv | tr "^" "\n" | grep -i -n "name"

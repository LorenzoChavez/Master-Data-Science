#!/usr/bin/env bash

# Expand previous command to grant these permissions using “ok cmd” option.

find ~ -empty ! -perm 777 -ok chmod 777 \;

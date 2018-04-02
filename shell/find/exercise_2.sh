#!/usr/bin/env bash

# Find all empty files inside subdirectories of your home directory which do NOT have read-write-execute permissions given to all users

find ~ -empty ! -perm 777 

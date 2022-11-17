#!/usr/bin/env bash

# CHeck if the first param is greater than 10
# if it was, print the name of script and PID

[ $1 -gt 10 ] && echo "$0 $$"

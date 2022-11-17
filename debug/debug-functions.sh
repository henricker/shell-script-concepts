#!/usr/bin/env bash

# --- GLOBAL VARIABLES ---
DEBUG_KEY=0
DEBUG_LEVEL=0

# --- FUNCTIONS ---
Debugger() {
    [[ $1 -le $DEBUG_LEVEL ]] && echo "DEBUG: $*"
}

Sum() {
    local a=$1 # local => to create a local variable
    local b=$2

    Debugger 1 "Sum() => params a=$a, b=$b"

    local sum=$((a + b))

    Debugger 2 "Sum() => result sum=$sum"

    echo "$sum" # echo => to return a value
}

# --- MAIN ---
case "$1" in
-d) [ $2 ] && DEBUG_LEVEL=$2 ;;
*) echo $(Sum 10 20) && exit 0 ;;
esac

Sum 10 20

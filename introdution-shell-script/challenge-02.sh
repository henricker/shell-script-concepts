#!/usr/bin/env bash

for i in $(seq 0 10); do
    [ $(($i % 2)) -eq 0 ] && echo "$i is even number"
done

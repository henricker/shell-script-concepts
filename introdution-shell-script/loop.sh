#!/usr/bin/env bash

echo "===== FOR 1"
for ((i = 0; i < 10; i++)); do
    echo $i
done

echo "===== FOR 2"
for i in $(seq 10); do
    echo $i
done

FRUTAS=("banana" "maçã" "uva")

echo "===== FOR 3"
for i in ${FRUTAS[@]}; do
    echo $i
done

echo $FRUTAS # show the first element

echo ${FRUTAS[@]} # show all elements

counter=5

while [[ $counter -gt 0 ]]; do
    echo $counter
    counter=$((counter - 1))
done

while [[ $counter -lt ${#FRUTAS[@]} ]]; do
    echo $counter
    counter=$((counter + 1))
done

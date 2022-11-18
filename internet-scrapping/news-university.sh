#!/usr/bin/env bash

# This script scrapes the news from the University (UFC QUIXADÁ) website

# VARS
RED='\033[0;31m'
GREEN='\033[0;32m'

# TESTS
[! -x "$(which curl)"] && sudo apt install curl -y

# EXECUTION
curl -s https://www.quixada.ufc.br/category/destaque/ |
    grep -Pzo '(?<=<div class="col-md-8">)[\n\s]+<h1>(?<title>.*)<\/h1>' |
    sed 's/<h1>//;s/<\/h1>//;s/&#8211;.*//;s/\s*//;s/\n//;' |
    tr '\0' ' ' |
    tail -n+2 >news.txt

while read -r line; do
    echo -e "${RED}Title: ${GREEN}$line"
done <"news.txt"

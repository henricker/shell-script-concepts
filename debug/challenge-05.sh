#!/usr/bin/env bash

#
# challenge.sh - Find users in file
#
# Site:       https://4fasters.com.br
# Author:      Henrique Vieira
# Maintenance: Henrique Vieira - henricker@email.com
#
# ------------------------------------------------------------------------ #
#  This program will print a tree with '*' character.
#
#  Exemplos:
#      $ ./challenge.sh (DEFAULT OUTPUT)
#       mariana,27
#       mariana,25
#       henrique,20
#       mateus,21
#       joao,22
#       maria,23
#       jose,24
#       marcela,25
#       marcos,26

#      $ ./challenge.sh -s
#       henrique,20
#       joao,22
#       jose,24
#       marcela,25
#       marcos,26
#       maria,23
#       mariana,25
#       mariana,27
#       mateus,21

#      $ ./challenge.sh -m
#       MARIANA,27
#       MARIANA,25
#       HENRIQUE,20
#       MATEUS,21
#       JOAO,22
#       MARIA,23
#       JOSE,24
#       MARCELA,25
#       MARCOS,26

#      $ ./challenge.sh -a 20
#       henrique,20

#      $ ./challenge.sh -n henrique
#       henrique,20

#      $ ./challenge.sh -n henrique -a 20
#       henrique,20

#      $ ./challenge.sh -n henrique -a 20 -m
#       HENRIQUE,20
# ------------------------------------------------------------------------ #
# History:
#
#   v1.0 17/11/2022, Mateus:
#      - Search for the user in the system
#      - Filter by age and name
#      - Sort the output
#      - Uppercase the output
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

# CREATE FILE TO SEARCH USERS :)
rm -rf ./users.csv
echo "mariana,27" >>./users.csv
echo "mariana,25" >>./users.csv
echo "henrique,20" >>./users.csv
echo "mateus,21" >>./users.csv
echo "joao,22" >>./users.csv
echo "maria,23" >>./users.csv
echo "jose,24" >>./users.csv
echo "marcela,25" >>./users.csv
echo "marcos,26" >>./users.csv

# GLOBAL VARIABLES

MAIN_MENU="
    $(basename $0) - [OPTIONS]

    -h - Help
    -v - Version
    -s - Order output
    -m - Uppercase output
    -a - Search for age
    -n - Search for name
"
VERSION="1.0"

ORDER_KEY=0
UPPERCASE_KEY=0
SEARCH_AGE=NULL
SEARCH_NAME=NULL

DEBUG_KEY=0
DEBUG_LEVEL=0

USERS="$(cat ./users.csv)"

BLUE='\033[34;1m'
YELLOW='\033[33;1m'
NORMAL='\033[m'

# FUNCTIONS
Debugger() {
    [ $1 -le $DEBUG_LEVEL ] && echo -e "$2DEBUG: $*${NORMAL}"
}

# TESTS
while [[ -n "$1" ]]; do
    case "$1" in
    -d)
        DEBUG_LEVEL=$2
        shift
        ;;
    -h) echo "$MAIN_MENU" && exit 0 ;;
    -v) echo "$VERSION" && exit 0 ;;
    -s) ORDER_KEY=1 ;;
    -m) UPPERCASE_KEY=1 ;;
    -a) SEARCH_AGE=$2 && shift ;;
    -n) SEARCH_NAME=$2 && shift ;;
    *) echo "Invalid option $1, use -h to see options" && exit 1 ;;
    esac
    shift
done

Debugger 1 "${BLUE}" "Params: $ORDER_KEY"
Debugger 2 "${YELLOW}" "Params: $UPPERCASE_KEY"

# set -x
[[ $SEARCH_AGE != NULL ]] && USERS=$(echo "$USERS" | grep "$SEARCH_AGE")
[[ $SEARCH_NAME != NULL ]] && USERS=$(echo "$USERS" | grep "$SEARCH_NAME")
[[ $ORDER_KEY -eq 1 ]] && USERS=$(echo "$USERS" | sort)
[[ $UPPERCASE_KEY -eq 1 ]] && USERS=$(echo "$USERS" | tr '[:lower:]' '[:upper:]')
# set +x
# OUTPUT DATA
echo "$USERS"

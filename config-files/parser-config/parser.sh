#!/usr/bin/env bash

# -- VARIABLES --
CONFIG_FILE=$1

# -- TESTS --
[[ ! -f "$CONFIG_FILE" ]] && echo "File not found" && exit 1
[[ ! -r "$CONFIG_FILE" ]] && echo "Read access denied" && exit 1

# ------------- FUNCTIONS -------------
DefineParams() {
    # local param="$(echo "$1" | cut -d = -f 1)" # awk -F: '{print $1}'
    # local value="$(echo "$1" | cut -d = -f 2)" # awk -F: '{print $2}'

    local param="$(echo "$1" | awk -F= '{print $1}')"
    local value="$(echo "$1" | awk -F= '{print $2}')"

    echo "CONF_$param=$value"
}

# ------------- EXECUTION -------------
while read -r LINE; do
    [[ "$LINE" =~ ^\#.*$ ]] && continue # [[ "$(echo $LINE | cut -c 1)" = "#" ]] && continue
    [[ ! "$LINE" ]] && continue
    DefineParams "$LINE"
done <"$CONFIG_FILE"

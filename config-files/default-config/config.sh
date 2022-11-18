#!/usr/bin/env bash

# ------------- VARIABLES -------------
CONFIG_FILE="config.cf"
MESSAGE="Mensagem de teste"
USE_COLORS=0
USE_UPPERCASE=0
GREEN="\033[0;32;1m"

# ------------- TESTS -------------
[[ ! -r "$CONFIG_FILE" ]] && echo "Read access denied" && exit 1

# ------------- FUNCTIONS -------------
DefineParams() {
    # local param="$(echo "$1" | cut -d = -f 1)" # awk -F: '{print $1}'
    # local value="$(echo "$1" | cut -d = -f 2)" # awk -F: '{print $2}'

    local param="$(echo "$1" | awk -F= '{print $1}')"
    local value="$(echo "$1" | awk -F= '{print $2}')"

    case "$param" in
    "USE_COLORS") USE_COLORS=$value ;;
    "USE_UPPERCASE") USE_UPPERCASE=$value ;;
    esac
}

# ------------- EXECUTION -------------
while read -r LINE; do
    [[ "$LINE" =~ ^\#.*$ ]] && continue # [[ "$(echo $LINE | cut -c 1)" = "#" ]] && continue
    [[ ! "$LINE" ]] && continue
    DefineParams "$LINE"
done <"$CONFIG_FILE"

[[ $USE_UPPERCASE -eq 1 ]] && MESSAGE="$(echo "$MESSAGE" | tr '[:lower:]' '[:upper:]')"
[[ $USE_COLORS -eq 1 ]] && MESSAGE="$(echo -e ${GREEN}$MESSAGE)"

echo -e "$MESSAGE"

# cut works only with lines

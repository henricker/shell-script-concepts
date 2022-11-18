#!/usr/bin/env bash
FILE_CONFIG="config.cf"
MESSAGE="Mensagem de teste"
USE_UPPERCASE=
USE_COLORS=
GREEN="\033[0;32;1m"

eval $(./parser.sh $FILE_CONFIG) # export CONF VARIABLES

[ $CONF_USE_UPPERCASE -eq 1 ] && USE_UPPERCASE=1
[ $CONF_USE_COLORS -eq 1 ] && USE_COLORS=1

[[ $USE_UPPERCASE -eq 1 ]] && MESSAGE="$(echo "$MESSAGE" | tr '[:lower:]' '[:upper:]')"
[[ $USE_COLORS -eq 1 ]] && MESSAGE="$(echo -e ${GREEN}$MESSAGE)"

echo -e "$MESSAGE"

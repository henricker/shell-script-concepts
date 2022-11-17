#!/usr/bin/env bash

VAR=""
VAR2=""

if [ "$VAR" = "$VAR2" ]; then
    echo "The variables are equal"
else
    echo "The variables are not equal"
fi

if [[ "$VAR" == "$VAR2" ]]; then
    echo "The variables are equal"
else
    echo "The variables are not equal"
fi

if test "$VAR" = "$VAR2"; then
    echo "The variables are equal"
else
    echo "The variables are not equal"
fi

[ "$VAR" = "$VAR2" ] && echo "The variables are equal" || echo "The variables are not equal"

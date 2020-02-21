#!/bin/bash

GROUP="$1"

if [ -z "${GROUP}" ]; then
    echo "group is not defined"
    exit 1
fi


arc branch -a | sort | grep -E "arcadia/users/[^/]*/$GROUP/.*"

#!/bin/sh

DESCRIPTION="$1"

if [ -z "${DESCRIPTION}" ]; then
    echo "define pull request description"
    echo "usage $0 <description>"
    exit 0
fi

arc pr create --push -m "${DESCRIPTION}"

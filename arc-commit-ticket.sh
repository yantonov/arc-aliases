#!/bin/bash

SCRIPT="$(basename "$0")"

COMMIT_MESSAGE="$1"

if [ -z "${COMMIT_MESSAGE}" ]; then
    echo "Usage ${SCRIPT} commit_message"
    exit 1
fi

BRANCH="$(arc branch | grep -o '^\* .*' | sed -E 's/^\* (.*)/\1/' | head -n 1 || echo "")"
if [ "trunk" == "$BRANCH" ]; then
    echo "You are currently at trunk. Create separate branch"
    exit 1
fi

TICKET_NUMBER=$(echo "${BRANCH}" | sed -E 's/^.*\/([A-Z0-9_-]+)/\1/' | head -n 1 || echo "")
if [ -z "${TICKET_NUMBER}" ]; then
    echo 'can not detect ticket number'
    exit 1
fi

arc commit -m "${TICKET_NUMBER}: ${COMMIT_MESSAGE}"

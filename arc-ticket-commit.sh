#!/bin/sh

SCRIPT="$(basename "$0")"

COMMIT_MESSAGE="$1"

if [ -z "${COMMIT_MESSAGE}" ]; then
    echo "Usage ${SCRIPT} commit_message"
    exit 1
fi


BRANCH="$(arc branch)"
TICKET_NUMBER=$(echo "${BRANCH}" | grep -o '^\*.*' | sed -E 's/^\* .*\/([A-Z0-9_-]+)/\1/' | head -n 1 || echo "")

if [ -z "${TICKET_NUMBER}" ]; then
    echo 'can not detect ticket number'
    exit 1
fi

arc commit -m "${TICKET_NUMBER}: ${COMMIT_MESSAGE}"

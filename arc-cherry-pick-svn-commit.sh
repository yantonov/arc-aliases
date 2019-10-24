#!/usr/bin/env bash
set -eu

SCRIPT="$(basename "$0")"

$REV="$1"

if [ -z "${REV}" ]; then
    echo "Usage ${SCRIPT} svn-revision"
    exit 1
fi

arc cherry-pick "$(arc dump svn-rev ${REV})"

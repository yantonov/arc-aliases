#!/usr/bin/env bash
set -eu

SCRIPT="$(basename "$0")"

SVN_REVISION="$1"

if [ -z "${SVN_REVISION}" ]; then
    echo "Usage ${SCRIPT} svn-revision"
    exit 1
fi

arc cherry-pick "$(arc dump svn-rev ${SVN_REVISION})"

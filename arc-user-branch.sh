#!/bin/sh

if [ -z "$1" ]; then
    echo 'define branch name'
    echo "usage: $0 <branch-name>"
    exit 0
fi

arc checkout -b users/$USER/$1

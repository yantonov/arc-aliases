#!/bin/sh

check="$(arc br)"

if [ $? -eq 0 ]; then
    echo "You are inside the arc repository, leave it before run unmount command"
    exit 1
fi

cd $ARC_ROOT

nice arc unmount arcadia/

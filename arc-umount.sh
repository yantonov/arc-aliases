#!/bin/sh

if [ -z "${ARC_ROOT}" ]; then
    echo "ARC_ROOT environment variable is not defined"
    exit 1
fi

cd $ARC_ROOT
nice arc unmount arcadia/

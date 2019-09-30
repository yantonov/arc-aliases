#!/bin/sh

if [ -z "${ARC_ROOT}" ]; then
    echo "ARC_ROOT environment variable is not defined"
    exit 1
fi

cd $ARC_ROOT
mkdir -p arcadia store
nice arc mount -m arcadia/ -S store/

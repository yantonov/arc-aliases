#!/bin/bash

GROUP="$1"

arc branches -a | sort | grep -E "^groups/.*$GROUP"

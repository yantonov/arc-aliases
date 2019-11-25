#!/bin/bash

GROUP="$1"

arc branch -a | sort | grep -E "arcadia/users/.*/$GROUP.*"

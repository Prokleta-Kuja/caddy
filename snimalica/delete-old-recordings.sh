#!/bin/bash

if ! [[ $KEEP_DAYS =~ ^[0-9]+$ ]] ; then
   echo "KEEP_DAYS not a number, can't clean recordings" >&2; exit 1
fi

find /data -type f -mtime +$KEEP_DAYS -delete
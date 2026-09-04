#!/bin/bash

echo ***Status Report***

TODAY=$(date)
echo "Today is $TODAY"

USERS=$(who | wc -l)
echo "$USERS users are currently logged in"

UPTIME=$(date ; uptime)
echo "The uptime is $UPTIME"
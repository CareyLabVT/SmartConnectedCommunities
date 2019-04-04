#!/bin/bash

GITBIN=/usr/bin/git
RETRIES=35
DELAY=1200
COUNT=1
while [ $COUNT -lt $RETRIES ]; do
  echo $(date)
  $GITBIN $*
  if [ $? -eq 0 ]; then
    RETRIES=0
    break
  fi
  let COUNT=$COUNT+1
  sleep $DELAY
done

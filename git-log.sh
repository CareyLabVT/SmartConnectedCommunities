#!/bin/bash

timestamp=$(date +"%D %T")

echo -e "\n\n-------------- $timestamp --------------" 2>&1 | tee -a /data/SCCData/daily-email/git.log

echo -e "\n\nSystem Status:\n" 2>&1 | tee -a /data/SCCData/daily-email/git.log

cd /home/scc/SCCData
git pull --all 2>&1 | tee -a /data/SCCData/daily-email/git.log
git log --pretty=format:"%ad | %an | %d | %B" --reverse --since=24.hours.ago --remotes=*-data 2>&1 | tee /data/SCCData/daily-email/git-log.log

echo -ne "\n" 2>&1 | tee -a /data/SCCData/daily-email/git-log.log

cd /home/scc/forecast/FCR_forecasts/v1.beta2
git log --pretty=format:"%ad | %an | %d | %B" --reverse --since=24.hours.ago --remotes=FCR-forecasts-v1b2 2>&1 | tee -a /data/SCCData/daily-email/git-log.log

convert label:"$(cat /data/SCCData/daily-email/git-log.log)" /home/scc/applications/git-log.png 2>&1 | tee -a /data/SCCData/daily-email/git.log

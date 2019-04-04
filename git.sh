#!/bin/bash

logfile=/data/diana-logs/git.log
datadir=/data/diana-data
logdir=/data/diana-logs

timestamp=$(date +"%D %T %Z %z")

echo -e "\n\n-------------- $timestamp --------------" &>> $logfile

echo -e "\n\nGitHub:\n" &>> $logfile

cd $datadir
/home/scc/applications/git-retry.sh pull &>> $logfile
git add .
git commit -m "$timestamp: Git Backup" &>> $logfile
/home/scc/applications/git-retry.sh push &>> $logfile &

echo -e "\n\nGateway 3 (Diana):\n" &>> $logfile

cd $logdir
/home/scc/applications/git-retry.sh pull &>> $logfile
git add .
git commit -m "$timestamp: Logs" &>> $logfile
/home/scc/applications/git-retry.sh push &>> $logfile
git add .
git commit -m "$timestamp: Logs" &>> $logfile
/home/scc/applications/git-retry.sh push &>> $logfile

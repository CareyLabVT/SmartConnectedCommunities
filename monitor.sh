#!/bin/bash

logfile=/data/diana-logs/monitor.log
datadir=/data/diana-data
logdir=/data/diana-logs

timestamp=$(date +"%D %T %Z %z")

echo -e "\n\n-------------- $timestamp --------------\n\n" &>> $logfile

uptime &>> $logfile
echo -e "\n" &>> $logfile
/sbin/ip link show enx0015ff030033 &>> $logfile
/sbin/ip link show enx0015ff025968 &>> $logfile
/sbin/ip link show ipop &>> $logfile
/sbin/ip link show enp2s0 &>> $logfile
#systemctl status watchdog.service &>> $logfile
echo -e "\n" &>> $logfile
systemctl status ipopTincan.service &>> $logfile
echo -e "\n" &>> $logfile
systemctl status ipopController.service &>> $logfile
echo -e "\n" &>> $logfile
ping -c 3 8.8.8.8 &>> $logfile
echo -e "\n" &>> $logfile
ping -c 3 192.168.10.1  &>> $logfile
echo -e "\n" &>> $logfile
ping -c 3 192.168.10.13  &>> $logfile
echo -e "\n" &>> $logfile
ping -c 3 github.com  &>> $logfile
echo -e "\n" &>> $logfile
dmesg | tail &>> $logfile

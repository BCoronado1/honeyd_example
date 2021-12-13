#!/bin/bash
echo "Waiting 2 seconds then scanning..."
ethtool -K eth0 tx off > /dev/null  2>&1
sleep 2
nmap -sV 192.168.56.101 -p 22
sleep 9999

#!/bin/bash
echo "Waiting 2 seconds then scanning..."
sleep 2
nmap -sV 192.168.56.101 -p 22,80
sleep 9999

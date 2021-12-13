#!/bin/bash
ethtool -K eth0 tx off
honeyd -d -f honeypot.conf 192.168.56.101
sleep 9999

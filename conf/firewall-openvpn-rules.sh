#!/bin/sh 
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j4 SNAT --to-source 192.168.0.255

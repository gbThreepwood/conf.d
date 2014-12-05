#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
ip addr add 192.168.1.1/24 dev eth1
ip link set eth1 up
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
iptables -A FORWARD -i eth1 -o wlan0 -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

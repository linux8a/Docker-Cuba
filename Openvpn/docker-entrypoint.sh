#!/bin/sh

mkdir -p /dev/net
mknod /dev/net/tun c 10 200

IP=$(grep '^server .*$' /etc/openvpn/server.conf | awk '{print $2}')

iptables -t nat -A POSTROUTING -s ${IP}/24 -o eth0 -j MASQUERADE

/usr/sbin/openvpn --cd /etc/openvpn --config /etc/openvpn/server.conf --script-security 2
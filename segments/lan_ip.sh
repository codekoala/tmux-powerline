#!/usr/bin/env bash
# Prints the local network IP address.
if [ "$PLATFORM" == "mac" ]; then
    nic0="en0"
    nic1="en1"
else
    nic0="br0"
    nic1="eth0"
fi
ip0=$(/sbin/ifconfig ${nic0} 2>/dev/null | grep 'inet ')
ip1=$(/sbin/ifconfig ${nic1} 2>/dev/null | grep 'inet ')

if [ -n "$ip0" ]; then
    lan_ip="$ip0"
elif [ -n "$ip1" ]; then
    lan_ip="$ip1"
fi

if [ -n "$lan_ip" ]; then
    lan_ip=$(echo "$lan_ip" | awk '{ print $2}')

    echo "L ${lan_ip}"
    exit 0
else
    exit 1
fi

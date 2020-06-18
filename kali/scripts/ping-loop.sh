#!/bin/bash

for net in $(seq 1 254);do
ping -c 1 192.168.100.$net | grep "bytes from" | cut -d " " -f4 | cut -d ":" -f 1 &
done 

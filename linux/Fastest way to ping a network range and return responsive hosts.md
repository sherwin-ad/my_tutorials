# Fastest way to ping a network range and return responsive hosts

## PING:

for ip in $(seq 1 254); do ping -c 1 10.185.0.$ip > /dev/null; [ $? -eq 0 ] && echo "10.185.0.$ip UP" || : ; done

## ARP:

for ip in $(seq 1 254); do arp -n 10.185.0.$ip | grep Address; [ $? -eq 0 ] && echo "10.185.0.$ip UP" || : ; done
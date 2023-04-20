#!/bin/bash

for users in $(cat users.txt);do echo VRFY $user | nc -nv -w 1 192.168.31.215 25 2>/dev/null |grep ^"250";done





#!/bin/bash

set -x
x=1
set +x

while (( x <= 10 ))
do 
  sleep 0.3
  echo $x
  ((x++))
done
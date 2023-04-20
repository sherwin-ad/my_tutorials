#!/bin/bash
x=1
while (( $x <= 10 )) # OR [ $x -le 10 ]
do
  echo $x
  ((x++))       # x = x + 1
  sleep .2
done  
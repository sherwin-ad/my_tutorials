#!/bin/bash

x=20

until (( $x <= 10))
do
  echo $x
  ((x--))       # x = x - 1
done  
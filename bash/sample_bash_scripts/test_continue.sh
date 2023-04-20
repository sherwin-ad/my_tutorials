#!/bin/bash

for (( x=0; x<=10; x++ ))
do
  if [ $x -eq 5 ]
  then
  continue
  fi
  echo "$x"
done  
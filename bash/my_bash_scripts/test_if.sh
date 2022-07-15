#!/bin/bash

x=10

if [ $x -eq 10 ]
then
 echo 'ok'
 fi

if (( $x == 10 ))
then
 echo 'ok'
 fi 

if (( $x < 10 ))
then
  echo $x 'is less 10'
elif (( $x > 10 ))
then
  echo $x 'is greater than 10'
else
  echo $x 'is equal 10'
fi
 
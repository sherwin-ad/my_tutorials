#!/bin/bash
 
for i in pwd ls "ls -l"
do
  echo "---$i---"
  $i
  echo
done


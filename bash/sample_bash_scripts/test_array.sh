#!/bin/bash

declare -a animals
animals=(1 2 "cat" "dog")
echo ${animals[@]}
echo ${animals[2]}
echo ${!animals[@]}
echo ${#animals[@]}

animals[2]=bird
animals[4]=frog
unset animals[1]
echo ${animals[@]}


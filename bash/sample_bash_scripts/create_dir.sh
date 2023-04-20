#!/bin/bash

echo "Enter directory name:"
read make_directory

if [ -d "/home/sherwinowen/Documents/my_tutorials/bash/my_bash_scripts/$make_directory" ]
then
  echo "Directory is already exist"
else
  `mkdir /home/sherwinowen/Documents/my_tutorials/bash/my_bash_scripts/$make_directory`
  echo "Directory is created"
fi    
#!/bin/bash

login_name=`whoami`
path=`pwd`
device_name=`uname -n`
os_version=`uname -v`

echo "My login name is: $login_name"
echo "My current directory is: $path"
echo "Device name is: $device_name"
echo "OS version: $os_version"


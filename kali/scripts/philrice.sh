#!/bin/bash

for owen in $(cat philrice.txt);do
host $owen | grep "has address" | cut -d" " -f4
done

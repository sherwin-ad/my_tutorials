#!/bin/bash

host="10.10.10.10"
username="sherwinowen"
password="password"

sshpass - p $password ssh $username@$host <<EOF

ls
touch new_file.txt
ls

EOF
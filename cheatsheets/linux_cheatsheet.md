# Linux Cheatsheet

# Basic commands

SourceURL:file://Document1

| Command                             | Description                                                  |
| ----------------------------------- | ------------------------------------------------------------ |
| pwd                                 | Show the current directory full path                         |
| ls                                  | Show the all files and directories in current path (“dir” in Windows ) |
| ls -l                               | Show detailed information like owner, mode, size, change date |
| ls -lh                              | Show size as more readable like in KB, MB, GB                |
| ls -a                               | Show hidden files                                            |
| ls -R                               | Show also sub files inside of directory                      |
| ls /home                            | Show specific path’s inside                                  |
| ls -a -l   /   ls -al               | Same result, different usage                                 |
| ls -r                               | Show files in reverse order                                  |
| ls test                             | Path in current directory                                    |
| ls /test                            | Full path from root directory                                |
|                                     |                                                              |
| cd                                  | Change Directory                                             |
| cd ..                               | Go back to upper directory                                   |
| cd ../..                            | Go back to 2 upper directory (Can be more with ../../../..)  |
| cd /home                            | Go to another directory with writing the full path           |
|                                     |                                                              |
| touch test.txt                      | Create a file                                                |
| rm test.txt                         | Remove a file                                                |
| mkdir test                          | Create a directory                                           |
| mkdir -v test                       | -v option shows details of the process                       |
| rmdir test                          | Remove a directory, if directory has no content              |
| rm -r test                          | Remove directories and their contents recursively            |
| rm                                  | Remove only all files in current directory, directory is not removed |
|                                     |                                                              |
| mv test.txt ..                      | Move file to upper directory                                 |
| mv test.txt test2.txt               | Rename the file                                              |
| mv test /home                       | Move directory with its content to another directory         |
| cp test.txt ..                      | Copy file to upper directory                                 |
| cp test.txt test2.txt               | Copy file with new name                                      |
| cp test.txt /home                   | Copy file to a directory                                     |
| cp -r test /home                    | Copy directory recursively with its content to another directory |
|                                     |                                                              |
| cat  test.txt                       | Show file content                                            |
| cat > test.txt                      | Add content to file.(Overwrite, not append, Create if no file) |
| cat 1.txt 2.txt > 3.txt             | Copy files content in order and add to a new file            |
| cat test.txt \| grep bird           | Search specific text in file                                 |
| cat test.txt \| grep "bird\|dog"    | Search multiple letters with "or - \|" sign                  |
| vim test.txt                        | Create/Modify text file                                      |
| nano test.txt                       | Create/Modify text file                                      |
|                                     |                                                              |
| more test.txt                       | Show file                                                    |
| more +2 test.txt                    | Start to show file from 2nd line                             |
| more +"/cat" test.txt               | Start to show file with a specific letter                    |
| less -p "cat" test.txt              | Find all specific letter in the file                         |
| less -N test.txt                    | Open file with line number                                   |
| echo "TEST"                         | Enter content in Terminal (Like prompt in python)            |
| echo $(( 1+1 ))                     | Calculate integers                                           |
|                                     |                                                              |
| head test.txt                       | Show first lines of text file                                |
| head -10 test.txt                   | Show first 10 lines of file                                  |
| tail test.txt                       | Show the last lines of the text file                         |
| tail -10 test.txt                   | Show last 10 lines of the file                               |
| tail -f /var/log/syslog             | Show last lines of file, Update the file instantly           |
|                                     |                                                              |
| zip -r test.zip test.txt            | Zip the file to test.zip (r - recursively)                   |
| unzip test.zip                      | Unzip zip file                                               |
| zip -r test.zip test test.txt -P 11 | Set password for zip file                                    |
| rar a test.rar test.txt             | Rar the file (a - Add files to archive)                      |
| unrar e test.rar                    | Unrar file ( e - Extract files without archived paths)       |
| rar a test1.rar test                | Archive directory with its content                           |
| rar a test1.rar test/               | Archive directory content only (Not included directory)      |
|                                     |                                                              |
| chmod                               | Change access permission to files or directories             |
| chmod +x test.txt                   | Give execute permission from all users                       |
| chmod -x test.txt                   | Remove execute permission from all users                     |
| chmod 0 test.txt                    | Remove all permission for all users                          |
| chmod 666 test.txt                  | Add read/write for all users                                 |
|                                     |                                                              |
| sudo apt-get install nano           | Install a package                                            |
| sudo apt-get install nano vim       | We can add multiple packages                                 |
| sudo apt-get remove nano            | Remove package                                               |
| sudo apt-get update                 | Update package index or list                                 |
| sudo apt-get upgrade                | Upgrade all installed packages to latest version             |
| sudo apt-get autoremove             | Remove installed packages dependencies                       |
|                                     |                                                              |
| sudo COMMAND                        | Temporarily enter root user for a specific command and exit  |
| sudo su                             | Permanently enter root user                                  |
| exit                                | Exit from current user                                       |
| su user1                            | Switch user to user1                                         |
| su                                  | Switch user to root user                                     |
| passwd                              | Change password of current user                              |
| sudo passwd user1                   | Change password for user1                                    |
|                                     |                                                              |
| sudo adduser user1                  | Add new user                                                 |
| sudo userdel user1                  | Remove user, but not delete user files                       |
| sudo userdel --r user1              | Remove user with it's all files                              |
| su user1 -c "ls"                    | Run “ls” command in user1 home directory ( -c : command)     |
| cat /etc/passwd                     | Show all users and user informations                         |
| sudo cat /etc/shadow                | Show all users and their encrypted passwords                 |
|                                     |                                                              |
| usermod -L  user1                   | Lock user - user cannot enter or use its account.            |
| sudo usermod -U user1               | Unlock user                                                  |
| sudo groupadd group1                | Create new group                                             |
| sudo usermod -G group1 user1        | Add user to group                                            |
| cat /etc/group                      | Check groups                                                 |
| sudo groupmod -n group2 group1      | Change group name from group1 to group2                      |
| sudo groupdel new_group             | Delete group                                                 |
|                                     |                                                              |
| uname -a                            | Show details of Operation System                             |
| uname -n                            | Show hostname of device                                      |
| hostname                            | Show hostname of device                                      |
| uptime                              | Show the uptime of device                                    |
| date                                | Show system date                                             |
| clear                               | Clear all in the terminal screen                             |
|                                     |                                                              |
| command --help                      | Show usage of specific command (nano --help)                 |
| info command                        | Show detailed documentation of command (info nano)           |
| whatis command                      | Show the command description (whatis nano)                   |
| whereis command                     | Show the directory of command (whereis nano)                 |
| whoami                              | Show current user                                            |
| history                             | Show the commands that run before. Can be used with "\| grep" |
| history -c                          | Delete all history commands                                  |
|                                     |                                                              |
| shutdown                            | Shutdown after 1 minute                                      |
| shutdown -c                         | Cancel shutdown task                                         |
| shutdown now                        | Shutdown immediately                                         |
| shutdown 11:00                      | Shutdown at 11:00                                            |
| shutdown +10                        | Shutdown 10 minutes later                                    |
| reboot                              | Reboot device                                                |
| halt                                | System opened, cpu ve processes will be stopped              |
| poweroff                            | Shutdown device. In addition to halt, system will be stopped |
|                                     |                                                              |
| du                                  | Show disk usage of current directory                         |
| du /etc -h                          | Show disk usage of specific directory with size type as KB, MB, GB |
| du -sh                              | Total usage of current directory                             |
| df -h                               | Show Used/Available Memory in all file systems in KB, MB, GB |
| free -m                             | Show total memory usage (-m: as MB based, -h: as KB, MB, GB based) |
|                                     |                                                              |
| top                                 | Show CPU and Memory usage of all processes                   |
| top -d 5                            | Update in every 5 seconds                                    |
| top -p PID                          | Show process with specific PID number                        |
| top -i                              | Show only active processes that changes everytime            |
| htop                                | Show CPU and Memory usage. Better view than top command      |
| ps fax                              | Show processes in terminal and system                        |
| kill PID                            | Stop process with Process ID                                 |
| kill -9 PID                         | Force to stop process                                        |
|                                     |                                                              |
| ifconfig                            | Show network information of interfaces, IP, netmask, gateway |
| ping                                | Ping IP address - continues ping                             |
| ping -c 5                           | Set ping count                                               |
| ping -s 100                         | Set ping packets size as bytes                               |
| traceroute                          | Find all hops between source and target device               |
| telnet IP_ADD                       | Make telnet connection to remote device                      |
| ssh USER@IP_ADD                     | Make SSH connection to remote device                         |
|                                     |                                                              |
| host                                | Find IP address of a website                                 |
| whois                               | Show domain information of websites                          |
| netstat                             | Show network information. Show all sockets in system.        |
| wget                                | Download file from internet                                  |
| curl -O                             | Download file from internet                                  |
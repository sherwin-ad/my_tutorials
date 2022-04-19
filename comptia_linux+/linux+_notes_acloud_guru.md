[TOC]



# Linux+

# About Linux Installations

## Componets of Linux

- Boot loader
- The kernel
- Daemons
- The shell
- Graphical Server
- Desktop Environment
- Applications

## Why use Linux?

- Free
- Stable
- Secure
- Open source
  - Free to run the program for any purpose
  - Free to study how the program works
  - Free to change how the program works
  - Free to redistribute copies

## What are distributions?

- Collection of software
- Package management system
- Helps you install, upgrade and remove software
- Keep your server up to date

## Popular distributions

- Redhat
  - CentOS
  - Fedora

* Debian
  - Ubuntu
  - Mint

* SuSE
* Gentoo
* Arch
* Slackware

# Unix Commands

## Work on the command line

### List all current environment variables

```
# env
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
SSH_CONNECTION=192.168.101.117 30227 192.168.101.121 22
LESSCLOSE=/usr/bin/lesspipe %s %s
LANG=en_US.UTF-8
DISPLAY=localhost:10.0
SSH_AUTH_SOCK=/tmp/ssh-UPnDTX1odB/agent.2297
XDG_SESSION_ID=11
USER=sherwinowen
PWD=/home/sherwinowen
HOME=/home/sherwinowen
SSH_CLIENT=192.168.101.117 30227 22
XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/snapd/desktop
SSH_TTY=/dev/pts/0
MAIL=/var/mail/sherwinowen
TERM=xterm
SHELL=/bin/bash
SHLVL=1
LOGNAME=sherwinowen
XDG_RUNTIME_DIR=/run/user/1000
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
LESSOPEN=| /usr/bin/lesspipe %s
_=/usr/bin/env
```

### Print current directory

```
# pwd
```

### Print environment variable

```
$ echo $HISTFILE
/home/sherwinowen/.bash_history
```

### List all the files 

```
$ ls -a
```

### List history 

```
$ cat .bash_
.bash_history  .bash_logout
sherwinowen@ubuntu:~$ cat .bash_history
sudo su
su
sudo apt update
sudo apt upgrade
sudo poweroff
yum update
sudo apt update
clear
env
pwd
echo $HISTFILE
ls -a
ls -la
history
```

OR 

```
$ history
    1  sudo su
    2  su
    3  sudo apt update
    4  sudo apt upgrade
    5  sudo poweroff
    6  yum update
    7  sudo apt update
    8  clear
    9  env
   10  pwd
   11  echo $HISTFILE
   12  ls -a
   13  ls -la
   14  history
   15  help set
   16  manpath
   17  env
   18  clear
   19  env
   20  echo $HISTFILE
   21  /home/sherwinowen/.bash_history
   22  cat .bash_history
   23  history --help
   24  history
   25  cat .bash_history
   26  history
```
### export
- Change environment variable temporarily

```
$ export HISTFILE=/home/guru/.test
```

### .bashrc file
- Execute commands every time you login

- .bashrc file

### set or unset 

- Set or unset values of shell options and positional parameters.

- sample disable history

```
# set

# help set
```
### man

- man - an interface to the on-line reference manuals

```
# man -k

# man man
```

### manpath

- manpath - determine search path for manual pages

```
#$ manpath
/usr/local/man:/usr/local/share/man:/usr/share/man
```

### uname

- uname - print system information

```
$ uname -a
```

## Process text streams using filters

### cut

```
$ cat file1.txt
A B C
D E F
G H I
J K L
M N O
P Q R
S T U
V W X
Y Z

$ cut -c3 file1.txt
B
E
H
K
N
Q
T
W
Z

$ cut -c3-5 file1.txt
B C
E F
H I
K L
N O
Q R
T U
W X
Z
```

```
$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd/netif:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd/resolve:/usr/sbin/nologin
syslog:x:102:106::/home/syslog:/usr/sbin/nologin
messagebus:x:103:107::/nonexistent:/usr/sbin/nologin
_apt:x:104:65534::/nonexistent:/usr/sbin/nologin
lxd:x:105:65534::/var/lib/lxd/:/bin/false
uuidd:x:106:110::/run/uuidd:/usr/sbin/nologin
dnsmasq:x:107:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
landscape:x:108:112::/var/lib/landscape:/usr/sbin/nologin
pollinate:x:109:1::/var/cache/pollinate:/bin/false
sshd:x:110:65534::/run/sshd:/usr/sbin/nologin
sherwinowen:x:1000:1000:Sherwin:/home/sherwinowen:/bin/bash

$ cut -d: -f1 /etc/passwd
root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
proxy
www-data
backup
list
irc
gnats
nobody
systemd-network
systemd-resolve
syslog
messagebus
_apt
lxd
uuidd
dnsmasq
landscape
pollinate
sshd
sherwinowen
```

### expand and unexpand

-  expand - convert tabs to spaces
- unexpand - convert spaces to tabs

```
sherwinowen@ubuntu:~$ cat file3.txt
A       B       C
D       E       F
G       H       I
J       K       L
M       N       O
P       Q       R
S       T       U
V       W       X
Y       Z
sherwinowen@ubuntu:~$ cat -vet file3.txt
A^IB^IC$
D^IE^IF$
G^IH^II$
J^IK^IL$
M^IN^IO$
P^IQ^IR$
S^IT^IU$
V^IW^IX$
Y^IZ$
sherwinowen@ubuntu:~$ expand file3.txt > file4.txt
sherwinowen@ubuntu:~$ cat -vet file4.txt
A       B       C$
D       E       F$
G       H       I$
J       K       L$
M       N       O$
P       Q       R$
S       T       U$
V       W       X$
Y       Z$
sherwinowen@ubuntu:~$ unexpand -a file4.txt > file5.txt
sherwinowen@ubuntu:~$ cat -vet file5.txt
A^IB^IC$
D^IE^IF$
G^IH^II$
J^IK^IL$
M^IN^IO$
P^IQ^IR$
S^IT^IU$
V^IW^IX$
Y^IZ$

```

### wc

- print number of lines, word, and byte counts for each file

```
sherwinowen@ubuntu:~$ wc fmt.txt
  1  46 305 fmt.txt
sherwinowen@ubuntu:~$ wc file1.txt
 9 26 52 file1.txt
sherwinowen@ubuntu:~$ wc -l file1.txt
9 file1.txt
```

### fmt

- split 1 line to multiple lines

```
sherwinowen@ubuntu:~$ wc fmt.txt
  1  46 305 fmt.txt

sherwinowen@ubuntu:~$ cat fmt.txt
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse diam enim, faucibus ut cursus vel, dictum et risus. Donec elementum, lacus in pulvinar pretium, ex risus porttitor tortor, ac faucibus leo ante sed mauris. Proin volutpat urna ut faucibus placerat. Ut dictum tristique nibh quis ornare.

sherwinowen@ubuntu:~$ fmt fmt.txt | wc
      5      46     305

sherwinowen@ubuntu:~$ fmt fmt.txt > fmt1.txt

sherwinowen@ubuntu:~$ wc fmt1.txt
  5  46 305 fmt1.txt

sherwinowen@ubuntu:~$ cat fmt1.txt
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse
diam enim, faucibus ut cursus vel, dictum et risus. Donec elementum,
lacus in pulvinar pretium, ex risus porttitor tortor, ac faucibus leo
ante sed mauris. Proin volutpat urna ut faucibus placerat. Ut dictum
tristique nibh quis ornare.
```

### head and tail

- head - output the first part of files
- tail - output the last part of files

``` 
sherwinowen@ubuntu:~$ head /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin

sherwinowen@ubuntu:~$ head -n 2 /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin

sherwinowen@ubuntu:~$ tail /etc/passwd
syslog:x:102:106::/home/syslog:/usr/sbin/nologin
messagebus:x:103:107::/nonexistent:/usr/sbin/nologin
_apt:x:104:65534::/nonexistent:/usr/sbin/nologin
lxd:x:105:65534::/var/lib/lxd/:/bin/false
uuidd:x:106:110::/run/uuidd:/usr/sbin/nologin
dnsmasq:x:107:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
landscape:x:108:112::/var/lib/landscape:/usr/sbin/nologin
pollinate:x:109:1::/var/cache/pollinate:/bin/false
sshd:x:110:65534::/run/sshd:/usr/sbin/nologin
sherwinowen:x:1000:1000:Sherwin:/home/sherwinowen:/bin/bash

sherwinowen@ubuntu:~$ tail -n 2 /etc/passwd
sshd:x:110:65534::/run/sshd:/usr/sbin/nologin
sherwinowen:x:1000:1000:Sherwin:/home/sherwinowen:/bin/bash
```



### join

- join - join lines of two files on a common field

```
sherwinowen@ubuntu:~$ cat join1.txt
1 Sydney
2 Tokyo
3 San Francisco
4 Mumbai
5 London

sherwinowen@ubuntu:~$ cat join2.txt
1 Australia
2 Japan
3 USA
4 India
5 United Kingdom
6 China
7 New Zealand

sherwinowen@ubuntu:~$ join join1.txt join2.txt
1 Sydney Australia
2 Tokyo Japan
3 San Francisco USA
4 Mumbai India
5 London United Kingdom
```



### less

- shows page by page of a file

```
$ less /etc/services
```



### nl

- nl - number lines of files

```
sherwinowen@ubuntu:~$ nl /etc/passwd
     1  root:x:0:0:root:/root:/bin/bash
     2  daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
     3  bin:x:2:2:bin:/bin:/usr/sbin/nologin
     4  sys:x:3:3:sys:/dev:/usr/sbin/nologin
     5  sync:x:4:65534:sync:/bin:/bin/sync
     6  games:x:5:60:games:/usr/games:/usr/sbin/nologin
     7  man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
     8  lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
     9  mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
    10  news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
    11  uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
    12  proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
    13  www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
    14  backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
    15  list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
    16  irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
    17  gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
    18  nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
```



### od

- dump files in octal and other formats

```
$ cat file1.txt
A B C
D E F
G H I
J K L
M N O
P Q R
S T U
V W X
Y Z

$ od file1.txt
0000000 020101 020102 005103 020104 020105 005106 020107 020110
0000020 005111 020112 020113 005114 020115 020116 005117 020120
0000040 020121 005122 020123 020124 005125 020126 020127 005130
0000060 020131 005132
0000064
```

### paste

- merge lines of files

```
$ cat join1.txt
1 Sydney
2 Tokyo
3 San Francisco
4 Mumbai
5 London

$ cat join2.txt
1 Australia
2 Japan
3 USA
4 India
5 United Kingdom
6 China
7 New Zealand

$ paste join1.txt join2.txt
1 Sydney        1 Australia
2 Tokyo 2 Japan
3 San Francisco 3 USA
4 Mumbai        4 India
5 London        5 United Kingdom
        6 China
        7 New Zealand
```

### pr

- convert text files for printing

```
$ pr /etc/passwd | less

2022-01-31 04:02                   /etc/passwd                    Page 1


root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
```

### sed

- stream editor for filtering and transforming text

```
sherwinowen@ubuntu:~$ echo day | sed -e s/day/night/
night

sherwinowen@ubuntu:~$ echo sunday | sed -e s/day/night/
sunnight
```

### sort

- sort lines of text files

```
$ sort /etc/passwd
_apt:x:104:65534::/nonexistent:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
dnsmasq:x:107:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
games:x:5:60:games:/usr/games:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
landscape:x:108:112::/var/lib/landscape:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
lxd:x:105:65534::/var/lib/lxd/:/bin/false
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
messagebus:x:103:107::/nonexistent:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
pollinate:x:109:1::/var/cache/pollinate:/bin/false
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
root:x:0:0:root:/root:/bin/bash
```

### split

- split a file into pieces

```
sherwinowen@ubuntu:~$ split /var/log/kern.log kern

sherwinowen@ubuntu:~$ ls
'002 text file zip.text file zip'   fmt.txt
 file1.txt                          join1.txt
 file2.txt                          join2.txt
 file3.txt                          kernaa
 file4.txt                          kernab
 file5.txt                         'ystem informationuname - print system information'
 fmt1.txt

sherwinowen@ubuntu:~$ wc kern*
  1000  13389  96289 kernaa
    29    456   4105 kernab
  1029  13845 100394 total

sherwinowen@ubuntu:~$ wc /var/log/kern.log
  1029  13845 100394 /var/log/kern.log
```

### tr

- translate or delete characters

```
$ echo Hello | tr -d l
Heo

$ echo Hello How are you? | tr -d H
ello ow are you?

$ cat ls.txt
total 168
-rw-rw-r-- 1 sherwinowen sherwinowen    53 Feb  1 02:35 error.txt
-rw-rw-r-- 1 sherwinowen sherwinowen 10240 Feb  1 02:01 file1.tar
-rw-r--r-- 1 sherwinowen sherwinowen    52 Apr  3  2017 file1.txt
-rw-r--r-- 1 sherwinowen sherwinowen    18 Apr  3  2017 file2.txt
-rw-r--r-- 1 sherwinowen sherwinowen    52 Apr  3  2017 file3.txt
-rw-rw-r-- 1 sherwinowen sherwinowen   154 Jan 31 23:03 file4.txt
-rw-rw-r-- 1 sherwinowen sherwinowen    52 Jan 31 23:05 file5.txt
-rw-rw-r-- 1 sherwinowen sherwinowen   215 Feb  1 01:56 file.tar.gz
-rw-rw-r-- 1 sherwinowen sherwinowen   305 Jan 31 23:25 fmt1.txt
-rw-r--r-- 1 sherwinowen sherwinowen   305 Apr  3  2017 fmt.txt
-rw-rw-r-- 1 sherwinowen sherwinowen    36 Feb  1 02:40 input.txt
-rw-r--r-- 1 sherwinowen sherwinowen    51 Apr  3  2017 join1.txt
-rw-r--r-- 1 sherwinowen sherwinowen    73 Apr  3  2017 join2.txt
-rw-rw-r-- 1 sherwinowen sherwinowen 96289 Feb  1 00:02 kernaa
-rw-rw-r-- 1 sherwinowen sherwinowen  4105 Feb  1 00:02 kernab
-rw-rw-r-- 1 sherwinowen sherwinowen     0 Feb  1 02:51 ls.txt
-rw-rw-r-- 1 sherwinowen sherwinowen    18 Feb  1 00:11 uniq.txt

# deletes spaces and replce it with single space (squeeze)
$ tr -s ' ' < ls.txt > output.txt

$ cat output.txt
total 168
-rw-rw-r-- 1 sherwinowen sherwinowen 53 Feb 1 02:35 error.txt
-rw-rw-r-- 1 sherwinowen sherwinowen 10240 Feb 1 02:01 file1.tar
-rw-r--r-- 1 sherwinowen sherwinowen 52 Apr 3 2017 file1.txt
-rw-r--r-- 1 sherwinowen sherwinowen 18 Apr 3 2017 file2.txt
-rw-r--r-- 1 sherwinowen sherwinowen 52 Apr 3 2017 file3.txt
-rw-rw-r-- 1 sherwinowen sherwinowen 154 Jan 31 23:03 file4.txt
-rw-rw-r-- 1 sherwinowen sherwinowen 52 Jan 31 23:05 file5.txt
-rw-rw-r-- 1 sherwinowen sherwinowen 215 Feb 1 01:56 file.tar.gz
-rw-rw-r-- 1 sherwinowen sherwinowen 305 Jan 31 23:25 fmt1.txt
-rw-r--r-- 1 sherwinowen sherwinowen 305 Apr 3 2017 fmt.txt
-rw-rw-r-- 1 sherwinowen sherwinowen 36 Feb 1 02:40 input.txt
-rw-r--r-- 1 sherwinowen sherwinowen 51 Apr 3 2017 join1.txt
-rw-r--r-- 1 sherwinowen sherwinowen 73 Apr 3 2017 join2.txt
-rw-rw-r-- 1 sherwinowen sherwinowen 96289 Feb 1 00:02 kernaa
-rw-rw-r-- 1 sherwinowen sherwinowen 4105 Feb 1 00:02 kernab
-rw-rw-r-- 1 sherwinowen sherwinowen 0 Feb 1 02:51 ls.txt
-rw-rw-r-- 1 sherwinowen sherwinowen 18 Feb 1 00:11 uniq.txt

```

### uniq

- report or omit repeated lines

```
$ cat uniq.txt
1
2
3
4
1
1
5
6
2
$ uniq uniq.txt
1
2
3
4
1
5
6
2
$ sort uniq.txt
1
1
1
2
2
3
4
5
6
$ sort uniq.txt | uniq
1
2
3
4
5
6
```

## Perform basic file management

 ### home directory - tilde (~)

```
sherwinowen@ubuntu:~$ ls ~/
'002 text file zip.text file zip'   fmt.txt
 file1.txt                          join1.txt
 file2.txt                          join2.txt
 file3.txt                          kernaa
 file4.txt                          kernab
 file5.txt                          uniq.txt
 fmt1.txt                          'ystem informationuname - print system information'
$ ls ~sherwinowen/
'002 text file zip.text file zip'   fmt.txt
 file1.txt                          join1.txt
 file2.txt                          join2.txt
 file3.txt                          kernaa
 file4.txt                          kernab
 file5.txt                          uniq.txt
 fmt1.txt                          'ystem informationuname - print system information'
```

### file

- determine file type

```
$ file file1.txt
file1.txt: ASCII text

$ sudo file /boot/vmlinuz-4.15.0-166-generic
/boot/vmlinuz-4.15.0-166-generic: Linux kernel x86 boot executable bzImage, version 4.15.0-166-generic (buildd@lgw01-amd64-012) #174-Ubuntu SMP Wed Dec 8 19:07:44 UTC 2021, RO-rootFS, swap_dev 0x8, Normal VGA
```

### find

- search for files in a directory hierarchy

```
$ find . -name "file*"
./file4.txt
./file5.txt
./file1.txt
./file3.txt
./file2.txt

$ find /usr -size +10M
/usr/bin/snap
/usr/bin/lxc
/usr/lib/x86_64-linux-gnu/libicudata.so.60.2
/usr/lib/lxd/lxd
/usr/lib/snapd/snap-preseed
/usr/lib/snapd/snapd
/usr/lib/snapd/snap-bootstrap

$ find /usr -maxdepth 2 -size +10M
/usr/bin/snap
/usr/bin/lxc

sherwinowen@ubuntu:~$ find /var/log -mmin -60
/var/log/wtmp
/var/log/journal/9b47149296e04049841d7bb6937f4981/system.journal
/var/log/syslog
/var/log/ubuntu-advantage-timer.log
/var/log/auth.log
```

 ### tar

- an archiving utility

```
$ tar cvfz file.tar.gz file1.txt file2.txt
file1.txt
file2.txt

$ tar -tf file.tar.gz
file1.txt
file2.txt

$ tar xvfz file.tar.gz
file1.txt
file2.txt
```



### gzip and gunzip

- compress or expand files

```
$ tar cvf file1.tar file1.txt file2.txt
file1.txt
file2.txt

$ gzip file1.tar

$ ls
'002 text file zip.text file zip'   fmt1.txt
 file1.tar.gz                       fmt.txt
 file1.txt                          join1.txt
 file2.txt                          join2.txt
 file3.txt                          kernaa
 file4.txt                          kernab
 file5.txt                          uniq.txt
 file.tar.gz                       'ystem informationuname - print system information'

$ gunzip file1.tar.gz
```

### dd

- convert and copy a file

```
# Backup entire disk to disk

$ dd if=/dev/sda of=/dev/sdb bs=4096 conv=noerror,sync
97281+0 records in
97280+0 records out
99614720 bytes (100 MB) copied, 2.75838 s, 36.1 MB/s

# Creating dd disk image (file image)
$ dd if=/dev/sda of=/tmp/sdadisk.img

# Creating a compressed disk image
$ dd if=/dev/vda | gzip -c >/tmp/vdadisk.img.gz

# Backup a partition or clone one partition to another
$ dd if=/dev/sda1 of=/dev/sdb1 bs=4096 conv=noerror,sync

# Restoring a disk or a partition image
$ dd if=/tmp/sdadisk.img of=/dev/sda

# Restoring compressed image
$ gzip -dc /tmp/vdadisk.img.gz | dd of=/dev/vda

# Backing up MBR
$ dd if=/dev/sda of=/tmp/sdambr.img bs=512 count=1

# Backing up the boot data of MBR excluding the partition table
$ dd if=/dev/sda of=/tmp/sdambr2.img bs=446 count=1

# Restoring MBR from MBR image
$ dd if=/tmp/sdambr.img of=/dev/sda

# Convert the data format of a file from EBCDIC to ASCII
$ dd if=textfile.ebcdic of=textfile.ascii conv=ascii
```



## Use streams, pipes and redirects

### Standard Streams



![Diagram to help visualize the standard streams (stdin, stdout, stderr) and their file descriptors.](images\standard-streams.jpg)

| File Descriptor |      Name       | Standard Stream |
| :-------------: | :-------------: | :-------------: |
|        0        | Standard Input  |      stdin      |
|        1        | Standard Output |     stdout      |
|        2        | Standard Error  |     stderr      |



**Standard Output**

```
$ ls -l > ls.txt
sherwinowen@ubuntu:~$ cat ls.txt
total 168
-rwxr-xr-x 1 sherwinowen sherwinowen  1327 Jan 31 22:46 002 text file zip.text file zip
-rw-rw-r-- 1 sherwinowen sherwinowen 10240 Feb  1 02:01 file1.tar
-rw-r--r-- 1 sherwinowen sherwinowen    52 Apr  3  2017 file1.txt
-rw-r--r-- 1 sherwinowen sherwinowen    18 Apr  3  2017 file2.txt
-rw-r--r-- 1 sherwinowen sherwinowen    52 Apr  3  2017 file3.txt
-rw-rw-r-- 1 sherwinowen sherwinowen   154 Jan 31 23:03 file4.txt
-rw-rw-r-- 1 sherwinowen sherwinowen    52 Jan 31 23:05 file5.txt
-rw-rw-r-- 1 sherwinowen sherwinowen   215 Feb  1 01:56 file.tar.gz
-rw-rw-r-- 1 sherwinowen sherwinowen   305 Jan 31 23:25 fmt1.txt
-rw-r--r-- 1 sherwinowen sherwinowen   305 Apr  3  2017 fmt.txt
-rw-r--r-- 1 sherwinowen sherwinowen    51 Apr  3  2017 join1.txt
-rw-r--r-- 1 sherwinowen sherwinowen    73 Apr  3  2017 join2.txt
-rw-rw-r-- 1 sherwinowen sherwinowen 96289 Feb  1 00:02 kernaa
-rw-rw-r-- 1 sherwinowen sherwinowen  4105 Feb  1 00:02 kernab
-rw-rw-r-- 1 sherwinowen sherwinowen     0 Feb  1 02:34 ls.txt
-rw-rw-r-- 1 sherwinowen sherwinowen    18 Feb  1 00:11 uniq.txt
-rw-r--r-- 1 sherwinowen sherwinowen  2288 Jan 31 23:09 ystem informationuname - print system information
```

**Standard Error**

```
sherwinowen@ubuntu:~$ ls hello
ls: cannot access 'hello': No such file or directory
sherwinowen@ubuntu:~$ ls hello 2> error.txt
sherwinowen@ubuntu:~$ cat error.txt
ls: cannot access 'hello': No such file or directory
```

**Standard Input**

```
$ cat input.txt
Banana
Orange
Pear
Apple
Watermelon

$ sort < input.txt
Apple
Banana
Orange
Pear
Watermelon

$ sort << END
> Banana
> Orange
> Pear
> Apple
> Watermelon
> END
Apple
Banana
Orange
Pear
Watermelon
```

### xargs

- build and execute command lines from standard input

```
$ ls -1
error.txt
file1.tar
file1.txt
file2.txt
file3.txt
file4.txt
file5.txt
file.tar.gz
fmt1.txt
fmt.txt
input.txt
join1.txt
join2.txt
kernaa
kernab
ls.txt
output.txt
uniq.txt

$ ls -1 | xargs wc
     1      9     53 error.txt
    18     39  10240 file1.tar
     9     26     52 file1.txt
     9      9     18 file2.txt
     9     26     52 file3.txt
     9     26    154 file4.txt
     9     26     52 file5.txt
     0      2    215 file.tar.gz
     5     46    305 fmt1.txt
     1     46    305 fmt.txt
     5      5     36 input.txt
     5     11     51 join1.txt
     7     16     73 join2.txt
  1000  13389  96289 kernaa
    29    456   4105 kernab
    18    155   1121 ls.txt
    18    155   1061 output.txt
     9      9     18 uniq.txt
  1161  14451 114200 total
  
  # Find and Delete file 
  $ find / -name blah.txt | xargs rm
```

### tee

- read from standard input and write to standard output and files

```
$ ls | tee lsout.txt
error.txt
file1.tar
file1.txt
file2.txt
file3.txt
file4.txt
file5.txt
file.tar.gz
fmt1.txt
fmt.txt
input.txt
join1.txt
join2.txt
kernaa
kernab
lsout.txt
ls.txt
output.txt
uniq.txt

$ cat lsout.txt
error.txt
file1.tar
file1.txt
file2.txt
file3.txt
file4.txt
file5.txt
file.tar.gz
fmt1.txt
fmt.txt
input.txt
join1.txt
join2.txt
kernaa
kernab
lsout.txt
ls.txt
output.txt
uniq.txt
```

## Create, monitor and kill processes

### bg and fg

- bg - Move jobs to the background.
- fg - Move job to the foreground.

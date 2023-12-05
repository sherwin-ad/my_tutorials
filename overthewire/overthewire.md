# OVERTHEWIRE

https://overthewire.org/wargames/

# Bandit

## Level 0 - SSH Login.

The password for the next level is stored in a file called **readme** located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.

**Commands you may need to solve this level**

[ls](https://man7.org/linux/man-pages/man1/ls.1.html) , [cd](https://man7.org/linux/man-pages/man1/cd.1p.html) , [cat](https://man7.org/linux/man-pages/man1/cat.1.html) , [file](https://man7.org/linux/man-pages/man1/file.1.html) , [du](https://man7.org/linux/man-pages/man1/du.1.html) , [find](https://man7.org/linux/man-pages/man1/find.1.html)

```
# ssh -p 2220 bandit0@bandit.labs.overthewire.org
```



## Level 1 - Read a File.

The password for the next level is stored in a file called **-** located in the home directory

Commands you may   need to solve this level

[ls](https://man7.org/linux/man-pages/man1/ls.1.html) , [cd](https://man7.org/linux/man-pages/man1/cd.1p.html) , [cat](https://man7.org/linux/man-pages/man1/cat.1.html) , [file](https://man7.org/linux/man-pages/man1/file.1.html) , [du](https://man7.org/linux/man-pages/man1/du.1.html) , [find](https://man7.org/linux/man-pages/man1/find.1.html)

**Helpful Reading Material**

- [Google Search for “dashed filename”](https://www.google.com/search?q=dashed+filename)
- [Advanced Bash-scripting Guide - Chapter 3 - Special Characters](http://tldp.org/LDP/abs/html/special-chars.html)

```
bandit0@bandit:~$ ls -l
total 4
-rw-r----- 1 bandit1 bandit0 33 Oct  5 06:19 readme

bandit0@bandit:~$ cat readme
NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL
```

## Level 2 - Unusually named Files.

The password for the next level is stored in a file called **spaces in this filename** located in the home directory

**Commands you may need to solve this level**

[ls](https://man7.org/linux/man-pages/man1/ls.1.html) , [cd](https://man7.org/linux/man-pages/man1/cd.1p.html) , [cat](https://man7.org/linux/man-pages/man1/cat.1.html) , [file](https://man7.org/linux/man-pages/man1/file.1.html) , [du](https://man7.org/linux/man-pages/man1/du.1.html) , [find](https://man7.org/linux/man-pages/man1/find.1.html)

**Helpful Reading Material**

- [Google Search for “spaces in filename”](https://www.google.com/search?q=spaces+in+filename)

```
bandit1@bandit:~$ ls -l
total 4
-rw-r----- 1 bandit2 bandit1 33 Oct  5 06:19 -
bandit1@bandit:~$ cat ./-
rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi
```



## Level 3 - Spaces in a filename.

**Level Goal**

The password for the next level is stored in a hidden file in the **inhere** directory.

**Commands you may need to solve this level**

[ls](https://man7.org/linux/man-pages/man1/ls.1.html) , [cd](https://man7.org/linux/man-pages/man1/cd.1p.html) , [cat](https://man7.org/linux/man-pages/man1/cat.1.html) , [file](https://man7.org/linux/man-pages/man1/file.1.html) , [du](https://man7.org/linux/man-pages/man1/du.1.html) , [find](https://man7.org/linux/man-pages/man1/find.1.html)

```
bandit2@bandit:~$ ls -la
total 24
drwxr-xr-x  2 root    root    4096 Oct  5 06:19 .
drwxr-xr-x 70 root    root    4096 Oct  5 06:20 ..
-rw-r--r--  1 root    root     220 Jan  6  2022 .bash_logout
-rw-r--r--  1 root    root    3771 Jan  6  2022 .bashrc
-rw-r--r--  1 root    root     807 Jan  6  2022 .profile
-rw-r-----  1 bandit3 bandit2   33 Oct  5 06:19 spaces in this filename
bandit2@bandit:~$ cat spaces\ in\ this\ filename
aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG
```



## Level 4 - Hidden Files.

**Level Goal**

The password for the next level is stored in the only human-readable file in the **inhere** directory. Tip: if your terminal is messed up, try the “reset” command.

**Commands you may need to solve this level**

[ls](https://man7.org/linux/man-pages/man1/ls.1.html) , [cd](https://man7.org/linux/man-pages/man1/cd.1p.html) , [cat](https://man7.org/linux/man-pages/man1/cat.1.html) , [file](https://man7.org/linux/man-pages/man1/file.1.html) , [du](https://man7.org/linux/man-pages/man1/du.1.html) , [find](https://man7.org/linux/man-pages/man1/find.1.html)

```
bandit3@bandit:~$ ls -la inhere/
total 12
drwxr-xr-x 2 root    root    4096 Oct  5 06:19 .
drwxr-xr-x 3 root    root    4096 Oct  5 06:19 ..
-rw-r----- 1 bandit4 bandit3   33 Oct  5 06:19 .hidden
bandit3@bandit:~$ cat inhere/.hidden
2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe
```



## Level 5 - File types, specifically human-readable files.

**Level Goal**

The password for the next level is stored in the only human-readable file in the **inhere** directory. Tip: if your terminal is messed up, try the “reset” command.

**Commands you may need to solve this level**

[ls](https://man7.org/linux/man-pages/man1/ls.1.html) , [cd](https://man7.org/linux/man-pages/man1/cd.1p.html) , [cat](https://man7.org/linux/man-pages/man1/cat.1.html) , [file](https://man7.org/linux/man-pages/man1/file.1.html) , [du](https://man7.org/linux/man-pages/man1/du.1.html) , [find](https://man7.org/linux/man-pages/man1/find.1.html)

```
bandit4@bandit:~/inhere$ cd ..

bandit4@bandit:~$ cd inhere/

bandit4@bandit:~/inhere$ ls -la
total 48
drwxr-xr-x 2 root    root    4096 Oct  5 06:19 .
drwxr-xr-x 3 root    root    4096 Oct  5 06:19 ..
-rw-r----- 1 bandit5 bandit4   33 Oct  5 06:19 -file00
-rw-r----- 1 bandit5 bandit4   33 Oct  5 06:19 -file01
-rw-r----- 1 bandit5 bandit4   33 Oct  5 06:19 -file02
-rw-r----- 1 bandit5 bandit4   33 Oct  5 06:19 -file03
-rw-r----- 1 bandit5 bandit4   33 Oct  5 06:19 -file04
-rw-r----- 1 bandit5 bandit4   33 Oct  5 06:19 -file05
-rw-r----- 1 bandit5 bandit4   33 Oct  5 06:19 -file06
-rw-r----- 1 bandit5 bandit4   33 Oct  5 06:19 -file07
-rw-r----- 1 bandit5 bandit4   33 Oct  5 06:19 -file08
-rw-r----- 1 bandit5 bandit4   33 Oct  5 06:19 -file09

bandit4@bandit:~/inhere$ file ./*
./-file00: data
./-file01: data
./-file02: data
./-file03: data
./-file04: data
./-file05: data
./-file06: data
./-file07: ASCII text
./-file08: data
./-file09: data

bandit4@bandit:~/inhere$ cat ./-file07
lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR
```



## Level 6 - Human-readable files, file sizes and non-executable files.

**Level Goal**

The password for the next level is stored in a file somewhere under the **inhere** directory and has all of the following properties:

- human-readable
- 1033 bytes in size
- not executable

**Commands you may need to solve this level**

[ls](https://man7.org/linux/man-pages/man1/ls.1.html) , [cd](https://man7.org/linux/man-pages/man1/cd.1p.html) , [cat](https://man7.org/linux/man-pages/man1/cat.1.html) , [file](https://man7.org/linux/man-pages/man1/file.1.html) , [du](https://man7.org/linux/man-pages/man1/du.1.html) , [find](https://man7.org/linux/man-pages/man1/find.1.html)

```
bandit5@bandit:~$ ls
inhere

bandit5@bandit:~$ cd inhere/

bandit5@bandit:~/inhere$ ls -la
total 88
drwxr-x--- 22 root bandit5 4096 Oct  5 06:19 .
drwxr-xr-x  3 root root    4096 Oct  5 06:19 ..
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere00
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere01
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere02
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere03
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere04
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere05
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere06
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere07
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere08
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere09
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere10
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere11
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere12
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere13
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere14
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere15
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere16
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere17
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere18
drwxr-x---  2 root bandit5 4096 Oct  5 06:19 maybehere19

bandit5@bandit:~/inhere$ find . -type f -size 1033c ! -executable
./maybehere07/.file2

bandit5@bandit:~/inhere$ cat ./maybehere07/.file2
P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU
```



## Level 7 - Find a file with specific user and group ownership.

**Level Goal**

The password for the next level is stored **somewhere on the server** and has all of the following properties:

- owned by user bandit7
- owned by group bandit6
- 33 bytes in size

**Commands you may need to solve this level**

[ls](https://man7.org/linux/man-pages/man1/ls.1.html) , [cd](https://man7.org/linux/man-pages/man1/cd.1p.html) , [cat](https://man7.org/linux/man-pages/man1/cat.1.html) , [file](https://man7.org/linux/man-pages/man1/file.1.html) , [du](https://man7.org/linux/man-pages/man1/du.1.html) , [find](https://man7.org/linux/man-pages/man1/find.1.html) , [grep](https://man7.org/linux/man-pages/man1/grep.1.html)

```
bandit6@bandit:~$ find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null
/var/lib/dpkg/info/bandit7.password
bandit6@bandit:~$ cat /var/lib/dpkg/info/bandit7.password
z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S
```



## Level 8 - Learning grep and piping.

**Level Goal**

The password for the next level is stored in the file **data.txt** next to the word **millionth**

**Commands you may need to solve this level**

[man](https://man7.org/linux/man-pages/man1/man.1.html), grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

```
bandit7@bandit:~$ ls -l
total 4088
-rw-r----- 1 bandit8 bandit7 4184396 Oct  5 06:19 data.txt
bandit7@bandit:~$ cat data.txt | grep millionth
millionth	TESKZC0XvTetK0S9xNwm25STk5iWrBvP
```



## Level 9 - Linux command uniq and sort, to find lines only appearing once.

**Level Goal**

The password for the next level is stored in the file **data.txt** and is the only line of text that occurs only once

**Commands you may need to solve this level**

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

**Helpful Reading Material**

- [Piping and Redirection](https://ryanstutorials.net/linuxtutorial/piping.php)

```
bandit8@bandit:~$ ls -l
total 36
-rw-r----- 1 bandit9 bandit8 33033 Oct  5 06:19 data.txt
bandit8@bandit:~$ sort data.txt | uniq -u
EN632PlfYiZbn3PhVK3XOGSlNInNE00t
```



## Level 10 - The ‘strings’ command. Find human-readable strings in a file.

**Level Goal**

The password for the next level is stored in the file **data.txt** in one of the few human-readable strings, preceded by several ‘=’ characters.

**Commands you may need to solve this level**

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

```
bandit9@bandit:~$ ls -l
total 20
-rw-r----- 1 bandit10 bandit9 19379 Oct  5 06:19 data.txt

bandit9@bandit:~$ strings data.txt | grep ===
x]T========== theG)"
========== passwordk^
========== is
========== G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s
```



## Level 11 - Base64.

**Level Goal**

The password for the next level is stored in the file **data.txt**, which contains base64 encoded data

**Commands you may need to solve this level**

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

**Helpful Reading Material**

- [Base64 on Wikipedia](https://en.wikipedia.org/wiki/Base64)

```
bandit10@bandit:~$ cat data.txt
VGhlIHBhc3N3b3JkIGlzIDZ6UGV6aUxkUjJSS05kTllGTmI2blZDS3pwaGxYSEJNCg==
bandit10@bandit:~$ base64 -d data.txt
The password is 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM
```



## Level 12 - Rot13 substitution cipher as Linux command with ’tr’.

**Level Goal**

The password for the next level is stored in the file **data.txt**, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions

**Commands you may need to solve this level**

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

**Helpful Reading Material**

- [Rot13 on Wikipedia](https://en.wikipedia.org/wiki/Rot13)

The substitution for ROT13 is A->N,…,Z->M. With tr it would be:

```
bandit11@bandit:~$ cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
The password is JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv
```

**Addition**

If we want to use ROT13 more often in the future, it might make sense to create a ‘alias’ so that we can use the name `rot13` (and `rot5` for numbers) as command and not `tr`:

```
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
alias rot5="tr '0-9' '5-90-4'"
```



## Level 13 - Hexdumps and compression and file signatures.

**Level Goal**

The password for the next level is stored in **/etc/bandit_pass/bandit14 and can only be read by user bandit14**. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. **Note:** **localhost** is a hostname that refers to the machine you are working on

**Commands you may need to solve this level**

ssh, telnet, nc, openssl, s_client, nmap

**Helpful Reading Material**

- [SSH/OpenSSH/Keys](https://help.ubuntu.com/community/SSH/OpenSSH/Keys)

```
bandit12@bandit:~$ cat data.txt 

bandit12@bandit:~$ mkdir -p /tmp/owen

bandit12@bandit:~$ cp data.txt /tmp/owen

bandit12@bandit:~$ cd /tmp/owen

bandit12@bandit:/tmp/owen$ ls
data.txt

bandit12@bandit:/tmp/owen$ file data.txt 
data.txt: ASCII text

bandit12@bandit:/tmp/owen$ xxd -r data.txt data1

bandit12@bandit:/tmp/owen$ file data1
data1: gzip compressed data, was "data2.bin", last modified: Thu Oct  5 06:19:20 2023, max compression, from Unix, original size modulo 2^32 573

bandit12@bandit:/tmp/owen$ mv data1 data2.gz

bandit12@bandit:/tmp/owen$ gzip -d data2.gz 
```



```
bandit12@bandit:/tmp/owen$ file data2
data2: bzip2 compressed data, block size = 900k

bandit12@bandit:/tmp/owen$ mv data2 data3.bz2

bandit12@bandit:/tmp/owen$ bzip2 -d data3.bz2 

bandit12@bandit:/tmp/owen$ file data3
data3: gzip compressed data, was "data4.bin", last modified: Thu Oct  5 06:19:20 2023, max compression, from Unix, original size modulo 2^32 20480

bandit12@bandit:/tmp/owen$ mv data3 data4.gz

bandit12@bandit:/tmp/owen$ gzip -d data4.gz 

bandit12@bandit:/tmp/owen$ file data4 
data4: POSIX tar archive (GNU)

bandit12@bandit:/tmp/owen$ tar -xvf data4
data5.bin

bandit12@bandit:/tmp/owen$ file data5.bin 
data5.bin: POSIX tar archive (GNU)

bandit12@bandit:/tmp/owen$ tar -xvf data5.bin
data6.bin

bandit12@bandit:/tmp/owen$ file data6.bin 
data6.bin: bzip2 compressed data, block size = 900k

bandit12@bandit:/tmp/owen$ mv data6.bin data7.bz2

bandit12@bandit:/tmp/owen$ bzip2 -d data7.bz2 

bandit12@bandit:/tmp/owen$ file data7
data7: POSIX tar archive (GNU)

bandit12@bandit:/tmp/owen$ tar -xvf data7
data8.bin

bandit12@bandit:/tmp/owen$ file data8.bin 
data8.bin: gzip compressed data, was "data9.bin", last modified: Thu Oct  5 06:19:20 2023, max compression, from Unix, original size modulo 2^32 49

bandit12@bandit:/tmp/owen$ mv data8.bin data9.gz

bandit12@bandit:/tmp/owen$ gzip -d data9.gz 

bandit12@bandit:/tmp/owen$ file data9
data9: ASCII text

bandit12@bandit:/tmp/owen$ cat data9
The password is wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw
```



## Level 14 - SSH Login with key and transferring files from a remote host.

**Level Goal**

The password for the next level is stored in **/etc/bandit_pass/bandit14 and can only be read by user bandit14**. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. **Note:** **localhost** is a hostname that refers to the machine you are working on

**Commands you may need to solve this level**

ssh, telnet, nc, openssl, s_client, nmap

**Helpful Reading Material**

- [SSH/OpenSSH/Keys](https://help.ubuntu.com/community/SSH/OpenSSH/Keys)

```
bandit13@bandit:~$ ls
sshkey.private

bandit13@bandit:~$ ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
```



## Level 15 - Netcat and first network communication.

**Level Goal**

The password for the next level can be retrieved by submitting the password of the current level to **port 30000 on localhost**.

**Commands you may need to solve this level**

ssh, telnet, nc, openssl, s_client, nmap

**Helpful Reading Material**

- [How the Internet works in 5 minutes (YouTube)](https://www.youtube.com/watch?v=7_LPdttKXPc) (Not completely accurate, but good enough for beginners)
- [IP Addresses](http://computer.howstuffworks.com/web-server5.htm)
- [IP Address on Wikipedia](https://en.wikipedia.org/wiki/IP_address)
- [Localhost on Wikipedia](https://en.wikipedia.org/wiki/Localhost)
- [Ports](http://computer.howstuffworks.com/web-server8.htm)
- [Port (computer networking) on Wikipedia](https://en.wikipedia.org/wiki/Port_(computer_networking))

**Solution**

1. First, we need to find the password for bandit14. The previous levels stated that the password is in **/etc/bandit_pass/bandit14**.

```
bandit14@bandit:~$ cat /etc/bandit_pass/bandit14
fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq
```



2. Next, we need to submit the password to port 30000 on localhost. I used `nc` to connect to localhost port 3000 and write the password.

```
bandit14@bandit:~$ nc localhost 30000
fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq
Correct!
jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt
```



## Level 16 - OpenSSL, secure communication.

**Level Goal**

The password for the next level can be retrieved by submitting the password of the current level to **port 30001 on localhost** using SSL encryption.

**Helpful note: Getting “HEARTBEATING” and “Read R BLOCK”? Use -ign_eof and read the “CONNECTED COMMANDS” section in the manpage. Next to ‘R’ and ‘Q’, the ‘B’ command also works in this version of that command…**

**Commands you may need to solve this level**

ssh, telnet, nc, openssl, s_client, nmap

**Helpful Reading Material**

- [Secure Socket Layer/Transport Layer Security on Wikipedia](https://en.wikipedia.org/wiki/Secure_Socket_Layer)
- [OpenSSL Cookbook - Testing with OpenSSL](https://www.feistyduck.com/library/openssl-cookbook/online/ch-testing-with-openssl.html)



```
bandit15@bandit:~$ openssl s_client -connect localhost:30001
CONNECTED(00000003)
Can't use SSL_get_servername
depth=0 CN = localhost
verify error:num=18:self-signed certificate
verify return:1
depth=0 CN = localhost
verify error:num=10:certificate has expired
notAfter=Nov  8 12:55:31 2023 GMT
verify return:1
depth=0 CN = localhost
notAfter=Nov  8 12:55:31 2023 GMT
verify return:1
---
Certificate chain
 0 s:CN = localhost
   i:CN = localhost
   a:PKEY: rsaEncryption, 2048 (bit); sigalg: RSA-SHA1
   v:NotBefore: Nov  8 12:54:31 2023 GMT; NotAfter: Nov  8 12:55:31 2023 GMT
---
Server certificate
-----BEGIN CERTIFICATE-----
MIIDCzCCAfOgAwIBAgIEClBPszANBgkqhkiG9w0BAQUFADAUMRIwEAYDVQQDDAls
b2NhbGhvc3QwHhcNMjMxMTA4MTI1NDMxWhcNMjMxMTA4MTI1NTMxWjAUMRIwEAYD
VQQDDAlsb2NhbGhvc3QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCR
megH7LdvfdbmnXCXavxc3MYvqBC/DZWaFwJv3PptpcNJFVSr05DpDzNTxjXwlAtN
nOvMJfNdXEBF8nG/vKvfQFbr+D3gRRxLS/mm9/kCSj3PKn1SKhKyFrgmipoI0QZq
mFDgiFWdj8zwl1G3wSYODGDlSTJy78BBLsNrs6rizmz+7uvSAmnZk5XH4y55YIsC
NhUqMXawofufwvmc4RhdS9DSgAAUP6qr4ixmId1IAxgEnezaINx1g29gKv2nQHQS
BXHIWx8ZYPa04b04VfYNrpdBIBC0vUBsXGw8vPqvGMZhkl5GsGaK0qYDDgOLim4+
C8oLQvgTC6yMqEY9GCQ5AgMBAAGjZTBjMBQGA1UdEQQNMAuCCWxvY2FsaG9zdDBL
BglghkgBhvhCAQ0EPhY8QXV0b21hdGljYWxseSBnZW5lcmF0ZWQgYnkgTmNhdC4g
U2VlIGh0dHBzOi8vbm1hcC5vcmcvbmNhdC8uMA0GCSqGSIb3DQEBBQUAA4IBAQBc
nZLKzRwTQ/U67drbSn2Ogz8PQNGqvugv+7a1UIEnODObd1AlobakabXipM6N2QdH
+z8JPFWQxbpLFrQW836GkJKuoNoAojsnWKQeyUzfNbuXKsU8Cy/3WbFaBNaijmYW
I7D1DBSfzqJCfJS8mTXaTVxiw4h1hjIMVkcP0v2Uo3JhHzBF+FnKpPie9EasamDP
+LppPBllofql9+nuaSUDXquTu1AKIKpN73MCOXe/akVL5SLD58UBKEzA4eFR7Pa7
SdOJ/5uJDq5lGbZFFgVqtZjBzGV8yZHo8KN1D6O6bJmu9glgIcFaYZzTEtd+j86s
iYXDHOdS571vq4Ddas0W
-----END CERTIFICATE-----
subject=CN = localhost
issuer=CN = localhost
---
No client certificate CA names sent
Peer signing digest: SHA256
Peer signature type: RSA-PSS
Server Temp Key: X25519, 253 bits
---
SSL handshake has read 1339 bytes and written 373 bytes
Verification error: certificate has expired
---
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
Server public key is 2048 bit
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 10 (certificate has expired)
---
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: 73E9FCE12C174259DAD5DFB20FA92708FC12B545469D5230D0F747515A221C98
    Session-ID-ctx:
    Resumption PSK: 45B3D8F6CA85B5F060C62532682A5AEC73F510EBEF6707DC63EE8E9DF53B0738B9726671EF1DDB47202403CFF20DA056
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 7200 (seconds)
    TLS session ticket:
    0000 - 18 63 32 e6 ed 98 5f 1d-58 22 49 b6 29 31 10 0e   .c2..._.X"I.)1..
    0010 - 38 ac 5e a5 ff 49 f0 e1-09 54 1a dc a3 6c 40 dc   8.^..I...T...l@.
    0020 - 23 f3 01 57 f5 1a 37 38-09 c4 29 24 cf 45 ab f6   #..W..78..)$.E..
    0030 - 24 4e 3c 53 85 93 db 39-27 fa 7e e7 c9 18 7c bd   $N<S...9'.~...|.
    0040 - 37 72 36 36 fb 26 c3 4a-ab 50 c5 62 2a 5d da 25   7r66.&.J.P.b*].%
    0050 - ae 4f 17 05 21 8e 96 18-1e 1f 5f 6c f2 bf 49 41   .O..!....._l..IA
    0060 - 82 81 47 af 15 a2 7b 93-e5 52 03 6b 44 e9 e4 b7   ..G...{..R.kD...
    0070 - 9e db 98 5d b1 cb 33 0d-79 ee 18 27 1a e1 11 75   ...]..3.y..'...u
    0080 - 45 85 e2 a6 1c 6c b1 7f-bc 49 5a 97 c6 f9 dc 6a   E....l...IZ....j
    0090 - ad 06 9c db e0 e4 b0 f9-1a e7 37 ca 0c 1a d7 1d   ..........7.....
    00a0 - 58 99 c8 a5 e1 bf e2 28-96 ee 0a 67 6a e1 5b 83   X......(...gj.[.
    00b0 - f2 25 6b a1 08 52 f1 24-3e 95 8f 0d 24 71 f1 6f   .%k..R.$>...$q.o
    00c0 - be 23 d1 e0 2b 3a d8 e2-b3 1d ce 64 7b ea a4 22   .#..+:.....d{.."

    Start Time: 1699580391
    Timeout   : 7200 (sec)
    Verify return code: 10 (certificate has expired)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: 7C28328C8882B63EF5C9F4DAE339FCC040A0DCD16C9518ED7DB0D4CA549B638A
    Session-ID-ctx:
    Resumption PSK: 669F368A65A250EB7F93D5A85E319CE44D03E148D60AA396D914EEA97677EAAE07241397DDA8ADB51E939EBCC4417991
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 7200 (seconds)
    TLS session ticket:
    0000 - 18 63 32 e6 ed 98 5f 1d-58 22 49 b6 29 31 10 0e   .c2..._.X"I.)1..
    0010 - 2c ea f1 a3 60 9d c8 dc-2c 95 c6 1d 65 10 f9 de   ,...`...,...e...
    0020 - d8 ee 08 a9 e7 4a de bb-9c 3a bc 0f 55 c6 43 7a   .....J...:..U.Cz
    0030 - f0 f7 34 8d 15 2b 3d 0e-d2 95 38 db 8e 92 a7 96   ..4..+=...8.....
    0040 - 62 ba 4a 57 2f 13 46 02-56 e7 c8 d6 32 25 71 7f   b.JW/.F.V...2%q.
    0050 - 3f ac b9 36 42 79 cc fd-11 07 cc 72 cf 65 9b 2b   ?..6By.....r.e.+
    0060 - 94 ed c4 89 f3 bc 1b 7b-bf c8 65 bd cc 64 04 49   .......{..e..d.I
    0070 - b5 dc 8c 50 20 ce fc 46-87 15 5c 13 68 93 94 62   ...P ..F..\.h..b
    0080 - 62 4e 66 7e ca 40 21 8b-95 01 94 09 c3 a0 ae d3   bNf~.@!.........
    0090 - 98 b7 9f 03 e1 5d 30 1a-45 da e1 43 83 94 8e 14   .....]0.E..C....
    00a0 - dc 1e 6f ff 05 74 8e 6f-5a fc 76 86 7e b4 f1 05   ..o..t.oZ.v.~...
    00b0 - d5 44 b5 bb 49 f2 51 1f-05 fb 82 1c ca 24 d8 2b   .D..I.Q......$.+
    00c0 - ce 34 04 bf 6d 75 6c 8d-0f b1 7a 65 da ca 3a a7   .4..mul...ze..:.

    Start Time: 1699580391
    Timeout   : 7200 (sec)
    Verify return code: 10 (certificate has expired)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt
Correct!
JQttfApK4SeyHwDlI9SXGR50qclOAil1

closed
```





## Level 17 - Port and Service Scanning with Nmap and SSL repetition.

**Level Goal**

The credentials for the next level can be retrieved by submitting the password of the current level to **a port on localhost in the range 31000 to 32000**. First find out which of these ports have a server listening on them. Then find out which of those speak SSL and which don’t. There is only 1 server that will give the next credentials, the others will simply send back to you whatever you send to it.

**Commands you may need to solve this level**

ssh, telnet, nc, openssl, s_client, nmap

**Helpful Reading Material**

- [Port scanner on Wikipedia](https://en.wikipedia.org/wiki/Port_scanner)

**Solution**

First, we need to find open ports between 31000 to 32000 on localhost and check what services are running on them. I used the service discovery from `nmap`. (This task could be split by first finding open ports and then doing the service discovery only on these ports. This could be faster.)

```
bandit16@bandit:~$ nmap -v -A -T4 -p 31000-32000 localhost
Starting Nmap 7.80 ( https://nmap.org ) at 2023-11-10 02:10 UTC
NSE: Loaded 151 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 02:10
Completed NSE at 02:10, 0.00s elapsed
Initiating NSE at 02:10
Completed NSE at 02:10, 0.00s elapsed
Initiating NSE at 02:10
Completed NSE at 02:10, 0.00s elapsed
Initiating Ping Scan at 02:10
Scanning localhost (127.0.0.1) [2 ports]
Completed Ping Scan at 02:10, 0.00s elapsed (1 total hosts)
Initiating Connect Scan at 02:10
Scanning localhost (127.0.0.1) [1001 ports]
Discovered open port 31790/tcp on 127.0.0.1
Discovered open port 31046/tcp on 127.0.0.1
Discovered open port 31691/tcp on 127.0.0.1
Discovered open port 31518/tcp on 127.0.0.1
Discovered open port 31960/tcp on 127.0.0.1
Completed Connect Scan at 02:10, 0.04s elapsed (1001 total ports)
Initiating Service scan at 02:10
Scanning 5 services on localhost (127.0.0.1)
Service scan Timing: About 20.00% done; ETC: 02:13 (0:02:44 remaining)
Completed Service scan at 02:12, 98.04s elapsed (5 services on 1 host)
NSE: Script scanning 127.0.0.1.
Initiating NSE at 02:12
Completed NSE at 02:12, 0.03s elapsed
Initiating NSE at 02:12
Completed NSE at 02:12, 0.06s elapsed
Initiating NSE at 02:12
Completed NSE at 02:12, 0.00s elapsed
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00015s latency).
Not shown: 996 closed ports
PORT      STATE SERVICE     VERSION
31046/tcp open  echo
31518/tcp open  ssl/echo
| ssl-cert: Subject: commonName=localhost
| Subject Alternative Name: DNS:localhost
| Issuer: commonName=localhost
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha1WithRSAEncryption
| Not valid before: 2023-11-08T12:54:31
| Not valid after:  2023-11-08T12:55:31
| MD5:   eb07 31e6 e512 29b9 7500 2f6d 5ef1 26e7
|_SHA-1: 11ee cea4 742c 9fb2 db61 c134 5145 27d5 03f3 5ced
31691/tcp open  echo
31790/tcp open  ssl/unknown
| fingerprint-strings:
|   FourOhFourRequest, GenericLines, GetRequest, HTTPOptions, Help, Kerberos, LDAPSearchReq, LPDString, RTSPRequest, SIPOptions, SSLSessionReq, TLSSessionReq, TerminalServerCookie:
|_    Wrong! Please enter the correct current password
| ssl-cert: Subject: commonName=localhost
| Subject Alternative Name: DNS:localhost
| Issuer: commonName=localhost
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha1WithRSAEncryption
| Not valid before: 2023-11-08T12:54:33
| Not valid after:  2023-11-08T12:55:33
| MD5:   01a4 8530 6187 6373 e0c5 54f2 7cb3 5dea
|_SHA-1: 6ff2 659a 00b1 f7ed 44d8 98c9 fd7a 67f9 5efd 889b
31960/tcp open  echo
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port31790-TCP:V=7.80%T=SSL%I=7%D=11/10%Time=654D9120%P=x86_64-pc-linux-
SF:gnu%r(GenericLines,31,"Wrong!\x20Please\x20enter\x20the\x20correct\x20c
SF:urrent\x20password\n")%r(GetRequest,31,"Wrong!\x20Please\x20enter\x20th
SF:e\x20correct\x20current\x20password\n")%r(HTTPOptions,31,"Wrong!\x20Ple
SF:ase\x20enter\x20the\x20correct\x20current\x20password\n")%r(RTSPRequest
SF:,31,"Wrong!\x20Please\x20enter\x20the\x20correct\x20current\x20password
SF:\n")%r(Help,31,"Wrong!\x20Please\x20enter\x20the\x20correct\x20current\
SF:x20password\n")%r(SSLSessionReq,31,"Wrong!\x20Please\x20enter\x20the\x2
SF:0correct\x20current\x20password\n")%r(TerminalServerCookie,31,"Wrong!\x
SF:20Please\x20enter\x20the\x20correct\x20current\x20password\n")%r(TLSSes
SF:sionReq,31,"Wrong!\x20Please\x20enter\x20the\x20correct\x20current\x20p
SF:assword\n")%r(Kerberos,31,"Wrong!\x20Please\x20enter\x20the\x20correct\
SF:x20current\x20password\n")%r(FourOhFourRequest,31,"Wrong!\x20Please\x20
SF:enter\x20the\x20correct\x20current\x20password\n")%r(LPDString,31,"Wron
SF:g!\x20Please\x20enter\x20the\x20correct\x20current\x20password\n")%r(LD
SF:APSearchReq,31,"Wrong!\x20Please\x20enter\x20the\x20correct\x20current\
SF:x20password\n")%r(SIPOptions,31,"Wrong!\x20Please\x20enter\x20the\x20co
SF:rrect\x20current\x20password\n");

NSE: Script Post-scanning.
Initiating NSE at 02:12
Completed NSE at 02:12, 0.00s elapsed
Initiating NSE at 02:12
Completed NSE at 02:12, 0.00s elapsed
Initiating NSE at 02:12
Completed NSE at 02:12, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 99.10 seconds
```



So, `nmap` tells us that five ports are open. Only two ports (31518 and 31790) use SSL. Nmap also tells us that port 31518 runs only the echo service. The promising port seems to be port 31790, which runs an unknown service.

Now we use OpenSSL again to connect to this port on localhost and send the password.

```
bandit16@bandit:~$ openssl s_client -connect localhost:31790
CONNECTED(00000003)
Can't use SSL_get_servername
depth=0 CN = localhost
verify error:num=18:self-signed certificate
verify return:1
depth=0 CN = localhost
verify error:num=10:certificate has expired
notAfter=Nov  8 12:55:33 2023 GMT
verify return:1
depth=0 CN = localhost
notAfter=Nov  8 12:55:33 2023 GMT
verify return:1
---
Certificate chain
 0 s:CN = localhost
   i:CN = localhost
   a:PKEY: rsaEncryption, 2048 (bit); sigalg: RSA-SHA1
   v:NotBefore: Nov  8 12:54:33 2023 GMT; NotAfter: Nov  8 12:55:33 2023 GMT
---
Server certificate
-----BEGIN CERTIFICATE-----
MIIDCzCCAfOgAwIBAgIEavkSJjANBgkqhkiG9w0BAQUFADAUMRIwEAYDVQQDDAls
b2NhbGhvc3QwHhcNMjMxMTA4MTI1NDMzWhcNMjMxMTA4MTI1NTMzWjAUMRIwEAYD
VQQDDAlsb2NhbGhvc3QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC2
SUeognHzKS7jqHs5FMLo5OHP7nhqx5HwEyy8xxquAtvSciF5dHgNVx2BTZMkgyeh
1vTS2Eso0ARpEhzH40C2+HZaaZNlTpBgRYjC8fMGGtUozkWli3cSvROgMVpnn4QN
wMEWAlMXRY0+YDM51t4pEiDR4z0Z+9uDRw99ODGyuVSFVIiCQjW9LLF8myvl5OMT
P+U7MTRmqWdHtI09zQbUUQPBI80bM2G/sYhBlA81rDQeEXxkKq6RSW4LsjwIjF8c
x2yXrn4cRidtIGNF58+LJjO/MGTiCsMnRsYBPv/GhOLMNi0MPfui7fSweo/ZrNYc
uoaInbVqkCvLtdSfW9xxAgMBAAGjZTBjMBQGA1UdEQQNMAuCCWxvY2FsaG9zdDBL
BglghkgBhvhCAQ0EPhY8QXV0b21hdGljYWxseSBnZW5lcmF0ZWQgYnkgTmNhdC4g
U2VlIGh0dHBzOi8vbm1hcC5vcmcvbmNhdC8uMA0GCSqGSIb3DQEBBQUAA4IBAQBC
AafPbm2NqKDEvG+h75RBeHGMgEbSHYhGFwOWcRM5W82GeYitdc6PPeoyXKVEw/mY
jZ0VfWi6YT/tC9cEDJ2CMeebKg3eF6Z2gMu6+vvaUi/QC8wYTmE9fVgDm48Cn2eA
hCsMI836iRibggc6rwj97Pwrl11iOCWN2FVGI2AYKLh/K75D8oEHwXWKWNAEm5Gn
TEOU0bqf96p/iQlW1vB5UCDr73QO8YezJPZefP7A3mJHKO4Ap8SJwhNCfNkQWeSy
E7p2mUOAG/ZW9rKT/JEoONXti5+mmMfrMhcn3usTaOyIYJDISgJYW06jVVqp4/D0
TaGEAKIubSjxz9FErf3r
-----END CERTIFICATE-----
subject=CN = localhost
issuer=CN = localhost
---
No client certificate CA names sent
Peer signing digest: SHA256
Peer signature type: RSA-PSS
Server Temp Key: X25519, 253 bits
---
SSL handshake has read 1339 bytes and written 373 bytes
Verification error: certificate has expired
---
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
Server public key is 2048 bit
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 10 (certificate has expired)
---
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: F802EA489831BA602A0BA02562ECC59B2C75E7F6CED771815860E526B5D1D19E
    Session-ID-ctx:
    Resumption PSK: 37099EC67ED392A507F2DE83A817CF337B391957C557FFD4BD94EE01817DC49710BD5AE628CEAB1EED0D2DB5534D25E5
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 7200 (seconds)
    TLS session ticket:
    0000 - 4d bf d0 5b 84 26 8d fe-c6 b8 67 f5 43 56 67 fb   M..[.&....g.CVg.
    0010 - f9 c7 7d 46 1b 5d da e3-29 2c 70 77 84 e0 c7 23   ..}F.]..),pw...#
    0020 - a1 c9 68 b9 3d 7e 3d 45-e7 49 06 dd ce 43 ca 9f   ..h.=~=E.I...C..
    0030 - 87 a3 f5 46 3b bc 9a cd-74 f5 42 e1 8f 57 1b 50   ...F;...t.B..W.P
    0040 - bc b0 5e 34 1d 97 ec 3f-70 8e b2 fe d4 90 61 59   ..^4...?p.....aY
    0050 - 0f 3b 87 9d 11 57 93 57-a5 8e 80 81 c2 72 12 92   .;...W.W.....r..
    0060 - f4 39 23 97 95 dd cc 8a-59 70 63 77 f9 53 2d 20   .9#.....Ypcw.S-
    0070 - f7 ba ca 24 9f 13 70 e5-74 7c 9f 1b 01 de 89 3d   ...$..p.t|.....=
    0080 - 7e db 1b 3c cb ee de 7b-76 e5 fd 1b 14 8b e4 3e   ~..<...{v......>
    0090 - 8c b2 ef 68 b5 0e 6d 69-56 d1 74 97 1b 59 fe d2   ...h..miV.t..Y..
    00a0 - ee f2 8c d4 a5 46 5b 8d-7e 69 fd d2 fb a2 88 9b   .....F[.~i......
    00b0 - 6e 94 c4 60 8a e4 7a 95-1e b8 6a 98 2c 75 a2 3e   n..`..z...j.,u.>
    00c0 - 12 10 5b a9 d9 38 46 ad-62 8f 41 54 d2 e9 00 b2   ..[..8F.b.AT....

    Start Time: 1699582439
    Timeout   : 7200 (sec)
    Verify return code: 10 (certificate has expired)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: 894D999064C583C7FD09ADAE65209117A93B5E5CCCDE0CF13862A9B063A481B7
    Session-ID-ctx:
    Resumption PSK: 10FEC1DF399ABF234680EDE1306005CB4F32529864E05F1B9DBA322C857B56EAC8163A86FC7D7F779D96FB4CCD8939B7
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 7200 (seconds)
    TLS session ticket:
    0000 - 4d bf d0 5b 84 26 8d fe-c6 b8 67 f5 43 56 67 fb   M..[.&....g.CVg.
    0010 - 6d c6 aa e0 8d 49 c2 ba-0b a7 50 ab c9 c4 50 4d   m....I....P...PM
    0020 - 00 48 3a ac 01 c0 9a 7c-ea 12 78 df 51 fe 0b e5   .H:....|..x.Q...
    0030 - da 9b da 78 d1 f6 4c f1-ba f1 cc d5 f4 12 da 95   ...x..L.........
    0040 - e5 96 c2 a9 fc 2f ae 2b-9a 09 9a 8e b0 1c 63 75   ...../.+......cu
    0050 - de e1 c4 a8 80 b1 ca 14-36 a7 43 0f d0 80 c9 ac   ........6.C.....
    0060 - a1 d0 99 78 ef c3 73 84-7f 97 8c 5f 4c 4e 52 6f   ...x..s...._LNRo
    0070 - 10 46 64 b8 ad f2 03 80-0a 85 f3 3b 9f 5e 7a a0   .Fd........;.^z.
    0080 - 9c 12 a8 f7 b8 98 20 45-95 3c 4b f6 ef dd b6 ed   ...... E.<K.....
    0090 - 1c b8 f7 7a 41 e4 3d 47-ff 1c d0 64 e3 e3 17 1e   ...zA.=G...d....
    00a0 - d0 d5 12 0c c1 73 45 81-7b b5 7a c1 b7 f9 4f 8a   .....sE.{.z...O.
    00b0 - 0b cd 39 e7 be ef 17 28-aa 98 6d 84 af 81 ab 86   ..9....(..m.....
    00c0 - 59 40 bc 7f ab c5 1e a5-f0 71 31 df 15 03 7a 86   Y@.......q1...z.

    Start Time: 1699582439
    Timeout   : 7200 (sec)
    Verify return code: 10 (certificate has expired)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
JQttfApK4SeyHwDlI9SXGR50qclOAil1
Correct!
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
+TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
-----END RSA PRIVATE KEY-----

closed
```



The result is a private SSH key. So, we create a file (I called it ‘sshkey17.private’) to put the key into and like in [Level 14](https://mayadevbe.me/posts/overthewire/bandit/level14/), we need to make sure that the file only has permissions for the user.

```
bandit16@bandit:~$ mkdir /tmp/techyrick_ssh

bandit16@bandit:~$ cd /tmp/techyrick_ssh

bandit16@bandit:~$ vi bandit17.private

bandit16@bandit:~$ ssh -i bandit17.private -p 2220 bandit17@bandit.labs.overthewire.org
```



## Level 18 - Find differences in a file.

**Level Goal**

There are 2 files in the homedirectory: **passwords.old and passwords.new**. The password for the next level is in **passwords.new** and is the only line that has been changed between **passwords.old and passwords.new**

**NOTE: if you have solved this level and see ‘Byebye!’ when trying to log into bandit18, this is related to the next level, bandit19**

**Commands you may need to solve this level**

cat, grep, ls, diff

```
bandit17@bandit:~$ ls -l
total 8
-rw-r----- 1 bandit18 bandit17 3300 Oct  5 06:19 passwords.new
-rw-r----- 1 bandit18 bandit17 3300 Oct  5 06:19 passwords.old


bandit17@bandit:~$ diff passwords.old passwords.new
42c42
< p6ggwdNHncnmCNxuAt0KtKVq185ZU7AW
---
> hga5tuuCLF6fFzUpnagiMN8ssu9LFrdg
```



## Level 19 - Advanced SSH, remote command execution.

## Level 20 - Suid and linux permissions.

## Level 21 - Setuid binary, netcat and background processes/jobs.

## Level 22 - Cronjobs.

## Level 23 - Cronjobs.

## Level 24 - Cronjobs and bash scripting.

## Level 25 - Brute-forcing w=ith bash scripting and netcat.

## Level 26 - Breaking out of a restricted environment with more and vim.

## Level 27 - Breaking out of a restricted environment with more and vim and SUID Binary.

## Level 28 - Git introduction and basics.

## Level 29 - Git history.

## Level 30 - Git Branching Basics.

## Level 31 - Git Tagging.

## Level 32 - Git Push, Commit, Ignore, Add.

## Level 33 - Linux Variables and shell escape.



# Natas

## Level 0

```
Username: natas0
Password: natas0
URL:      http://natas0.natas.labs.overthewire.org
```



## Level 1

```
Username: natas1
URL:      http://natas1.natas.labs.overthewire.org
```

Right click > view source

```
<html>
<head>
<!-- This stuff in the header has nothing to do with the level -->
<link rel="stylesheet" type="text/css" href="http://natas.labs.overthewire.org/css/level.css">
<link rel="stylesheet" href="http://natas.labs.overthewire.org/css/jquery-ui.css" />
<link rel="stylesheet" href="http://natas.labs.overthewire.org/css/wechall.css" />
<script src="http://natas.labs.overthewire.org/js/jquery-1.9.1.js"></script>
<script src="http://natas.labs.overthewire.org/js/jquery-ui.js"></script>
<script src=http://natas.labs.overthewire.org/js/wechall-data.js></script><script src="http://natas.labs.overthewire.org/js/wechall.js"></script>
<script>var wechallinfo = { "level": "natas0", "pass": "natas0" };</script></head>
<body>
<h1>natas0</h1>
<div id="content">
You can find the password for the next level on this page.

<!--The password for natas1 is g9D9cREhslqBKtcA2uocGHPfMZVzeFK6 -->
</div>
</body>
</html>

```



## Level 2

```
Username: natas2
URL:      http://natas2.natas.labs.overthewire.org
```

```
<html>
<head>
<!-- This stuff in the header has nothing to do with the level -->
<link rel="stylesheet" type="text/css" href="http://natas.labs.overthewire.org/css/level.css">
<link rel="stylesheet" href="http://natas.labs.overthewire.org/css/jquery-ui.css" />
<link rel="stylesheet" href="http://natas.labs.overthewire.org/css/wechall.css" />
<script src="http://natas.labs.overthewire.org/js/jquery-1.9.1.js"></script>
<script src="http://natas.labs.overthewire.org/js/jquery-ui.js"></script>
<script src=http://natas.labs.overthewire.org/js/wechall-data.js></script><script src="http://natas.labs.overthewire.org/js/wechall.js"></script>
<script>var wechallinfo = { "level": "natas1", "pass": "g9D9cREhslqBKtcA2uocGHPfMZVzeFK6" };</script></head>
<body oncontextmenu="javascript:alert('right clicking has been blocked!');return false;">
<h1>natas1</h1>
<div id="content">
You can find the password for the
next level on this page, but rightclicking has been blocked!

<!--The password for natas2 is h4ubbcXrWqsTo7GGnnUMLppXbOogfBZ7 -->
</div>
</body>
</html>
```

## Level 3

View source page and find that there’s a folder `/files/` on the web root. Inside this folder there’s a file named as `users.txt`. Open it and find the password.

```

<html>
<head>
<!-- This stuff in the header has nothing to do with the level -->
<link rel="stylesheet" type="text/css" href="http://natas.labs.overthewire.org/css/level.css">
<link rel="stylesheet" href="http://natas.labs.overthewire.org/css/jquery-ui.css" />
<link rel="stylesheet" href="http://natas.labs.overthewire.org/css/wechall.css" />
<script src="http://natas.labs.overthewire.org/js/jquery-1.9.1.js"></script>
<script src="http://natas.labs.overthewire.org/js/jquery-ui.js"></script>
<script src=http://natas.labs.overthewire.org/js/wechall-data.js></script><script src="http://natas.labs.overthewire.org/js/wechall.js"></script>
<script>var wechallinfo = { "level": "natas2", "pass": "h4ubbcXrWqsTo7GGnnUMLppXbOogfBZ7" };</script></head>
<body>
<h1>natas2</h1>
<div id="content">
There is nothing on this page
<img src="files/pixel.png">
</div>
</body></html>
```


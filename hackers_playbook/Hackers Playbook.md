[TOC]



# Hackers Playbook

# 1. Reconnaissance / Information gathering

## Passive Reconnaissance

#### Recon-NG

https://github.com/lanmaster53/recon-ng

```
# recon-ng
[*] Version check disabled.

    _/_/_/    _/_/_/_/    _/_/_/    _/_/_/    _/      _/            _/      _/    _/_/_/
   _/    _/  _/        _/        _/      _/  _/_/    _/            _/_/    _/  _/       
  _/_/_/    _/_/_/    _/        _/      _/  _/  _/  _/  _/_/_/_/  _/  _/  _/  _/  _/_/_/
 _/    _/  _/        _/        _/      _/  _/    _/_/            _/    _/_/  _/      _/ 
_/    _/  _/_/_/_/    _/_/_/    _/_/_/    _/      _/            _/      _/    _/_/_/    


                                          /\
                                         / \\ /\
    Sponsored by...               /\  /\/  \\V  \/\
                                 / \\/ // \\\\\ \\ \/\
                                // // BLACK HILLS \/ \\
                               www.blackhillsinfosec.com

                  ____   ____   ____   ____ _____ _  ____   ____  ____
                 |____] | ___/ |____| |       |   | |____  |____ |
                 |      |   \_ |    | |____   |   |  ____| |____ |____
                                   www.practisec.com

                      [recon-ng v5.1.1, Tim Tomes (@lanmaster53)]                       

[2] Recon modules

[recon-ng][default] > 


```



#### theHarvester 

https://github.com/laramies/theHarvester

```
kali@kali:~$ theHarvester -d megacorpone.com -b google
```







## Active Reconnaissance

### DNS Enumeration

#### DNSRecon

```
kali@kali:-$ dnsrecon -d megacorpone.com -t axfr                                           
```

#### DNSenum

```
kali@kali:-#dnsenum zonetransfer.me      
```

#### NMAP NSE script (dns-zone-transfer)

```
kali@kali:~$ nmap --script=dns-zone-transfer -p 53 ns2.megacorpone.com
Starting Nmap 7.91 ( https://nmap.org ) at 2020-12-15 04:43 EST
Nmap scan report for ns2.megacorpone.com (3.211.51.86)
Host is up (0.25s latency).
rDNS record for 3.211.51.86: ec2-3-211-51-86.compute-1.amazonaws.com

PORT   STATE SERVICE
53/tcp open  domain
| dns-zone-transfer: 
| megacorpone.com.           SOA  ns1.megacorpone.com. admin.megacorpone.com.
| megacorpone.com.           TXT  "Try Harder"
| megacorpone.com.           TXT  "google-site-verification=U7B_b0HNeBtY4qYGQZNsEYXfCJ32hMNV3GtC0wWq5pA"
| megacorpone.com.           MX   10 fb.mail.gandi.net.
| megacorpone.com.           MX   20 spool.mail.gandi.net.
| megacorpone.com.           MX   50 mail.megacorpone.com.
| megacorpone.com.           MX   60 mail2.megacorpone.com.
| megacorpone.com.           NS   ns1.megacorpone.com.
| megacorpone.com.           NS   ns2.megacorpone.com.
| megacorpone.com.           NS   ns3.megacorpone.com.
| admin.megacorpone.com.     A    3.220.61.179
| beta.megacorpone.com.      A    3.220.61.179
| fs1.megacorpone.com.       A    3.220.61.179
| intranet.megacorpone.com.  A    3.220.61.179
| mail.megacorpone.com.      A    3.220.61.179
| mail2.megacorpone.com.     A    3.220.61.179
| ns1.megacorpone.com.       A    3.220.61.179
| ns2.megacorpone.com.       A    3.211.51.86
| ns3.megacorpone.com.       A    3.212.85.86
| router.megacorpone.com.    A    3.220.61.179
| siem.megacorpone.com.      A    3.220.61.179
| snmp.megacorpone.com.      A    3.220.61.179
| support.megacorpone.com.   A    3.212.85.86
| syslog.megacorpone.com.    A    3.220.61.179
| test.megacorpone.com.      A    3.220.61.179
| vpn.megacorpone.com.       A    3.220.61.179
| www.megacorpone.com.       A    3.220.87.155
| www2.megacorpone.com.      A    3.220.61.179
|_megacorpone.com.           SOA  ns1.megacorpone.com. admin.megacorpone.com.

Nmap done: 1 IP address (1 host up) scanned in 5.60 seconds
```




### Port Scanning

#### NMAP

##### Stealth | SNY Scanning (-sS)

- SYN scanning is a TCP port scanning method that involves sending SYN packets to various ports on a target machine without completing a TCP handshake.

```
# nmap -sS 192.168.0.196  
Starting Nmap 7.91 ( https://nmap.org ) at 2020-12-15 00:42 EST
Nmap scan report for 192.168.0.196
Host is up (0.00052s latency).
Not shown: 994 closed ports
PORT     STATE SERVICE
21/tcp   open  ftp
135/tcp  open  msrpc
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
3389/tcp open  ms-wbt-server
5357/tcp open  wsdapi
MAC Address: 00:0C:29:95:9D:B8 (VMware)

Nmap done: 1 IP address (1 host up) scanned in 5.11 seconds
```

##### TCP Connect Scanning (-sT)

- TCP connect scan is the default TCP scan type
- establish a full **connection** (Three way handshake)

```
# nmap -sT 192.168.101.114                                                                                    255 ⨯
Starting Nmap 7.91 ( https://nmap.org ) at 2021-02-09 04:10 EST
Nmap scan report for 192.168.101.114
Host is up (0.0016s latency).
Not shown: 996 filtered ports
PORT     STATE SERVICE
135/tcp  open  msrpc
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
3389/tcp open  ms-wbt-server
MAC Address: 84:7B:EB:0D:5B:64 (Dell)

Nmap done: 1 IP address (1 host up) scanned in 5.17 seconds
```

##### UDP Scanning (-sU)

```
ka1i@kali:~$ sudo nmap -sU 10.11.1.115
Starting Nmap 7.70 ( https://nmap.org) at 2019-03-04 11:46 EST
Nmap scan report for 10.11.1.115
Host is up (0.079s latency).
Not shown: 997 openlfiltered ports
PORT STATE SERVICE
111/udp open rpcbind
137/udp open netbios-ns
161/udp open snmp

Nmap done: l IP address (1 host up) scanned in 22.49 seconds
```

The UDP scan (-sU) can also be used in conjunction with a TCP SYN  (-sS) option to build a scan more complete picture of our target: 

```
kali@kali:~$ sudo nmap -sS -sU 10.11.1.115
Starting Nmap 7.70 ( https://nmap.org) at 2019-03-04 12:46 EST
Nmap scan report for 10.11.1.115
Host is up (0.15s latency).
Not shown: 997 openlfiltered ports, 989 closed ports
PORT		STATE	SERVICE 
21/tcp		open	ftp
22/tcp		open	ssh	
25/tcp		open	smtp
80/tcp		open	http
111/tcp		open	rpcbind
139/tcp		open	netbios-ssn
143/tcp		open	imap
199/tcp		open	smux
443/tcp		open	https
3306/tcp	open	mysql
32768/tcp 	open	filenet-tms
111/udp		open	rpcbind
137/udp		open	netbios-ns
161/udp 	open	snmp

Nmap done: l IP address (l host up) scanned in 64.74 seconds
```

##### Network Sweeping (-sn)

```
kali@kali:~$ nmap -sn 192.168.0.1-254                                                     Starting Nmap 7.91 ( https://nmap.org ) at 2020-12-15 04:12 EST
Nmap scan report for 192.168.0.1
Host is up (0.0016s latency).
Nmap scan report for 192.168.0.107
Host is up (0.027s latency).
Nmap scan report for 192.168.0.196
Host is up (0.0039s latency).
Nmap scan report for 192.168.0.207
Host is up (0.0088s latency).
Nmap scan report for 192.168.0.223
Host is up (0.0012s latency).
Nmap done: 254 IP addresses (5 hosts up) scanned in 6.82 seconds
```

##### OS Fingerprinting (-0)

- OS detection

```
kali@kali:~$ sudo nmap -O 192.168.0.196                                                   [sudo] password for kali: 
Starting Nmap 7.91 ( https://nmap.org ) at 2020-12-15 04:30 EST
Nmap scan report for 192.168.0.196
Host is up (0.0011s latency).
Not shown: 994 closed ports
PORT     STATE SERVICE
21/tcp   open  ftp
135/tcp  open  msrpc
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
3389/tcp open  ms-wbt-server
5357/tcp open  wsdapi
MAC Address: 00:0C:29:95:9D:B8 (VMware)
Device type: general purpose
Running: Microsoft Windows 10
OS CPE: cpe:/o:microsoft:windows_10
OS details: Microsoft Windows 10 1709 - 1909
Network Distance: 1 hop

OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 6.53 seconds
```

##### Banner Grabbing/Service Enumeration

We can also identify services running on specific ports by inspecting service banners (-sV) and running various OS and service enumeration scripts (-A) against the target

```
kali@kali:~$ nmap -sV -sT -A 192.168.0.196
Starting Nmap 7.91 ( https://nmap.org ) at 2020-12-15 04:38 EST
Nmap scan report for 192.168.0.196
Host is up (0.00060s latency).
Not shown: 993 closed ports
PORT     STATE SERVICE       VERSION
21/tcp   open  ftp           Microsoft ftpd
| ftp-syst: 
|_  SYST: Windows_NT
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
445/tcp  open  microsoft-ds  Windows 10 Pro 18362 microsoft-ds (workgroup: WORKGROUP)
2869/tcp open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Service Unavailable
3389/tcp open  ms-wbt-server Microsoft Terminal Services
| rdp-ntlm-info: 
|   Target_Name: DESKTOP-H5AKSBG
|   NetBIOS_Domain_Name: DESKTOP-H5AKSBG
|   NetBIOS_Computer_Name: DESKTOP-H5AKSBG
|   DNS_Domain_Name: DESKTOP-H5AKSBG
|   DNS_Computer_Name: DESKTOP-H5AKSBG
|   Product_Version: 10.0.18362
|_  System_Time: 2020-12-15T09:39:00+00:00
| ssl-cert: Subject: commonName=DESKTOP-H5AKSBG
| Not valid before: 2020-12-08T02:39:09
|_Not valid after:  2021-06-09T02:39:09
|_ssl-date: 2020-12-15T09:39:05+00:00; 0s from scanner time.
5357/tcp open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Service Unavailable
Service Info: Host: DESKTOP-H5AKSBG; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: -1h36m00s, deviation: 3h34m39s, median: 0s
|_nbstat: NetBIOS name: DESKTOP-H5AKSBG, NetBIOS user: <unknown>, NetBIOS MAC: 00:0c:29:95:9d:b8 (VMware)
| smb-os-discovery: 
|   OS: Windows 10 Pro 18362 (Windows 10 Pro 6.3)
|   OS CPE: cpe:/o:microsoft:windows_10::-
|   Computer name: DESKTOP-H5AKSBG
|   NetBIOS computer name: DESKTOP-H5AKSBG\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2020-12-15T17:39:00+08:00
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2020-12-15T09:39:00
|_  start_date: N/A

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 19.33 seconds
```

##### Nmap Scripting Engine (NSE)

- NSE scripts are located in the /usr/share/nmap/scripts directory.

```
kali@kali:~$ nmap 192.168.0.196 --script=smb-os-discovery
Starting Nmap 7.91 ( https://nmap.org ) at 2020-12-15 04:42 EST
Nmap scan report for 192.168.0.196
Host is up (0.00039s latency).
Not shown: 994 closed ports
PORT     STATE SERVICE
21/tcp   open  ftp
135/tcp  open  msrpc
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
3389/tcp open  ms-wbt-server
5357/tcp open  wsdapi

Host script results:
| smb-os-discovery: 
|   OS: Windows 10 Pro 18362 (Windows 10 Pro 6.3)
|   OS CPE: cpe:/o:microsoft:windows_10::-
|   Computer name: DESKTOP-H5AKSBG
|   NetBIOS computer name: DESKTOP-H5AKSBG\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2020-12-15T17:42:11+08:00

Nmap done: 1 IP address (1 host up) scanned in 2.02 seconds
```

#### Metasploit

```
msf6 > use auxiliary/scanner/portscan/tcp
msf6 auxiliary(scanner/portscan/tcp) > show options 

Module options (auxiliary/scanner/portscan/tcp):

   Name         Current Setting  Required  Description
   ----         ---------------  --------  -----------
   CONCURRENCY  10               yes       The number of concurrent ports to check per host
   DELAY        0                yes       The delay between connections, per thread, in milliseconds
   JITTER       0                yes       The delay jitter factor (maximum value by which to +/- DELAY) in milliseconds.
   PORTS        1-10000          yes       Ports to scan (e.g. 22-25,80,110-900)
   RHOSTS                        yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   THREADS      1                yes       The number of concurrent threads (max one per host)
   TIMEOUT      1000             yes       The socket connect timeout in milliseconds

msf6 auxiliary(scanner/portscan/tcp) > set RHOSTS 192.168.101.113
RHOSTS => 192.168.101.113
msf6 auxiliary(scanner/portscan/tcp) > run

[+] 192.168.101.113:      - 192.168.101.113:80 - TCP OPEN
[+] 192.168.101.113:      - 192.168.101.113:135 - TCP OPEN
[+] 192.168.101.113:      - 192.168.101.113:139 - TCP OPEN
[+] 192.168.101.113:      - 192.168.101.113:445 - TCP OPEN
[+] 192.168.101.113:      - 192.168.101.113:443 - TCP OPEN

```




#### Masscan

Masscan is arguably the fastest port scanner; it can scan the entire Internet in about 6 minutes.  transmitting an astounding 10 miIlion packets per second! While it was originally designed to scan the entire Internet, it can easily handle a class A or B subnet, which is a more suitable target range during a penetration test.

Masscan is not installed on Kali by default; it must be installed using apt install:

```
kali@kali:~$ sudo apt install masscan
```

Consider this demonstration that locates all machines on a large internal network with TCP port 80 open (using the -p80 option). Since masscan implements a custom TCP/IP stack, it will require access to raw sockets and therefore requires sudo.

```
kali@kali:~$ sudo masscan -p80 10.0.0.0/8
```

We will add a few additional masscan options, including --rate to specify the desired rate of packet  transmission, -e to specify the raw network interface to use, and --router-ip to specify the IP address for the appropriate gateway:

```
kali@kali:~$ sudo masscan -p80 10.11.1.8/24 --rate=1000 -e tap0 --router-ip 10.11.0.1

Starting masscan 1.0.3 (http://bit.ly/l4GZzcT) at 2019-03-04 17:15:40 GMT
-- forced options: -sS -Pn -n --randomize-hosts -v --send-eth
Initiating SYN Stealth Scan
Scanning 256 hosts [l port/host]
Discovered open port 80/tcp on 10.11.1.14
Discovered open port 80/tcp on 10.11.1.39
Discovered open port 80/tcp on 10.11.1.219
Discovered open port 80/tcp on 10.11.1.227
Di scovered open port 80/tcp on 10.11.1.10
Discovered open port 80/tcp on 10.11.1.50
Discovered open port 80/tcp on 10.11.1.234
...
```

### 

### SMB Enumeration

#### Nmap SMB scan

```
kali@kali:~$ nmap -v -p 139,445 -oG smb.txt 192.168.0.223
Starting Nmap 7.91 ( https://nmap.org ) at 2020-12-15 04:57 EST
Initiating Ping Scan at 04:57
Scanning 192.168.0.223 [2 ports]
Completed Ping Scan at 04:57, 0.00s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 04:57
Completed Parallel DNS resolution of 1 host. at 04:57, 0.03s elapsed
Initiating Connect Scan at 04:57
Scanning 192.168.0.223 [2 ports]
Completed Connect Scan at 04:57, 0.00s elapsed (2 total ports)
Nmap scan report for 192.168.0.223
Host is up (0.00023s latency).

PORT    STATE  SERVICE
139/tcp closed netbios-ssn
445/tcp closed microsoft-ds

Read data files from: /usr/bin/../share/nmap
Nmap done: 1 IP address (1 host up) scanned in 0.10 seconds
```



#### Nbtscan



### NFS Enumeration

Both Portmapper  and RPCbind run on TCP port 111. RPCbind maps RPC services to the ports on which they listen. RPC processes notify rpcbind when they start, registering the ports they are listening on and the RPC program numbers they expect to serve.

#### Scanning for NFS Shares

We can scan these ports with nmap using the following syntax:

```
kali@kali:~$ nmap -v -p 111 10.11.1.1-254
```

We can use NSE scripts like rpcinfo to fi nd services that may have registered with rpcbind:

```
kal i@kali:~$ nmap -sV -p 111 --script=rpcinfo 10.11.1.1-254
Nmap scan report for 10.11.1.72
Host is up (0.0055s latency).
PORT 	STATE SERVICE
111/tcp open  rpcbind
rpcinfo:
program version		port/proto	service 
100000  2,3,4		111/tcp		rpcbind
100000  2,3,4 		111/udp		rpcbind
100003  2,3,4		2049/tcp	nfs
100003  2,3,4		2049/udp	nfs
100005  1,2,3		50255/udp	mountd
100005  1,2,3		56911/tcp	mountd
100021  1,3,4		40160/udp	nlockmgr
100021  1,3,4		57765/tcp	nlockmgr
100024  1			34959/udp	status
100024  1			46908/tcp	status
100227  2,3			2049/tcp	nfs_acl
100227  2,3			2049/udp	nfs_acl	
...
```

Once we find NFS running, we can collect additional information, en umerate NFS services, and discover additional services using NSE scripts found in the /usr/share/nmap/scripts directory:

```
kali@kali:~$ nmap -p 111 --script nfs* 10.11.1.12
...
Nmap scan report for 10,11,1,72
PORT
STATE SERVI CE
111/tcp open rpcbind
| nfs-showmount:
|_  /home 10.11.0.0/255.255.0.
```

In this case, the entire /home directory is being shared and we can access it by mounting it on our Kali virtual machine. We will use mount to do this, along with -o nolock to disable file locking, which is often needed for older NFS servers:

```
kali@kali:-$ mkdir home

kali@kali:~$ sudo mount -o nolock 10.11.1.12:/home -/home/

kali@kali:~$ cd home/ && ls
jenny joe45 john marcus ryuu
```

Based on this file listing, we can see that there are a few home directories for local users on the remote machine. Digging a blt deeper, we find a filename that catches our attention, so we try to view it:

```
kali@kali:-/home$ cd marcus
kali@kali:~/home/marcus$ ls -la
total 24
drwxr-xr-x 2 1014 1014 4096 Jun 10 09: 16 •
drwxr-xr-x 7 root root 4096 Sep 17 2015 ..
-rwx------ 1 1814 1814
48 Jun 10 89:16 creds.txt

kali@kali:-/home/marcus$ cat creds.txt
cat: creds.txt: Permission denied
```

It appears we do not have permission to view this file. Taking a closer look at the file permissions, we can see that its owner has a UUID of 1014, and also read (r), write (w), and execute (x) permissions on it. What can we do with this information? Since we have complete access to our Kali machine, we can try to add a local user to it using the adduser command, change its UUID to 1014, su to that user, and then try  ccessing the file again:

```
kali@kali:-/home/stefan$ sudo adduser pwn
Adding user 'pwn' ...
Adding new group 'pwn' (1001) .••
Adding new user 'pwn' (1001) with group 'pwn' ...
Creating home directory '/home/pwn'
Copying files from '/etc/skel' ..•
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Changing the user information for pwn
Enter the new value, or press ENTER for the default
Full Name []:
Room Number [] :
Work Phone []:
Home Phone [] :
Other[]:
Is the information correct? [V/n]
```

Based on the output above, we can see that the new user has a UUID of 1001, which is not really what we need. We ca n change it to 1014 using sed and confirm the change took place. The -i option is used to replace the file in-place and the -e option executes a script. In this case, that happens to be 's/1001/1014/g ', which will globally replace the UUID in the /etc/passwd file:

```
kali@kali:-/home/marcus$ sudo sed -i -e 's/1001/1014/g' /etc/passwd

kali@kali:~/home/marcus$ cat /etc/passwd | grep pwn
pwn:x :1014:1014 :,,,:/home/pwn:/bin/bash
```

So far so good. Let's try to su to the newly added pwn user, verify that our UUID has indeed changed, and then try accessing that file again. We will use the su command to change the current login session's owner. Then, we will use id to display our current user ID. Finally, we wi ll try to access the file again:

```
kali@ka1i:~/home/marcus$ su pwn

pwn@ka1i:/root/home/marcus$ id
uid=1014(pwn) gid=1014 groups=1014

pwn@ka1i:/root/home/marcus$ cat creds.txt
Not what you are looking for, try harder!!! :0)
```



### SMTP Enumeration

We can also gather information about a host or network from vulnerable mail servers. The Simple Mail Transport Protocol (SMTP)  supports several interesting commands, such as VRFY and EXPN. A VRFY request asks the server to verify an email address, w hile EXPN asks the server for the membership of a mailing list. These can often be abused to verify existing users on a mail server, w hich is useful informatfon during a penetration test. Consider this example:

```
kali@ka1i:~$ nc -nv 10.11.1.211 25
(UNKNOWN) (10.11.1.217] 25 (smtp) open
220 hot1ine.localdomain ESMTP Postfix
VRFY root
252 2.0.0 root
VRFY idontexist
550 5.1.1 <idontexist>: Recipient add ress rejected: User unknown in local recipient table
^C
```

Notice how the success and error messages differ. The SMTP server happily verifies that the user exists. Thf s procedure can be used to help guess valid usernames in an automated fashion. Consider the following Python script that opens a TCP socket, connects to the SMTP server, and issues a VRFY command for a given username:

```
#!/usr/bin/python

import socket
import sys

if len(sys.argv) != 2:
	print "Usage: vrfy.py <username>"
	sys.exit(0)
	
# Create a Socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the Server
connect= s.connect(('10.11.1.217',25))

# Receive the banner
banner= s.recv(1024)

print banner

# VRFY a user
s.send('VRFY ' + sys.argv[1] + '\r\n')
result= s.recv(1024)

print result

# Close the socket
s.close()
```



### SNMP Enumeration

#### NMAP

To scan for open SNMP ports, we can run nmap as shown in the example that follows. The -sU option is used to perform UDP scanning and t he --open option is used to limit the output to only display open ports:

```
kali@kali:~$ sudo nmap -sU --open -p 161 10.11.1.1-254 -oG open-snmp.txt
Starting Nmap 7.70 ( https://nmap.org) at 2019-05-01 06:26 MDT
Nmap scan report for 10.11.1.7
Host is up (0.080s latency).
PORT    STATE SERVICE
161/udp openl filtered snmp
MAC Address: 00:50:56:89:lA:CD (VMware)

Nmap scan report for 10.11.1.10
Host is up (0.080s latency).

PORT    STATE  SERVICE
161/udp openl  filtered snmp
MAC Address: 00:50:56:93:4E:DC (VMware)
...
```

#### onesixtyone

Alternatively, we can use a tool such as onesixtyone, which will attempt a brute force attack against a list of IP add resses. First we must build text files containing community strings and the IP addresses we wish to scan:

```
kali@kali:~$ echo public > community
kali @kali: ~$ echo private>> community
kali @kali:-$ echo manager >> community

kali@kali:~$ for ip in $(seq 1 254); do echo 10.11.1.$ip; done > ips

kali@kali:~$ onesixtyone -c community -i ips
Scanning 254 hosts, 3 communities
10.11.1.14 [public] Hardware: x86 Family 6 Model 12 Stepping 2 AT/AT COMPATIBLE - Soft
wa re: Windows 2000 Version 5.1 (Build 2600 Uniprocessor Free)
10.11.1.13 [public] Hardware: x86 Family 6 Model 12 Stepping 2 AT/AT COMPATIBLE - Soft
wa re: Wi ndows 2000 Version 5.1 (Build 2600 Uniprocessor Free)
10.11,1.22 [public] Linux barry 2.4.18-3 #1 Thu Apr 18 07:37:53 EDT 2002 i686
...
```

#### snmpwalk

##### Windows SNMP Enumeration Example

We can probe and query SNMP values using a tool such as snmpwalk provided we at least know
the SNMP read-only community string, which in most cases is "public".

###### Enumerating the Entire MIB Tree

Using some of the MIB values provided in Listing , we can attempt to enumerate their corresponding values. Try out the following examples against a known machine in the labs, which has a Windows SNMP port exposed wit h the community string "public". This command enumerates the entire MIB tree using the -c option to specify the community string, and -v to specify the SNMP version number as well as the -t 10 to increase the timeout period to 10 seconds:

```
kali@kali:~$ snmpwalk -c public -v1 -t 10  10.11.1.14
iso.3.6.1.2.1.1.1.0 = STRI NG: "Hardwa re: x86 Family 6 Model 12 Stepping 2 AT/AT COMPAT
IBLE - Software: Windows 2000 Version 5.1 (Build 2600 Uniprocessor Free)"
iso.3.6.1.2.1.1.2.0 = OID: iso.3.6.1.4.1.311.1.1.3,1.1
iso.3.6.1.2.1.1.3.0 = Timeticks: (2005539644) 232. days, 2:56:36.44
iso.3.6.1.2.1.1.4.0 = 1111
...
```

###### Enumerating Windows Users

This example enumerates the Windows users:

```
kali@kali:~$ snmpwalk -c public -vl 10.11.1.14 1.3.6.1.4.1.77.1.2.25
iso.3.6.1.4.1.77.1.2.25.1.1.3.98.111.98 = STRING: "bob"
iso.3.6.1.4.1.77.1.2.25.1.1.5.71.117.101.115.116 = STRING: "Guest''
iso.3.6.1.4.1.77.1.2.25.1.1.8.73.85.83.82.95.66.79.66 = STRING: " IUSR_BOB"
```

###### Enumerating Running Windows Processes

This example enumerates the running Windows processes:

```
kali@kali:~$ snmpwalk -c public -v1 10.11.1.73 1.3.6.1.2.1.25.4.2.1.2
iso.3.6.1.2.1.25.4.2.1.2.1 = STRING: "System Idle Pr-ocess "
iso.3.6.1.2.1.25.4.2.1.2.4 = STRING: "System"
iso.3.6.1.2.1.25.4.2.1.2.224 = STRING: "smss.exe"
iso.3.6.1.2.1.25.4.2.1.2.324 = STRING: "csrss.exe"
iso.3.6.1.2.1.25.4.2.1.2.364 = STRING: "wininit.exe"
iso.3.6.1.2.1.25.4.2.1.2.372 = STRING: "csrss.exe"
iso.3.6.1.2.1.25.4.2.1.2.420 = STRING: "winlogon.exe"
iso.3.6.1.2.1.25.4.2.1.2.448 = STRING: "services.exe"
iso.3.6.1.2.1.25.4.2.1.2.480 = STRING: "lsass.exe"
iso.3.6.1.2.1.25.4.2.1.2.488 = STRING: "lsm.exe"
...
```

###### Enumerating Open TCP Ports

This example enumerates the open TCP ports:

```
kali @kali:~$ snmpwatk -c public -v1 10.11.1.14 1.3.6.1.2.1.6.13.1.3
iso.3.6.l.2.l.6.13.l.3.0.0.0.0.21.0.0.0.0.18646 = INTEGER: 21
iso.3.6.1.2.l.6.13.1.3.0.0.0.0.80.0.0.0.0.45310 = INTEGER: 80
iso.3.6.l.2.l.6.13.l.3.0.0.0.0.135.0.0.0.0.24806 = INTEGER: 135
iso.3.6.1.2.l.6.13.l.3.0.0.0.0.443.0.0.0.0.45070 = INTEGER: 443
...
```

###### Enumerating Installed Software

This example enumerates installed software:

```
kali@kali:~$ snmpwalk -c public -v1 10.11.1.50 1.3.6.1.2.1.25.6.3.1.2
iso.3.6.1.2.1.25.6.3.1.2.1 = STRING: "LiveUpdate 3.3 (Symantec Corporation)"
iso.3.6.1.2.1.25.6.3.1.2.2 = STRING: "WampServer 2.5"
iso.3.6.1.2.1.25.6.3.1.2.3 = STRING: "VMware Tools"
iso.3.6.1.2.1.25.6.3.1.2.4 = STRING: "Microsoft Visual C++ 2008 Redistributable - x86
9.0.30729.4148"
iso.3.6.1.2.1.25.6.3.1.2.5 = STRING: "Microsoft Visual C++ 2012 Redistributable (x86)
- 11.0.61030"
```







# 2. Vulnerability Assessment

## Scanning Vulnerabilities

### NMAP
### NESSUS 

#### Installing Nessus

Manually download the 64-bit .deb file for Kali from the Tenable website: https://www.tenable.com/downloads/nessus.

Validate the downloaded file's checksum with sha256sum:

```
kali@kali:~$ sha256sum Nessus-8.13.0-ubuntu910_amd64.deb 
30a9e896cc84b7bc1eccf7f45b89f707f5e4d20fa96451daa365b9634fd1ddd7  Nessus-8.13.0-ubuntu910_amd64.deb
```

Install the package with apt

```
kali@kali:~$ sudo apt install ./Nessus-x.x.X.deb
Preparing to unpack ••• /kali/nessus/Nessus-X.X.X.deb
Unpacking nessus (X.X.X) ..•
Setting up nessus (X.X.X) .••
Unpacking Nessus Scanner Core Components ...
- You can start Nessus Scanner by typing /etc/init.d/nessusd start
- Then go to https://kali:8834/ to configure your scanner
```



### OPENVAS 

### Installing Openvas

```
kali@kali:~$ apt-get install gvm*

kali@kali:~$ gvm-setup

kali@kali:~$ gvm-start
```

Browse

https://localhost:9392



# 3. Exploitation



### Web Application Attacks

#### Web Application Enumeration

#### Web Application Assessment Tools

##### DIRB

- DIRB is a web content scanner that uses a wordlist to find directories and pages by issuing requests to the server. 

- DIRB can identify valid web pages on a web server even if the main index page is missing.

We will supply several arguments: the URL to scan, -r to scan non-recursively, and -z 10 to add a 10 millisecond delay to each request:

```
kali@kali:~$ dirb http://www.megacorpone.com -r -z 10                                                                   255 ⨯

-----------------
DIRB v2.22    
By The Dark Raver
-----------------

START_TIME: Sun Dec 20 20:51:59 2020
URL_BASE: http://www.megacorpone.com/
WORDLIST_FILES: /usr/share/dirb/wordlists/common.txt
OPTION: Not Recursive
SPEED_DELAY: 10 milliseconds

-----------------

GENERATED WORDS: 4612                                                          

---- Scanning URL: http://www.megacorpone.com/ ----
+ http://www.megacorpone.com/about (CODE:200|SIZE:14596)                                                     
+ http://www.megacorpone.com/admin (CODE:403|SIZE:292)                                                               
==> DIRECTORY: http://www.megacorpone.com/assets/                                                                    
+ http://www.megacorpone.com/contact (CODE:200|SIZE:9439)                                                            
+ http://www.megacorpone.com/index (CODE:200|SIZE:14603)                                                             
+ http://www.megacorpone.com/index.html (CODE:200|SIZE:14603)                                                        
+ http://www.megacorpone.com/jobs (CODE:200|SIZE:13269)                                                              
==> DIRECTORY: http://www.megacorpone.com/old-site/                                                                  
+ http://www.megacorpone.com/robots (CODE:200|SIZE:43)                                                               
+ http://www.megacorpone.com/robots.txt (CODE:200|SIZE:43)                                                           
+ http://www.megacorpone.com/server-status (CODE:403|SIZE:300)                                                       
                                                                                                                     
-----------------
END_TIME: Sun Dec 20 21:12:53 2020
DOWNLOADED: 4612 - FOUND: 9

```



##### Nikto

- Nikto is a highly configurable Open Source web server scanner that tests for thousands of dangerous files and programs, vulnerable server versions and various server configuration issues. It performs well, but is not designed for stealth as it will send many requests and embed information about itself in the User-Agent header.

We'll specify the host we want to scan (-host=http://www.megacorpone.com) and for the sake of this demonstration, we'll use -maxtime=30s to limit t he scan duration to 30 seconds:

```
kali@kali:~$ nikto -host=http://www.megacorpone.com -maxtime=30s
- Nikto v2.1.6
---------------------------------------------------------------------------
+ Target IP:          3.220.87.155
+ Target Hostname:    www.megacorpone.com
+ Target Port:        80
+ Start Time:         2020-12-20 23:11:03 (GMT-5)
---------------------------------------------------------------------------
+ Server: Apache/2.2.22 (Ubuntu)
+ Server may leak inodes via ETags, header found with file /, inode: 152243, size: 14603, mtime: Wed Nov  6 10:04:14 2019
+ The anti-clickjacking X-Frame-Options header is not present.
+ The X-XSS-Protection header is not defined. This header can hint to the user agent to protect against some forms of XSS
+ The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type
+ ERROR: Host maximum execution time of 30 seconds reached
+ Scan terminated:  0 error(s) and 4 item(s) reported on remote host
+ End Time:           2020-12-20 23:11:34 (GMT-5) (31 seconds)
---------------------------------------------------------------------------
+ 1 host(s) tested
```



### Cross-Site Scripting (XSS)

#### Identifying XSS Vulnerabilities


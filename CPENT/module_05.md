[TOC]



# Module 05 Network Penetration Testing -External

## Network Penetration Testing

Network penetration testing isa well-known method for identifying vulnerabilities in networks, systems, hosts, and network devices before attackers recognize and exploit them. It is the process of actively evaluating the security of a network by simulating the attacks an attacker ‘would perform on a network, attached devices, network applications, or a website, This security assessment of Internet/intranet systems determines the vuinerable network services that unidentified threat sources can abuse. Network penetration test starts with discovering live systems, open ports, troubleshooting live systems, services and grabbing system banners.

Pen tester should try to gain access to the target network environment through live systems, open ports, services, etc. and then use those systems as a base to penetrate deeper into the network.

**Network penetration test commonly includes the following type of tests against target network**
**infrastructure:**

+ Detecting unnecessary open ports, services running, sensitive information exposed through default banners

+ Firewall bypass testing

+ IDS evasion testing

+ Testing switching or routing issues

**Benefits of network penetration testing:**

+ Identification of he critical vulnerabilities enables the security experts to develop and  implement proper fixes
+ Network penetration test helps the administrator to close unnecessary ports, services, hide or customize banners, troubleshoot services and calibrate fiewal/DS rules for robust security.
+ It helps organizations avold huge fines for noncompliance, by helping them comply with the audit regulatory standards like Payment Card Industry Data Security Standard (PCIDDS, Health insurance Portability and Accountability Act (HIPAA), and Gramm-Leach-Bliley Act (GLBA)
+ It helps organizations to identify and address the risk, thus avoids security breach and protects the organization from heavy financial falls

## External vs, Internal Penetration Testing

### External network penetration testing

- Assess from across the internet

- Must break through firewall and intrusion detection/prevention systems

  ![image-20210817070122358](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210817070122358.png)

External network penetration testing is the method of assessing the assets and Identifying vulnerabilities that could help the attackers to exploit the network from ‘outside, This testing focuses on the servers, technology infrastructure, and the software of the target. This type of testing includes comprehensive analysis of publicly available Information about the target, identifies the target hosts through network enumeration, and assesses behavior of security devices, The main of objective of this method i to find
the vulnerabilities that attackers can exploit outside the network.

**External penetration testing involves security evaluation of:**

- All publicly available network applications such as websites/applications, FTP etc.
- Network infrastructure devices such as firewall, 10S, routers, switches, etc.
- Wireless networks

**External penetration testing is a process of determining the following:**

- Security flaws of client systems

- Strengths of client systems

**Its recommendable to perform external penetration testing during a predetermined**
**evaluation period and should include the following tasks:**

- Collecting available information regarding externally acessible configurations

- Analyzing and identifying the services and topologies of external client networks

- Scanning the ports and services of client Internet services that are prone to attack

### Internal penetration testing

- Assess from inside the corporate network

- Already past the perimeter firewall

  ![image-20210817070305610](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210817070305610.png)

Internal penetration testing refers to the analysis performed inside the organization and provides the complete picture of the security of an organization. It is the method of Identifying the internal security flaws to protect the organization's infrastructure from Internal threats. This type of testing is similar to external penetration assessment, but with more holistic view of network security. It helps in assessing the network security when attacks happen from inside the organization and the attackers have fair knowledge of the network and its security controls

Internal penetration testing involves security evaluation of:

- All internal networks, infrastructure devices and applications including servers, end
  points, etc.

## Network Penetration Testing Process

1. **Information gathering (OSINT)**
   In this step, the penetration tester performs a survey to gather all the possible Information about the target network. The penetration testers must gather information such as IP addresses, domain names, device type, applications and their versions, and security tools implemented such as IDS, IPS, and firewalls. This information will help them in developing methods of testing the network.

2. **Port scanning**
   Penetration testers use port scanning technique to find the lve IP addresses and open ports on the network devices as wel as fingerprint the services. Penetration testers use vulnerability scanners as well as port scanning tools to find the open ports in an organization. Testers can use tools such as MegaPing, Hping3, NetScan Tools Pro, and ‘Advanced port scanner to perform port scanning.
3. **OS and service fingerprinting**
   Penetration testers must find the operating system (0S) running on the target device to Identify and exploit the known vulnerabilities. OS service fingerprinting also helps the testers identify the protocols running on the port, the brand, and version of the server.
4. **Vulnerability research**
   After determining the list of live IP addresses, open ports services, applications, and OSs running on the target host, the penetration testers must scan the host to identify the known vulnerabilities. Testers deploy vulnerability scanning tools, which come with an in-built vulnerability database, to scan the vulnerabilities of the target. They can use  various types of vunerability scanners, such as Nessus, Qualys, GFl LanGuard, Retina, SAINT, and Nexpose.
5. **Exploit verification**
   **I**n this step, testers analyze the available exploits through manual verification and password cracking, to validate the results before preparing the reports.
6. **Reporting**
   At the end of network penetration testing process, testers must prepare a comprehensive report to provide findings, suggest solutions, and make recommendations.

## Types of Network Penetration Testing

### White-box penetration testing

White-box network penetration testing, also known as complete knowledge network penetration testing, requires penetration testers to know complete information about the target network The Information includes host IP addresses, domains owned by the company, device types, application and their version, network diagrams, OSs, security defenses like IPS or IDS in the network, and other infrastructure details. Organizations opting for this type of testing must provide testers with network administrator level
knowledge, except passwords.

**Advantages**

- High level of acuracy
- Deep and thorough comprehensiveness
- Test range Includes sections beyond the reach of black box testing, such as application security

**Disadvantages**

- Does not simulate the real-time attack scenario

### Black-box penetration testing

In black-box penetration testing, penetration tester has zero knowledge about the network and its infrastructure; and the organization will not provide any information about their network infrastructure. Here, the tester must collect the information such as domain names, IP range, live hosts, OS details, network map, device types, security defenses, etc., with the help of penetration testing tools or social engineering techniques. He may use publicly available information over the Internet**.**

**Advantages**

- Simulates a real-time attack

**Disadvantages**

- Testers have limited time, unlike the attacker
- Does not cover all the test areas

### Gray-box penetration testing

In gray-box network penetration testing, the client provides limited information about the network to the penetration testers.

**Advantages**

- It is the most cost-effective type of penetration testing

- The results can be similar to that of the white-box network penetration testing

**Disadvantages**

- Clients need to spend time for collecting the required information

## Port Scanning

Port scanning is the process of sending a message to all the ports of a system to check whether they are open or closed. Attackers use an open port to breach the networks by probing for vulnerabilities. A system contains 65,536 (0-65,535) ports in which each port offers a different service. There are different types of port scanning techniques such as vanilla scan, SYN scan, XMAS scan, and FIN scan.

**You can use port scanning to perform the following tasks:**

* Discover live hosts in a network using the Nmap command “nmap -sP 192.168.2.1/255” 
* Identify open ports of a live host using the Nmap port scanning technique
* Find the services running on the open ports of a host using the Nmap command nmap -
  sV <target IP address/domain name>
* Find vulnerabilities in the services running in a host

### Scan the Network to Discover Live Hosts

Testers must identify the live systems on the target network to perform network penetration tests. They can scan the network using network scanning tools such as Nmap, Hping2, and Netcat.

- **ICMP ping scan**: To detect live systems using ICMP ping scan, testers must send an ICMP echo request to each IP addresses in the target network. Use the following nmap ‘command to perform the scan:

  nmap -sP <IP_RANGE> or nmap -sn <IP_RANGE> 

  Here -sP represents the nmap switch for ping scan. Firewalls can detect the ICMP scans on the network

  ```
  $nmap -sP 192.168.101.0/24
  Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-17 20:32 PST
  Nmap scan report for 192.168.101.2
  Host is up (0.0034s latency).
  Nmap scan report for 192.168.101.3
  Host is up (0.0037s latency).
  Nmap scan report for 192.168.101.103
  Host is up (0.012s latency).
  Nmap scan report for 192.168.101.104
  Host is up (0.052s latency).
  Nmap scan report for 192.168.101.105
  Host is up (0.084s latency).
  Nmap scan report for 192.168.101.110
  Host is up (0.057s latency).
  Nmap scan report for 192.168.101.111
  Host is up (0.037s latency).
  Nmap done: 256 IP addresses (7 hosts up) scanned in 2.94 seconds
  ```

  ```
  #nmap -sn 192.168.101.0/24
  Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-19 22:21 PST
  Nmap scan report for 192.168.101.2
  Host is up (0.0016s latency).
  MAC Address: BC:98:89:9D:3C:58 (Fiberhome Telecommunication Technologies)
  Nmap scan report for 192.168.101.3
  Host is up (0.00057s latency).
  MAC Address: 3C:84:6A:A7:EB:B0 (Tp-link Technologies)
  Nmap scan report for 192.168.101.103
  Host is up (0.0036s latency).
  MAC Address: 28:6D:CD:4F:88:E7 (Beijing Winner Microelectronics)
  Nmap scan report for 192.168.101.104
  Host is up (0.0046s latency).
  MAC Address: 28:6D:CD:4F:8A:C6 (Beijing Winner Microelectronics)
  Nmap scan report for 192.168.101.105
  Host is up (0.0026s latency).
  MAC Address: 28:6D:CD:4E:45:8A (Beijing Winner Microelectronics)
  Nmap scan report for 192.168.101.106
  Host is up (0.0012s latency).
  MAC Address: 28:CF:E9:7D:FF:17 (Apple)
  Nmap scan report for 192.168.101.112
  Host is up (0.061s latency).
  MAC Address: EC:9B:F3:3C:F8:A2 (Samsung Electro-mechanics(thailand))
  Nmap scan report for 192.168.101.113
  Host is up (0.015s latency).
  MAC Address: 8E:57:89:77:47:F4 (Unknown)
  Nmap scan report for 192.168.101.114
  Host is up (0.055s latency).
  MAC Address: 94:65:9C:98:E2:57 (Intel Corporate)
  Nmap scan report for 192.168.101.117
  Host is up (0.018s latency).
  MAC Address: 94:E9:79:FE:2A:2D (Liteon Technology)
  Nmap scan report for 192.168.101.122
  Host is up (0.00031s latency).
  MAC Address: 18:DB:F2:39:6A:B3 (Dell)
  Nmap scan report for 192.168.101.115
  Host is up.
  Nmap done: 256 IP addresses (12 hosts up) scanned in 2.33 seconds
  ```

  

- **Popular port SYN scan**: This method involves scanning of only the 1024 popular ports.   ‘As the SYN packets easily pass through the firewall, this scanning is much reliable   compared to the ICMP ping scan. Generally, every host contains at least one popular port for listening the services, thus the scan helps in identifying the live host. To perform   the scan, use the following Nmap command:

  Nmap -sS -PO <IP_RANGE>

  Here, -sS is the operator required to send SYN packets to the target host and -PO operator tells the tools to consider the IP address as live even without an ICMP response.

  ```
  sudo nmap -sS -PO 192.168.101.0/24
  Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-17 20:38 PST
  Nmap scan report for 192.168.101.2
  Host is up (0.0046s latency).
  Not shown: 998 closed ports
  PORT     STATE SERVICE
  80/tcp   open  http
  8099/tcp open  unknown
  MAC Address: BC:98:89:9D:3C:58 (Fiberhome Telecommunication Technologies)
  
  Nmap scan report for 192.168.101.3
  Host is up (0.012s latency).
  Not shown: 997 closed ports
  PORT    STATE SERVICE
  22/tcp  open  ssh
  80/tcp  open  http
  443/tcp open  https
  MAC Address: 3C:84:6A:A7:EB:B0 (Tp-link Technologies)
  
  Nmap scan report for 192.168.101.103
  Host is up (0.0043s latency).
  Not shown: 999 closed ports
  PORT     STATE SERVICE
  6668/tcp open  irc
  MAC Address: 28:6D:CD:4F:88:E7 (Beijing Winner Microelectronics)
  
  Nmap scan report for 192.168.101.104
  Host is up (0.099s latency).
  Not shown: 999 closed ports
  PORT     STATE SERVICE
  6668/tcp open  irc
  MAC Address: 28:6D:CD:4F:8A:C6 (Beijing Winner Microelectronics)
  
  Nmap scan report for 192.168.101.105
  Host is up (0.010s latency).
  Not shown: 999 closed ports
  PORT     STATE SERVICE
  6668/tcp open  irc
  MAC Address: 28:6D:CD:4E:45:8A (Beijing Winner Microelectronics)
  
  Nmap scan report for 192.168.101.110
  Host is up (0.0074s latency).
  All 1000 scanned ports on 192.168.101.110 are closed
  MAC Address: EC:9B:F3:3C:F8:A2 (Samsung Electro-mechanics(thailand))
  
  Nmap scan report for 192.168.101.122
  Host is up (0.0038s latency).
  Not shown: 995 filtered ports
  PORT     STATE SERVICE
  22/tcp   open  ssh
  139/tcp  open  netbios-ssn
  445/tcp  open  microsoft-ds
  8000/tcp open  http-alt
  9000/tcp open  cslistener
  MAC Address: 18:DB:F2:39:6A:B3 (Dell)
  
  Nmap scan report for 192.168.101.111
  Host is up (0.032s latency).
  Not shown: 999 closed ports
  PORT   STATE SERVICE
  22/tcp open  ssh
  
  Nmap done: 256 IP addresses (8 hosts up) scanned in 41.25 seconds
  ```

  

- **All ports SYN scan**: In this method, the testers need to scan all the 64,000 ports using the SYN packers. This method requires more time compared to popular port scan. To optimize the scan, include the maximum round trip time switch in scanning. The Nmap command to perform all port SYN scan is

  Nmap -sS -p1-65535 -PO -max-rtt-timeout <time> <IP_RANGE>

- Specific ports SYN scan: In this type of scan, testers scan specific ports by sending SYN
  packets. The web application servers use the 80 and 443 ports to listen the services.
  Thus, the testers must use the following Nmap command to scan the web application
  server:

  Nmap -sS -p80,443 -PO <IP_RANGE>
  

## Ping Scan Messages and Codes



| Message Received/Type         | Code | Meaning/Description                       |
| ----------------------------- | ---- | ----------------------------------------- |
| 3-Destination Unreachable [5] | 0    | Destination network unreachable           |
| 3-Destination Unreachable [5] | 1    | Destination host unreachable              |
| 3-Destination Unreachable [5] | 2    | Destination protocol unreachable          |
| 3-Destination Unreachable [5] | 3    | Destination port unreachable              |
| 3-Destination Unreachable [5] | 4    | Fragmentation required, and DF flag set   |
| 3-Destination Unreachable [5] | 5    | Source route failed                       |
| 3-Destination Unreachable [5] | 6    | Destination network unknown               |
| 3-Destination Unreachable [5] | 7    | Destination host unknown                  |
| 3-Destination Unreachable [5] | 8    | Source host isolated                      |
| 3-Destination Unreachable [5] | 9    | Network administratively prohibited       |
| 3-Destination Unreachable [5] | 10   | Host administratively prohibited          |
| 3-Destination Unreachable [5] | 11   | Network unreachable for TOS               |
| 3-Destination Unreachable [5] | 12   | Host unreachable for TOS                  |
| 3-Destination Unreachable [5] | 13   | Communication administratively prohibited |
| 8-Echo Request                | 0    | Echo request (used to ping)               |
| 13-Timestamp                  | 0    | Timestamp                                 |
| 15-Information Request        | 0    | Information request                       |
| 17-Address Mask Request       | 0    | Address mask request                      |

## Identify Default Open Ports

- Most firewall implementations have default ports in use for remote management purposes, for example, user authentication, management, VPN connections, etc.
- Port scanners extract the information about open ports and relevant services of those ports
- Port scanning helps the pen tester in creating a profile of the target organization
- Use port scanning tools, such as Nmap, Hping, etc., to perform port scanning

```
nmap -p 1-65535 -T4 -A -v certifiedhacker.com
Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-18 00:51 PST
NSE: Loaded 153 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 00:51
Completed NSE at 00:51, 0.00s elapsed
Initiating NSE at 00:51
Completed NSE at 00:51, 0.00s elapsed
Initiating NSE at 00:51
Completed NSE at 00:51, 0.00s elapsed
Initiating Ping Scan at 00:51
Scanning certifiedhacker.com (162.241.216.11) [2 ports]
Completed Ping Scan at 00:51, 0.21s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 00:51
Completed Parallel DNS resolution of 1 host. at 00:51, 0.03s elapsed
Initiating Connect Scan at 00:51
Scanning certifiedhacker.com (162.241.216.11) [65535 ports]
Discovered open port 53/tcp on 162.241.216.11
Discovered open port 443/tcp on 162.241.216.11
Discovered open port 80/tcp on 162.241.216.11
Discovered open port 21/tcp on 162.241.216.11
Discovered open port 993/tcp on 162.241.216.11
Discovered open port 3306/tcp on 162.241.216.11
Discovered open port 22/tcp on 162.241.216.11
Discovered open port 143/tcp on 162.241.216.11
Discovered open port 995/tcp on 162.241.216.11
Discovered open port 110/tcp on 162.241.216.11
Discovered open port 587/tcp on 162.241.216.11
Discovered open port 2222/tcp on 162.241.216.11
Connect Scan Timing: About 6.60% done; ETC: 00:59 (0:07:19 remaining)
Discovered open port 2095/tcp on 162.241.216.11
Discovered open port 2083/tcp on 162.241.216.11
Connect Scan Timing: About 11.87% done; ETC: 01:00 (0:07:55 remaining)
Connect Scan Timing: About 18.07% done; ETC: 01:00 (0:07:20 remaining)
Discovered open port 2080/tcp on 162.241.216.11
Connect Scan Timing: About 23.55% done; ETC: 01:00 (0:06:52 remaining)
Connect Scan Timing: About 29.19% done; ETC: 01:00 (0:06:21 remaining)
Connect Scan Timing: About 34.95% done; ETC: 01:00 (0:05:54 remaining)
Connect Scan Timing: About 40.31% done; ETC: 01:00 (0:05:26 remaining)
Connect Scan Timing: About 46.24% done; ETC: 01:00 (0:04:58 remaining)
Connect Scan Timing: About 51.42% done; ETC: 01:00 (0:04:30 remaining)
```

## Use Connect Scan (Full Open Scan) 

- Use Nmap with -sT switch to perform a TCP connect scan and examine the response from the target

- Nmap uses the operating system’s connect() system call and tries to establish a connection with the
  target at all specified ports
- Bydefault, nmap -sT command scans for first 1000 most common ports

```
$nmap -sT -v certifiedhacker.com
Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-18 01:02 PST
Initiating Ping Scan at 01:02
Scanning certifiedhacker.com (162.241.216.11) [2 ports]
Completed Ping Scan at 01:02, 0.20s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 01:02
Completed Parallel DNS resolution of 1 host. at 01:02, 0.20s elapsed
Initiating Connect Scan at 01:02
Scanning certifiedhacker.com (162.241.216.11) [1000 ports]
Discovered open port 995/tcp on 162.241.216.11
Discovered open port 21/tcp on 162.241.216.11
Discovered open port 3306/tcp on 162.241.216.11
Discovered open port 143/tcp on 162.241.216.11
Discovered open port 22/tcp on 162.241.216.11
Discovered open port 80/tcp on 162.241.216.11
Discovered open port 443/tcp on 162.241.216.11
Discovered open port 587/tcp on 162.241.216.11
Discovered open port 993/tcp on 162.241.216.11
Discovered open port 53/tcp on 162.241.216.11
Discovered open port 110/tcp on 162.241.216.11
Discovered open port 5432/tcp on 162.241.216.11
Discovered open port 2222/tcp on 162.241.216.11
Discovered open port 26/tcp on 162.241.216.11
Discovered open port 465/tcp on 162.241.216.11
Completed Connect Scan at 01:02, 7.95s elapsed (1000 total ports)
Nmap scan report for certifiedhacker.com (162.241.216.11)
Host is up (0.21s latency).
rDNS record for 162.241.216.11: box5331.bluehost.com
Not shown: 983 closed ports
PORT     STATE    SERVICE
21/tcp   open     ftp
22/tcp   open     ssh
25/tcp   filtered smtp
26/tcp   open     rsftp
53/tcp   open     domain
80/tcp   open     http
110/tcp  open     pop3
143/tcp  open     imap
443/tcp  open     https
465/tcp  open     smtps
587/tcp  open     submission
993/tcp  open     imaps
995/tcp  open     pop3s
2222/tcp open     EtherNetIP-1
2525/tcp filtered ms-v-worlds
3306/tcp open     mysql
5432/tcp open     postgresql

Read data files from: /usr/bin/../share/nmap
```

## Use SYN Scan  (Half-open Scan) 

- Stealth scanning techniques are used to bypass firewall rules and logging mechanisms, and hide themselves as usual network traffic
- Client sends SYN packet to target and waits for the response. If the target responds with SYN/ACK, it infers that port is open on the target
- However, if the target responds with RST. This infers that port is closed on the target

```
$nmap -T4 -A -v certifiedhacker.com
Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-18 01:08 PST
NSE: Loaded 153 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 01:08
Completed NSE at 01:08, 0.00s elapsed
Initiating NSE at 01:08
Completed NSE at 01:08, 0.00s elapsed
Initiating NSE at 01:08
Completed NSE at 01:08, 0.00s elapsed
Initiating Ping Scan at 01:08
Scanning certifiedhacker.com (162.241.216.11) [2 ports]
Completed Ping Scan at 01:08, 0.21s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 01:08
Completed Parallel DNS resolution of 1 host. at 01:08, 0.04s elapsed
Initiating Connect Scan at 01:08
Scanning certifiedhacker.com (162.241.216.11) [1000 ports]
Discovered open port 80/tcp on 162.241.216.11
Discovered open port 22/tcp on 162.241.216.11
Discovered open port 143/tcp on 162.241.216.11
Discovered open port 53/tcp on 162.241.216.11
Discovered open port 21/tcp on 162.241.216.11
Discovered open port 443/tcp on 162.241.216.11
Discovered open port 995/tcp on 162.241.216.11
Discovered open port 110/tcp on 162.241.216.11
Discovered open port 587/tcp on 162.241.216.11
Discovered open port 3306/tcp on 162.241.216.11
Discovered open port 993/tcp on 162.241.216.11
Discovered open port 465/tcp on 162.241.216.11
Discovered open port 5432/tcp on 162.241.216.11
Discovered open port 26/tcp on 162.241.216.11
Discovered open port 2222/tcp on 162.241.216.11
Completed Connect Scan at 01:08, 8.07s elapsed (1000 total ports)
Initiating Service scan at 01:08
Scanning 15 services on certifiedhacker.com (162.241.216.11)
Completed Service scan at 01:09, 44.90s elapsed (15 services on 1 host)
NSE: Script scanning 162.241.216.11.
Initiating NSE at 01:09
Completed NSE at 01:09, 9.12s elapsed
Initiating NSE at 01:09
Completed NSE at 01:09, 9.71s elapsed
Initiating NSE at 01:09
Completed NSE at 01:09, 0.00s elapsed
Nmap scan report for certifiedhacker.com (162.241.216.11)
Host is up (0.21s latency).
rDNS record for 162.241.216.11: box5331.bluehost.com
Not shown: 983 closed ports
PORT     STATE    SERVICE     VERSION
21/tcp   open     ftp         Pure-FTPd
| ssl-cert: Subject: commonName=*.bluehost.com
| Subject Alternative Name: DNS:*.bluehost.com, DNS:bluehost.com
| Issuer: commonName=Sectigo RSA Domain Validation Secure Server CA/organizationName=Sectigo Limited/stateOrProvinceName=Greater Manchester/countryName=GB
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-01-28T00:00:00
| Not valid after:  2022-01-28T23:59:59
| MD5:   e141 675f 28f8 3cb1 fdbc 1cff 5aae 2ff3
|_SHA-1: 1d40 533a cab2 8402 3f61 467f 5334 2bda 106c e451
22/tcp   open     ssh         OpenSSH 5.3 (protocol 2.0)
| ssh-hostkey: 
|   1024 56:07:68:de:0c:92:4f:b5:e0:1f:cc:0b:c3:ba:0a:2f (DSA)
|_  2048 c5:65:11:7c:5b:03:60:8e:be:13:1e:d9:b6:8d:80:ac (RSA)
25/tcp   filtered smtp
26/tcp   open     smtp        Exim smtpd 4.94.2
| smtp-commands: box5331.bluehost.com Hello certifiedhacker.com [119.95.198.40], SIZE 52428800, 8BITMIME, PIPELINING, PIPE_CONNECT, AUTH PLAIN LOGIN, STARTTLS, HELP, 
|_ Commands supported: AUTH STARTTLS HELO EHLO MAIL RCPT DATA BDAT NOOP QUIT RSET HELP 
53/tcp   open     domain      ISC BIND 9.8.2rc1 (RedHat Enterprise Linux 6)
| dns-nsid: 
|_  bind.version: 9.8.2rc1-RedHat-9.8.2-0.62.rc1.el6_9.4
80/tcp   open     http        Apache httpd
|_http-favicon: Unknown favicon MD5: 629CCC774AED95B2C6BEC91151F7292D
| http-methods: 
|_  Supported Methods: GET POST OPTIONS HEAD
| http-server-header: 
|   Apache
|_  nginx/1.19.10
|_http-title: Certfied Hacker
110/tcp  open     pop3        Dovecot pop3d
|_pop3-capabilities: AUTH-RESP-CODE UIDL USER TOP STLS SASL(PLAIN LOGIN) CAPA PIPELINING RESP-CODES
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Issuer: commonName=R3/organizationName=Let's Encrypt/countryName=US
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-06-17T15:34:55
| Not valid after:  2021-09-15T15:34:54
| MD5:   b5c1 e46b b193 d9fb 4d9c 36a4 2034 7e95
|_SHA-1: 5545 48da 0150 46f3 9730 f5ea 7ebf a6c4 5a66 08f3
143/tcp  open     imap        Dovecot imapd
|_imap-capabilities: OK ID listed more ENABLE NAMESPACE IMAP4rev1 LOGIN-REFERRALS Pre-login LITERAL+ AUTH=PLAIN IDLE capabilities SASL-IR have AUTH=LOGINA0001 STARTTLS post-login
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Issuer: commonName=R3/organizationName=Let's Encrypt/countryName=US
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-06-17T15:34:55
| Not valid after:  2021-09-15T15:34:54
| MD5:   b5c1 e46b b193 d9fb 4d9c 36a4 2034 7e95
|_SHA-1: 5545 48da 0150 46f3 9730 f5ea 7ebf a6c4 5a66 08f3
443/tcp  open     ssl/http    Apache httpd
|_http-favicon: Unknown favicon MD5: 629CCC774AED95B2C6BEC91151F7292D
| http-methods: 
|_  Supported Methods: GET POST OPTIONS HEAD
| http-server-header: 
|   Apache
|_  nginx/1.19.10
|_http-title: Certfied Hacker
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Issuer: commonName=R3/organizationName=Let's Encrypt/countryName=US
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-06-17T15:34:55
| Not valid after:  2021-09-15T15:34:54
| MD5:   b5c1 e46b b193 d9fb 4d9c 36a4 2034 7e95
|_SHA-1: 5545 48da 0150 46f3 9730 f5ea 7ebf a6c4 5a66 08f3
465/tcp  open     ssl/smtp    Exim smtpd 4.94.2
| smtp-commands: box5331.bluehost.com Hello certifiedhacker.com [119.95.198.40], SIZE 52428800, 8BITMIME, PIPELINING, PIPE_CONNECT, AUTH PLAIN LOGIN, HELP, 
|_ Commands supported: AUTH HELO EHLO MAIL RCPT DATA BDAT NOOP QUIT RSET HELP 
587/tcp  open     smtp        Exim smtpd 4.94.2
|_smtp-commands: Couldn't establish connection on port 587
993/tcp  open     imaps?
|_imap-capabilities: OK ID listed more ENABLE NAMESPACE IMAP4rev1 LOGIN-REFERRALS Pre-login LITERAL+ post-login IDLE capabilities SASL-IR have AUTH=LOGINA0001 AUTH=PLAIN
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Issuer: commonName=R3/organizationName=Let's Encrypt/countryName=US
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-06-17T15:34:55
| Not valid after:  2021-09-15T15:34:54
| MD5:   b5c1 e46b b193 d9fb 4d9c 36a4 2034 7e95
|_SHA-1: 5545 48da 0150 46f3 9730 f5ea 7ebf a6c4 5a66 08f3
995/tcp  open     pop3s?
|_pop3-capabilities: AUTH-RESP-CODE SASL(PLAIN LOGIN) CAPA UIDL USER TOP PIPELINING RESP-CODES
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Issuer: commonName=R3/organizationName=Let's Encrypt/countryName=US
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-06-17T15:34:55
| Not valid after:  2021-09-15T15:34:54
| MD5:   b5c1 e46b b193 d9fb 4d9c 36a4 2034 7e95
|_SHA-1: 5545 48da 0150 46f3 9730 f5ea 7ebf a6c4 5a66 08f3
2222/tcp open     ssh         OpenSSH 5.3 (protocol 2.0)
| ssh-hostkey: 
|_  1024 56:07:68:de:0c:92:4f:b5:e0:1f:cc:0b:c3:ba:0a:2f (DSA)
2525/tcp filtered ms-v-worlds
3306/tcp open     mysql       MySQL 5.6.41-84.1
| mysql-info: 
|   Protocol: 10
|   Version: 5.6.41-84.1
|   Thread ID: 78554077
|   Capabilities flags: 65535
|   Some Capabilities: IgnoreSigpipes, SwitchToSSLAfterHandshake, Support41Auth, InteractiveClient, Speaks41ProtocolOld, SupportsTransactions, IgnoreSpaceBeforeParenthesis, LongPassword, ConnectWithDatabase, FoundRows, SupportsCompression, Speaks41ProtocolNew, SupportsLoadDataLocal, ODBCClient, DontAllowDatabaseTableColumn, LongColumnFlag, SupportsMultipleStatments, SupportsMultipleResults, SupportsAuthPlugins
|   Status: Autocommit
|   Salt: sOn^l&s3D<Ao,*/Ms}<P
|_  Auth Plugin Name: mysql_native_password
| ssl-cert: Subject: commonName=*.bluehost.com
| Subject Alternative Name: DNS:*.bluehost.com, DNS:bluehost.com
| Issuer: commonName=Sectigo RSA Domain Validation Secure Server CA/organizationName=Sectigo Limited/stateOrProvinceName=Greater Manchester/countryName=GB
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-01-28T00:00:00
| Not valid after:  2022-01-28T23:59:59
| MD5:   e141 675f 28f8 3cb1 fdbc 1cff 5aae 2ff3
|_SHA-1: 1d40 533a cab2 8402 3f61 467f 5334 2bda 106c e451
|_ssl-date: 2021-08-17T05:11:37+00:00; -11h57m36s from scanner time.
5432/tcp open     postgresql  PostgreSQL DB
| fingerprint-strings: 
|   SMBProgNeg: 
|     SFATAL
|     C0A000
|     Munsupported frontend protocol 65363.19778: server supports 1.0 to 3.0
|     Fpostmaster.c
|     L1624
|_    RProcessStartupPacket
3 services unrecognized despite returning data. If you know the service/version, please submit the following fingerprints at https://nmap.org/cgi-bin/submit.cgi?new-service :
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port993-TCP:V=7.91%I=7%D=8/18%Time=611BED0B%P=x86_64-pc-linux-gnu%r(SSL
SF:v23SessionReq,5,"\x80\x03\0\0\x01");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port995-TCP:V=7.91%I=7%D=8/18%Time=611BED06%P=x86_64-pc-linux-gnu%r(SSL
SF:v23SessionReq,5,"\x80\x03\0\0\x01");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port5432-TCP:V=7.91%I=7%D=8/18%Time=611BED06%P=x86_64-pc-linux-gnu%r(SM
SF:BProgNeg,85,"E\0\0\0\x84SFATAL\0C0A000\0Munsupported\x20frontend\x20pro
SF:tocol\x2065363\.19778:\x20server\x20supports\x201\.0\x20to\x203\.0\0Fpo
SF:stmaster\.c\0L1624\0RProcessStartupPacket\0\0");
Service Info: OS: Linux; CPE: cpe:/o:redhat:enterprise_linux:6

Host script results:
|_clock-skew: -11h57m36s

NSE: Script Post-scanning.
Initiating NSE at 01:09
Completed NSE at 01:09, 0.00s elapsed
Initiating NSE at 01:09
Completed NSE at 01:09, 0.00s elapsed
Initiating NSE at 01:09
Completed NSE at 01:09, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 73.01 seconds
```

## Use Illegal Flag Combinations to Scan the Target

- Refers to the use of FIN, URG, PUSH, a combination of these or no flags to scan a target for open ports
- These scans work only on OSes with RFC 793-compliant TCP/IP implementations
- These scans do not work against any current version of Microsoft Windows

![image-20210817162207851](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210817162207851.png)

## Use ACK Flag Probe Scan on the Target and See the Response

In ACK flag probe scan, penetration testers send TCP probe packets with the ACK flag set to a remote device and then analyze the header information (TTL and WINDOW field) of received RST packets to find whether the port is open or closed. The ACK flag probe scanning exploits the vulnerabilities within the BSD-derived TCP/IP stack. Thus, this scanning is effective only on those OSs and platforms on which the BSD derives TCP/IP stacks.

**Categories of ACK flag probe scanning include:**

- TTL-based ACK flag probe scanning

  In this scanning technique, penetration tester sends ACK probe packets (thousands in number) to different TCP ports, and then analyze the TTL field value of the received RST packets.

  If the TTL value of RST packet on a port is less than the boundary value of 64, then that port is open. Here is an example displaying a log of the first four RST packets received:

  ![image-20210817162752605](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210817162752605.png)



​		In the above example, port 22 has returned a TTL value of 50, which is less than 64; all other
​		ports returned a TTL value of 80, which is greater than 64. Therefore, port 22 is open.

- **WINDOW-based ACK flag probe scanning**

  In this scanning technique, penetration tester sends ACK probe packets (thousands in number) to different TCP ports and then analyze the WINDOW field value of the received RST packets. The penetration tester can use this scanning technique when all the ports return the same TTL value.

  On some systems, the WINDOW value of RST packets from closed ports is always zero. If the WINDOW of an RST packet on a port has a nonzero value, then that port is open. Here is an ‘example displaying a log of the first four RST packets received:

  ![image-20210817163242418](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210817163242418.png)

  ​							Figure 5.14; Open port based onthe window value of RST packet

  The above figure shows that the TTL value returned for each packet is the same, so the penetration tester has to use Window-based ACK flag probe scanning to find the open ports. In the above figure, the window value of the third packet has a nonzero window value, which ‘means that the port is open.

  However, you cannot rely on this technique alone to determine the state of ports as it works based on the TCP/IP implementation details used by only a minority of the systems on the Internet.

  **Advantages**

  - This type of scan can evade IDS in most cases.

  **Disadvantages**

  - This scan is slow and can exploit only older OSs with vulnerable BSD-derived TCP/IP   stacks.

The ACK flag probe scanning technique also assists in checking the filtering systems of target networks. The penetration tester sends an ACK probe packet to check the filtering mechanism   (firewalls) of packets employed by the target network.

Sending an ACK probe packet with a random sequence number and getting no response from the target means that the port is filtered (stateful firewall is present); an RST response from the target means thatthe port isnot fitered (no firewall is present).

Source: https://nmap.org

```
nmap -sA -P0 10.10.0.25
Starting nmap 7.60 (https://nmap.org) at 2018-01-16 12:15 EST
ALL 529 scanned ports on 10.10.0.25 are: filtered
```

![image-20210817164148892](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210817164148892.png)



## UDP Scan

Send UDP packets to a target system to find whether the port is open or closed.

- No response indicates an open or filtered port

- An ICMP port unreachable error message of type 3 with code 3 indicates a closed port, whereas type
  3 error with codes 0, 1, 2, 9, 10 or 13 indicates a filtered port

![image-20210817164612333](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210817164612333.png)

```
$sudo nmap -sU -v certifiedhacker.com
[sudo] password for sherwinowen: 
Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-18 04:44 PST
Initiating Ping Scan at 04:44
Scanning certifiedhacker.com (162.241.216.11) [4 ports]
Completed Ping Scan at 04:44, 0.24s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 04:44
Completed Parallel DNS resolution of 1 host. at 04:44, 0.04s elapsed
Initiating UDP Scan at 04:44
Scanning certifiedhacker.com (162.241.216.11) [1000 ports]
Increasing send delay for 162.241.216.11 from 0 to 50 due to max_successful_tryno increase to 4
Increasing send delay for 162.241.216.11 from 50 to 100 due to max_successful_tryno increase to 5
Increasing send delay for 162.241.216.11 from 100 to 200 due to max_successful_tryno increase to 6
Increasing send delay for 162.241.216.11 from 200 to 400 due to 11 out of 12 dropped probes since last increase.
Increasing send delay for 162.241.216.11 from 400 to 800 due to 11 out of 11 dropped probes since last increase.
UDP Scan Timing: About 4.95% done; ETC: 04:54 (0:09:55 remaining)
UDP Scan Timing: About 7.65% done; ETC: 04:57 (0:12:16 remaining)
UDP Scan Timing: About 10.27% done; ETC: 04:59 (0:13:15 remaining)
UDP Scan Timing: About 22.74% done; ETC: 05:00 (0:12:28 remaining)
UDP Scan Timing: About 29.71% done; ETC: 05:01 (0:11:38 remaining)
Discovered open port 53/udp on 162.241.216.11
UDP Scan Timing: About 35.06% done; ETC: 05:01 (0:10:46 remaining)
UDP Scan Timing: About 40.75% done; ETC: 05:01 (0:09:55 remaining)
UDP Scan Timing: About 46.44% done; ETC: 05:01 (0:09:01 remaining)
UDP Scan Timing: About 52.33% done; ETC: 05:01 (0:08:07 remaining)
UDP Scan Timing: About 57.24% done; ETC: 05:01 (0:07:16 remaining)
UDP Scan Timing: About 62.41% done; ETC: 05:01 (0:06:24 remaining)
UDP Scan Timing: About 67.49% done; ETC: 05:01 (0:05:33 remaining)
UDP Scan Timing: About 72.65% done; ETC: 05:01 (0:04:40 remaining)
UDP Scan Timing: About 77.95% done; ETC: 05:01 (0:03:47 remaining)
UDP Scan Timing: About 83.20% done; ETC: 05:01 (0:02:54 remaining)
UDP Scan Timing: About 88.20% done; ETC: 05:01 (0:02:02 remaining)
UDP Scan Timing: About 93.26% done; ETC: 05:01 (0:01:10 remaining)
Completed UDP Scan at 05:02, 1079.00s elapsed (1000 total ports)
Nmap scan report for certifiedhacker.com (162.241.216.11)
Host is up (0.21s latency).
rDNS record for 162.241.216.11: box5331.bluehost.com
Not shown: 989 closed ports
PORT   STATE         SERVICE
2/udp  open|filtered compressnet
3/udp  open|filtered compressnet
7/udp  open|filtered echo
9/udp  open|filtered discard
13/udp open|filtered daytime
17/udp open|filtered qotd
19/udp open|filtered chargen
20/udp open|filtered ftp-data
21/udp open|filtered ftp
53/udp open          domain
68/udp open|filtered dhcpc

Read data files from: /usr/bin/../share/nmap
Nmap done: 1 IP address (1 host up) scanned in 1079.81 seconds
           Raw packets sent: 1455 (64.917KB) | Rcvd: 1068 (77.426KB)
```



## Use Fragmentation Scanning and Examine the Response

- Instead of just sending the probe packet, break it into a couple of small IP fragments
- You are splitting up the TCP header over several packets to make it harder for packet filters
  to detect what you are doing
- In NMAP, the -f switch instructs the specified SYN or FIN scan to use tiny fragmented packets
  

```
$nmap -sS -A -f certifiedhacker.com
Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-18 05:06 PST
Nmap scan report for certifiedhacker.com (162.241.216.11)
Host is up (0.21s latency).
rDNS record for 162.241.216.11: box5331.bluehost.com
Not shown: 983 closed ports
PORT     STATE    SERVICE     VERSION
21/tcp   open     ftp         Pure-FTPd
| ssl-cert: Subject: commonName=*.bluehost.com
| Subject Alternative Name: DNS:*.bluehost.com, DNS:bluehost.com
| Not valid before: 2021-01-28T00:00:00
|_Not valid after:  2022-01-28T23:59:59
22/tcp   open     ssh         OpenSSH 5.3 (protocol 2.0)
| ssh-hostkey: 
|   1024 56:07:68:de:0c:92:4f:b5:e0:1f:cc:0b:c3:ba:0a:2f (DSA)
|_  2048 c5:65:11:7c:5b:03:60:8e:be:13:1e:d9:b6:8d:80:ac (RSA)
25/tcp   filtered smtp
26/tcp   open     smtp        Exim smtpd 4.94.2
|_smtp-commands: Couldn't establish connection on port 26
53/tcp   open     domain      ISC BIND 9.8.2rc1 (RedHat Enterprise Linux 6)
| dns-nsid: 
|_  bind.version: 9.8.2rc1-RedHat-9.8.2-0.62.rc1.el6_9.4
80/tcp   open     http        Apache httpd
| http-server-header: 
|   Apache
|_  nginx/1.19.10
|_http-title: Certfied Hacker
110/tcp  open     pop3        Dovecot pop3d
|_pop3-capabilities: STLS PIPELINING SASL(PLAIN LOGIN) AUTH-RESP-CODE CAPA UIDL TOP USER RESP-CODES
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Not valid before: 2021-06-17T15:34:55
|_Not valid after:  2021-09-15T15:34:54
143/tcp  open     imap        Dovecot imapd
|_imap-capabilities: capabilities more LOGIN-REFERRALS SASL-IR ID IMAP4rev1 IDLE LITERAL+ post-login have ENABLE AUTH=LOGINA0001 NAMESPACE AUTH=PLAIN STARTTLS OK listed Pre-login
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Not valid before: 2021-06-17T15:34:55
|_Not valid after:  2021-09-15T15:34:54
443/tcp  open     ssl/http    Apache httpd
| http-server-header: 
|   Apache
|_  nginx/1.19.10
|_http-title: Certfied Hacker
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Not valid before: 2021-06-17T15:34:55
|_Not valid after:  2021-09-15T15:34:54
465/tcp  open     ssl/smtp    Exim smtpd 4.94.2
|_smtp-commands: Couldn't establish connection on port 465
587/tcp  open     smtp        Exim smtpd 4.94.2
| smtp-commands: box5331.bluehost.com Hello certifiedhacker.com [119.95.198.40], SIZE 52428800, 8BITMIME, PIPELINING, PIPE_CONNECT, AUTH PLAIN LOGIN, STARTTLS, HELP, 
|_ Commands supported: AUTH STARTTLS HELO EHLO MAIL RCPT DATA BDAT NOOP QUIT RSET HELP 
993/tcp  open     imaps?
|_imap-capabilities: capabilities more LOGIN-REFERRALS SASL-IR ID IMAP4rev1 IDLE NAMESPACE post-login have ENABLE AUTH=LOGINA0001 LITERAL+ AUTH=PLAIN OK listed Pre-login
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Not valid before: 2021-06-17T15:34:55
|_Not valid after:  2021-09-15T15:34:54
995/tcp  open     pop3s?
|_pop3-capabilities: RESP-CODES UIDL TOP USER PIPELINING SASL(PLAIN LOGIN) AUTH-RESP-CODE CAPA
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Not valid before: 2021-06-17T15:34:55
|_Not valid after:  2021-09-15T15:34:54
2222/tcp open     ssh         OpenSSH 5.3 (protocol 2.0)
| ssh-hostkey: 
|_  1024 56:07:68:de:0c:92:4f:b5:e0:1f:cc:0b:c3:ba:0a:2f (DSA)
2525/tcp filtered ms-v-worlds
3306/tcp open     mysql       MySQL 5.6.41-84.1
| mysql-info: 
|   Protocol: 10
|   Version: 5.6.41-84.1
|   Thread ID: 78663319
|   Capabilities flags: 65535
|   Some Capabilities: Support41Auth, IgnoreSpaceBeforeParenthesis, Speaks41ProtocolOld, SwitchToSSLAfterHandshake, IgnoreSigpipes, FoundRows, SupportsTransactions, ConnectWithDatabase, InteractiveClient, Speaks41ProtocolNew, SupportsLoadDataLocal, ODBCClient, LongPassword, LongColumnFlag, SupportsCompression, DontAllowDatabaseTableColumn, SupportsMultipleStatments, SupportsMultipleResults, SupportsAuthPlugins
|   Status: Autocommit
|   Salt: *;'RIX[AsA+R;n:sX>k"
|_  Auth Plugin Name: mysql_native_password
| ssl-cert: Subject: commonName=*.bluehost.com
| Subject Alternative Name: DNS:*.bluehost.com, DNS:bluehost.com
| Not valid before: 2021-01-28T00:00:00
|_Not valid after:  2022-01-28T23:59:59
|_ssl-date: 2021-08-17T09:09:55+00:00; -11h57m37s from scanner time.
5432/tcp open     postgresql  PostgreSQL DB
| fingerprint-strings: 
|   SMBProgNeg: 
|     SFATAL
|     C0A000
|     Munsupported frontend protocol 65363.19778: server supports 1.0 to 3.0
|     Fpostmaster.c
|     L1624
|_    RProcessStartupPacket
3 services unrecognized despite returning data. If you know the service/version, please submit the following fingerprints at https://nmap.org/cgi-bin/submit.cgi?new-service :
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port993-TCP:V=7.91%I=7%D=8/18%Time=611C24DE%P=x86_64-pc-linux-gnu%r(SSL
SF:v23SessionReq,5,"\x80\x03\0\0\x01");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port995-TCP:V=7.91%I=7%D=8/18%Time=611C24DE%P=x86_64-pc-linux-gnu%r(SSL
SF:v23SessionReq,5,"\x80\x03\0\0\x01");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port5432-TCP:V=7.91%I=7%D=8/18%Time=611C24DE%P=x86_64-pc-linux-gnu%r(SM
SF:BProgNeg,85,"E\0\0\0\x84SFATAL\0C0A000\0Munsupported\x20frontend\x20pro
SF:tocol\x2065363\.19778:\x20server\x20supports\x201\.0\x20to\x203\.0\0Fpo
SF:stmaster\.c\0L1624\0RProcessStartupPacket\0\0");
Device type: VoIP adapter
Running: Cisco embedded
OS CPE: cpe:/h:cisco:unified_call_manager
OS details: Cisco Unified Communications Manager VoIP adapter
Network Distance: 17 hops
Service Info: OS: Linux; CPE: cpe:/o:redhat:enterprise_linux:6

Host script results:
|_clock-skew: -11h57m37s

TRACEROUTE (using port 5900/tcp)
HOP RTT       ADDRESS
1   6.59 ms   192.168.101.2
2   17.33 ms  119.95.192.1.static.pldt.net (119.95.192.1)
3   25.17 ms  122.2.175.190.static.pldt.net (122.2.175.190)
4   23.11 ms  210.213.131.101.static.pldt.net (210.213.131.101)
5   173.06 ms 210.213.131.117.static.pldt.net (210.213.131.117)
6   173.69 ms ce-0-13-0-3.r01.lsanca07.us.bb.gin.ntt.net (168.143.228.168)
7   173.38 ms ae-6.r24.lsanca07.us.bb.gin.ntt.net (129.250.3.122)
8   202.24 ms ae-7.r20.dllstx14.us.bb.gin.ntt.net (129.250.7.68)
9   205.75 ms ae-14.r24.dllstx09.us.bb.gin.ntt.net (129.250.3.37)
10  202.41 ms ae-2.r11.dllstx09.us.bb.gin.ntt.net (129.250.5.14)
11  206.36 ms ae-9.r10.dllstx09.us.bb.gin.ntt.net (129.250.2.103)
12  201.09 ms xe-2-0-1.rtrn2.dal1.net.unifiedlayer.com (162.215.243.7)
13  236.16 ms 162-215-243-21.unifiedlayer.com (162.215.243.21)
14  211.31 ms 162-241-0-28.unifiedlayer.com (162.241.0.28)
15  211.34 ms po100.router2b.hou1.net.unifiedlayer.com (162.241.0.5)
16  210.32 ms po100.router2a.hou1.net.unifiedlayer.com (162.241.0.3)
17  203.34 ms box5331.bluehost.com (162.241.216.11)

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 79.28 seconds

```



## List open and closed ports

- Create a list of all the open ports identified in the previous step

- Open ports provide attack paths to intruders, and vulnerabilities in associated services can be exploited to compromise system security
- Once a port is closed, any request made to a machine via the closed port will result in a "this port is closed" acknowledgment from the machine

```
$nmap -T4 -A -v certifiedhacker.com
Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-18 05:15 PST
NSE: Loaded 153 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 05:15
Completed NSE at 05:15, 0.00s elapsed
Initiating NSE at 05:15
Completed NSE at 05:15, 0.00s elapsed
Initiating NSE at 05:15
Completed NSE at 05:15, 0.00s elapsed
Initiating Ping Scan at 05:15
Scanning certifiedhacker.com (162.241.216.11) [2 ports]
Completed Ping Scan at 05:15, 0.21s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 05:15
Completed Parallel DNS resolution of 1 host. at 05:15, 0.03s elapsed
Initiating Connect Scan at 05:15
Scanning certifiedhacker.com (162.241.216.11) [1000 ports]
Discovered open port 110/tcp on 162.241.216.11
Discovered open port 53/tcp on 162.241.216.11
Discovered open port 21/tcp on 162.241.216.11
Discovered open port 587/tcp on 162.241.216.11
Discovered open port 143/tcp on 162.241.216.11
Discovered open port 3306/tcp on 162.241.216.11
Discovered open port 995/tcp on 162.241.216.11
Discovered open port 993/tcp on 162.241.216.11
Discovered open port 80/tcp on 162.241.216.11
Discovered open port 443/tcp on 162.241.216.11
Discovered open port 22/tcp on 162.241.216.11
Discovered open port 5432/tcp on 162.241.216.11
Discovered open port 465/tcp on 162.241.216.11
Discovered open port 2222/tcp on 162.241.216.11
Discovered open port 26/tcp on 162.241.216.11
Completed Connect Scan at 05:15, 9.82s elapsed (1000 total ports)
Initiating Service scan at 05:15
Scanning 15 services on certifiedhacker.com (162.241.216.11)
Completed Service scan at 05:16, 40.02s elapsed (15 services on 1 host)
NSE: Script scanning 162.241.216.11.
Initiating NSE at 05:16
Completed NSE at 05:16, 10.80s elapsed
Initiating NSE at 05:16
Completed NSE at 05:16, 10.24s elapsed
Initiating NSE at 05:16
Completed NSE at 05:16, 0.02s elapsed
Nmap scan report for certifiedhacker.com (162.241.216.11)
Host is up (0.20s latency).
rDNS record for 162.241.216.11: box5331.bluehost.com
Not shown: 983 closed ports
PORT     STATE    SERVICE     VERSION
21/tcp   open     ftp         Pure-FTPd
| ssl-cert: Subject: commonName=*.bluehost.com
| Subject Alternative Name: DNS:*.bluehost.com, DNS:bluehost.com
| Issuer: commonName=Sectigo RSA Domain Validation Secure Server CA/organizationName=Sectigo Limited/stateOrProvinceName=Greater Manchester/countryName=GB
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-01-28T00:00:00
| Not valid after:  2022-01-28T23:59:59
| MD5:   e141 675f 28f8 3cb1 fdbc 1cff 5aae 2ff3
|_SHA-1: 1d40 533a cab2 8402 3f61 467f 5334 2bda 106c e451
22/tcp   open     ssh         OpenSSH 5.3 (protocol 2.0)
| ssh-hostkey: 
|_  1024 56:07:68:de:0c:92:4f:b5:e0:1f:cc:0b:c3:ba:0a:2f (DSA)
25/tcp   filtered smtp
26/tcp   open     smtp        Exim smtpd 4.94.2
| smtp-commands: box5331.bluehost.com Hello certifiedhacker.com [119.95.198.40], SIZE 52428800, 8BITMIME, PIPELINING, PIPE_CONNECT, AUTH PLAIN LOGIN, STARTTLS, HELP, 
|_ Commands supported: AUTH STARTTLS HELO EHLO MAIL RCPT DATA BDAT NOOP QUIT RSET HELP 
53/tcp   open     domain      ISC BIND 9.8.2rc1 (RedHat Enterprise Linux 6)
| dns-nsid: 
|_  bind.version: 9.8.2rc1-RedHat-9.8.2-0.62.rc1.el6_9.4
80/tcp   open     http        Apache httpd
|_http-favicon: Unknown favicon MD5: 629CCC774AED95B2C6BEC91151F7292D
| http-methods: 
|_  Supported Methods: GET POST OPTIONS HEAD
| http-server-header: 
|   Apache
|_  nginx/1.19.10
|_http-title: Certfied Hacker
110/tcp  open     pop3        Dovecot pop3d
|_pop3-capabilities: AUTH-RESP-CODE PIPELINING CAPA UIDL TOP STLS USER SASL(PLAIN LOGIN) RESP-CODES
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Issuer: commonName=R3/organizationName=Let's Encrypt/countryName=US
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-06-17T15:34:55![image-20210819064521765](images/image-20210819064521765.png)
| Not valid after:  2021-09-15T15:34:54
| MD5:   b5c1 e46b b193 d9fb 4d9c 36a4 2034 7e95
|_SHA-1: 5545 48da 0150 46f3 9730 f5ea 7ebf a6c4 5a66 08f3
143/tcp  open     imap        Dovecot imapd
|_imap-capabilities: NAMESPACE IDLE Pre-login AUTH=LOGINA0001 have ENABLE ID capabilities STARTTLS listed SASL-IR more AUTH=PLAIN OK post-login LOGIN-REFERRALS IMAP4rev1 LITERAL+
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Issuer: commonName=R3/organizationName=Let's Encrypt/countryName=US
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-06-17T15:34:55
| Not valid after:  2021-09-15T15:34:54
| MD5:   b5c1 e46b b193 d9fb 4d9c 36a4 2034 7e95
|_SHA-1: 5545 48da 0150 46f3 9730 f5ea 7ebf a6c4 5a66 08f3
443/tcp  open     ssl/http    Apache httpd
|_http-favicon: Unknown favicon MD5: 629CCC774AED95B2C6BEC91151F7292D
| http-methods: 
|_  Supported Methods: GET POST OPTIONS HEAD
| http-server-header: 
|   Apache
|_  nginx/1.19.10
|_http-title: Certfied Hacker
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Issuer: commonName=R3/organizationName=Let's Encrypt/countryName=US
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-06-17T15:34:55
| Not valid after:  2021-09-15T15:34:54
| MD5:   b5c1 e46b b193 d9fb 4d9c 36a4 2034 7e95
|_SHA-1: 5545 48da 0150 46f3 9730 f5ea 7ebf a6c4 5a66 08f3
465/tcp  open     ssl/smtp    Exim smtpd 4.94.2
| smtp-commands: box5331.bluehost.com Hello certifiedhacker.com [119.95.198.40], SIZE 52428800, 8BITMIME, PIPELINING, PIPE_CONNECT, AUTH PLAIN LOGIN, HELP, 
|_ Commands supported: AUTH HELO EHLO MAIL RCPT DATA BDAT NOOP QUIT RSET HELP 
587/tcp  open     smtp        Exim smtpd 4.94.2
| smtp-commands: box5331.bluehost.com Hello certifiedhacker.com [119.95.198.40], SIZE 52428800, 8BITMIME, PIPELINING, PIPE_CONNECT, AUTH PLAIN LOGIN, STARTTLS, HELP, 
|_ Commands supported: AUTH STARTTLS HELO EHLO MAIL RCPT DATA BDAT NOOP QUIT RSET HELP 
993/tcp  open     imaps?
|_imap-capabilities: NAMESPACE IDLE LOGIN-REFERRALS AUTH=LOGINA0001 have ENABLE ID capabilities listed SASL-IR more AUTH=PLAIN OK Pre-login IMAP4rev1 post-login LITERAL+
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Issuer: commonName=R3/organizationName=Let's Encrypt/countryName=US
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-06-17T15:34:55
| Not valid after:  2021-09-15T15:34:54
| MD5:   b5c1 e46b b193 d9fb 4d9c 36a4 2034 7e95
|_SHA-1: 5545 48da 0150 46f3 9730 f5ea 7ebf a6c4 5a66 08f3
995/tcp  open     pop3s?
|_pop3-capabilities: TOP PIPELINING SASL(PLAIN LOGIN) CAPA USER AUTH-RESP-CODE UIDL RESP-CODES
| ssl-cert: Subject: commonName=cpcalendars.certifiedhacker.com
| Subject Alternative Name: DNS:autodiscover.certifiedhacker.com, DNS:certifiedhacker.com, DNS:cpanel.certifiedhacker.com, DNS:cpcalendars.certifiedhacker.com, DNS:cpcontacts.certifiedhacker.com, DNS:mail.certifiedhacker.com, DNS:webdisk.certifiedhacker.com, DNS:webmail.certifiedhacker.com, DNS:www.certifiedhacker.com
| Issuer: commonName=R3/organizationName=Let's Encrypt/countryName=US
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-06-17T15:34:55
| Not valid after:  2021-09-15T15:34:54
| MD5:   b5c1 e46b b193 d9fb 4d9c 36a4 2034 7e95
|_SHA-1: 5545 48da 0150 46f3 9730 f5ea 7ebf a6c4 5a66 08f3
2222/tcp open     ssh         OpenSSH 5.3 (protocol 2.0)
| ssh-hostkey: 
|   1024 56:07:68:de:0c:92:4f:b5:e0:1f:cc:0b:c3:ba:0a:2f (DSA)
|_  2048 c5:65:11:7c:5b:03:60:8e:be:13:1e:d9:b6:8d:80:ac (RSA)
2525/tcp filtered ms-v-worlds
3306/tcp open     mysql       MySQL 5.6.41-84.1
| mysql-info: 
|   Protocol: 10
|   Version: 5.6.41-84.1
|   Thread ID: 78666805
|   Capabilities flags: 65535
|   Some Capabilities: Support41Auth, DontAllowDatabaseTableColumn, IgnoreSigpipes, InteractiveClient, ConnectWithDatabase, Speaks41ProtocolOld, SupportsTransactions, SwitchToSSLAfterHandshake, Speaks41ProtocolNew, LongPassword, IgnoreSpaceBeforeParenthesis, SupportsLoadDataLocal, LongColumnFlag, ODBCClient, FoundRows, SupportsCompression, SupportsMultipleResults, SupportsMultipleStatments, SupportsAuthPlugins
|   Status: Autocommit
|   Salt: iossi6nJe>CuD4toQ(r'
|_  Auth Plugin Name: mysql_native_password
| ssl-cert: Subject: commonName=*.bluehost.com
| Subject Alternative Name: DNS:*.bluehost.com, DNS:bluehost.com
| Issuer: commonName=Sectigo RSA Domain Validation Secure Server CA/organizationName=Sectigo Limited/stateOrProvinceName=Greater Manchester/countryName=GB
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2021-01-28T00:00:00
| Not valid after:  2022-01-28T23:59:59
| MD5:   e141 675f 28f8 3cb1 fdbc 1cff 5aae 2ff3
|_SHA-1: 1d40 533a cab2 8402 3f61 467f 5334 2bda 106c e451
|_ssl-date: 2021-08-17T09:19:18+00:00; -11h57m36s from scanner time.
5432/tcp open     postgresql  PostgreSQL DB
| fingerprint-strings: 
|   SMBProgNeg: 
|     SFATAL
|     C0A000
|     Munsupported frontend protocol 65363.19778: server supports 1.0 to 3.0
|     Fpostmaster.c
|     L1624
|_    RProcessStartupPacket
3 services unrecognized despite returning data. If you know the service/version, please submit the following fingerprints at https://nmap.org/cgi-bin/submit.cgi?new-service :
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port993-TCP:V=7.91%I=7%D=8/18%Time=611C2715%P=x86_64-pc-linux-gnu%r(SSL
SF:v23SessionReq,5,"\x80\x03\0\0\x01");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port995-TCP:V=7.91%I=7%D=8/18%Time=611C2715%P=x86_64-pc-linux-gnu%r(SSL
SF:v23SessionReq,5,"\x80\x03\0\0\x01");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port5432-TCP:V=7.91%I=7%D=8/18%Time=611C2715%P=x86_64-pc-linux-gnu%r(SM
SF:BProgNeg,85,"E\0\0\0\x84SFATAL\0C0A000\0Munsupported\x20frontend\x20pro
SF:tocol\x2065363\.19778:\x20server\x20supports\x201\.0\x20to\x203\.0\0Fpo
SF:stmaster\.c\0L1624\0RProcessStartupPacket\0\0");
Service Info: OS: Linux; CPE: cpe:/o:redhat:enterprise_linux:6

Host script results:
|_clock-skew: -11h57m36s

NSE: Script Post-scanning.
Initiating NSE at 05:16
Completed NSE at 05:16, 0.00s elapsed
Initiating NSE at 05:16
Completed NSE at 05:16, 0.00s elapsed
Initiating NSE at 05:16
Completed NSE at 05:16, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 72.23 seconds
```

## Fingertprint OS

### Active OS Fingerprinting:

- It refers to gathering OS information about the target with direct interaction

- To fingerprint target OS details, use following Nmap command

  ```
  # nmap -O -F certifiedhacker.com
  Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-18 18:27 PST
  Nmap scan report for certifiedhacker.com (162.241.216.11)
  Host is up (0.20s latency).
  rDNS record for 162.241.216.11: box5331.bluehost.com
  Not shown: 85 closed ports
  PORT     STATE    SERVICE
  21/tcp   open     ftp
  22/tcp   open     ssh
  25/tcp   filtered smtp
  26/tcp   open     rsftp
  53/tcp   open     domain
  80/tcp   open     http
  110/tcp  open     pop3
  143/tcp  open     imap
  443/tcp  open     https
  465/tcp  open     smtps
  587/tcp  open     submission
  993/tcp  open     imaps
  995/tcp  open     pop3s
  [sudo] password for sherwinowen: 3306/tcp open     mysql
  5432/tcp open     postgresql
  OS details: Cisco Unified Communications Manager VoIP adapter, Android 7.1.2 (Linux 3.10), DD-WRT v23 (Linux 2.4.36), Vyatta router (Linux 2.6.26), Linux 2.6.18, MikroTik RouterOS 5.25 (Linux 2.6.35), Netgear ReadyNAS Duo NAS device (RAIDiator 4.1.4)
  Network Distance: 17 hops
  
  OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
  Nmap done: 1 IP address (1 host up) scanned in 8.05 seconds
  ```

  

### Passive OS Fingerprinting:

- It refers to gathering OS information about a target without direct interaction
- Use Netcraft to find information about OSes of web servers

https://www.netcraft.com/

![image-20210817170343740](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210817170343740.png)

## Examine the Patches Applied to the Target OS

Source: https://uptime.netcraft.com

Patch is a piece of code used as temporary fixes for software vulnerabilities. Developers use patches to protect and update their products, which include software applications, OSs, database management software, web browsers, and so on.

Scanning the device patches will help you to find if the organization has enabled automatic update for all the devices and find missing patches on devices. You must scan the network for patches related to the OS, web servers, and applications running on the devices. List the dates for patches applied to the server. Look for the version number, OS level, and date. The device not updated with recent patches will have vulnerabilities and the testers can exploit them to escalate privileges. You can use tools like Netcraft to perform this operation.


![image-20210817171528129](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210817171528129.png)



## Fingerprint the Services

- Service fingerprinting is performed to determine services running on various port and their versions

- To perform service fingerprint use the following command

  nmap -sV <target

- You can use the following Nmap's switches to detect services more aggressively:

  - -sV or -A
  - --version-light
  - --version-all
  - --version-intesity

```
#nmap -sV -T4 -F certifiedhacker.com
Starting Nmap 7.91 ( https://nmap.org ) at 2021-08-18 18:37 PST
Nmap scan report for certifiedhacker.com (162.241.216.11)
Host is up (0.26s latency).
rDNS record for 162.241.216.11: box5331.bluehost.com
Not shown: 85 closed ports
PORT     STATE    SERVICE    VERSION
21/tcp   open     ftp        Pure-FTPd
22/tcp   open     ssh        OpenSSH 5.3 (protocol 2.0)
25/tcp   filtered smtp
26/tcp   open     smtp       Exim smtpd 4.94.2
53/tcp   open     domain     ISC BIND 9.8.2rc1 (RedHat Enterprise Linux 6)
80/tcp   open     http       Apache httpd
110/tcp  open     pop3       Dovecot pop3d
143/tcp  open     imap       Dovecot imapd
443/tcp  open     ssl/http   Apache httpd
465/tcp  open     smtps?
587/tcp  open     smtp       Exim smtpd 4.94.2
993/tcp  open     imaps?
995/tcp  open     pop3s?
3306/tcp open     mysql      MySQL 5.6.41-84.1
5432/tcp open     postgresql PostgreSQL DB
3 services unrecognized despite returning data. If you know the service/version, please submit the following fingerprints at https://nmap.org/cgi-bin/submit.cgi?new-service :
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port993-TCP:V=7.91%I=7%D=8/18%Time=611CE2E6%P=x86_64-pc-linux-gnu%r(SSL
SF:v23SessionReq,5,"\x80\x03\0\0\x01");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port995-TCP:V=7.91%I=7%D=8/18%Time=611CE2E6%P=x86_64-pc-linux-gnu%r(SSL
SF:v23SessionReq,5,"\x80\x03\0\0\x01");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port5432-TCP:V=7.91%I=7%D=8/18%Time=611CE2E6%P=x86_64-pc-linux-gnu%r(SM
SF:BProgNeg,85,"E\0\0\0\x84SFATAL\0C0A000\0Munsupported\x20frontend\x20pro
SF:tocol\x2065363\.19778:\x20server\x20supports\x201\.0\x20to\x203\.0\0Fpo
SF:stmaster\.c\0L1624\0RProcessStartupPacket\0\0");
Service Info: OS: Linux; CPE: cpe:/o:redhat:enterprise_linux:6

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 46.72 seconds
```

### Fingerprinting tools to grab banners from service

- **httprint**
  Source: http://www.net-square.com

  https://net-square.com/httprint.html

  hittprint is a fingerprinting tool that relies on web server characteristics to identify web servers and also detect devices which have no server banner string, This tool uses text signature strings and the signatures are added to the database easily.

  ![image-20210818065146858](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210818065146858.png)

 

* **ID Serve**
  Source: https://www.grc.com

  https://www.grc.com/id/idserve.htm

  ID Serve is an open source fingerprinting tool for examining the functioning of the web
  server. This also provides information about the services of the server and reveals
  cookie values and reverse DNS information.

  ![image-20210818065241959](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210818065241959.png)

## Vulnerabilty Research

### External Vulnerability Assessment

- involves idenbtifying the vulnerabilities in operation systems, devices, applications on the internet-facing hosts

## Search and Map the Target with the Associated Security Vulnerabilities

Mapping the service versions of an organization will help the tester in identifying the applications and servers used for running the services along with their versions. This information will help in finding the known vulnerabilities related to the servers and applications and exploit them to gain access to the network.

**Use the following to map the service version with the associated security vulnerabilities:**

- **Google hacking database**

  https://www.exploit-db.com/google-hacking-database

  Google hacking database is a database of queries. Penetration testers are using Google hacking database to identify exploitable targets and sensitive data using search engines. Search on Google, vulnerabilities related to specific version make and model of service, devices or OS running on target. The following types of information can be identified through Google hacking database:

  - Advisories and server vulnerabilities

  - Error messages that contain too much information

  - Files containing passwords

  - Sensitive directories

  - Pages containing sign-in portals

  - Pages containing network of vulnerability data such as firewall logs

- **National vulnerability database**

  https://nvd.nist.gov/

  The national vulnerability database is the US government repository of standards-based vulnerability management data represented using the security content automation protocol. It integrates publicly available US government vulnerability resources and provides references to industry resources via
  web search capability, and through XML, RSS, and web service feeds. It allows automation of vulnerability management, security measurement, and compliance. Moreover, NVD stores databases of security checklist references, security-related software flaws, misconfigurations, product names, and impact metrics.

- **Exploit database** 

  https://www.exploit-db.com/

  Penetration testers and vulnerability researchers use exploit database to gather information related to public exploits and corresponding vulnerable software.   It collects information through direct submissions, mailing lists, and other public sources  and represents them in a proper manner. The exploit database stores information about   exploits and proof of concepts instead of advisories.

- **CVE details**

  https://www.cvedetails.com/

  Offers simple and easy to use web interface to CVE vulnerability data. Using this, penetration testers can search for vendors, products, and versions and observe related CVE entries and weaknesses. They can also see statistics about vendors, products, and their versions.

  

## Find Out the Security Vulnerability Exploits

You can use the following ways to find out the exploits related to a specific security vulnerability:

- **Exploit database**

  Source: https://www.exploit-db.com

  It contains a huge bunch of public exploits and their related vulnerabilities, where a penetration tester could search for any exploit to use in his/her tests. The tester could use this database for free of cost and they could submit exploits and vulnerabilities identified by them.

- **Searchsploit**

  It is a command-line utility where a penetration tester could use to identify exploits and vulnerabilities from the exploit database in off-line mode.

  ```
  searchsploit -t Windows Server 2008
  ------------------------------------------------------------------------------------ ---------------------------------
   Exploit Title                                                                      |  Path
  ------------------------------------------------------------------------------------ ---------------------------------
  Autodesk Backburner Manager 3 < 2016.0.0.2150 - Null Dereference Denial of Service  | windows/dos/41160.py
  FileRun < 2017.09.18 - SQL Injection                                                | php/webapps/42922.py
  Intuit QuickBooks Desktop 2007 < 2016 - Arbitrary Code Execution                    | windows/local/39804.txt
  ManageEngine Desktop Central 8.0.0 build < 80293 - Arbitrary File Upload            | jsp/webapps/29674.txt
  Microsoft Windows 7 < 10 / 2008 < 2012 (x86/x64) - Local Privilege Escalation (MS16 | windows/local/39809.cs
  Microsoft Windows 7 < 10 / 2008 < 2012 (x86/x64) - Secondary Logon Handle Privilege | windows/local/40107.rb
  Microsoft Windows 7 < 10 / 2008 < 2012 R2 (x86/x64) - Local Privilege Escalation (M | windows/local/39719.ps1
  Microsoft Windows Server 2000 < 2008 - Embedded OpenType Font Engine Remote Code Ex | windows/dos/10068.rb
  Microsoft Windows Server 2008 R1 - Local Denial of Service                          | windows/dos/17796.txt
  Microsoft Windows Server 2008 R2 (x64) - 'SrvOs2FeaToNt' SMB Remote Code Execution  | windows_x86-64/remote/41987.py
  Microsoft Windows Server 2008/2012 - LDAP RootDSE Netlogon Denial of Service        | windows/dos/40703.pl
  MuPDF < 20091125231942 - 'pdf_shade4.c' Multiple Stack Buffer Overflows             | windows/local/10244.txt
  NProtect Anti-Virus 2007 < 2010.5.11.1 - Local Privilege Escalation                 | windows/local/15762.txt
  SureMDM < 2018-11 Patch - Local / Remote File Inclusion                             | windows/webapps/46305.txt
  ViRobot Desktop 5.5 and Server 3.5 < 2008.8.1.1 - Local Privilege Escalation        | windows/local/15764.txt
  WPS Office < 2016 - '.doc' OneTableDocumentStream Memory Corruption                 | windows/dos/39396.txt
  WPS Office < 2016 - '.ppt' drawingContainer Memory Corruption                       | windows/dos/39397.txt
  WPS Office < 2016 - '.ppt' Heap Memory Corruption                                   | windows/dos/39395.txt
  WPS Office < 2016 - '.xls' Heap Memory Corruption                                   | windows/dos/39398.txt
  xt:Commerce Gambio 2008 < 2010 - 'reviews.php' Error-Based SQL Injection            | php/webapps/15039.txt
  Zoho ManageEngine ADManager Plus 6.6 (Build < 6659) - Privilege Escalation          | windows/local/46707.txt
  Zoho ManageEngine ADSelfService Plus 5.7 < 5702 build - Cross-Site Scripting        | php/webapps/46815.txt
  ------------------------------------------------------------------------------------ ---------------------------------
  Shellcodes: No Results
  ```

## Exploit Verification

**Run the Exploits against Identified Vulnerabilities**

After identifying the vulnerabilities in the client's network, you should try to exploit and check whether these vulnerabilities in services, OS or devices have the potential to exploit. The following example shows the exploitation of vulnerabilities of the server message block (SMB) in Windows 7 Ultimate:

**Exploiting SMB vulnerability in Windows 7 Ultimate**

The SMB is a protocol for allowing the computers in a network to access files, printers, and other resources. The SMB server use TCP port 445 for providing accessibility services to the computers.

Initially, you should identify the open ports in the target host using the following Nmap command:

```
nmap -T4 -A -sV <target-host>
```

![image-20210818085045907](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210818085045907.png)

From the above figure, you should know that port 445 (SMB) is open and listening to the traffic from outside.

The SMBv1 provides information about the system to the users without proper authentication. The following Nmap command is used for obtaining system information:

```
nmap --script=smb-os-discovery -p 445 <target-host>
```

![image-20210818085255223](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210818085255223.png)

The attackers use the vulnerabilities in the SMB server and send specially crafted messages to SMBv1 to compromise it. This allows the attacker to perform remote code execution on the target host without proper authentication.

**Microsoft Windows -SMB Remote Code Execution Scanner (MS17-010)**

![image-20210818085540339](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210818085540339.png)

You can use this vulnerability and check whether the target client host is vulnerable or if MS17-010 has been patched. You should open the terminal and open Metasploit framework using the command msfconsole. Use the auxiliary module in the Metasploit framework to create quick vulnerability scan on SMB using the following command:

```
use axliary/scanner/smb/smb_ms17_010

# In the auxiliary module, you need to set the remote host using the following command:
set rhosts <host-ip-address>
```

![image-20210818085719894](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210818085719894.png)

![image-20210818085751228](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210818085751228.png)

From the above figure, it is clear that the host is vulnerable to MS17-010. Now, you need to try to exploit the host using this vulnerability using the following steps:

- Search for the exploit in any search engine and copy the exploit name.

![image-20210818090053575](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210818090053575.png)

* From the msfconsole, use the command as shown in the figure below:

Here, you paste the copied exploit name and press enter key to see the options available to exploit the target host.

![image-20210818090154219](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210818090154219.png)

![image-20210818090407212](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210818090407212.png)

## Document the Result

You must document all the results including:

- The list of open ports, OS, services, and their versions

- The ports and services through which exploitation could be possible
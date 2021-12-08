[TOC]



# Network VAPT Playbook

## 1. 

### Host Discovery

- to find live hosts

1. **Nmap**

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

2. **Netdiscover**

   ```
   #netdiscover -i eth0 -p 
   Currently scanning: (passive)   |   Screen View: Unique Hosts                                                       
                                                                                                                        
    87 Captured ARP Req/Rep packets, from 12 hosts.   Total size: 5256                                                  
    _____________________________________________________________________________
      IP            At MAC Address     Count     Len  MAC Vendor / Hostname      
    -----------------------------------------------------------------------------
    192.168.101.3   3c:84:6a:a7:eb:b0     43    2580  TP-LINK TECHNOLOGIES CO.,LTD.                                                                       
    192.168.101.102 c8:94:bb:65:d2:79     13     816  HUAWEI TECHNOLOGIES CO.,LTD                                       
    192.168.101.122 18:db:f2:39:6a:b3      2     120  Dell Inc.                                                         
    192.168.101.100 28:6d:cd:4f:8a:c6      3     180  Beijing Winner Microelectronics Co.,Ltd.                          
    192.168.101.103 28:6d:cd:4f:88:e7      2     120  Beijing Winner Microelectronics Co.,Ltd.                          
    192.168.101.101 28:6d:cd:4e:45:8a      2     120  Beijing Winner Microelectronics Co.,Ltd.                          
    192.168.101.110 9a:bf:56:62:f7:fe      8     480  Unknown vendor                                                            
    192.168.101.114 7c:91:22:2b:0e:1a      2     120  Samsung Electronics Co.,Ltd                                       
    192.168.101.105 28:cf:e9:7d:ff:17      2     120  Apple, Inc.         
   ```

### Port Scanning

- to find open ports and services running

1. Nmap

   - Banner Grabbing/Service Enumeration

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

   

### Enumeration

- to collect additional information about the open port and services

## Vulnerability Assesment

1. Nessus
2. OpenVAS
3. Acunetix
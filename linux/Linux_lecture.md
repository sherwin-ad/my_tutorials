# Linux



## Check user’s login history

###  Difference between pts and tty

You may have seen `pts` and `tty` values in the who command output and the below explanation will show the difference between them.

- A tty stands for **TeleTYpe** is a native terminal device (It could be a server/system console).
- A pty (pseudo terminal device) is a terminal device that is emulated by another program such as putty, xterm or screen, etc,.

### Method 1

1. Checking login history of all logged users in Linux

   Run the **‘last’** command without any arguments to view the history of all the successful login in the system.

   If it has a lot of values, use `less` or `more` command to view them page wise.

   ```
   root@lappserver:~# last -20
   root     pts/0        192.168.69.254   Tue May 11 08:39   still logged in
   LaraAdmi pts/1        192.168.36.5     Mon May 10 15:39 - 16:34  (00:55)
   LaraAdmi pts/2        192.168.36.9     Mon May 10 14:16 - 15:17  (01:01)
   root     pts/0        192.168.69.254   Mon May 10 12:12 - 08:39  (20:26)
   LaraAdmi pts/1        192.168.36.5     Mon May 10 10:10 - 15:24  (05:13)
   LaraAdmi pts/0        192.168.36.5     Mon May 10 07:59 - 11:52  (03:53)
   LaraAdmi pts/0        192.168.36.9     Fri May  7 16:01 - 16:10  (00:08)
   LaraAdmi pts/1        192.168.36.5     Fri May  7 13:22 - 18:07  (04:44)
   LaraAdmi pts/0        192.168.36.5     Fri May  7 08:17 - 14:28  (06:11)
   LaraAdmi pts/1        192.168.36.5     Thu May  6 16:59 - 17:13  (00:13)
   LaraAdmi pts/0        192.168.36.5     Thu May  6 13:38 - 17:54  (04:15)
   LaraAdmi pts/0        192.168.36.5     Thu May  6 09:29 - 12:42  (03:12)
   LaraAdmi pts/1        192.168.36.5     Thu May  6 09:13 - 11:27  (02:13)
   LaraAdmi pts/0        192.168.36.5     Thu May  6 06:01 - 09:14  (03:13)
   LaraAdmi pts/0        192.168.36.5     Wed May  5 08:16 - 19:52  (11:35)
   LaraAdmi pts/2        192.168.36.9     Tue May  4 12:57 - 16:27  (03:29)
   LaraAdmi pts/1        192.168.36.9     Tue May  4 12:25 - 16:27  (04:02)
   LaraAdmi pts/0        192.168.36.5     Tue May  4 10:51 - 14:25  (03:34)
   LaraAdmi pts/0        192.168.36.5     Tue May  4 10:30 - 10:51  (00:21)
   LaraAdmi pts/1        192.168.36.5     Mon May  3 15:57 - 16:46  (00:48)
   ```

   

2. Checking login history for a particular user
   If you want to see the history of a particular user, use the below command. Replace **‘user_name’** with the desired username you want to verify.

   ```
   root@lappserver:~# last LaraAdmin
   LaraAdmi pts/1        192.168.36.5     Mon May 10 15:39 - 16:34  (00:55)
   LaraAdmi pts/2        192.168.36.9     Mon May 10 14:16 - 15:17  (01:01)
   LaraAdmi pts/1        192.168.36.5     Mon May 10 10:10 - 15:24  (05:13)
   LaraAdmi pts/0        192.168.36.5     Mon May 10 07:59 - 11:52  (03:53)
   LaraAdmi pts/0        192.168.36.9     Fri May  7 16:01 - 16:10  (00:08)
   LaraAdmi pts/1        192.168.36.5     Fri May  7 13:22 - 18:07  (04:44)
   LaraAdmi pts/0        192.168.36.5     Fri May  7 08:17 - 14:28  (06:11)
   LaraAdmi pts/1        192.168.36.5     Thu May  6 16:59 - 17:13  (00:13)
   LaraAdmi pts/0        192.168.36.5     Thu May  6 13:38 - 17:54  (04:15)
   LaraAdmi pts/0        192.168.36.5     Thu May  6 09:29 - 12:42  (03:12)
   LaraAdmi pts/1        192.168.36.5     Thu May  6 09:13 - 11:27  (02:13)
   LaraAdmi pts/0        192.168.36.5     Thu May  6 06:01 - 09:14  (03:13)
   LaraAdmi pts/0        192.168.36.5     Wed May  5 08:16 - 19:52  (11:35)
   LaraAdmi pts/2        192.168.36.9     Tue May  4 12:57 - 16:27  (03:29)
   LaraAdmi pts/1        192.168.36.9     Tue May  4 12:25 - 16:27  (04:02)
   LaraAdmi pts/0        192.168.36.5     Tue May  4 10:51 - 14:25  (03:34)
   LaraAdmi pts/0        192.168.36.5     Tue May  4 10:30 - 10:51  (00:21)
   LaraAdmi pts/1        192.168.36.5     Mon May  3 15:57 - 16:46  (00:48)
   LaraAdmi pts/0        192.168.36.9     Mon May  3 14:55 - 17:10  (02:14)
   LaraAdmi pts/0        192.168.36.5     Mon May  3 11:53 - 14:32  (02:38)
   
   ```

3.  How to check login history for a particular period in Linux?

   If you want to verify who has been logged into the system for a particular period of time, use the following format.

   ```
   #  last -F | grep -E 'Mar ([ 1-9]|1[0-9]|2[0-9]|30)' | grep 2019
   
   daygeek  pts/0        192.168.1.6      Sat Mar 30 04:14:54 2019 - Sat Mar 30 11:21:57 2019  (07:07)    
   reboot   system boot  3.10.0-957.el7.x Sat Mar 30 04:03:20 2019 - Wed Apr  3 00:09:13 2019 (3+20:05)   
   ladmin   pts/2        192.168.1.6      Fri Mar 29 02:19:13 2019 - Fri Mar 29 04:30:25 2019  (02:11)    
   user2    pts/2        192.168.1.6      Fri Mar 29 02:10:38 2019 - Fri Mar 29 02:10:50 2019  (00:00)    
   user1    pts/2        192.168.1.6      Fri Mar 29 02:10:22 2019 - Fri Mar 29 02:10:30 2019  (00:00)    
   user3    pts/2        192.168.1.6      Fri Mar 29 02:01:13 2019 - Fri Mar 29 02:10:01 2019  (00:08)    
   daygeek  pts/1        192.168.1.6      Fri Mar 29 01:48:21 2019 - crash                    (1+02:14)   
   root     pts/0        192.168.1.3      Tue Mar 19 02:49:09 2019 - Tue Mar 19 02:50:25 2019  (00:01)    
   daygeek  pts/0        192.168.1.6      Tue Mar 19 02:36:14 2019 - Tue Mar 19 02:45:25 2019  (00:09)    
   reboot   system boot  3.10.0-957.el7.x Tue Mar 19 02:33:54 2019 - Wed Apr  3 00:09:13 2019 (14+21:35)  
   ```

   If you want to verify that a given user has been logged into the system for a period of time, use the following format.

   ```
   # last -F root | grep -E 'Mar ([ 1-9]|1[0-9]|2[0-9]|30)' | grep 2019
   
   root     pts/0        192.168.1.3      Tue Mar 19 02:49:09 2019 - Tue Mar 19 02:50:25 2019  (00:01)    
   root     pts/0        192.168.1.6      Tue Mar 19 02:45:46 2019 - Tue Mar 19 02:46:09 2019  (00:00)    
   root     pts/1        192.168.1.3      Mon Mar 18 18:29:18 2019 - Mon Mar 18 18:29:25 2019  (00:00)    
   root     pts/1        192.168.1.3      Mon Mar 18 16:22:53 2019 - Mon Mar 18 16:23:06 2019  (00:00)    
   root     pts/3        192.168.1.7      Mon Mar 18 16:21:38 2019 - Mon Mar 18 16:21:40 2019  (00:00)    
   root     pts/0        192.168.1.6      Fri Mar 15 01:45:10 2019 - down                      (00:01)    
   ```

4.  Checking login history based on a terminal connected

   If you want to check the users based on the terminal connected. Use the following format.

   ```
    # last pts/2
   LaraAdmi pts/2        192.168.36.9     Mon May 10 14:16 - 15:17  (01:01)
   LaraAdmi pts/2        192.168.36.9     Tue May  4 12:57 - 16:27  (03:29)
   ```

5. How to check bad login history in Linux?

   **lastb** command is used to check the user’s bad login history in Linux. It can also be used to view details from their archived files.

   ```
   # lastb
   
   # lastb -f /var/log/btmp-20190402
   
   user1    ssh:notty    192.168.1.6      Fri Mar 29 02:17 - 02:17  (00:00)    
   ladmin   ssh:notty    192.168.1.6      Fri Mar 29 02:12 - 02:12  (00:00)    
   user2    ssh:notty    192.168.1.6      Fri Mar 29 02:00 - 02:00  (00:00)    
   user1    ssh:notty    192.168.1.6      Fri Mar 29 01:53 - 01:53  (00:00)    
   daygeekk ssh:notty    192.168.1.6      Tue Mar 19 02:36 - 02:36  (00:00)    
   root     ssh:notty    192.168.1.3      Mon Mar 18 18:05 - 18:05  (00:00)    
   root     pts/1                         Mon Mar 18 16:00 - 16:00  (00:00)    
   root     ssh:notty    192.168.1.6      Sun Mar 10 10:15 - 10:15  (00:00)    
   
   btmp-20190402 begins Sun Mar 10 10:15:14 2020
   ```

   Execute the following command to suppress the **[hostname](https://www.2daygeek.com/10-methods-to-check-view-the-hostname-in-linux/)** information in the output.

   ```
   # last -10 -R
   
   daygeek  pts/0        Wed Apr  3 00:02   still logged in   
   reboot   system boot  Tue Apr  2 23:50 - 00:29  (00:38)    
   reboot   system boot  Tue Apr  2 06:00 - 00:29  (18:29)    
   daygeek  pts/1        Sat Mar 30 10:05 - 00:18  (14:13)    
   reboot   system boot  Sat Mar 30 04:03 - 00:29 (3+20:25)   
   ladmin   pts/2        Fri Mar 29 02:19 - 04:30  (02:11)    
   user2    pts/2        Fri Mar 29 02:10 - 02:10  (00:00)    
   user1    pts/2        Fri Mar 29 02:10 - 02:10  (00:00)
   
   wtmp begins Fri Feb 15 16:03:13 2020
   ```

   Display full user and domain names in the output.

   ```
   # last -10 -w
   ```

   ### Method2 Checking login history using the log files
   
   Users can manually view the login history from the following log files which containing success, failure and bad login.
   
   - **/var/log/secure** – Red Hat based systems
   - **/var/log/auth.log** – Debian based systems
   
   Use the below format to check successful login details on RHEL, CentOS, Oracle Linux and Fedora systems.
   
   ```
   # cat /var/log/secure-20190331 | grep Accepted | awk '{print $1,$2,$3,$9}'
   
   Mar 29 01:38:41 daygeek
   Mar 29 01:48:21 daygeek
   Mar 29 02:01:13 user3
   Mar 29 02:10:21 user1
   Mar 29 02:10:38 user2
   Mar 29 02:19:13 ladmin
   Mar 30 04:14:54 daygeek
   Mar 30 10:05:02 daygeek
   ```
   
   Use the below format for failed attempts.
   
   ```
   # cat /var/log/secure-20190331 | grep Failed | awk '{print $1,$2,$3,$11}'
   
   Mar 29 01:53:48 user1
   Mar 29 02:00:43 user2
   Mar 29 02:12:58 ladmin
   Mar 29 02:17:41 user1
   ```
   
   Use the below format to check successful and failed login details on Debian and Ubuntu systems.
   
   ```
   # cat /var/log/auth.log | grep Accepted | awk '{print $1,$2,$3,$9}'
   # cat /var/log/auth.log | grep Failed | awk '{print $1,$2,$3,$9}'
   ```
   
   ## Method-3: Checking login history using lastlog command
   
   The **lastlog** command reports the user’s last login information by retrieving the details from the **‘/var/log/lastlog’** file.
   
   ```
   root@lappserver:~# lastlog
   Username         Port     From             Latest
   root             pts/0    192.168.69.254   Tue May 11 08:39:12 +0800 2021
   daemon                                     **Never logged in**
   bin                                        **Never logged in**
   sys                                        **Never logged in**
   sync                                       **Never logged in**
   games                                      **Never logged in**
   man                                        **Never logged in**
   lp                                         **Never logged in**
   mail                                       **Never logged in**
   news                                       **Never logged in**
   uucp                                       **Never logged in**
   proxy                                      **Never logged in**
   www-data                                   **Never logged in**
   backup                                     **Never logged in**
   list                                       **Never logged in**
   irc                                        **Never logged in**
   gnats                                      **Never logged in**
   nobody                                     **Never logged in**
   systemd-network                            **Never logged in**
   systemd-resolve                            **Never logged in**
   syslog                                     **Never logged in**
   messagebus                                 **Never logged in**
   _apt                                       **Never logged in**
   lxd                                        **Never logged in**
   uuidd                                      **Never logged in**
   dnsmasq                                    **Never logged in**
   landscape                                  **Never logged in**
   pollinate                                  **Never logged in**
   sshd                                       **Never logged in**
   hosttel          pts/0    192.168.69.246   Thu Nov 21 20:33:18 +0800 2019
   redis                                      **Never logged in**
   LaraAdmin        pts/1    192.168.36.5     Mon May 10 15:39:41 +0800 2021
   ftp                                        **Never logged in**
   vijeshftp                                  **Never logged in**
   statd                                      **Never logged in**
   Debian-snmp                                **Never logged in**
   dylanb           pts/0    192.168.36.16    Sun Mar 28 10:52:43 +0800 2021
   cp-schema-registry                           **Never logged in**
   cp-ksql                                    **Never logged in**
   cp-kafka-rest                              **Never logged in**
   
   ```
   
   





````
sudo cat hi
exit
ls
top
ifconfig

ifconfig | grep ient
ifconfig | grep inet
sudo su
strace -p 4724
sudo strace -p 4724
sudo strace -p 4724 | grep Select
sudo strace -p 4724
sudo strace -p 4724 | grep Select
sudo strace -p 4724 | grep sendto\(7
netstat -anp | grep sync
sudo 'netstat -anp | grep sync'
sudo su
top
top -c
strace -p 2526
top -c | grep sync
top -c
ps aux | grep sync
watch -n1 'ps aux | grep sync'
top
watch -n1 'ps aux | grep sync'
top -c
ps aux | grep sync
ps aux | grep node
ps aux | grep sync
ps aux | top
ps aux
ps aux | grep php
ps aux | grep php -c
top -c
ps aux
ps aux | grep sync
top
top -c
top -c | grep php
ps aux | grep php
ps aux | grep sync
watch -n1 'ps aux | grep sync'
top
sudo su
exit
top
echo $TERM
top
strace -p 17585
sudo strace -p 17585
ps aux | grep php
sudo strace -p 17585
top
man rg
strace -p 18437
sudo strace -p 18437
ps aux
ls /usr/local/bin
nano /usr/local/bin/update-public
nano /usr/local/bin/update-hosttel
sudo su
ps aux
cd /var/www/html/my
grep QRCode * -R
nano app/Http/Controllers/API/ClientController.php
sudo su
ls -la
sudo su
top
ps aux | grep asterisk
top -c php7.4
top -c --help php7.4
top --help
man top
pidof php7.4
$(pidof php7.4)
top -c $(pidof php7.4)
top -c pidof php7.4
top -c `pidof php7.4`
echo `pidof php7.4
`
echo `pidof php7.4`
echo `pidof php7.4` | top -c
pidof php7.4 | top -c
top --help
top -p `pidof php7.4`
top -p28370
ps aux | grep asterisk wa
ps aux | grep asteriskwa
ps aux | grep asteriskwa$
awk '{print $1}' `ps aux | grep asteriskwa$`
awk '{print $1}' 'ps aux | grep asteriskwa$'
ps aux | grep asteriskwa$ | awk '{print $1;}'
ps aux | grep asteriskwa$ | awk '{print $2;}'
ps aux | grep asteriskwa$ | awk '{print $2}'
ps aux | grep asteriskwa$ | awk '{print $2}' | top -p
ps aux | grep asteriskwa$ | awk '{print $2}' | top -p -
ps aux | grep asteriskwa$ | awk '{print $2}'
`ps aux | grep asteriskwa$ | awk '{print $2}'`
top -p `ps aux | grep asteriskwa$ | awk '{print $2}'`
top -H -p `ps aux | grep asteriskwa$ | awk '{print $2}'`
strace -p `ps aux | grep asteriskwa$ | awk '{print $2}'`
sudo strace -p `ps aux | grep asteriskwa$ | awk '{print $2}'`
sudo strace -p `ps aux | grep asteriskwa$ | awk '{print $2}'` -e sendto,recvfrom
top
ssh root@192.168.69.42
ssh root@192.168.69.72
ssh root@192.168.69.74
cd /var/www
ls
cd html
ls
cd admin-portal
ls
sudo ssh root@wa
ls -la
tcpdump --help
#sudo tcpdump -w ~/phone 'host 192.168.31.224' -i ens192
ip l
sudo tcpdump -w ~/phone 'host 192.168.31.224' -i ens192
sudo tcpdump -w ~/phone 'host 192.168.31.224' -i any
sudo su
top
````


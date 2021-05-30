[TOC]



# Cisco Configuration

## Setup Hostname

```
Switch(config)# hostname access-switch1
```

## Assign a Password to the Switch

```
access-switch1(config)# enable secret somestrongpass
```

## **Configure a password for Telnet and Console access**

```
access-switch1(config)# line vty 0 15
access-switch1(config-line)# password strongtelnetpass
access-switch1(config-line)# login
access-switch1(config-line)# exit
access-switch1(config)#

access-switch1(config)# line console 0
access-switch1(config-line)# password strongconsolepass
access-switch1(config-line)# login
access-switch1(config-line)# exit
access-switch1(config)#
```

## **Define which IP addresses are allowed to access the switch via Telnet**

````
access-switch1(config)# ip access-list standard TELNET-ACCESS
access-switch1(config-std-nacl)# permit 10.1.1.100
access-switch1(config-std-nacl)# permit 10.1.1.101
access-switch1(config-std-nacl)# exit

!Apply the access list to Telnet VTY Lines
access-switch1(config)# line vty 0 15
access-switch1(config-line)# access-class TELNET-ACCESS in
access-switch1(config-line)# exit
access-switch1(config)#
````



## **Assign IP address to the switch for management**

```
!Management IP is assigned to Vlan 1 by default
access-switch1(config)# interface vlan 1
access-switch1(config-if)# ip address 10.1.1.200 255.255.255.0
access-switch1(config-if)# exit
access-switch1(config)#
```



## **Assign default gateway to the switch**

**access-switch1(config)#** **ip default-gateway 10.1.1.254**



## **Disable ports on the switch**

```
! This step is optional but enhances security
! Assume that we have a 48-port switch and we don’t need ports 25 to 48

access-switch1(config)# interface range fa 0/25-48
access-switch1(config-if-range)# shutdown
access-switch1(config-if-range)# exit
access-switch1(config)#
```



## Access List

### Standard IP Access List

- Standard IP lists (1-99, 1300-1999) only check source addresses of all IP packets.
- Standard ACL should be placed near the destination devices

![Standard_ACL_Example1.jpg](images\Standard_ACL_Example1.jpg)

**Configuration:**

In this example we will define a standard access list that will only allow network 10.0.0.0/8 to access the server (located on the Fa0/1 interface)

**Define which source is allowed to pass:**

``` 
Router(config)#access-list 1 permit 10.0.0.0 0.255.255.255

**Apply ACL to an interface**
Router(config)#interface Fa0/1
Router(config-if)#ip access-group 1 out
```
### Extended IP Access List

- Extended IP lists (100-199, 2000-2699) check both source and destination addresses, specific UDP/TCP/IP protocols, and destination ports.
- Extended ACL should be placed near the source devices

![Extended_ACL_Example1.jpg](C:\Users\sherwinowen\Documents\GitHub\my_tutorials\hack_the_box\images\Extended_ACL_Example1-1620958387862.jpg)



In this example we will create an extended ACL that will deny FTP traffic from network 10.0.0.0/8 but allow other traffic to go through.

Note: FTP uses TCP on port 20 & 21.

**Define which protocol, source, destination and port are denied:**

```

Router(config)#access-list 101 deny tcp 10.0.0.0 0.255.255.255 187.100.1.6 0.0.0.0 eq 21
Router(config)#access-list 101 deny tcp 10.0.0.0 0.255.255.255 187.100.1.6 0.0.0.0 eq 20
Router(config)#access-list 101 permit ip any any

**Apply this ACL to an interface:**
Router(config)#interface Fa0/1
Router(config-if)#ip access-group 101 out
```
### Named IP Access List

- This allows standard and extended ACLs to be given names instead of numbers

Example of Named IP Access List

This is an example of the use of a named ACL in order to block all traffic except the Telnet connection from host 10.0.0.1/8 to host 187.100.1.6.

![Named_ACL_Example1.jpg](C:\Users\sherwinowen\Documents\GitHub\my_tutorials\hack_the_box\images\Named_ACL_Example1-1620959821111.jpg)

**Define the ACL:**

```
Router(config)#ip access-list extended in_to_out permit tcp host 10.0.0.1 host 187.100.1.6 eq telnet
(notice that we can use ‘telnet’ instead of port 23)
```
**Apply this ACL to an interface:**

```
Router(config)#interface Fa0/0
Router(config-if)#ip access-group in_to_out in
```





```
show ip access-lists
```





**How to use the wildcard mask?**

Wildcard masks are used with access lists to specify a host, network or part of a network.

The zeros and ones in a wildcard determine whether the corresponding bits in the IP address should be checked or ignored for ACL purposes. For example, we want to create a standard ACL which will only allow network 172.23.16.0/20 to pass through. We need to write an ACL, something like this:

**access-list 1 permit 172.23.16.0 255.255.240.0**

Of course we can’t write subnet mask in an ACL, we must convert it into wildcard mask by converting all bits 0 to 1 & all bits 1 to 0.

255 = 1111 1111 -> convert into 0000 0000

240 = 1111 0000 -> convert into 0000 1111

0 = 0000 0000 -> convert into 1111 1111

Therefore 255.255.240.0 can be written in wildcard mask as 00000000.00000000.00001111.11111111 = 0.0.15.255



## Understanding Access and Trunk Interfaces

Ethernet interfaces can be configured either as access ports or a trunk ports, as follows:

-  An **access port** can have only one VLAN configured on the interface; it can carry traffic for only one VLAN.
-  A **trunk port** can have two or more VLANs configured on the interface; it can carry traffic for several VLANs simultaneously.



### Configuring a LAN Interface as an Ethernet Access Port

```
switch# configure terminal
switch(config)# interface ethernet 1/10
switch(config-if)# switchport mode access
switch(config-if)# switchport access vlan 5 
```
### Configuring Access Host Ports

- **Note**![blank.gif](https://www.cisco.com/c/dam/en/us/td/i/templates/blank.gif) You should apply the **switchport host** command only to interfaces connected to an end station.

```
switch# configure terminal
switch(config)# interface ethernet 1/10
switch(config-if)# switchport host 
```
### Configuring Trunk Ports
```
switch# configure terminal
switch(config)# interface ethernet 3/1
switch(config-if)# switchport mode trunk 
switch(config-if)# trunk encapsulation dot1q
```
### Configuring the Allowed VLANs for Trunking Ports

```
switch# configure terminal
switch(config)# interface ethernet 3/1
switch(config-if)# switchport trunk allow vlan 15-20 
```
### Verifying Interface Configuration

| Command                                | Purpose                                                      |
| -------------------------------------- | ------------------------------------------------------------ |
| switch#  **show interface**            | Displays the interface configuration                         |
| switch#  **show interface switchport** | Displays information for all Ethernet interfaces, including access and trunk interfaces. |
| switch#  **show interface brief**      | Displays interface configuration information.                |
## Configuring DHCP server on the cisco

```
Router>enable
Router#configure terminal
Enter configuration commands, one per line. End with CNTL/Z.
Router(config)#ip dhcp excluded-address 192.168.1.0 192.168.1.10
Router(config)#ip dhcp pool Left_Network
Router(dhcp-config)#default-router 192.168.1.1
Router(dhcp-config)#dns-server 192.168.1.2
Router(dhcp-config)#option 150 ip 192.168.1.3
Router(dhcp-config)#network 192.168.1.0 255.255.255.0
Router(dhcp-config)#exit
```
The following table describes the above commands.

| **Command**                                         | **Description**                                              |
| --------------------------------------------------- | ------------------------------------------------------------ |
| ip dhcp excluded-address *192.168.1.0 192.168.1.10* | This command tells the DHCP server not to assign the addresses from **192.168.1.0** to **192.168.1.10** to DHCP clients. |
| ip dhcp pool *Left_Network*                         | This command creates a DHCP pool named, **Left_Network** and changes command mode to DHCP pool configuration mode. |
| default-router *192.168.1.1*                        | This command assigns the default gateway to clients of this DHCP pool. |
| dns-server *192.168.1.2*                            | This command sets a primary DNS server for the clients.      |
| option *150* ip  *192.168.1.3*                      | This command provides the IP address of the TFTP server to the clients. |
| network *192.168.1.0 255.255.255.0*                 | This command specifies the range of IP addresses for the pool. |
| exit                                                | This command exits DHCP pool configuration mode.             |

### Verifying the DHCP Server

To verify that the DHCP server is working properly and to see the IP  addresses that are provided by the DHCP server, run the following  command in **privileged-exec mode**.

```
show ip dhcp binding
```


![ip dhcp binding command](https://www.computernetworkingnotes.org/images/cisco/ccna-study-guide/csg72-07-show-ip-dhcp-binding.png)

To view detailed information about a specific DHCP pool, use the following command.

```
show ip dhcp pool Left_Network
```
![show ip dhcp pool](https://www.computernetworkingnotes.org/images/cisco/ccna-study-guide/csg72-08-dhcp-pool-detail.png)

### DHCP Reservation

```
Router#conf t
Router(config)#ip dhcp pool client_1
Router(dhcp-config)#host 192.168.100.33 255.255.255.0
Router(dhcp-config)#client-identifier 011c.697a.a367.b0
```
### Clear DHCP binding

```
Router#clear ip dhcp binding {address ip dhcp binding 10.0.88.166]
```
## Port Forward

```





​```1
Router#conf t
Router(config)#ip nat inside source static tcp 192.168.100.33 3389 interface Dialer0 62666
```



# Cisco Security



## Configuring Dhcp Snooping and Arp Inspection on Cisco

- Dhcp snooping is a feature that protects against rogue DHCP agents.

**Steps to to configure dhcp**

1. **characterize uplink interfaces as trusted**

I assume your dhcp server is on the distribution or core layer.  Otherwise, you will have to identify also this link, and characterize it as trusted. in the following example, we assume that int gi1/0/48 is  the uplink interface. If you have multiple uplinks, you have to specify  them all as trusted. if there is a port channel, you have to put the  command in the port-channel

```sh
int gi1/0/48
 ip dhcp snooping trust
 ip arp inspection trust
```

2. **enable dhcp snooping on certain vlans.**

if you don’t use the information option, you have to disable it, otherwise, upstream switches will drop the packets

```
ip dhcp snooping vlan X,Y,Z
no ip dhcp snooping information option
ip dhcp snooping
```

3. **Enable arp inspection**

- Arp inspection uses the dhcp binding database to protect against mac spoofing - man in the middle - attacks **Before you enable arp detection you have to let dhcp snooping run for at least a lease period**

```
ip arp inspection vlan X,Y,Z
ip arp inspection log-buffer entries 512
ip arp inspection log-buffer logs 64 interval 3600
```

**3.1 if you have hosts with static IPs you have to declare them in an arp access-list**

```
ip arp inspection filter static-hosts vlan  X,Y,Z
arp access-list static-hosts
 permit ip host X.X.X.X mac host xxxx.xxxx.xxxx
```

4. **confirm dhcp snooping is enabled**

```
sh ip dhcp snooping    
Load for five secs: 3%/0%; one minute: 3%; five minutes: 3%
Time source is NTP, 09:13:55.261 EET Fri Jan 11 2019

Switch DHCP snooping is enabled
Switch DHCP gleaning is disabled
DHCP snooping is configured on following VLANs:
X,Y,X
DHCP snooping is operational on following VLANs:
X,Y,X
DHCP snooping is configured on the following L3 Interfaces:

Insertion of option 82 is disabled
   circuit-id default format: vlan-mod-port
   remote-id: 6c6c.d382.3580 (MAC)
Option 82 on untrusted port is not allowed
Verification of hwaddr field is enabled
Verification of giaddr field is enabled
DHCP snooping trust/rate is configured on the following Interfaces:

Interface                  Trusted    Allow option    Rate limit (pps)
-----------------------    -------    ------------    ----------------   
Interface                  Trusted    Allow option    Rate limit (pps)
-----------------------    -------    ------------    ----------------   
TenGigabitEthernet1/1/1          yes        yes             unlimited
  Custom circuit-ids:
TenGigabitEthernet3/1/1          yes        yes             unlimited
  Custom circuit-ids:
Port-channel1                    yes        yes             unlimited
  Custom circuit-ids:
```







## Dynamic Trunking Protocol (DTP)

- is used to negotiate forming a trunk between two Cisco devices. DTP  causes increased traffic, and is enabled by default, but may be disabled.

- **CAUTION**

  Some internetworking devices might forward DTP frames improperly,  which can cause misconfigurations. To avoid this, turn off DTP on  interfaces on a Cisco switch connected to devices that do not support  DTP.

**Disable DTP**

```
SW1#configure terminal
Enter configuration commands, one per line. End with CNTL/Z.
SW1(config)#interface gi0/1
SW1(config-if)#switchport ?
	access	Set access mode characteristics of the interface
	mode	Set trunking mode of the interface
	nonegotiate	Device will not engage in negotiation protocol on this interface
	trunk	Set trunking characteristics of the interface
SW1(config-if)#switchport mode access
SW1(config-if)#switchport nonegotiate
```

**Disable DTP on a dynamic interface**

```
SW1#configure terminal
Enter configuration commands, one per line. End with CNTL/Z.
SW1(config)#interface gi0/1
SW1(config-if)#switchport nonegotiate
Command rejected: Conflict between 'nonegotiate' and 'dynamic' status.
SW1(config-if)#
```

- When we try to disable DTP on a Layer 2 interface that has its  trunking administrative mode to dynamic, we receive an error message  stating that the command has been rejected due to a conflict between  "nonegotiate" and "dynamic" status.

- We cannot disable DTP on a dynamic interface because the  interface must use DTP to determine its trunking operational mode. An  interface must be statically configured in access or trunk mode before  we can disable DTP on it.

- What happens when we disable DTP on an interface?

  When an interface in access or trunk mode has DTP disabled on it  (by using the switchport nonegotiate command), it will not participate  in DTP negotiation, and will not respond to incoming DTP frames. Any DTP frames that it receives will simply be ignored.



## Maintenance Operation Protocol (MOP)

-  an ancient remote management protocol from the [DECnet](https://de.wikipedia.org/wiki/DECnet) protocol suite.
-  clients were able to establish a console connection to Cisco devices via MOP

**Disable MOP**

```
 Router(config)# interface eth 0/0
 Router(config-if)# no mop enabled
 Router(config-if)# end
```

**Detect MOP on Cisco devices**

Run the following command to see all the default configuration values:

> ```
>  Router# show run all
> ```

However, for our purpose the following command is more suitable:

> ```
>  Router# show run all | i mop
> ```

If the output does not include “no mop enabled”, MOP is enabled!

**Detect MOP enabled devices**

There are two ways to detect if a Cisco device supports MOP on the network:

- MOP enabled devices send multicast messages to ab:00:00:02:00:00
- Trying to connect to the MOP console

Any user in the same local network network can observe messages from  Cisco devices, if they may send DEC DNA multicast packets (every ~8-10  minutes). However, one might miss those.

To check if a specific device supports MOP one could use the **moprc** utility from the [DECnet for Linux](http://sourceforge.net/projects/linux-decnet/) project as follows:

> ```
>  # ./moprc -v -i eth0 01:02:03:04:05:06
> ```

If MOP is enabled on the accessible Ethernet interface, a login should pop up.

In order to make discovery of MOP easier, I’ve submitted a NSE script to Nmap that detects MOP. It’s also available on [GitHub](https://github.com/ernw/nmap-scripts/blob/master/mop-discover.nse). If layer 3 connectivity is given and the IP of a Cisco device is known, detecting MOP with the NSE script is as easy as this:

> ```
>  # nmap --script mop-discover 192.168.1.1
> ```

When the script is added to the global Nmap scripts (on Linux they  are typically located in /usr/share/nmap/scripts), the script will  automatically run in every script scan (-sC).

In case you only have layer 2 connectivity, you can specify the MAC address as follows:

> ```
>  # nmap --script mop-discover --script-args target=01:02:03:04:05:06
> ```



## IP SourceGuard

- is a per-interfacetraffic filter that permitsIP traffic only when the IP addressand MACaddressof each packet matchesone of two sourcesof IP and MAC addressbindings:
  - Entries in the Dynamic Host Configuration Protocol (DHCP) snooping binding table
  - Static IP source entries that you configure

### Prerequisitesfor IP SourceGuard

IP Source Guard has the following prerequisites:

- You must enable the DHCP featureand DHCP snooping before you can configure IP Source Guard. See Configuring DHCP.
- You must configurethe ACL TCAM region size for IP Source Guard using the hardware access-list tcam region ipsg command. See Configuring ACL TCAM Region Sizes

Note: By default the ipsg region size is zero. You need to allocate enough entries to this region for storing and enforcing the SMAC-IP bindings.

### Default Settings for IP Source Guard

This table lists the default settings for IP SourceGuard parameters.

| Parameters        | Default                                                      |
| ----------------- | ------------------------------------------------------------ |
| IP Source Guard   | Disabledon each interface                                    |
| IP source entries | None. No static or default IP source entries exist by default. |

### Configuring IP Source Guard

#### Enabling or Disabling IP Source Guard on a Layer2 Interface

**Before you begin**

- Make sure that the DHCP feature and DHCP snooping are enabled. 
- Make sure that the ACL TCAM region size for IPSG (ipsg) is configured

**Procedure**

```
switch# configure terminal
switch(config)# interface ethernet 2/3
switch(config-if)# ip verify source dhcp-snooping vlan
switch(config-if)# show running-config dhcp
switch(config-if)#copy running-config startup-config
```

#### Adding or Removing a Static IP Source Entry

```
switch# configure terminal
switch(config)# [no] ip source binding 10.5.22.17 001f.28bd.0013 vlan100 interface ethernet 2/3
switch(config)# show ip dhcp snooping binding interface ethernet 2/3
switch(config)# copy running-config startup-config
```

#### Configuring IP Source Guard for Trunk Ports

Beforeyou begin:

- Make sure that the DHCP feature and DHCP snooping are enabled

```
switch# configure terminal
switch(config)# [no] ip dhcp snooping ipsg-excluded vlan 1001-1256, 3097
switch(config)# show ip ver source
switch(config)#copy running-config startup-config
```

##  Cisco Discovery Protocol (CDP)

- Cisco Discovery Protocol is a Layer 2, media-independent, and  network-independent protocol that networking applications use to learn  about nearby, directly connected devices. 
- Cisco Discovery Protocol is  enabled by default. 
- Each device configured for Cisco Discovery Protocol  advertises at least one address at which the device can receive messages and sends periodic advertisements (messages) to the well-known  multicast address 01:00:0C:CC:CC:CC. 
- Devices discover each other by  listening at that address. They also listen to messages to learn when  interfaces on other devices are up or go down.   

### Enable/Disable Cisco Discovery Protocol Supported Device

```
Device> enable
Device# configure terminal
Device(config)# [no] cdp run
Device(config)# end
```

### Enable/Disable Cisco Discovery Protocol Supported Interface

```
Device> enable
Device# configure terminal
Device(config)# interface  gi0/1
Device(config)# [no] cdp enable
Device(config)# end
```

## Proxy ARP

- is the technique in which one host, usually a router, answers **ARP** requests intended for another machine. By "faking" its identity, the  router accepts responsibility for routing packets to the "real"  destination.
- First let us be clear about the difference between arp and proxy-arp. ARP is a mechanism to establish the relationship between an IP address  (at layer 3) and a MAC address (at layer 2). A device (host, or switch,  or router) that wants to communicate will send an ARP request giving the IP address and requesting the associated MAC address.
- In a normal ARP the request is sent on the local subnet and the IP address  asked for is on the local subnet. But sometimes an ARP request is sent  and the IP address asked for is on a remote subnet or remote network. A  router may respond to that ARP request for a "remote" IP address. In  essence the router is acting as a "proxy" for the device on the remote  subnet or remote network and this is why it is called proxy-arp.
- By default Cisco IOS has proxy-arp enabled, so the router will respond to  arp requests for remote addresses (assuming that the route does have a  route to the remote subnet or remote network in the routing table). When you configure no ip proxy-arp on the interface you are instructing IOS  that it should not respond to an ARP request for a remote address.

**Disable Proxy ARP**

```
Router# configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)# interface ethernet 0
Router(config-if)# no ip proxy-arp
Router(config-if)# end
Router#
```

## Traffic Storm Control

- A traffic storm occurs when packets flood the LAN, creating excessive traffic and degrading network performance. The traffic storm control feature prevents LAN ports from being disrupted by a broadcast, multicast, or unicast traffic storm on physical interfaces. 

- Traffic storm control (also called traffic suppression) monitors incoming traffic levels over a 1-second traffic storm control interval, and during the interval it compares the traffic level with the traffic storm control level that you configure.

- The traffic storm control level is a percentage of the total available bandwidth of the port. Each port has a single traffic storm control level that is used for all types of traffic (broadcast, multicast, and unicast).

- Traffic storm control monitors the level of each traffic type for which you enable traffic storm control in 1-second traffic storm control intervals. 

- In all releases, and by default in Release 12.2(33)SXJ and later releases, within an interval, when the ingress traffic for which traffic storm control is enabled reaches the traffic storm control level that is configured on the port, traffic storm control drops the traffic until the traffic storm control interval ends. Release 12.2(33)SXJ and later releases support these configurable traffic storm control optional actions:

  - Shutdown - When a traffic storm occurs, traffic storm control puts the port into the error-disabled state. To reenable ports, use the error-disable detection and recovery feature or the shutdown and no shutdown commands.
  - Trap - When a traffic storm occurs, traffic storm control generates an SNMP trap.

**Default Traffic Storm Control Configuration**

- Traffic storm control is disabled by default.



### Broadcast traffic Storm Control



## Enable SSH on Cisco 

1. Setup Management IP

   ```
   # ip default-gateway 192.168.101.1
   
   # interface vlan 101
   (config-if)# ip address 192.168.101.2 255.255.255.0
   ```

   

2.  Set hostname and domain-name

   ```
   # config t
   (config)# hostname myswitch
   (config)# ip domain-name thegeekstuff.com
   ```

3. Generate the RSA Keys

   ```
   myswitch(config)# crypto key generate rsa
    The name for the keys will be: myswitch.thegeekstuff.com
    Choose the size of the key modulus in the range of 360 to 2048 for your
      General Purpose Keys. Choosing a key modulus greater than 512 may take
      a few minutes.
   
   How many bits in the modulus [512]: 1024
    % Generating 1024 bit RSA keys, keys will be non-exportable...[OK]
   ```

4. Setup the Line VTY configurations

   ```
   line vty 0 4
   (config-line)# transport input ssh
   (config-line)# login local
   (config-line)# password 7
   (config-line)# exit
   ```

   If you have not set the console line yet, set it to the following values.

   ```
   # line console 0
   (config-line)# logging synchronous
   (config-line)# login local
   ```

5. Create the username password

   ```
   myswitch# config t
   Enter configuration commands, one per line.  End with CNTL/Z.
   myswitch(config)# username ramesh password mypassword
   ```

   Note: If you don’t have the enable password setup properly, do it now.

   ```
   myswitch# enable secret myenablepassword
   ```

   Make sure the password-encryption service is turned-on, which will encrypt the password, and when you do “sh run”, you’ll seee only the encrypted password and not clear-text password.

   ```
   myswitch# service password-encryption
   ```

6. Verify SSH access

   ```
   myswitch# sh ip ssh
   SSH Enabled - version 1.99
   Authentication timeout: 120 secs; Authentication retries: 3
   ```

   Switch ssh to version 2:

   ```
   R1(config)#ip ssh version 2
   ```
   
   
   
   In this example, 192.168.101.2 is the management ip-address of the switch.
   
   ```
   remote-machine# ssh 192.168.101.2
   login as: ramesh
   Using keyboard-interactive authentication.
   Password:
   
   myswitch>en
   Password:
   myswitch#
   ```




## Service Password Encryption

- Use the *service password-encryption* command with additional security measures
- stored passwords in ecrypted form
- Turn it on to encrypt passwords

```
# service password-encryption
```



## TCP Keepalives in and out

- Ensure that abnormally terminated TCP sessions are removed.
- You may need it to prevent stuck sessions

To enable TCP keepalives on the routers, use the following  configuration commands: 

> ```
> Router1# config term
> Router1(config)# service tcp-keepalives-in
> Router1(config)# service tcp-keepalives-out
> Router1(config)# end
> ```



## Smart Install

- Turn it off or block 4786 port (if "vstack" option unavailable) to disable smart install configuration

To check vstack 

```
# show vstack config
```

To disable 

```
# no vstack
# no vstack config
```



hosttel

htvg30dett



show ip int brief

show run int Fa0/1

show vlan

write mem


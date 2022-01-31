

# Linux

[TOC]

## Linux Boot Process

1. Firmware stage

- Execute code in the BIOS for legacy systems
- Execute code in the UEFI firmware for new computers
- Start boot loader

2. Bootloader stage

- Firmware executes bootloader (grub2) code on drive (Ubuntu)

- Bootloader reads its configuration file

  - Location dependent on distribution and BIOS/UEFI

- Executes the kernel

3. Kernel Stage

- Kernel loads the RAMDisk into RAM
- Kernel loads device drivers and config files from RamDisk
- Kernel unmounts RAMDisk and mounts root filesystem
- Starts Initialization stage

4. Initialization stage

- Granfather process (systemd) is started by the kernel
- systemd starts system services
- systemd starts login shells and GUI interface

**System Targets**

- Target is a specific configuration
- Default target is graphical.target
-  Systems can be booted into different tragets



## How to reset root on password

1. Boot Up your system and on the Grub2 boot Menu screen, Press **e** on the Keyboard to enter.`Grub Edit Mode`
2. After pressing “**e**“, scroll down to **vmlinux** line and move to the end of the line press **ctrl+e** and to move to the front of the line press **ctrl+a.** 
3. Add the following Full line will be similar to:linux16 /vmlinuz-3.10.0-327.el7.x86_64 root=/dev/mapper/centos-root \ ro rd.lvm.lv=centos/root rd.lvm.lv=centos/swap **rd.break**
4. To boot the system with the New parameter parsed, press **ctrl+x** which will take you to prompt window.
5. Mount the file system asread and write, you cannot change the password when the filesystem is not writable. Remount is as writable by typing the following command.

```
# mount -o remount,rw  /sysroot
```

6. Chroot into the **/sysroot**

```
# chroot /sysroot
```

7. Now change the password

```
# passwd
```

8. Set SELinux relabeling on next boot

```
# touch /.autorelabel
```

## Go to the emergency mode

systemd.unit=emergency



## How to set default target (default runlevel)

**To Check current default target**

```
# systemctl get-default
```

**To list the predefined systemd run level target units :**

```
# find / -name "runlevel*.target"
/usr/lib/systemd/system/runlevel4.target
/usr/lib/systemd/system/runlevel5.target
/usr/lib/systemd/system/runlevel6.target
/usr/lib/systemd/system/runlevel1.target
/usr/lib/systemd/system/runlevel2.target
/usr/lib/systemd/system/runlevel3.target
/usr/lib/systemd/system/runlevel0.target
```

 **To set default target**

```
# systemctl set-default mutliuser.target
```



| Run Level | Target Units                             | Description                            |
| :-------- | :--------------------------------------- | :------------------------------------- |
| 0         | runlevel0.target, poweroff.target        | Shut down and power off                |
| 1         | runlevel1.target, rescue.target          | Set up a rescue shell                  |
| 2,3,4     | runlevel[234].target, multi- user.target | Set up a nongraphical multi-user shell |
| 5         | runlevel5.target, graphical.target       | Set up a graphical multi-user shell    |
| 6         | runlevel6.target, reboot.target          | Shut down and reboot the system        |



## Update Kernels

### Set kernel boot options

```
# grub2-set-default 1
```

* boot list starts at 0

### Check the kernel installed

```
# yum list installed kernel-*
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: mirror.xtom.com.hk
 * extras: mirror.xtom.com.hk
 * updates: mirror.xtom.com.hk
Installed Packages
kernel.x86_64                                            3.10.0-1160.el7                                      @anaconda
kernel.x86_64                                            3.10.0-1160.49.1.el7                                 @updates
kernel-debug-devel.x86_64                                3.10.0-1160.49.1.el7                                 @updates
kernel-devel.x86_64                                      3.10.0-1160.49.1.el7                                 @updates
kernel-headers.x86_64                                    3.10.0-1160.49.1.el7                                 @updates
kernel-tools.x86_64                                      3.10.0-1160.49.1.el7                                 @updates
kernel-tools-libs.x86_64                                 3.10.0-1160.49.1.el7                                 @updates
```

### All installed kernels reside in /boot directory

```
# ls -l /boot
total 195016
-rw-r--r--. 1 root root   153596 Nov 30 23:55 config-3.10.0-1160.49.1.el7.x86_64
-rw-r--r--. 1 root root   153591 Oct 20  2020 config-3.10.0-1160.el7.x86_64
drwx------. 3 root root       17 Jul 29  2020 efi
drwxr-xr-x. 2 root root       27 Jan  6 20:18 grub
drwx------. 5 root root       97 Jan  6 20:43 grub2
-rw-------. 1 root root 79699095 Jan  6 20:24 initramfs-0-rescue-2290d4b2b5e17749a3f266340bdd5764.img
-rw-------. 1 root root 31706377 Jan  6 20:53 initramfs-3.10.0-1160.49.1.el7.x86_64.img
-rw-------. 1 root root 14031948 Jan  6 20:46 initramfs-3.10.0-1160.49.1.el7.x86_64kdump.img
-rw-------. 1 root root 31707646 Jan  6 20:44 initramfs-3.10.0-1160.el7.x86_64.img
-rw-------. 1 root root 14029731 Jan  6 20:41 initramfs-3.10.0-1160.el7.x86_64kdump.img
-rw-r--r--. 1 root root   320671 Nov 30 23:55 symvers-3.10.0-1160.49.1.el7.x86_64.gz
-rw-r--r--. 1 root root   320648 Oct 20  2020 symvers-3.10.0-1160.el7.x86_64.gz
-rw-------. 1 root root  3620596 Nov 30 23:55 System.map-3.10.0-1160.49.1.el7.x86_64
-rw-------. 1 root root  3616707 Oct 20  2020 System.map-3.10.0-1160.el7.x86_64
-rwxr-xr-x. 1 root root  6769256 Jan  6 20:24 vmlinuz-0-rescue-2290d4b2b5e17749a3f266340bdd5764
-rwxr-xr-x. 1 root root  6773352 Nov 30 23:55 vmlinuz-3.10.0-1160.49.1.el7.x86_64
-rwxr-xr-x. 1 root root  6769256 Oct 20  2020 vmlinuz-3.10.0-1160.el7.x86_64
```

### See the kernel release

```
# uname -r
3.10.0-1160.49.1.el7.x86_64
```



### List the available kernel update

```
# yum list available kernel
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: mirror.xtom.com.hk
 * extras: mirror.xtom.com.hk
 * updates: mirror.xtom.com.hk
Available Packages
kernel.x86_64                            3.10.0-1160.53.1.el7                             updates
```

### Update kernel

```
# yum update -y kernel
```

### Remove unused kernels

```
# yum remove kernel
```



## Manage kernel modules

### Kernel Modules folder

```
# ls /lib/modules/$(uname -r)/kernel
arch  crypto  drivers  fs  kernel  lib  mm  net  sound  virt
```

### See the current loaded modules

```
# lsmod
Module                  Size  Used by
xt_CHECKSUM            12549  1
ipt_MASQUERADE         12678  3
nf_nat_masquerade_ipv4    13463  1 ipt_MASQUERADE
tun                    36164  1
devlink                60067  0
ip6t_rpfilter          12595  1
ip6t_REJECT            12625  2
nf_reject_ipv6         13717  1 ip6t_REJECT
ipt_REJECT             12541  4
nf_reject_ipv4         13373  1 ipt_REJECT
xt_conntrack           12760  12
ebtable_nat            12807  1
ebtable_broute         12731  1
bridge                151336  1 ebtable_broute
stp                    12976  1 bridge
```

### Get more information about the module

```
# modinfo cdrom
filename:       /lib/modules/3.10.0-1160.53.1.el7.x86_64/kernel/drivers/cdrom/cdrom.ko.xz
license:        GPL
retpoline:      Y
rhelversion:    7.9
srcversion:     9354225F1E3AD5837E4D30F
depends:
intree:         Y
vermagic:       3.10.0-1160.53.1.el7.x86_64 SMP mod_unload modversions
signer:         CentOS Linux kernel signing key
sig_key:        87:E5:16:0E:55:99:B4:50:B2:48:34:5F:17:61:A1:76:E0:8A:6D:FD
sig_hashalgo:   sha256
parm:           debug:bool
parm:           autoclose:bool
parm:           autoeject:bool
parm:           lockdoor:bool
parm:           check_media_type:bool
parm:           mrw_format_restart:bool
```

 ###  Add and remove modules

```
# modprobe -va [module name]

# modprobe -vr [module name]
```

### Scan new hardware local

```
# depmod -v
```

## Configure Network Connections

### Static Network Config

- /etc/sysconfig/networkscripts/ifcfg-eth0

```
TYPE="Ethernet"
BOOTPROTO=none
IPV6INIT="yes"
NAME="eth0"
UUID="e9f08541-ce05-41 19-abeb-3849fcb76516"
DEVICE="eth0"
ONBOOT="yes"
HWADDR=52:54:00:99:63:49
IPADDR=192.168.1.206
GATEWAY=192.168.1.1
```

### DHCP Configuration File

```
BOOTPROTO=dhcp
DEVICE=eth0
ONBOOT=yes
```

### Static Configuration File

```
DEVICE=eth0
BOOTPROTO=none
ONBOOT=yes
PREFIX=24
IPADDR=192.168.1.206
```

### General Configuration Options

* DEVICE=name

* IPADDR=address

* IPV6ADDR=address

* HWADDR=MAC-address

* MACADDR=MAC-address

* BOOTPROTO=protocol (none, bootp, dhcp)
* ONBOOT=answer (yes,no)

* IPV6INIT=answer (yes, no)

### DNS Configuration Options

- PEERDNS=answer (yes, no)

* DNS{1,2j=address

### Netmask Configuration Options

- PREFIX = CIDR bits
- NETMASK = mask in dotted notation

### Control Configurartion Options

- NM_CONTROLLED=answer (yes,no)
- USERCTL=answer (yes,no)



**Systemd Network Interface Naming**

| Interface Type         | Interface Name |
| ---------------------- | -------------- |
| Firmware/BIOS supplied | enol           |
| PCI Express Slot       | ens1           |
| PCI Slot               | enp3s0         |
| Invalid firmware info  | ethO           |

### Change hostname

```
# hostnamectl set-hostname rhhost1.localnet.com
```

### Host Configuration

- /etc/hosts

```
192.168.1.100	rhhost1.localnet.com	rhhosts1
192.168.1.200	rhhost2.localnet.com	rhhosts2
```

### Interface Administrator Commands

- ifup/ifdown
- ip
- nm-cli
- nm-tui
- nm-connection-editor

### Nameserver Configuration

- /etc/resolv,conf

### Nmcli

Show nmcli examples

```
$ man nmcli-examples
NMCLI-EXAMPLES(7)                       Examples                      NMCLI-EXAMPLES(7)

NAME
       nmcli-examples - usage examples of nmcli

SYNOPSIS
       nmcli [OPTIONS...]

DESCRIPTION
       nmcli is a command-line client for NetworkManager. It allows controlling
       NetworkManager and reporting its status. For more information please refer to
       nmcli(1) manual page.

       The purpose of this manual page is to provide you with various examples and
       usage scenarios of nmcli.

EXAMPLES
       Example 1. Listing available Wi-Fi APs

           $ nmcli device wifi list
           *  SSID               MODE    CHAN  RATE       SIGNAL  BARS  SECURITY
              netdatacomm_local  Infra   6     54 Mbit/s  37      ▂▄__  WEP
           *  F1                 Infra   11    54 Mbit/s  98      ▂▄▆█  WPA1
              LoremCorp          Infra   1     54 Mbit/s  62      ▂▄▆_  WPA2 802.1X
              Internet           Infra   6     54 Mbit/s  29      ▂___  WPA1
              HPB110a.F2672A     Ad-Hoc  6     54 Mbit/s  22      ▂___  --
              Jozinet            Infra   1     54 Mbit/s  19      ▂___  WEP
              VOIP               Infra   1     54 Mbit/s  20      ▂___  WEP
              MARTINA            Infra   4     54 Mbit/s  32      ▂▄__  WPA2
              N24PU1             Infra   7     11 Mbit/s  22      ▂___  --
              alfa               Infra   1     54 Mbit/s  67      ▂▄▆_  WPA2
              bertnet            Infra   5     54 Mbit/s  20      ▂___  WPA1 WPA2

```



**Bring down interface**

```
nmcli dev disconnect enp0s3
```

**Bring down interface**

```
nmcli con up enp0s3
```

Reload interface configuration****

```
# nmcli con load /etc/sysconfig/network-scripts/ifcfg-enp0s3
```

**Show all network connection**

```
nmcli con show
NAME                UUID                                  TYPE      DEVICE
Wired connection 1  fa4b8c06-1a57-3450-9f84-e8cee9f03a62  ethernet  enp0s8
enp0s3              97972afa-cd62-44b8-ae57-5e64c8afa0f9  ethernet  enp0s3
virbr0              e1c136af-784a-4fe2-b4a8-678a486e3396  bridge    virbr0
```

**Show active connection**

```
# nmcli con show --active
```

Show status of conn**ection**

```
nmcli general status
STATE      CONNECTIVITY  WIFI-HW  WIFI     WWAN-HW  WWAN
connected  full          enabled  enabled  enabled  enabled
```

**Configure connection**

```
nmcli connection edit
Valid connection types: 6lowpan, 802-11-olpc-mesh (olpc-mesh), 802-11-wireless (wifi), 802-3-ethernet (ethernet), adsl, bluetooth, bond, bridge, cdma, dummy, generic, gsm, infiniband, ip-tunnel, macsec, macvlan, ovs-bridge, ovs-interface, ovs-port, pppoe, team, tun, vlan, vpn, vxlan, wifi-p2p, wimax, wireguard, wpan, bond-slave, bridge-slave, team-slave
Enter connection type:
```

## Configure interface bonding

 **Check status of NetworkManager**

```
# systemctl status NetworkManager
```

**Install module bonding and check if installed **

```
# modprobe bonding
# lsmod | grep bonding
bonding               152979  0
```



**Create connection**

```
# sudo nmcli connection add type bond con-name bond0 ifname bond0 mode balance-rr ipv4.addresses 192.168.100.101/24 gw4 192.168.100.1
```

**Add interface connection to the bond**

```
# nmcli connection add type bond-slave ifname enp0s8 master bond0
Connection 'bond-slave-enp0s8' (e684a83b-db3c-4d7b-81b4-37e8d8048e91) successfully added.
# nmcli connection add type bond-slave ifname enp0s9 master bond0
Connection 'bond-slave-enp0s9' (4c91105f-164d-4bcf-8a6b-4872703e51b0) successfully added.
```



```
# cat /etc/sysconfig/network-scripts/ifcfg-bond-slave-enp0s8
TYPE=Ethernet
NAME=bond-slave-enp0s8
UUID=e684a83b-db3c-4d7b-81b4-37e8d8048e91
DEVICE=enp0s8
ONBOOT=yes
MASTER=bond0
SLAVE=yes

# cat /etc/sysconfig/network-scripts/ifcfg-bond-slave-enp0s9
TYPE=Ethernet
NAME=bond-slave-enp0s9
UUID=4c91105f-164d-4bcf-8a6b-4872703e51b0
DEVICE=enp0s9
ONBOOT=yes
MASTER=bond0
SLAVE=yes
```



```
# nmcli connection up bond0
Connection successfully activated (master waiting for slaves) (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/38)

# ip addr | grep bond0
11: bond0: <NO-CARRIER,BROADCAST,MULTICAST,MASTER,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000

# nmcli con show | grep bond
bond0               3b5b5c62-a629-4b31-b399-6649c6e37bbf  bond      bond0
bond-slave-enp0s8   e684a83b-db3c-4d7b-81b4-37e8d8048e91  ethernet  enp0s8
bond-slave-enp0s9   4c91105f-164d-4bcf-8a6b-4872703e51b0  ethernet  enp0s9
[root@rhhost1 user1]#

```



## List, create and delete partitions on MBR and GPT disk



### Get list of drives in a system

```
# cat /proc/partitions
major minor  #blocks  name

   8        0    8388608 sda
   8        1    1048576 sda1
   8        2    7339008 sda2
   8       16    1048576 sdb
   8       32    1048576 sdc
   8       48    1048576 sdd
   8       64    1048576 sde
  11        0    1048575 sr0
 253        0    6496256 dm-0
 253        1     839680 dm-1
```

or

```
# lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda               8:0    0    8G  0 disk
├─sda1            8:1    0    1G  0 part /boot
└─sda2            8:2    0    7G  0 part
  ├─centos-root 253:0    0  6.2G  0 lvm  /
  └─centos-swap 253:1    0  820M  0 lvm  [SWAP]
sdb               8:16   0    1G  0 disk
sdc               8:32   0    1G  0 disk
sdd               8:48   0    1G  0 disk
sde               8:64   0    1G  0 disk
sr0              11:0    1 1024M  0 rom
```

or

**List all partitions**

```
# fdisk -l
```

**List specific partition**

```
# fdisk -l /dev/sdb

Disk /dev/sdb: 1073 MB, 1073741824 bytes, 2097152 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```



### Partion Tools

- fdisk
- gdisk
- gparted



### Legacy Systems

- Boot with a BIOS
- Master boot record (MBR)
- Four real primary partitions
- Accessible size of 2 TB
- One extended partition

**MBR Partioning Number**

- Primary or extended partitions (1-4)
- Logical partitions (5-11)

**Tools**

- fdisk
- sfdisk (scripts)
- cfdisk (curses interface)



### Modern Systems

- Boot with a Unified Extensible Firmware Interface (UEFI)
- Use GUID Partition Tables (GPTs)
- Unlimited partitions
- Accessible size of 18 exabytes

**Tools**

- gdisk
- sgdisk (scripts)
- cgdisk (curses interface)
- parted

### Create partion using gdisk

```
# gdisk /dev/sdb
GPT fdisk (gdisk) version 0.8.10

Partition table scan:
  MBR: not present
  BSD: not present
  APM: not present
  GPT: not present

Creating new GPT entries.

Command (? for help): n
Partition number (1-128, default 1):
First sector (34-2097118, default = 2048) or {+-}size{KMGTP}:
Last sector (2048-2097118, default = 2097118) or {+-}size{KMGTP}: +500M
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300):
Changed type of partition to 'Linux filesystem'

Command (? for help): p
Disk /dev/sdb: 2097152 sectors, 1024.0 MiB
Logical sector size: 512 bytes
Disk identifier (GUID): A73A7BEB-9341-490F-9D1F-0353051099D6
Partition table holds up to 128 entries
First usable sector is 34, last usable sector is 2097118
Partitions will be aligned on 2048-sector boundaries
Total free space is 1073085 sectors (524.0 MiB)

Number  Start (sector)    End (sector)  Size       Code  Name
   1            2048         1026047   500.0 MiB   8300  Linux filesystem

Command (? for help): w

Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
PARTITIONS!!

Do you want to proceed? (Y/N): Y
OK; writing new GUID partition table (GPT) to /dev/sdb.
The operation has completed successfully.
```



**Put filesystem in new partition**

```
# mkfs -t ext4 /dev/sdb1
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
Stride=0 blocks, Stripe width=0 blocks
128016 inodes, 512000 blocks
25600 blocks (5.00%) reserved for the super user
First data block=1
Maximum filesystem blocks=34078720
63 block groups
8192 blocks per group, 8192 fragments per group
2032 inodes per group
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729, 204801, 221185, 401409

Allocating group tables: done
Writing inode tables: done
Creating journal (8192 blocks): done
Writing superblocks and filesystem accounting information: done
```

### Create partion using parted

```
# parted
(parted) print all
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sda: 8590MB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start   End     Size    Type     File system  Flags
 1      1049kB  1075MB  1074MB  primary  xfs          boot
 2      1075MB  8590MB  7515MB  primary               lvm


Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdb: 1074MB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start   End    Size   File system  Name              Flags
 1      1049kB  525MB  524MB  ext4         Linux filesystem


Error: /dev/sdc: unrecognised disk label
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdc: 1074MB
Sector size (logical/physical): 512B/512B
Partition Table: unknown
Disk Flags:

Error: /dev/sdd: unrecognised disk label
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdd: 1074MB
Sector size (logical/physical): 512B/512B
Partition Table: unknown
Disk Flags:

Error: /dev/sde: unrecognised disk label
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sde: 1074MB
Sector size (logical/physical): 512B/512B
Partition Table: unknown
Disk Flags:

Model: Linux device-mapper (linear) (dm)
Disk /dev/mapper/centos-swap: 860MB
Sector size (logical/physical): 512B/512B
Partition Table: loop
Disk Flags:

Number  Start  End    Size   File system     Flags
 1      0.00B  860MB  860MB  linux-swap(v1)


Model: Linux device-mapper (linear) (dm)
Disk /dev/mapper/centos-root: 6652MB
Sector size (logical/physical): 512B/512B
Partition Table: loop
Disk Flags:

Number  Start  End     Size    File system  Flags
 1      0.00B  6652MB  6652MB  xfs

(parted) print devices
/dev/sda (8590MB)
/dev/sdb (1074MB)
/dev/sdc (1074MB)
/dev/sdd (1074MB)
/dev/sde (1074MB)
/dev/mapper/centos-swap (860MB)
/dev/mapper/centos-root (6652MB)
(parted) select /dev/sdc
Using /dev/sdc
(parted) print free
Error: /dev/sdc: unrecognised disk label
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdc: 1074MB
Sector size (logical/physical): 512B/512B
Partition Table: unknown
Disk Flags:
(parted) mklabel msdos
(parted) print
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdc: 1074MB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:
(parted) mkpart primary 1 500MB
(parted) print
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdc: 1074MB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start   End    Size   Type     File system  Flags
 1      1049kB  500MB  499MB  primary
```

## Resize partitions without losing data


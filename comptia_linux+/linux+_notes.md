

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



### Create partion using fdisk

```
$ sudo fdisk /dev/sdc

Welcome to fdisk (util-linux 2.34).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS disklabel with disk identifier 0x40857866.

Command (m for help): p
Disk /dev/sdc: 1 GiB, 1073741824 bytes, 2097152 sectors
Disk model: VMware Virtual S
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x40857866

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-2097151, default 2048): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-2097151, default 2097151): +500M
Created a new partition 1 of type 'Linux' and of size 500 MiB.

Command (m for help): p
Disk /dev/sdc: 1 GiB, 1073741824 bytes, 2097152 sectors
Disk model: VMware Virtual S
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x40857866

Device     Boot Start     End Sectors  Size Id Type
/dev/sdc1        2048 1026047 1024000  500M 83 Linux

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```



## Resize partitions without losing data





## Manage LVM volumes and Volume Groups

### Create Physical Volume

```
# pvcreate /dev/sdb1
  Physical volume "/dev/sdb1" successfully created.
```



### Display various attributes of physical volume

```
# pvdisplay 
  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               vgdata
  PV Size               1022.98 MiB / not usable 2.98 MiB
  Allocatable           yes 
  PE Size               4.00 MiB
  Total PE              255
  Free PE               255
  Allocated PE          0
  PV UUID               OGrmim-rzWw-Hcha-DVte-IexI-G4SZ-ncnyjH
   
  --- Physical volume ---
  PV Name               /dev/sda3
  VG Name               ubuntu-vg
  PV Size               <18.50 GiB / not usable 0   
  Allocatable           yes 
  PE Size               4.00 MiB
  Total PE              4735
  Free PE               2175
  Allocated PE          2560
  PV UUID               qyLTxi-Qpue-NtZv-bvA3-gOZL-sD6f-Oi1GBe

```



### Display physical volumes summary

```
# pvs
  PV         VG        Fmt  Attr PSize    PFree   
  /dev/sda3  ubuntu-vg lvm2 a--   <18.50g   <8.50g
  /dev/sdb1            lvm2 ---  1022.98m 1022.98m
```

### Create Volume Group

```
# vgcreate vgdata /dev/sdb1 
  Volume group "vgdata" successfully created
```



### Display various attributes of  volume group

```
# vgdisplay 
  --- Volume group ---
  VG Name               vgdata
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               1020.00 MiB
  PE Size               4.00 MiB
  Total PE              255
  Alloc PE / Size       0 / 0   
  Free  PE / Size       255 / 1020.00 MiB
  VG UUID               tW9pGf-e1Dn-wPbw-AbTi-fZts-Idnq-ok3PfH
   
  --- Volume group ---
  VG Name               ubuntu-vg
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               <18.50 GiB
  PE Size               4.00 MiB
  Total PE              4735
  Alloc PE / Size       2560 / 10.00 GiB
  Free  PE / Size       2175 / <8.50 GiB
  VG UUID               wj8jtg-X72X-B2fP-otgY-jNSr-Ee4o-FtmeP3
```



### Display volume group summary

```
# vgs
  VG        #PV #LV #SN Attr   VSize    VFree   
  ubuntu-vg   1   1   0 wz--n-  <18.50g   <8.50g
  vgdata      1   0   0 wz--n- 1020.00m 1020.00mm
```



### Create logical volume

```
# lvcreate -L 500M -n lvdata vgdata
  Logical volume "lvdata" created.
```



### Display logical volume summary

```
# lvs
  LV        VG        Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  ubuntu-lv ubuntu-vg -wi-ao----  10.00g                                                    
  lvdata    vgdata    -wi-a----- 500.00m  
```



### Display various attributes of  logical volume

```
# lvdisplay 
  --- Logical volume ---
  LV Path                /dev/vgdata/lvdata
  LV Name                lvdata
  VG Name                vgdata
  LV UUID                Injzvs-3phl-QqAN-yz0M-V8Oi-eVpl-bx6GH0
  LV Write Access        read/write
  LV Creation host, time ubuntu-server, 2022-02-25 06:47:43 +0000
  LV Status              available
  # open                 0
  LV Size                500.00 MiB
  Current LE             125
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:1
   
  --- Logical volume ---
  LV Path                /dev/ubuntu-vg/ubuntu-lv
  LV Name                ubuntu-lv
  VG Name                ubuntu-vg
  LV UUID                8Ge2rh-29oS-Y9u3-IxuT-tQA0-r1dB-CCVRS2
  LV Write Access        read/write
  LV Creation host, time ubuntu-server, 2022-02-25 02:10:20 +0000
  LV Status              available
  # open                 1
  LV Size                10.00 GiB
  Current LE             2560
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0
```

### Format Logical Volume

```
# mkfs -t ext4 /dev/vgdata/lvdata 
mke2fs 1.45.5 (07-Jan-2020)
Creating filesystem with 128000 4k blocks and 128000 inodes
Filesystem UUID: 2045a544-067d-42e3-9c26-cf42d9af48ec
Superblock backups stored on blocks: 
	32768, 98304

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done
```



### Verify if File System created

```
# blkid 
/dev/fd0: SEC_TYPE="msdos" UUID="5459-5107" TYPE="vfat"
/dev/sr0: UUID="2022-02-25-10-08-07-00" LABEL="CDROM" TYPE="iso9660"
/dev/sr1: UUID="2022-02-23-09-27-00-00" LABEL="Ubuntu-Server 20.04.4 LTS amd64" TYPE="iso9660" PTUUID="492bdcc4" PTTYPE="dos"
/dev/sda2: UUID="5ad1c3ca-0b9d-47b1-9d23-40d0592ad390" TYPE="ext4" PARTUUID="61e94aee-2ced-42a4-8ad7-9f95c01377aa"
/dev/sda3: UUID="qyLTxi-Qpue-NtZv-bvA3-gOZL-sD6f-Oi1GBe" TYPE="LVM2_member" PARTUUID="39b90254-d4da-4d47-a513-945f26496902"
/dev/mapper/ubuntu--vg-ubuntu--lv: UUID="65238bf3-8a36-4379-8276-298243687ce2" TYPE="ext4"
/dev/loop0: TYPE="squashfs"
/dev/loop1: TYPE="squashfs"
/dev/loop2: TYPE="squashfs"
/dev/sda1: PARTUUID="fbc83446-9f88-4d6a-ac2a-4814d123e721"
/dev/sdb1: UUID="OGrmim-rzWw-Hcha-DVte-IexI-G4SZ-ncnyjH" TYPE="LVM2_member" PARTLABEL="Linux filesystem" PARTUUID="3841d75f-43f9-464c-9d93-45192a03cf04"
/dev/mapper/vgdata-lvdata: UUID="2045a544-067d-42e3-9c26-cf42d9af48ec" TYPE="ext4"
```



### Mount the logical volume

```
# mkdir /media/lvdata

# mount /dev/vgdata/lvdata /media/lvdata

# df -h
Filesystem                         Size  Used Avail Use% Mounted on
udev                               933M     0  933M   0% /dev
tmpfs                              196M  1.3M  194M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv  9.8G  4.3G  5.1G  46% /
tmpfs                              977M     0  977M   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
tmpfs                              977M     0  977M   0% /sys/fs/cgroup
/dev/loop0                          62M   62M     0 100% /snap/core20/1328
/dev/loop1                          44M   44M     0 100% /snap/snapd/14978
/dev/loop2                          68M   68M     0 100% /snap/lxd/21835
/dev/sda2                          1.5G  110M  1.3G   8% /boot
tmpfs                              196M     0  196M   0% /run/user/1000
/dev/mapper/vgdata-lvdata          469M  768K  433M   1% /media/lvdata

# lsblk 
NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
fd0                         2:0    1  1.4M  0 disk 
loop0                       7:0    0 61.9M  1 loop /snap/core20/1328
loop1                       7:1    0 43.6M  1 loop /snap/snapd/14978
loop2                       7:2    0 67.2M  1 loop /snap/lxd/21835
sda                         8:0    0   21G  0 disk 
├─sda1                      8:1    0    1M  0 part 
├─sda2                      8:2    0  1.5G  0 part /boot
└─sda3                      8:3    0 18.5G  0 part 
  └─ubuntu--vg-ubuntu--lv 253:0    0   10G  0 lvm  /
sdb                         8:16   0    1G  0 disk 
└─sdb1                      8:17   0 1023M  0 part 
  └─vgdata-lvdata         253:1    0  500M  0 lvm  /media/lvdata
sr0                        11:0    1 97.2M  0 rom  
sr1                        11:1    1  1.2G  0 rom  
```



### Linux File System

| FS    | Max FS Size | Max File Size | Notes                                                        |
| ----- | ----------- | ------------- | ------------------------------------------------------------ |
| ext2  | 16-32 TiB   | 2 TiB         | Not journalized                                              |
| ext3  | 16-32 TiB   | 2 TiB         | ext2 with a journal                                          |
| ext4  | 1 EiB       | 16 TiB        | Suppots solid-state disks. larger disks, robusts             |
| XFS   | 8 EiB       | 8EiB          | Cannot be shrunk, supports snaphots                          |
| Btrfs | 16 EiB      | 16 EiB        | Supports automatic defragmentation, copy-on-write, RAID, subvolumes, online data correction, snapshots |



### Extend existing logical volumes

1. Check volume group free space

   **Using lsblk command**

   ```
   # lsblk 
   NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
   fd0                         2:0    1  1.4M  0 disk 
   loop0                       7:0    0 67.2M  1 loop /snap/lxd/21835
   loop1                       7:1    0 61.9M  1 loop /snap/core20/1328
   loop2                       7:2    0 43.6M  1 loop /snap/snapd/14978
   loop3                       7:3    0 61.9M  1 loop /snap/core20/1361
   loop4                       7:4    0 67.9M  1 loop /snap/lxd/22526
   sda                         8:0    0   21G  0 disk 
   ├─sda1                      8:1    0    1M  0 part 
   ├─sda2                      8:2    0  1.5G  0 part /boot
   └─sda3                      8:3    0 18.5G  0 part 
     └─ubuntu--vg-ubuntu--lv 253:1    0   10G  0 lvm  /
   sdb                         8:16   0    1G  0 disk 
   └─sdb1                      8:17   0 1023M  0 part 
     └─vgdata-lvdata         253:0    0  500M  0 lvm  
   sr0                        11:0    1 97.2M  0 rom  
   sr1                        11:1    1  1.2G  0 rom  
   ```

   **Using vgdispaly commnd**

   ```
   # vgdisplay | grep Free
     Free  PE / Size       130 / 520.00 MiB
     Free  PE / Size       2175 / <8.50 GiB
   ```

2. Extend logical volume

   ```
   # lvextend -L +500M /dev/vgdata/lvdata 
     Size of logical volume vgdata/lvdata changed from 500.00 MiB (125 extents) to 1000.00 MiB (250 extents).
     Logical volume vgdata/lvdata successfully resized.
   ```

3. Check logical volume

   **Using vgdispaly commnd**

   ```
   # lsblk 
   NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
   fd0                         2:0    1  1.4M  0 disk 
   loop0                       7:0    0 67.2M  1 loop /snap/lxd/21835
   loop1                       7:1    0 61.9M  1 loop /snap/core20/1328
   loop2                       7:2    0 43.6M  1 loop /snap/snapd/14978
   loop3                       7:3    0 61.9M  1 loop /snap/core20/1361
   loop4                       7:4    0 67.9M  1 loop /snap/lxd/22526
   sda                         8:0    0   21G  0 disk 
   ├─sda1                      8:1    0    1M  0 part 
   ├─sda2                      8:2    0  1.5G  0 part /boot
   └─sda3                      8:3    0 18.5G  0 part 
     └─ubuntu--vg-ubuntu--lv 253:1    0   10G  0 lvm  /
   sdb                         8:16   0    1G  0 disk 
   └─sdb1                      8:17   0 1023M  0 part 
     └─vgdata-lvdata         253:0    0 1000M  0 lvm  
   sr0                        11:0    1 97.2M  0 rom  
   sr1                        11:1    1  1.2G  0 rom  
   ```

   **Using vgdispaly commnd**

   ```
   # vgdisplay | grep Free
     Free  PE / Size       5 / 20.00 MiB
     Free  PE / Size       2175 / <8.50 GiB
   ```

4. Resize file system

   **For ext4** 

   ```
   # resize2fs /dev/vgdata/lvdata 
   ```

   **For xfs**

   ```
   # xfs_growfs /dev/vgdata/lvdata 
   ```

   

### Automount File Systems on Linux 

1. Get the Name, UUID and File System Type

   ```
   # blkid 
   /dev/fd0: SEC_TYPE="msdos" UUID="5459-5107" TYPE="vfat"
   /dev/sda2: UUID="5ad1c3ca-0b9d-47b1-9d23-40d0592ad390" TYPE="ext4" PARTUUID="61e94aee-2ced-42a4-8ad7-9f95c01377aa"
   /dev/sda3: UUID="qyLTxi-Qpue-NtZv-bvA3-gOZL-sD6f-Oi1GBe" TYPE="LVM2_member" PARTUUID="39b90254-d4da-4d47-a513-945f26496902"
   /dev/sr0: UUID="2022-02-25-10-08-07-00" LABEL="CDROM" TYPE="iso9660"
   /dev/sdb1: UUID="OGrmim-rzWw-Hcha-DVte-IexI-G4SZ-ncnyjH" TYPE="LVM2_member" PARTLABEL="Linux filesystem" PARTUUID="3841d75f-43f9-464c-9d93-45192a03cf04"
   /dev/mapper/ubuntu--vg-ubuntu--lv: UUID="65238bf3-8a36-4379-8276-298243687ce2" TYPE="ext4"
   /dev/mapper/vgdata-lvdata: UUID="2045a544-067d-42e3-9c26-cf42d9af48ec" TYPE="ext4"
   /dev/loop0: TYPE="squashfs"
   /dev/loop1: TYPE="squashfs"
   /dev/loop2: TYPE="squashfs"
   /dev/loop3: TYPE="squashfs"
   /dev/loop4: TYPE="squashfs"
   /dev/sda1: PARTUUID="fbc83446-9f88-4d6a-ac2a-4814d123e721"
   ```

   

2. Make a Mount Point For Your Drive

   ```
   # mkdir /mnt/sdb1
   ```

3. Edit /etc/fstab File

   ```
   sudo nano /etc/fstab
   ```

   We need to append one line of code at the end of the file. The format of this line of code is as follows:

   ```
   UUID=<uuid-of-your-drive>  <mount-point>  <file-system-type>  <mount-option>  <dump>  <pass>
   ```

   Note that you need to separate these items with Tab key. For example, I added the following line to the end of `/etc/fstab`.

   ```
   UUID=2045a544-067d-42e3-9c26-cf42d9af48ec /mnt/sdb1 ext4 defaults 0 1
   ```

   Save and close the file. Then run the following command to see if it works.

   ```
   sudo mount -a
   ```



### Reduce existing logical volumes

#### Automated

**Decrease logical volume size using lvresize**

```
# lvresize -r -L 300M /dev/vgdata/lvdata 
Do you want to unmount "/mnt/sdb1" ? [Y|n] y
fsck from util-linux 2.34
/dev/mapper/vgdata-lvdata: 11/128000 files (0.0% non-contiguous), 8302/128000 blocks
resize2fs 1.45.5 (07-Jan-2020)
Resizing the filesystem on /dev/mapper/vgdata-lvdata to 76800 (4k) blocks.
The filesystem on /dev/mapper/vgdata-lvdata is now 76800 (4k) blocks long.

  Size of logical volume vgdata/lvdata changed from 500.00 MiB (125 extents) to 300.00 MiB (75 extents).
  Logical volume vgdata/lvdata successfully resized.

# df -h
Filesystem                         Size  Used Avail Use% Mounted on
udev                               933M     0  933M   0% /dev
tmpfs                              196M  1.3M  194M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv  9.8G  4.5G  4.9G  48% /
tmpfs                              977M     0  977M   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
tmpfs                              977M     0  977M   0% /sys/fs/cgroup
/dev/loop0                          62M   62M     0 100% /snap/core20/1328
/dev/loop2                          68M   68M     0 100% /snap/lxd/22526
/dev/loop1                          68M   68M     0 100% /snap/lxd/21835
/dev/loop4                          62M   62M     0 100% /snap/core20/1361
/dev/loop3                          44M   44M     0 100% /snap/snapd/14978
/dev/sda2                          1.5G  110M  1.3G   8% /boot
tmpfs                              196M     0  196M   0% /run/user/1000
/dev/mapper/vgdata-lvdata          273M  520K  251M   1% /mnt/sdb1
```

**Increase logical volume size using lvresize**

```
# lvresize -r -L 700M /dev/vgdata/lvdata 
  Size of logical volume vgdata/lvdata changed from 300.00 MiB (75 extents) to 700.00 MiB (175 extents).
  Logical volume vgdata/lvdata successfully resized.
resize2fs 1.45.5 (07-Jan-2020)
Filesystem at /dev/mapper/vgdata-lvdata is mounted on /mnt/sdb1; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 1
The filesystem on /dev/mapper/vgdata-lvdata is now 179200 (4k) blocks long.

# df -h
Filesystem                         Size  Used Avail Use% Mounted on
udev                               933M     0  933M   0% /dev
tmpfs                              196M  1.3M  194M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv  9.8G  4.5G  4.9G  48% /
tmpfs                              977M     0  977M   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
tmpfs                              977M     0  977M   0% /sys/fs/cgroup
/dev/loop0                          62M   62M     0 100% /snap/core20/1328
/dev/loop2                          68M   68M     0 100% /snap/lxd/22526
/dev/loop1                          68M   68M     0 100% /snap/lxd/21835
/dev/loop4                          62M   62M     0 100% /snap/core20/1361
/dev/loop3                          44M   44M     0 100% /snap/snapd/14978
/dev/sda2                          1.5G  110M  1.3G   8% /boot
tmpfs                              196M     0  196M   0% /run/user/1000
/dev/mapper/vgdata-lvdata          661M 1016K  630M   1% /mnt/sdb1
```



#### Manual

1. Check the mount

   ```
   # df -h
   Filesystem                         Size  Used Avail Use% Mounted on
   udev                               933M     0  933M   0% /dev
   tmpfs                              196M  1.3M  194M   1% /run
   /dev/mapper/ubuntu--vg-ubuntu--lv  9.8G  4.5G  4.9G  48% /
   tmpfs                              977M     0  977M   0% /dev/shm
   tmpfs                              5.0M     0  5.0M   0% /run/lock
   tmpfs                              977M     0  977M   0% /sys/fs/cgroup
   /dev/loop0                          62M   62M     0 100% /snap/core20/1328
   /dev/loop2                          68M   68M     0 100% /snap/lxd/22526
   /dev/loop1                          68M   68M     0 100% /snap/lxd/21835
   /dev/loop4                          62M   62M     0 100% /snap/core20/1361
   /dev/loop3                          44M   44M     0 100% /snap/snapd/14978
   /dev/sda2                          1.5G  110M  1.3G   8% /boot
   /dev/mapper/vgdata-lvdata          953M  1.3M  886M   1% /mnt/sdb1
   tmpfs                              196M     0  196M   0% /run/user/1000
   ```

2. Unmount logical volume and check if unmounted

   Note: Always unmount logical volumes when reducing the size and leave it mounted when increasing it.

   ```
   # umount /mnt/sdb1 
   
   # df -h
   Filesystem                         Size  Used Avail Use% Mounted on
   udev                               933M     0  933M   0% /dev
   tmpfs                              196M  1.3M  194M   1% /run
   /dev/mapper/ubuntu--vg-ubuntu--lv  9.8G  4.5G  4.9G  48% /
   tmpfs                              977M     0  977M   0% /dev/shm
   tmpfs                              5.0M     0  5.0M   0% /run/lock
   tmpfs                              977M     0  977M   0% /sys/fs/cgroup
   /dev/loop0                          62M   62M     0 100% /snap/core20/1328
   /dev/loop2                          68M   68M     0 100% /snap/lxd/22526
   /dev/loop1                          68M   68M     0 100% /snap/lxd/21835
   /dev/loop4                          62M   62M     0 100% /snap/core20/1361
   /dev/loop3                          44M   44M     0 100% /snap/snapd/14978
   /dev/sda2                          1.5G  110M  1.3G   8% /boot
   tmpfs                              196M     0  196M   0% /run/user/1000
   ```

3. Run file system check

   Note: If all 5 system file check is pass, proceed if not resolve the error first.

   ```
   # e2fsck -ff /dev/mapper/vgdata-lvdata 
   e2fsck 1.45.5 (07-Jan-2020)
   Pass 1: Checking inodes, blocks, and sizes
   Pass 2: Checking directory structure
   Pass 3: Checking directory connectivity
   Pass 4: Checking reference counts
   Pass 5: Checking group summary information
   /dev/mapper/vgdata-lvdata: 11/256000 files (0.0% non-contiguous), 12438/256000 blocks
   ```

4.  Resize the file system

   ```
   # resize2fs /dev/mapper/vgdata-lvdata 500M
   resize2fs 1.45.5 (07-Jan-2020)
   Resizing the filesystem on /dev/mapper/vgdata-lvdata to 128000 (4k) blocks.
   The filesystem on /dev/mapper/vgdata-lvdata is now 128000 (4k) blocks long.
   ```

5. Reduce the logical volume

   ```
   # lvresize -L 500M /dev/vgdata/lvdata 
     WARNING: Reducing active logical volume to 500.00 MiB.
     THIS MAY DESTROY YOUR DATA (filesystem etc.)
   Do you really want to reduce vgdata/lvdata? [y/n]: y
     Size of logical volume vgdata/lvdata changed from 1000.00 MiB (250 extents) to 500.00 MiB (125 extents).
     Logical volume vgdata/lvdata successfully resized.
   ```

6. Verify the logical volume size

   ```
   # lvs
     LV        VG        Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
     ubuntu-lv ubuntu-vg -wi-ao----  10.00g                                                    
     lvdata    vgdata    -wi-a----- 500.00m     
   ```

7. Mount the volume again and check the size

   ```
   # mount /dev/mapper/vgdata-lvdata /mnt/sdb1
   
   # df -h
   Filesystem                         Size  Used Avail Use% Mounted on
   udev                               933M     0  933M   0% /dev
   tmpfs                              196M  1.3M  194M   1% /run
   /dev/mapper/ubuntu--vg-ubuntu--lv  9.8G  4.5G  4.9G  48% /
   tmpfs                              977M     0  977M   0% /dev/shm
   tmpfs                              5.0M     0  5.0M   0% /run/lock
   tmpfs                              977M     0  977M   0% /sys/fs/cgroup
   /dev/loop0                          62M   62M     0 100% /snap/core20/1328
   /dev/loop2                          68M   68M     0 100% /snap/lxd/22526
   /dev/loop1                          68M   68M     0 100% /snap/lxd/21835
   /dev/loop4                          62M   62M     0 100% /snap/core20/1361
   /dev/loop3                          44M   44M     0 100% /snap/snapd/14978
   /dev/sda2                          1.5G  110M  1.3G   8% /boot
   tmpfs                              196M     0  196M   0% /run/user/1000
   /dev/mapper/vgdata-lvdata          469M  768K  433M   1% /mnt/sdb1
   ```

   

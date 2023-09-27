# Linux Professional Institute LPIC-1 Lab

## SYSTEM ARCHITECTURE

### QUIZ: DETERMINE AND CONFIGURE HARDWARE SETTINGS

1. Which command will list kernel modules in use by hardware?

   - lspci -l
   - lspci -m
   - **lspci -k**
   - lspci --modules

2. Which file would you search to determine the CPU features on a Linux machine?

   - **/proc/cpuinfo**
   - /proc/cpu
   - /proc/hardware/cpuinfo
   - /dev/cpuinfo

3. A friend is visiting you and brings a portable USB hard drive to share some files with you. You have one SATA drive in your Linux machine. Which name will be given to your friend’s portable USB hard drive in the /dev/ directory of your Linux machine?

   - /dev/sata2
   - **/dev/sdb**
   - /dev/sba
   - /dev/usb1

   In Linux, USB drives are treated as SATA drives and follow the same naming conventions. Your initial drive is already identified as /dev/sda, so your friend's USB hard drive will be identified as /dev/sdb.

4. You have added a new hard drive to a system. You know that the hard drive has no defects, but the system cannot boot. Where would you go to begin troubleshooting this problem?

   - The manufacturer’s website.
   - The manual for the hard drive.
   - An Internet forum.
   - **The BIOS setup utility.**

5. You need to know which hardware devices are inside of a Linux system, but you cannot open the system’s case. How would you get Linux to produce a list of hardware connected to the PCI bus?

   - modprobe
   - ls /dev/
   - cat /proc/hardware
   - **lspci**



### QUIZ: BOOT THE SYSTEM



1. You have compiled a custom kernel, and the filesystem type used by your Linux system’s root filesystem is compiled as a module. What would you need to include along with the kernel to make sure your system loads the root filesystem correctly?

   - **initramfs**
   - bootstrap-
   - EFI applications
   - A copy of /etc/modules.conf.d/

   An initial RAM filesystem (initramfs) should be included if the root filesystem is compiled as a module.

2. On a system equipped with BIOS, what should be placed in the MBR of the first storage device in order to boot the system?

   - kernel
   - firmware
   - **bootstrap**
   - initrd

   The bootstrap binary must be located in the MBR of the first storage device for a system equipped with BIOS to boot correctly.

3. Which command would you use to view only the last ten lines of the initialization log?

   - **dmesg | tail**
   - dmesg -H
   - lastlog
   - dmesg --last

   Directing the output of dmesg to the tail command will only show the last ten lines of the initialization log.

4. Which option would you pass to journalctl to change the directory it uses to search for log files?

   - –log-dir

   - -d

   - –log-directory=

   - **-D**

5. Which filesystem would you use for the ESP partition?

   - xfs
   - **fat32**
   - ext2
   - ntfs

   EFI System Partitions (ESP) should use a FAT filesystem, like FAT12, FAT16, or FAT32.



### QUIZ: CHANGE RUNLEVELS / BOOT TARGETS AND SHUTDOWN OR REBOOT SYSTEM

1. On SysV systems, which file contains the default init configuration?

   - /etc/init.d/defaults

   - **/etc/inittab**

   - /etc/defaults/inittab

   - /etc/conf.d/inittab

2. Which command would cause the system to shutdown 45 minutes from now?

   - shutdown +45M
   - shutdown now+45
   - **shutdown +45**
   - shutdown 00:45

3. Using systemctl, how would you determine if a service named myservice.service is configured to start when the system boots?

   - systemctl is-active myservice.service
   - systemctl status myservice.service
   - **systemctl is-enabled myservice.service**
   - systemctl on-boot myservice.service

4. Given a theoretical file located at /etc/rc3.d/S45 ethernet, what would happen to any services listed in this file when the system enters runlevel 3?

   - They will stop.
   - **They will start.**
   - They will be suspended.
   - They will be restarted.

5. If you want to warn other users of a Linux system that the system is going down for maintenance, which command could you use to send a message to all logged-in users?

   - warn
   - write
   - wipe
   - **wall**



## LINUX INSTALLATION AND PACKAGE MANAGEMENT, 

### Design Hard Disk Layout – Logical Volume Manager (LVM)

#### **To install LVM**

```
# apt install lvm2
```

#### **List devices that may be used as physical volumes**

```
# lvmdiskscan 
  /dev/sda1 [       1.00 GiB] 
  /dev/sda2 [     <19.00 GiB] LVM physical volume
  /dev/sdb  [       1.00 GiB] 
  /dev/sdc  [       1.00 GiB] 
  /dev/sdd  [       1.00 GiB] 
  3 disks
  1 partition
  0 LVM physical volume whole disks
  1 LVM physical volume
```

#### **List block devices**

```
# lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda               8:0    0   20G  0 disk 
├─sda1            8:1    0    1G  0 part /boot
└─sda2            8:2    0   19G  0 part 
  ├─centos-root 253:0    0   17G  0 lvm  /
  └─centos-swap 253:1    0    2G  0 lvm  [SWAP]
sdb               8:16   0    1G  0 disk 
sdc               8:32   0    1G  0 disk 
sdd               8:48   0    1G  0 disk 
sr0              11:0    1 1024M  0 rom  
```

#### **Create physical volumes**

```
# pvcreate /dev/sdb /dev/sdc 
  Physical volume "/dev/sdb" successfully created.
  Physical volume "/dev/sdc" successfully created.
```

##### **Display information about physical volumes**

```
# pvs
  PV         VG     Fmt  Attr PSize   PFree
  /dev/sda2  centos lvm2 a--  <19.00g    0 
  /dev/sdb          lvm2 ---    1.00g 1.00g
  /dev/sdc          lvm2 ---    1.00g 1.00g
```

OR 

```
# pvdisplay /dev/sdb 
  "/dev/sdb" is a new physical volume of "1.00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/sdb
  VG Name               
  PV Size               1.00 GiB
  Allocatable           NO
  PE Size               0   
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               kxWiFl-Upcq-BQFQ-bXDd-K0ZW-MDdE-17jaSD
```

OR

```
# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sda2
  VG Name               centos
  PV Size               <19.00 GiB / not usable 3.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              4863
  Free PE               0
  Allocated PE          4863
  PV UUID               ZQzCdM-Q7Ur-9aRo-v1r1-1gHk-kozF-8F0hej
   
  "/dev/sdc" is a new physical volume of "1.00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/sdc
  VG Name               
  PV Size               1.00 GiB
  Allocatable           NO
  PE Size               0   
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               ns2hHg-TMqs-wUAI-ufHU-PH7Q-qbHp-mfd4KW
   
  "/dev/sdb" is a new physical volume of "1.00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/sdb
  VG Name               
  PV Size               1.00 GiB
  Allocatable           NO
  PE Size               0   
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               kxWiFl-Upcq-BQFQ-bXDd-K0ZW-MDdE-17jaSD
```

##### Remove physical volume(s)

```
# pvremove /dev/sdd
  Labels on physical volume "/dev/sdd" successfully wiped.
```



#### Create a volume group

```
vgcreate my_volume /dev/sdb 
```

Or, to include both partitions at once:

```
# vgcreate my_volume /dev/sdb /dev/sdc 
  Volume group "my_volume" successfully created
```

##### **Display information about volume group**

```
# vgs
  VG        #PV #LV #SN Attr   VSize   VFree
  centos      1   2   0 wz--n- <19.00g    0 
  my_volume   2   0   0 wz--n-   1.99g 1.99g
```

OR

```
# vgdisplay my_volume
  --- Volume group ---
  VG Name               my_volume
  System ID             
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               1.99 GiB
  PE Size               4.00 MiB
  Total PE              510
  Alloc PE / Size       0 / 0   
  Free  PE / Size       510 / 1.99 GiB
  VG UUID               dYknHq-jSIQ-sGWy-Kdpd-xsCe-33yV-EhuIA2

```

OR

```
# vgdisplay 
  --- Volume group ---
  VG Name               centos
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               <19.00 GiB
  PE Size               4.00 MiB
  Total PE              4863
  Alloc PE / Size       4863 / <19.00 GiB
  Free  PE / Size       0 / 0   
  VG UUID               ZYiPQY-wxhi-nTaQ-x7Y2-GGV4-lfzT-PnYFb4
   
  --- Volume group ---
  VG Name               my_volume
  System ID             
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               1.99 GiB
  PE Size               4.00 MiB
  Total PE              510
  Alloc PE / Size       0 / 0   
  Free  PE / Size       510 / 1.99 GiB
  VG UUID               dYknHq-jSIQ-sGWy-Kdpd-xsCe-33yV-EhuIA2
```

##### Add more physical volumes to the volume group 

```
# pvcreate /dev/sdd
  Physical volume "/dev/sdd" successfully created.

# vgextend my_volume /dev/sdd
  Volume group "my_volume" successfully extended

# vgs
  VG        #PV #LV #SN Attr   VSize   VFree 
  centos      1   2   0 wz--n- <19.00g     0 
  my_volume   3   0   0 wz--n-  <2.99g <2.99g
```

##### Remove physical volumes to the volume group 

```
# pvdisplay -C -o pv_name,vg_name
  PV         VG       
  /dev/sda2  centos   
  /dev/sdb   my_volume
  /dev/sdc   my_volume
  /dev/sdd   my_volume

# vgreduce my_volume /dev/sdd
  Removed "/dev/sdd" from volume group "my_volume"

```

##### List all physical volumes associated to a volume group

```
# pvdisplay -C -o pv_name,vg_name
  PV         VG       
  /dev/sda2  centos   
  /dev/sdb   my_volume
  /dev/sdc   my_volume
  /dev/sdd            
```



#### Create logical volumes

```
# lvcreate --size 250M --name partition1 my_volume
  Rounding up size to full physical extent 252.00 MiB
  Logical volume "partition1" created.
```

OR

```
# lvcreate -L 250M -n partition2 my_volume
  Rounding up size to full physical extent 252.00 MiB
  Logical volume "partition2" created.
```

##### **Display information about logicalvolumes**

```
# lvs
  LV         VG        Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root       centos    -wi-ao---- <17.00g                                                    
  swap       centos    -wi-ao----   2.00g                                                    
  partition1 my_volume -wi-a----- 252.00m                                                    
  partition2 my_volume -wi-a----- 252.00m                    
```

OR

```
# lvdisplay /dev/my_volume/partition1
  --- Logical volume ---
  LV Path                /dev/my_volume/partition1
  LV Name                partition1
  VG Name                my_volume
  LV UUID                cgVC6q-VQTl-TjsA-dY4W-lM83-aBLM-fAczWp
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2023-09-25 09:46:32 +0800
  LV Status              available
  # open                 0
  LV Size                252.00 MiB
  Current LE             63
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:
```



##### Resize logical volumes

```
# lvresize --extents 100%VG my_volume/partition1

OR

# lvresize -l 100%VG my_volume/partition1
  Reducing 100%VG to remaining free space <1.75 GiB in VG.
  Size of logical volume my_volume/partition1 changed from 252.00 MiB (63 extents) to <1.75 GiB (447 extents).
  Logical volume my_volume/partition1 successfully resized.
  
# vgs
  VG        #PV #LV #SN Attr   VSize   VFree
  centos      1   2   0 wz--n- <19.00g    0 
  my_volume   2   2   0 wz--n-   1.99g    0 
  
# lvs
  LV         VG        Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root       centos    -wi-ao---- <17.00g                                                    
  swap       centos    -wi-ao----   2.00g                                                    
  partition1 my_volume -wi-a-----  <1.75g                                                    
  partition2 my_volume -wi-a----- 252.00m                                                
```

##### Shrink logical volumes

```
# lvresize -L 250M my_volume/partition1
OR
# lvresize --size 250M my_volume/partition1
  Rounding size to boundary between physical extents: 252.00 MiB.
  WARNING: Reducing active logical volume to 252.00 MiB.
  THIS MAY DESTROY YOUR DATA (filesystem etc.)
Do you really want to reduce my_volume/partition1? [y/n]: y
  Size of logical volume my_volume/partition1 changed from <1.75 GiB (447 extents) to 252.00 MiB (63 extents).
  Logical volume my_volume/partition1 successfully resized.
```

#### Create a filesystem on logical volumes

 ```
 # mkfs.xfs /dev/my_volume/partition1
 meta-data=/dev/my_volume/partition1 isize=512    agcount=4, agsize=16128 blks
          =                       sectsz=512   attr=2, projid32bit=1
          =                       crc=1        finobt=0, sparse=0
 data     =                       bsize=4096   blocks=64512, imaxpct=25
          =                       sunit=0      swidth=0 blks
 naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
 log      =internal log           bsize=4096   blocks=855, version=2
          =                       sectsz=512   sunit=0 blks, lazy-count=1
 realtime =none                   extsz=4096   blocks=0, rtextents=0
 
 ```

Resize the logical volume and filesystem

```
# lvresize --resizefs --size 512M my_volume/partition1
OR
# lvresize -r -L 512M my_volume/partition1
Phase 1 - find and verify superblock...
Phase 2 - using internal log
        - zero log...
        - scan filesystem freespace and inode maps...
        - found root inode chunk
Phase 3 - for each AG...
        - scan (but don't clear) agi unlinked lists...
        - process known inodes and perform inode discovery...
        - agno = 0
        - agno = 1
        - agno = 2
        - agno = 3
        - process newly discovered inodes...
Phase 4 - check for duplicate blocks...
        - setting up duplicate extent list...
        - check for inodes claiming duplicate blocks...
        - agno = 0
        - agno = 1
        - agno = 2
        - agno = 3
No modify flag set, skipping phase 5
Phase 6 - check inode connectivity...
        - traversing filesystem ...
        - traversal finished ...
        - moving disconnected inodes to lost+found ...
Phase 7 - verify link counts...
No modify flag set, skipping filesystem flush and exiting.
  Size of logical volume my_volume/partition1 changed from 252.00 MiB (63 extents) to 512.00 MiB (128 extents).
  Logical volume my_volume/partition1 successfully resized.
meta-data=/dev/mapper/my_volume-partition1 isize=512    agcount=4, agsize=16128 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0 spinodes=0
data     =                       bsize=4096   blocks=64512, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal               bsize=4096   blocks=855, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
data blocks changed from 64512 to 131072
```



### QUIZ: DESIGN HARD DISK LAYOUT

1. Where are the files for the GRUB bootloader stored?
   - **/boot/grub/**
   - /etc/grub/
   - /boot/
   - /grub/boot/
2. In addition to swap partitions, Linux can make use of swap files. Where is the swap file typically located?
   - /mnt/swap
   - **/swapfile**
   - /mnt/swapfile
   - /swap
3. When a Linux system mounts the EFI partition, where is it usually mounted?
   - /boot/grub/efi/
   - **/boot/efi/**
   - /efi/
   - /mnt/efi/
4. Volume Groups are divided into:
   - **Extents**
   - Chunks
   - Sectors
   - Slices
5. Which formula would give the size of a Logical Volume?
   - **Number of extents multiplied by physical extent size**
   - Size of physical extents divided by number of extents
   - Disk sectors multiplied by number of extents
   - Number of extents divided by size of physical extents



### QUIZ: INSTALL A BOOT MANAGER

1. To change the menu entries for GRUB Legacy, which file would you edit?

   - **/boot/grub/menu.lst**

   - /boot/grub/grub.cfg

   - /etc/grub/menu.lst

   - /etc/grub/grub.cfg

2. GRUB 2 stores its configuration file at:

   - /boot/grub/grub.cfg

   - **/etc/grub/grub.cfg**

   - /etc/grub.d/

   - /boot/grub.d/

3. When using GRUB Legacy, how is the first partition of the first disk labeled?

   - (hd1,1)

   - (hd0,1)

   - **(hd0,0)**

   - (hd1,0)

4. If you update the configuration for GRUB 2, which command would you run to write that configuration to the correct directory for GRUB 2 to use the next time you boot the system?

   - **grub-mkconfig -o /boot/grub/grub.cfg**

   - grub-config -o /boot/grub/grub.conf

   - grub-config -o /boot/grub/grub.cfg

   - grub-mkconfig -o /boot/grub/grub.conf

5. When using GRUB 2, which menu entry parameter determines how long GRUB 2 will pause before booting the default menu entry?

   - **GRUB_TIMEOUT=**

   - GRUB_TIMER=

   - GRUB_PAUSE=

   - GRUB_WAIT=

### MANAGE SHARED LIBRARIES

**List the shared libraries used by the /usr/bin/systemctl program**

```
# ldd /usr/bin/systemctl
```



### QUIZ: MANAGE SHARED LIBRARIES

1. You have added a new shared library directory to your system, and you have written a custom configuration file including the full path to to the new shared library location. Which directory would you put the configuration file into?

   - /etc/share

   - /usr/ld.so.conf.d/

   - **/etc/ld.so.conf.d/**

   - /usr/share/

2. After adding a new shared library directory to your system, you copied a configuration file with its full path to the correct directory. Which command would you use to notify the system of the change?

   - **ldconfig**

   - ldd

   - updatedb

   - libupdate

3. Static libraries have which file extension?

   - .aout

   - .out

   - **.a**

   - .lib

   Static libraries use the .a file extension.

4. The naming format for shared libraries is:

   - [libraryname.versionnumber.so](http://libraryname.versionnumber.so/)

   - **libraryname.so.versionnumber**

   - libraryname-so.versionnumber

   - [libraryname-versionnumber.so](http://libraryname-versionnumber.so/)

5. Which command would you use to list the shared libraries used by the /usr/bin/systemctl program?

   - shared /usr/bin/systemctl

   - lib /usr/bin/systemctl

   - **ldd /usr/bin/systemctl**

   - ###### which /usr/bin/systemctl

### QUIZ: USE DEBIAN PACKAGE MANAGEMENT

1. Which parameter would you add to dpkg-query to show which package contains a particular file?

   - **-S**
   - -l
   - -s
   - -W

2. Which apt-cache command will provide information for a package?

   - apt-cache info

   - apt-cache search

   - apt-cache print

   - **apt-cache show**

3. On a Debian system, which command would remove a package and all of its configuration files?

   - dpkg --remove

   - dkpg --erase

   - **dpkg -P**

   - dpkg -r

4. Which apt-file command would show the package that contains the file /usr/bin/systemctl?

   - apt-file query /usr/bin/systemctl

   - apt-file provides /usr/bin/systemctl

   - **apt-file search /usr/bin/systemctl**

   - apt-file show /usr/bin/systemctl

   You can use apt-file search followed by the full path to a file to show which package contains that file.

5. Which command would you use to install a .deb file located on your local Linux system?

   - dpkg -I

   - dpkg install

   - **dpkg -i**

   - dpkg -install



### **USE RPM AND YUM PACKAGE MANAGEMENT**

 Display the configured software repositories

```
# yum repolist
repo id                            repo name
appstream                          CentOS Stream 9 - AppStream
baseos                             CentOS Stream 9 - BaseOS
extras-common                      CentOS Stream 9 - Extras packages
```

```
# yum repolist -v
Loaded plugins: builddep, changelog, config-manager, copr, debug, debuginfo-install, download, generate_completion_cache, groups-manager, needs-restarting, playground, repoclosure, repodiff, repograph, repomanage, reposync, system-upgrade
YUM version: 4.14.0
cachedir: /var/cache/dnf
Last metadata expiration check: 2:31:14 ago on Tue 26 Sep 2023 10:16:47 AM PST.
Repo-id            : appstream
Repo-name          : CentOS Stream 9 - AppStream
Repo-revision      : 9-stream
Repo-distro-tags      : [cpe:/o:centos-stream:centos-stream:9]:  ,  , 9, C, O, S, S, a,
                      : e, e, m, n, r, t, t
Repo-updated       : Mon 25 Sep 2023 09:53:14 PM PST
Repo-pkgs          : 12,091
Repo-available-pkgs: 11,868
Repo-size          : 23 G
Repo-metalink      : https://mirrors.centos.org/metalink?repo=centos-appstream-9-stream&arch=aarch64&protocol=https,http
  Updated          : Tue 26 Sep 2023 10:16:43 AM PST
Repo-baseurl       : http://ftp.riken.jp/Linux/centos-stream/9-stream/AppStream/aarch64/os/
                   : (39 more)
Repo-expire        : 21,600 second(s) (last: Tue 26 Sep 2023 10:16:43 AM PST)
Repo-filename      : /etc/yum.repos.d/centos.repo

Repo-id            : baseos
Repo-name          : CentOS Stream 9 - BaseOS
Repo-revision      : 9-stream
Repo-distro-tags      : [cpe:/o:centos-stream:centos-stream:9]:  ,  , 9, C, O, S, S, a,
                      : e, e, m, n, r, t, t
Repo-updated       : Mon 25 Sep 2023 09:50:17 PM PST
Repo-pkgs          : 3,396
Repo-available-pkgs: 3,396
Repo-size          : 5.2 G
Repo-metalink      : https://mirrors.centos.org/metalink?repo=centos-baseos-9-stream&arch=aarch64&protocol=https,http
  Updated          : Tue 26 Sep 2023 10:16:37 AM PST
Repo-baseurl       : http://mirrors.tuna.tsinghua.edu.cn/centos-stream/9-stream/BaseOS/aarch64/os/
                   : (39 more)
Repo-expire        : 21,600 second(s) (last: Tue 26 Sep 2023 10:16:37 AM PST)
Repo-filename      : /etc/yum.repos.d/centos.repo

Repo-id            : extras-common
Repo-name          : CentOS Stream 9 - Extras packages
Repo-revision      : 1695367583
Repo-updated       : Fri 22 Sep 2023 03:26:23 PM PST
Repo-pkgs          : 69
Repo-available-pkgs: 69
Repo-size          : 700 k
Repo-metalink      : https://mirrors.centos.org/metalink?repo=centos-extras-sig-extras-common-9-stream&arch=aarch64&protocol=https,http
  Updated          : Tue 26 Sep 2023 10:16:47 AM PST
Repo-baseurl       : https://ftp.iij.ad.jp/pub/linux/centos-stream/SIGs/9-stream/extras/aarch64/extras-common/
                   : (19 more)
Repo-expire        : 21,600 second(s) (last: Tue 26 Sep 2023 10:16:47 AM PST)
Repo-filename      : /etc/yum.repos.d/centos-addons.repo
Total packages: 15,556
```

**Repolist command-specific options:**
  --all                 show all repos
  --enabled             show enabled repos (default)
  --disabled            show disabled repos

```
# yum repolist --all
repo id                         repo name                                        status
appstream                       CentOS Stream 9 - AppStream                      enabled
appstream-debuginfo             CentOS Stream 9 - AppStream - Debug              disabled
appstream-source                CentOS Stream 9 - AppStream - Source             disabled
baseos                          CentOS Stream 9 - BaseOS                         enabled
baseos-debuginfo                CentOS Stream 9 - BaseOS - Debug                 disabled
baseos-source                   CentOS Stream 9 - BaseOS - Source                disabled
crb                             CentOS Stream 9 - CRB                            disabled
crb-debuginfo                   CentOS Stream 9 - CRB - Debug                    disabled
crb-source                      CentOS Stream 9 - CRB - Source                   disabled
extras-common                   CentOS Stream 9 - Extras packages                enabled
extras-common-source            CentOS Stream 9 - Extras packages - Source       disabled
highavailability                CentOS Stream 9 - HighAvailability               disabled
highavailability-debuginfo      CentOS Stream 9 - HighAvailability - Debug       disabled
highavailability-source         CentOS Stream 9 - HighAvailability - Source      disabled
nfv                             CentOS Stream 9 - NFV                            disabled
nfv-debuginfo                   CentOS Stream 9 - NFV - Debug                    disabled
nfv-source                      CentOS Stream 9 - NFV - Source                   disabled
resilientstorage                CentOS Stream 9 - ResilientStorage               disabled
resilientstorage-debuginfo      CentOS Stream 9 - ResilientStorage - Debug       disabled
resilientstorage-source         CentOS Stream 9 - ResilientStorage - Source      disabled
rt                              CentOS Stream 9 - RT                             disabled
rt-debuginfo                    CentOS Stream 9 - RT - Debug                     disabled
rt-source                       CentOS Stream 9 - RT - Source                    disabled
```

Enable and disable repositories

```
# subscription-manager repos --enable [repo id]

# subscription-manager repos --disable [repo id]

# yum-config-manager --enable [repo-id]

# yum-config-manager --disable [repo-id]
```

Add repository

```
# yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
Updating Subscription Management repositories.
Unable to read consumer identity

This system is not registered with an entitlement server. You can use subscription-manager to register.

Adding repo from: https://download.docker.com/linux/centos/docker-ce.repo
```



```
# vi /etc/yum.repos.d/docker-ce.repo
```

docker-ce.repo

```
[docker-ce-stable]
name=Docker CE Stable - $basearch
baseurl=https://download.docker.com/linux/centos/$releasever/$basearch/stable
enabled=1
gpgcheck=1
gpgkey=https://download.docker.com/linux/centos/gpg

[docker-ce-stable-debuginfo]
name=Docker CE Stable - Debuginfo $basearch
baseurl=https://download.docker.com/linux/centos/$releasever/debug-$basearch/stable
enabled=0
gpgcheck=1
gpgkey=https://download.docker.com/linux/centos/gpg

[docker-ce-stable-source]
name=Docker CE Stable - Sources
baseurl=https://download.docker.com/linux/centos/$releasever/source/stable
enabled=0
gpgcheck=1
gpgkey=https://download.docker.com/linux/centos/gpg
```

**Yum group**

```
# yum group list
Updating Subscription Management repositories.
Unable to read consumer identity

This system is not registered with an entitlement server. You can use subscription-manager to register.

Last metadata expiration check: 1:58:05 ago on Tue 26 Sep 2023 01:17:13 PM PST.
Available Environment Groups:
   Server with GUI
   Server
   Custom Operating System
Installed Environment Groups:
   Minimal Install
Available Groups:
   Legacy UNIX Compatibility
   Console Internet Tools
   Container Management
   Development Tools
   .NET Development
   Graphical Administration Tools
   Headless Management
   Network Servers
   RPM Development Tools
   Scientific Support
   Security Tools
   Smart Card Support
   System Tools
   
   # yum group list --hidden
   
   # yum group install 'Server with GUI'
   
   # yum group remove 'Server with GUI'
```

```
$ sudo wget https://download.nomachine.com/download/7.7/Linux/nomachine_7.7.4_1_x86_64.rpm

$ sudo yum install ./nomachine_7.7.4_1_X86_64.rpm

$ sudo yum remove nomachine

$ sudo yum autoremove
```



### QUIZ: USE RPM AND YUM PACKAGE MANAGEMENT

1. Where are repository files stored for DNF and YUM?

   - /etc/repos.d/

   - /etc/yum/repos.d/

   - **/etc/yum.repos.d/**

   - /etc/yum/repos/

2. Using YUM or DNF, which option would uninstall a package from the system, along with any packages that depend on that package?

   - uninstall

   - **remove**

   - delete

   - purge

3. Using DNF, how would you install the httpd package?

   - dnf provide httpd

   - dnf -i httpd

   - dnf httpd

   - **dnf install httpd**

4. Which yum command will bring repository metadata to the most recent version?

   - yum check-metadata

   - yum metadata

   - yum upgrade

   - **yum update**

5. Using zypper, how would you find out which package provides the file /usr/bin/systemctl?

   - **zypper se --provides /usr/bin/systemctl**

   - zypper se /usr/bin/systemctl

   - zypper se provides /usr/bin/systemctl

   - zypper --provides /usr/bin/systemctl



### QUIZ: LINUX AS A VIRTUALIZATION GUEST

1. Which type of virtualization requires the guest to be capable of running all instructions on virtual hardware?

   - bare metal

   - paravirtualization

   - **full virtualization**

   - hybrid virtualization

2. Intel VT-x and AMD-V are examples of _____ used to provide support for fully virtualized guests?

   - hypervisors

   - virtual machines

   - paravirtualized drivers

   - **CPU extensions**

3. Which virtualization method provides the highest performance?

   - Virsh

   - VirtualBox

   - **Paravirtualization**

   - Full virtualization

4. Which program is used to start Linux virtual instances in a cloud environment?

   - kickstart

   - upstart

   - **cloud-init**

   - cloud-start

5. KVM is a _____ hypervisor. Select all that apply.

   - **Type-1**

   - Bare metal

   - Hybrid

   - **Type-2**



## GNU AND UNIX COMMANDS

### QUIZ: WORK ON THE COMMAND LINE PART 1

1. Which command is used to search the short description of man pages for keywords?

   - find

   - **apropos**

   - grep

   - cat

2. To create an empty file named emptyfile in the current working directory, which command would you use?

   - echo emptyfile

   - **touch emptyfile**

   - new emptyfile

   - blank emptyfile

3. Which command will cause Bash to print the path of the current directory?

   - **pwd**

   - cwd

   - whereami

   - which directory

4. If you are unsure of the location of an executable mycommand on a Linux system, how would you find it?

   - whereis mycommand

   - **which mycommand**

   - find mycommand

   - fetch mycommand

5. Before the apropos command will work on a new system, it may be necessary to run another command first. Which command would you run to make sure apropos has access to all of the information it needs?

   - mandb

   - dbupdate

   - apropos -update

   - **updatedb**



### QUIZ: WORK ON THE COMMAND LINE PART 2

1. You have set a variable called kodekloud using the export command. Which command would print the value of the kodekloud variable?

   - echo kodekloud

   - print kodekloud

   - **echo $kodekloud**

   - read $kodekloud

2. The _____ command can be used to assign values to environment variables for the current shell session.

   - import

   - env

   - echo

   - **export**

3. The _____ command will print a list of all current environment variables.

   - import

   - **env**

   - export

   - path

4. Which command would return the list of directories used by the shell to find executable commands?

   - **echo $PATH**

   - print $PATH

   - pwd $PATH

   - read $PATH

5. The _____ command can be used to clear environment variables for the current shell session.

   - import

   - clear

   - **unset**

   - echo



### QUIZ: PROCESS TEXT STREAMS USING FILTERS

1. Which command can be used to search file content using regular expression patterns?

   - find

   - **grep**

   - search

   - read

2. Which command sequence would put the contents of a text file named myfile.txt in alphabetical order and remove all duplicates? Select all that apply.

   - **sort myfile.txt | uniq**

   - **uniq myfile.txt | sort**

   - sed -i -s ‘duplicates//g’ myfile.txt && sort myfile.txt

   - sort myfile.txt | sed -s ‘duplicates//g’

3. The _____ command will print the contents of a text file to standard output.

   - grep

   - **cat**

   - wc

   - print

4. The _____ command can be used to perform search and replace operations on text files.

   - **sed**

   - substitute

   - grep

   - find

5. Which command can be used to print only the desired field from text?

   - grep

   - find

   - sed

   - **cut**





### QUIZ: PERFORM BASIC FILE MANAGEMENT PART 1

1. Which command can be used to rename an existing file or directory?

   - cp

   - ls

   - touch

   - **mv**

2. To remove a directory called mydir along with all of its files and subdirectories, which command would you use?

   - rm mydir

   - rm -R mydir

   - rm mydir/*

   - **rm -rf mydir**

3. Which command(s) would list all of the files in the current directory that start with the word “file” followed by one number and .txt?

   - **ls file[0-9].txt**

   - ls | grep ‘file*.txt’

   - **ls | grep ‘file[0-9].txt’**

   - ls file*.txt

4. Which option(s) would you use with the ls command to print file sizes in human readable format?

   - ls -h

   - ls -l --human

   - ls --human

   - **ls -lh**

5. Which option can be used with ls to show hidden files?

   - -h

   - **-a**

   - –hidden

   - -?



### QUIZ: PERFORM BASIC FILE MANAGEMENT PART 2

1. Which command would take the contents of the /home/kodekloud/ directory and create a gzipped tar archive of the contents in a file called kodekloud.tar.gz?

   - tar -cvf kodekloud.tar.gz /home/kodekloud/

   - tar -czvf /home/kodekloud/ kodekloud.tar.gz

   - tar -cvf /home/kodekloud/ kodekloud.tar.gz

   - **tar -czvf kodekloud.tar.gz /home/kodekloud/**

2. Which of the following commands could be used to back up an entire disk, including its filesystem?

   - **dd**

   - cpio

   - gzip

   - tar

3. Which option(s) would you use with tar to extract the archive located at /home/kodekloud/archive.tar.gz?

   - xfz

   - cfvz

   - cvf

   - **xf**

4. Which command could be used to create an archive named backup.cpio containing all of the files and directories in the current working directory?

   - cpio -o > backup.cpio

   - **ls | cpio -o > backup.cpio**

   - cpio * > backup.cpio

   - cpio -o * > backup.cpio

5. Which of the following find command would find files in the current directory that have an extension of .bak and are larger than 1 gigabyte?

   - **find . -name *.bak -size +1G**

   - find . -name *.bak -size =1G+

   - find pwd -name *.bak -size -1G

   - find . -name *.back -size 1G



### QUIZ: USE STREAMS, PIPES, AND REDIRECTS PART 1

1. Which of the following would search the contents of the /etc/ directory for the pattern “kodekloud” and write only the errors to a file a /home/kodekloud/errors.list?

   - grep -r ‘kodekloud’ /etc/ > /home/kodekloud/errors.list

   - **grep -r ‘kodekloud’ /etc/ 2> /home/kodekloud/errors.list**

   - grep -r ‘kodekloud’ /etc/ 2>&1 /home/kodekloud/errors.list

   - grep -r ‘kodekloud’ /etc/ 1> /home/kodekloud/errors.list

2. Which command would search the /etc/ directory for the pattern “kodekloud” and redirect all output (stdout and stderr) to the file at /home/kodekloud/output.list?

   - **grep -r ‘kodekloud’ /etc/ 2>&1 /home/kodekloud/output.list**

   - grep -r ‘kodekloud’ /etc/ 2> /home/kodekloud/output.list

   - grep -r ‘kodekloud’ /etc/ > /home/kodekloud/output.list

   - grep -r ‘kodekloud’ /etc/ 1> /home/kodekloud/output.list

3. Which operator can be used to append text to a file, without overwriting the existing contents?

   - <

   - <<

   - **\>\>**

   - \>

4. Which operator would be used to designate a herestring?

   - <<<<

   - **<<<**

   - <<

   - <

5. Which symbol(s) would be used to specify a stdout redirect? Select all that apply.

   - 0>
   - **none**

   - **1>**

   - 2>


### QUIZ: USE STREAMS, PIPES, AND REDIRECTS PART 2

1. _____ is an intermediary program used to pass the output from one program as arguments to another program.

   - **xargs**

   - xinput

   - xout

   - xin

2. Which operator(s) can be used for command substitution? Select all that apply.

   - **$()**

   - **``**

   - %{}

   - “”

3. The output of _____ is passed as an argument to _____ by xargs in the following command: ps -ef | grep ‘httpd’ | xargs kill

   - ps to kill

   - httpd to kill

   - ps to grep

   - **grep to kill**

4. The standard operator used to pass the output of one program to the input of another is:

   - @

   - **|**

   - %

   - &

5. Given that the “whoami” command prints the current user’s username, what would be the result of the following command: rm -rf /home/$(whoami)

   - Nothing; this is not a valid command

   - It would delete the directory /home/whoami

   - **It would delete the user’s home directory**

   - An endless loop



### QUIZ: CREATE, MONITOR AND KILL PROCESSES

1. To view dynamically updated information on system processes and resources, we can use the _____ command.

   - ps

   - jobs

   - uptime

   - **top**

2. To bring a job with job ID 1 from the background to the foreground, which command could we run?

   - fg $1

   - **fg %1**

   - bg %1

   - bg $1

3. To modify a the priority of an existing process, we can use the _____ command.

   - top

   - **renice**

   - ps

   - nice

4. True or false: A regular user can only lower the process niceness one time.

   - False

   - **True**

5. To set the priority for a process when it is run, we can use the _____ command.

   - top

   - ps

   - renice

   - **nice**

6. To view processes which have been sent to the background, we can use the _____ command.

   - **jobs**

   - fg

   - cron

   - bg

7. To run a command detached from the current session, we can use the _____ command.

   - SIGTERM

   - jobs

   - bg

   - **nohup**

8. Which command(s) can we use to view the priority of a process that is already running? Select all that apply.

   - **ps**

   - renice

   - nice

   - **top**

9. To get detailed information about a process when we already have the PID (process ID), we can use the _____ command.

   - **ps**

   - pgrep

   - proc

   - pkill

10. Which user account(s) can lower the niceness of a process to a value less than zero? Select all that apply.

    - only the user who started the process

    - normal users

    - **the root user**

    - **any user with sudo access**





### QUIZ: GNU SCREEN AND TMUX

1.  The _____ terminal multiplexer uses a client-server model.

   - GNU screen

   - **tmux**

2. The default configuration file for GNU screen is located at _____.

   - **/etc/screenrc**

   - /etc/screen/screenrc

   - /etc/screen/conf/screenrc

   - /etc/screen.conf.d/screenrc

3. The default command prefix for GNU screen is:

   - CTRL + b

   - CTRL + v

   - **CTRL + a**

   - CTRL + s

4. The default command prefix for tmux is:

   - CTRL + s

   - CTRL + v

   - **CTRL + b**

   - CTRL + a

5. The default configuration file for tmux is located at _____.

   - /etc/tmux.conf.d/tmux.conf

   - /etc/tmux/conf/tmux.conf

   - **/etc/tmux.conf**

   - /etc/conf/tmux.conf



# Devices, Linux Filesystems, Filesystem Hierarchy Standard



## QUIZ: CREATE PARTITIONS AND FILESYSTEMS



1. Which command will check a filesystem for errors and repair it if it is offline?

   - sfc

   - fdisk

   - chkdsk

   - **fsck**

2. Which command can be used to determine how much disk space is available?

   - du

   - free

   - **df**

   - diskfree

3. Which command can be used to show how much space is currently taken up on a disk and display that output in human-readable format?

   - free -h

   - diskfree -h

   - df -h

   - **du -h**

4. Which command is used to create filesystems?

   - mkswap

   - fdisk

   - **mkfs**

   - parted

5. The two types of partition tables commonly used in Linux are (select two):

   - BSD

   - **GPT**

   - **MBR**

   - DVH

6. Which of the following are features of BTRFS? Select all that apply.

   - **subvolumes**

   - encryption

   - **snapshots**

   - **compression**

7. Before checking a filesystem for errors and repairing any that are found, you should first use the ____ command on the filesystem to get it ready for this process.

   - **umount**

   - mount

   - xfs_repair

   - fsck

8. Which utility can be used to check and repair XFS filesystems?

   - **xfs_repair**

   - xfs_fsck

   - xfs_fix

   - xfs_check

9. Which command(s) can be used to work with partitio-ns? Select all that apply.

   - **gdisk**

   - **fdisk**

   - **parted**

   - vdisk

10. Which methods can be used on Linux to move memory pages from RAM to the hard disk?

    - disk cache

    - virtual memory

    - **swap partition**

    - **swap file**



## QUIZ: CONTROL MOUNTING AND UNMOUNTING OF FILESYSTEM

1. In addition to the device’s disk identifier and partition number (e.g., /dev/sda1), what else can be used in /etc/fstab to identify a partition? Select all that apply.

   - **UUID**

   - **label**

   - blkid

   - FSID

2. When trying to unmount a filesystem, you get an error saying the target is busy. Which command can you use to see the program that is keeping the disk busy?

   - lsfiles

   - lsio

   - **lsof**

   - iowait

3. Which command will mount every filesystem defined in /etc/fstab?

   - mount -o

   - **mount -a**

   - mount -t

   - mount -e

4. Which command can be used to show information about all block devices on the system?

   - ls /dev/

   - disks

   - **lsblk**

   - mount

5. A list of filesystems to be mounted when the system boots can be found in _____.

   - **/etc/fstab**

   - /boot/fs

   - /etc/fs

   - /boot/fstab



## QUIZ: MANAGE FILE PERMISSIONS AND OWNERSHIP

1. A file named “myfile” has the user owner “kodekloud” and the group owner “users.” Which command(s) could be use to change the group owner to “friends”? Select all that apply.

   - **chgrp friends myfile**

   - chown myfile kodekloud:friends

   - chgrp myfile friends

   - **chown kodekloud:friends myfile**

2. Which command would change the permissions of the file “myfile” to read, write, and execute for the user owner, read and write for the group owner, and no permissions for all other users? Select all that apply.

   - **chmod u=rwx,g=rw,u= myfile**

   - chmod u=rw,g=rw=u= myfile

   - chmod 660 myfile

   - **chmod 760 myfile**

3. Which command would change the user owner of a directory named “mydir” to “kodekloud” and also make this change for all files and subdirectories contained in the directory?

   - chown mydir kodekloud

   - chown kodekloud mydir

   - chown -R mydir kodekloud

   - **chown -R kodekloud mydir**

4. To add execute permissions for the user-owner of a file to existing permissions, which command would you use?

   - chmod -x

   - chmod u-x

   - **chmod u+x**

   - chmod +x

5. How can we set the sticky bit on a file named “myfile”? Other permissions are unimportant. Select all that apply.

   - chmod 0777 myfile

   - **chmod 1777 myfile**

   - **chmod +t myfile**

   - chmod 4777 myfile



## QUIZ: CREATE AND CHANGE HARD AND SYMBOLIC LINKS\

1. The command ln myphoto.jpg /home/kodekloud/Pictures/photo would create a _____ link.

   - Symbolic

   - **Hard**

2. True or false: When a soft link is deleted, the original file is also deleted.

   - **False**

   - True

3. Which command would create a soft link between myphoto.jpg and /home/kodekloud/photo?

   - ln -s /home/kodekloud/photo myphoto.jpg

   - ln /home/kodekloud/photo myphoto.jpg

   - ln myphoto.jpg /home/kodekloud/photo

   - **ln -s myphoto.jpg /home/kodekloud/photo**

4. True or false: When a hard link is deleted, the original file is also deleted.

   - False

   - **True**

5. You see myphoto.jpg -> photo in the output of the ls command. What type of link does this show?

   - **Soft**

   - Hard



## QUIZ: FIND SYSTEM FILES AND PLACE FILES IN THE CORRECT LOCATION



1. Removable storage, such as CD-ROMs and flash drives are mounted to the _____ directory.

   - /media

   - /mnt

   - /run

   - /home

2. Temporary files can be located in _____. Select any that apply.

   - /usr/tmp

   - **/run**

   - **/tmp**

   - **/var/tmp**

3. The standard layout for Linux directories and their contents, as determined by the Linux Foundation, is known as the _____.

   - Filesystem Standard Hierarchy

   - Hierarchical Filesystem Standard

   - **Filesystem Hierarchy Standard**

   - Standard Hierarchical Filesystem

4. Essential programs, available to all users, are found in _____.

   - /usr/bin

   - /usr/sbin

   - **/bin**

   - /sbin

5. To locate files, we use the _____ command.

   - spotlight

   - cortana

   - **find**

   - search

# MOCK EXAM 101-1

1. To set the priority for a process when it is run, we can use the _____ command.

   - **nice**

   - ps

   - top

   - renice

2. If you want to warn other users of a Linux system that the system is going down for maintenance, which command could you use to send a message to all logged-in users?

   - wipe

   - **wall**

   - write

   - warn

3. Which of the following would search the contents of the /etc/ directory for the pattern “kodekloud” and write only the errors to a file a /home/kodekloud/errors.list?

   - **grep -r ‘kodekloud’ /etc/ 2> /home/kodekloud/errors.list**

   - grep -r ‘kodekloud’ /etc/ > /home/kodekloud/errors.list

   - grep -r ‘kodekloud’ /etc/ 1> /home/kodekloud/errors.list

   - grep -r ‘kodekloud’ /etc/ 2>&1 /home/kodekloud/errors.list

4. The _____ command will print a list of all current environment variables.

   - path

   - **env**

   - export

   - import

5. Which command will mount every filesystem defined in /etc/fstab?

   - **mount -a**

   - mount -e

   - mount -o

   - mount -t

6. Which command would you use to install a .deb file located on your local Linux system?

   - dpkg -I

   - dpkg install

   - dpkg -install

   - **dpkg -i**

7. The _____ command will print the contents of a text file to standardThe _____ command will print the contents of a text file to standard output.

   - **cat**

   - print

   - wc

   - grep

8. How can we set the sticky bit on a file named “myfile”? Other permissions are unimportant. Select all that apply.

   - chmod 0777 myfile

   - **chmod +t myfile**

   - chmod 4777 myfile

   - **chmod 1777 myfile**

9. The default command prefix for tmux is:

   - CTRL + v

   - CTRL + a

   - CTRL + s

   - **CTRL + b**

10. Which regular expression symbol matches a single instance of a any character?

    - $

    - **.**

    - ^
    - \

11. In addition to the device’s disk identifier and partition number (e.g., /dev/sda1), what else can be used in /etc/fstab to identify a partition? Select all that apply.

    - **UUID**

    - FSID

    - **label**

    - blkid

12. After adding a new shared library directory to your system, you copied a configuration file with its full path to the correct directory. Which command would you use to notify the system of the change?

    - **ldconfig**

    - updatedb

    - libupdate

    - ldd

13. To bring a job with job ID 1 from the background to the foreground, which command could we run?

    - bg %1

    - **fg %1**

    - fg $1

    - bg $1

14. You need to know which hardware devices are inside of a Linux system, but you cannot open the system’s case. How would you get Linux to produce a list of hardware connected to the PCI bus?

    - modprobe

    - cat /proc/hardware

    - **lspci**

    - ls /dev/

15. Which option can be used with sed to edit the file as-is, without specifying a different file name as a target?

    - –here

    - –same

    - -e

    - **-i**

16. A list of filesystems to be mounted when the system boots can be found in _____.

    - /boot/fstab

    - **/etc/fstab**

    - /etc/fs

    - /boot/fs

17. Which command is used to create filesystems?

    - fdisk

    - parted

    - **mkfs**

    - mkswap

18. When using vi, in normal mode, which key allows us to search the file?

    - **/**

    - t

    - s

    - f

19. The command ln myphoto.jpg /home/kodekloud/Pictures/photo would create a _____ link.

    - **Hard**

    - Symbolic

20. Which parameter would you add to dpkg-query to show which package contains a particular file?

    - -W

    - **-S**

    - -s

    - -l

21. Which command would take the contents of the /home/kodekloud/ directory and create a gzipped tar archive of the contents in a file called kodekloud.tar.gz?

    - tar -cvf /home/kodekloud/ kodekloud.tar.gz

    - **tar -czvf kodekloud.tar.gz /home/kodekloud/**

    - tar -cvf kodekloud.tar.gz /home/kodekloud/

    - tar -czvf /home/kodekloud/ kodekloud.tar.gz

22. Given that the “whoami” command prints the current user’s username, what would be the result of the following command: rm -rf /home/$(whoami)

    - Nothing; this is not a valid command

    - **It would delete the user’s home directory**

    - An endless loop

    - It would delete the directory /home/whoami

23. A friend is visiting you and brings a portable USB hard drive to share some files with you. You have one SATA drive in your Linux machine. Which name will be given to your friend’s portable USB hard drive in the /dev/ directory of your Linux machine?

    - /dev/sata2

    - **/dev/sdb**

    - /dev/usb1

    - /dev/sba

24. Using YUM or DNF, which option would uninstall a package from the system, along with any packages that depend on that package?

    - purge

    - delete

    - uninstall

    - **remove**

25. To create an empty file named emptyfile in the current working directory, which command would you use?

    - echo emptyfile

    - new emptyfile

    - blank emptyfile

    - **touch emptyfile**

26. If you update the configuration for GRUB 2, which command would you run to write that configuration to the correct directory for GRUB 2 to use the next time you boot the system?

    - grub-mkconfig -o /boot/grub/grub.conf

    - grub-config -o /boot/grub/grub.conf

    - grub-config -o /boot/grub/grub.cfg

    - **grub-mkconfig -o /boot/grub/grub.cfg**

27. Which command would cause the system to shutdown 45 minutes from now?

    - shutdown +45M

    - shutdown now+45

    - **shutdown +45**

    - shutdown 00:45

28. Using DNF, how would you install the httpd package?

    - dnf -i httpd

    - dnf provide httpd

    - **dnf install httpd**

    - dnf httpd

29. Which option would you pass to journalctl to change the directory it uses to search for log files?

    - **-D**

    - –log-dir

    - -d

    - –log-directory=

30. Which command would change the permissions of the file “myfile” to read, write, and execute for the user owner, read and write for the group owner, and no permissions for all other users? Select all that apply.

    - **chmod 760 myfile**

    - **chmod u=rwx,g=rw,u= myfile**

    - chmod u=rw,g=rw=u= myfile

    - chmod 660 myfile

31. Which command will check a filesystem for errors and repair it if it is offline?

    - chkdsk

    - sfc

    - fdisk

    - **fsck**

32. Which virtualization method provides the highest performance?

    - **Paravirtualization**

    - Virsh

    - VirtualBox

    - Full virtualization

33. Which command would you use to view only the last ten lines of the initialization log?

    - **dmesg | tail**

    - dmesg -H

    - dmesg --last

    - lastlog

34. Which command can be used to show how much space is currently taken up on a disk and display that output in human-readable format?

    - **du -h**

    - diskfree -h

    - free -h

    - df -h

35. Volume Groups are divided into:

    - Chunks

    - **Extents**

    - Sectors

    - Slices

36. Which regular expression symbol indicates that a line ends with a regular expression pattern?

    - ^

    - **$**

    - .

37. _____ is an intermediary program used to pass the output from one program as arguments to another program.

    - **xargs**

    - xout

    - xin

    - xinput

38. Temporary files can be located in _____. Select any that apply.

    - **/var/tmp**

    - /usr/tmp

    - **/run**

    - **/tmp**

39. Which option(s) would you use with the ls command to print file sizes in human readable format?

    - **ls -lh**

    - ls --human

    - ls -h

    - ls -l --human

40. Which user account(s) can lower the niceness of a process to a value less than zero? Select all that apply.

    - **the root user**

    - only the user who started the process

    - normal users

    - **any user with sudo access**

41. Which command would change the user owner of a directory named “mydir” to “kodekloud” and also make this change for all files and subdirectories contained in the directory?

    - chown mydir kodekloud

    - **chown -R kodekloud mydir**

    - chown kodekloud mydir

    - chown -R mydir kodekloud

42. Which command could be used to create an archive named backup.cpio containing all of the files and directories in the current working directory?

    - cpio -o > backup.cpio

    - cpio * > backup.cpio

    - cpio -o * > backup.cpio

    - **ls | cpio -o > backup.cpio**

43. Where are repository files stored for DNF and YUM?

    - /etc/repos.d/

    - /etc/yum/repos.d/

    - **/etc/yum.repos.d/**

    - /etc/yum/repos/

44. Which regular expression symbol indicates a line that begins with a regular expression pattern?

    - $

    - .

    - **^**

45. When using GRUB Legacy, how is the first partition of the first disk labeled?

    - (hd0,1)

    - (hd1,1)

    - (hd1,0)

    - **(hd0,0)**

46. Which command sequence would put the contents of a text file named myfile.txt in alphabetical order and remove all duplicates? Select all that apply.

    - sed -i -s ‘duplicates//g’ myfile.txt && sort myfile.txt

    - sort myfile.txt | sed -s ‘duplicates//g’

    - **sort myfile.txt | uniq**

    - **uniq myfile.txt | sort**

47. Which formula would give the size of a Logical Volume?

    - Disk sectors multiplied by number of extents

    - **Number of extents multiplied by physical extent size**

    - Size of physical extents divided by number of extents

    - Number of extents divided by size of physical extents

48. Which command is used to search the short description of man pages for keywords?

    - find

    - grep

    - **apropos**

    - cat

49. Which of the following commands could be used to back up an entire disk, including its filesystem?

    - cpio

    - **dd**

    - tar

    - gzip

50. The default command prefix for GNU screen is:

    - **CTRL + a**

    - CTRL + s

    - CTRL + b

    - CTRL + v

51. Given a theoretical file located at /etc/rc3.d/S45 ethernet, what would happen to any services listed in this file when the system enters runlevel 3?

    - They will stop.

    - They will be suspended.

    - They will be restarted.

    - **They will start.**

52. Which filesystem would you use for the ESP partition?

    - xfs

    - **fat32**

    - ext2

    - ntfs

53. Essential programs, available to all users, are found in _____.

    - /usr/sbin

    - **/bin**

    - /sbin

    - /usr/bin

54. Which command would return the list of directories used by the shell to find executable commands?

    - read $PATH

    - print $PATH

    - **echo $PATH**

    - pwd $PATH

55. Which option can be used with ls to show hidden files?

    - **-a**

    - -h

    - –hidden

    - -?

56. On a Debian system, which command would remove a package and all of its configuration files?

    - dpkg -r

    - **dpkg -P**

    - dkpg --erase

    - dpkg --remove

57. In command mode, which command will allow us to save changes and exit vi?

    - **:wq**

    - :q!

    - :w

    - :q

58. To view dynamically updated information on system processes and resources, we can use the _____ command.

    - **top**

    - ps

    - jobs

    - uptime

59. Which command would create a soft link between myphoto.jpg and /home/kodekloud/photo?

    - **ln -s myphoto.jpg /home/kodekloud/photo**

    - ln myphoto.jpg /home/kodekloud/photo

    - ln -s /home/kodekloud/photo myphoto.jpg

    - ln /home/kodekloud/photo myphoto.jpg

60. Which command(s) can be used to work with partitions? Select all that apply.

    - **parted**
    - **fdsik**
    - **gdisk**
    - vdisk

# MOCK EXAM 101-2

1. Which yum command will bring repository metadata to the most recent version?

   - yum upgrade

   - **yum update**

   - yum check-metadata

   - yum metadata

2. Which regular expression symbol matches any characters from a list provided with that symbol?

   - ( )

   - **[ ]**

   - ?
   - .

3. To view processes which have been sent to the background, we can use the _____ command.

   - cron

   - bg

   - **jobs**

   - fg

4. A file named “myfile” has the user owner “kodekloud” and the group owner “users.” Which command(s) could be use to change the group owner to “friends”? Select all that apply.

   - chgrp myfile friends

   - **chown kodekloud:friends myfile**

   - chown myfile kodekloud:friends

   - **chgrp friends myfile**

5. To get detailed information about a process when we already have the PID (process ID), we can use the _____ command.

   - pgrep

   - proc

   - pkill

   - **ps**

6. To run a command detached from the current session, we can use the _____ command.

   - **nohup**

   - SIGTERM

   - jobs

   - bg

7. The _____ command can be used to clear environment variables for the current shell session.

   - **unset**

   - clear

   - import

   - echo

8. Which utility can be used to check and repair XFS filesystems?

   - **xfs_repair**

   - xfs_fsck

   - xfs_fix

   - xfs_check

9. Which command can be used to search file content using regular expression patterns?

   - **grep**

   - read

   - find

   - search

10. You have added a new shared library directory to your system, and you have written a custom configuration file including the full path to to the new shared library location. Which directory would you put the configuration file into?

    - /usr/share/

    - **/etc/ld.so.conf.d/**

    - /etc/share

    - /usr/ld.so.conf.d/

11. Removable storage, such as CD-ROMs and flash drives are mounted to the _____ directory.

    - **/media**

    - /run

    - /mnt

    - /home

12. Which apt-cache command will provide information for a package?

    - apt-cache info

    - apt-cache search

    - apt-cache print

    - **apt-cache show**

13. Which option can be used with the find command to show only directories?

    - –type -d

    - **-type d**

    - –type --directory

    - -type directory

14. True or false: A regular user can only lower the process niceness one time.

    - **True**

    - False

15. Which of the following utilities makes use of regular expressions? Select all that apply.

    - **sed**

    - **egrep**

    - ps

    - **grep**

16. To change the menu entries for GRUB Legacy, which file would you edit?

    - /etc/grub/grub.cfg

    - **/boot/grub/menu.lst**

    - /boot/grub/grub.cfg

    - /etc/grub/menu.lst

17. Which command can be used to determine how much disk space is available?

    - **df**

    - du

    - diskfree

    - free

18. To add execute permissions for the user-owner of a file to existing permissions, which command would you use?

    - chmod -x

    - chmod +x

    - **chmod u+x**

    - chmod u-x

19. In addition to vi, what are some other common editors for Linux?

    - **Emacs**

    - **nano**

    - Word

    - notes

20. Intel VT-x and AMD-V are examples of _____ used to provide support for fully virtualized guests?

    - paravirtualized drivers

    - **CPU extensions**

    - virtual machines

    - hypervisors

21. The two types of partition tables commonly used in Linux are (select two):

    - **GPT**

    - **MBR**

    - BSD

    - DVH

22. You have set a variable called kodekloud using the export command. Which command would print the value of the kodekloud variable?

    - print kodekloud

    - read $kodekloud

    - echo kodekloud

    - **echo $kodekloud**

23. In addition to the device’s disk identifier and partition number (e.g., /dev/sda1), what else can be used in /etc/fstab to identify a partition? Select all that apply.

    - FSID

    - **label**

    - blkid

    - **UUID**

24. Which command will list kernel modules in use by hardware?

    - **lspci -k**

    - lspci --modules

    - lspci -l

    - lspci -m

25. Where are repository files stored for DNF and YUM?

    - /etc/repos.d/

    - /etc/yum/repos/

    - **/etc/yum.repos.d/**

    - /etc/yum/repos.d/

26. Which command(s) would list all of the files in the current directory that start with the word “file” followed by one number and .txt?

    - ls | grep ‘file*.txt’

    - **ls file[0-9].txt**

    - **ls | grep ‘file[0-9].txt’**

    - ls file*.txt

27. True or false: When a soft link is deleted, the original file is also deleted.

    - **False**

    - True

28. Which apt-file command would show the package that contains the file /usr/bin/systemctl?

    - apt-file query /usr/bin/systemctl

    - **apt-file search /usr/bin/systemctl**

    - apt-file provides /usr/bin/systemctl

    - apt-file show /usr/bin/systemctl

29. In vi normal mode, the pp command will paste. Which command can be used to copy?

    - cc

    - :copy

    - **yy**

    - :yank

30. Which command will cause Bash to print the path of the current directory?

    - **pwd**

    - cwd

    - which directory

    - whereami

31. Which symbol(s) would be used to specify a stdout redirect? Select all that apply.

    - 0>

    - **1>**

    - 2>

32. Which option(s) would you use with tar to extract the archive loc-ated at /home/kodekloud/archive.tar.gz?

    - cfvz

    - cvf

    - **xf**

    - xfz

33. On a system equipped with BIOS, what should be placed in the MBR of the first storage device in order to boot the system?

    - **bootstrap**

    - firmware

    - kernel

    - initrd

34. On SysV systems, which file contains the default init configuration?-

    - **/etc/inittab**

    - /etc/init.d/defaults

    - /etc/conf.d/inittab

    - /etc/defaults/inittab

35. Which operator(s) can be used for command substitution? Select all that apply.

    - **``**

    - %{}

    - **$()**

    - “”

36. Where are the files for the GRUB bootloader stored?

    - /boot/

    - **/boot/grub/**

    - /etc/grub/

    - /grub/boot/

37. Given a theoretical file located at /etc/rc3.d/S45 ethernet, what would happen to any services listed in this file when the system enters runlevel 3?

    - **They will start.**

    - They will be restarted.

    - They will be suspended.

    - They will stop.

38. Which command can be used to show information about all block devices on the system?

    - mount

    - disks

    - ls /dev/

    - **lsblk**

39. When a Linux system mounts the EFI partition, where is it usually mounted?

    - /efi/

    - /mnt/efi/

    - **/boot/efi/**

    - /boot/grub/efi/

40. When trying to unmount a filesystem, you get an error saying the target is busy. Which command can you use to see the program that is keeping the disk busy?

    - lsio

    - iowait

    - **lsof**

    - lsfiles

41. When using GRUB 2, which menu entry parameter determines how long GRUB 2 will pause before booting the default menu entry?

    - GRUB_TIMER=

    - **GRUB_TIMEOUT=**

    - GRUB_PAUSE=

    - GRUB_WAIT=

42. True or false: When a hard link is deleted, the original file is also deleted.

    - **True**

    - False

43. Which of the following are features of BTRFS? Select all that apply.

    - **snapshots**

    - **subvolumes**

    - encryption

    - **compression**

44. Which of the following find command would find files in the current directory that have an extension of .bak and are larger than 1 gigabyte?

    - find . -name *.bak -size =1G+

    - find pwd -name *.bak -size -1G

    - find . -name *.back -size 1G

    - **find . -name *.bak -size +1G**

45. Which command would you use to view only the last ten lines of the initialization log?

    - dmesg --last

    - **dmesg | tail**

    - dmesg -H

    - lastlog

46. The standard layout for Linux directories and their contents, as determined by the Linux Foundation, is known as the _____.

    - Hierarchical Filesystem Standard

    - Filesystem Standard Hierarchy

    - Standard Hierarchical Filesystem

    - **Filesystem Hierarchy Standard**

47. Which operator would be used to designate a herestring?

    - <<

    - **<<<**

    - <<<<

    - <

48. Which command would change the permissions of the file “myfile” to read, write, and execute for the user owner, read and write for the group owner, and no permissions for all other users? Select all that apply.

    - **chmod u=rwx,g=rw,u= myfile**

    - **chmod 760 myfile**

    - chmod 660 myfile

    - chmod u=rw,g=rw=u= myfile

49. To modify a the priority of an existing process, we can use the _____ command.

    - nice

    - ps

    - top

    - **renice**

50. Which grep option can be used to search an entire directory and its sub directories?

    - .

    - **-r**

    - -R

51. When using vi in normal mode, which command will delete the line at the cursor?

    - **dd**

    - yy

    - d

    - ZZ

52. Using zypper, how would you find out which package provides the file /usr/bin/systemctl?

    - zypper se provides /usr/bin/systemctl

    - zypper --provides /usr/bin/systemctl

    - zypper se /usr/bin/systemctl

    - **zypper se --provides /usr/bin/systemctl**

53. The _____ terminal multiplexer uses a client-server model.

    - GNU screen

    - **tmux**

54. Which command can be used to print only the desired field from text?

    - grep

    - find

    - sed

    - **cut**

55. You have compiled a custom kernel, and the filesystem type used by your Linux system’s root filesystem is compiled as a module. What would you need to include along with the kernel to make sure your system loads the root filesystem correctly?

    - EFI applications

    - A copy of /etc/modules.conf.d/

    - bootstrap

    - **initramfs**

56. Using systemctl, how would you determine if a service named myservice.service is configured to start when the system boots?

    - **systemctl is-enabled myservice.service**

    - systemctl is-active myservice.service

    - systemctl on-boot myservice.service

    - systemctl status myservice.service

57. Which file would you search to determine the CPU features on a Linux machine?

    - **/proc/cpuinfo**

    - /dev/cpuinfo

    - /proc/cpu

    - /proc/hardware/cpuinfo

58. The _____ command can be used to assign values to environment variables for the current shell session.

    - **export**

    - env

    - echo

    - import

59. Which parameter would you add to dpkg-query to show which package contains a particular file?

    - **-S**

    - -W

    - -s

    - -l

60. The standard operator used to pass the output of one program to the input of another is:

    - &

    - @

    - **|**

    - %



# MOCK EXAM 101-2

1. Which command would you use to view only the last ten lines of the initialization log?

   - lastlog

   - **dmesg | tail**

   - dmesg -H

   - dmesg --last

2. If you update the configuration for GRUB 2, which command would you run to write that configuration to the correct directory for GRUB 2 to use the next time you boot the system?

   - grub-config -o /boot/grub/grub.conf

   - grub-mkconfig -o /boot/grub/grub.conf

   - **grub-mkconfig -o /boot/grub/grub.cfg**

   - grub-config -o /boot/grub/grub.cfg

3. Which command would create a soft link between myphoto.jpg and /home/kodekloud/photo?

   - ln myphoto.jpg /home/kodekloud/photo

   - ln -s /home/kodekloud/photo myphoto.jpg

   - ln /home/kodekloud/photo myphoto.jpg

   - **ln -s myphoto.jpg /home/kodekloud/photo**

4. Which command can be used to determine how much disk space is available?

   - **df**

   - diskfree

   - free

   - du

5. Which grep option can be used to search an entire directory and its sub directories?

   - **-r**

   - .

   - -R

6. The default configuration file for tmux is located at _____.

   - /etc/conf/tmux.conf

   - /etc/tmux/conf/tmux.conf

   - /etc/tmux.conf.d/tmux.conf

   - **/etc/tmux.conf**

7. Which option can be used with ls to show hidden files?

   - **-a**

   - -?

   - -h

   - –hidden

8. The _____ command can be used to perform search and replace operations on text files.

   - grep

   - **sed**

   - find

   - substitute

9. To remove a directory called mydir along with all of its files and subdirectories, which command would you use?

   - rm mydir/*

   - **rm -rf mydir**

   - rm mydir

   - rm -R mydir

10. Which command is used to search the short description of man pages for keywords?

    - **apropos**

    - cat

    - find

    - grep

11. When using GRUB 2, which menu entry parameter determines how long GRUB 2 will pause before booting the default menu entry?

    - GRUB_PAUSE=

    - GRUB_TIMER=

    - GRUB_WAIT=

    - **GRUB_TIMEOUT=**

12. Using systemctl, how would you determine if a service named myservice.service is configured to start when the system boots?

    - **systemctl is-enabled myservice.service**

    - systemctl on-boot myservice.service

    - systemctl status myservice.service

    - systemctl is-active myservice.service

13. In command mode, which command will allow us to save changes and exit vi?

    - :wq

    - :q

    - :q!

    - :w

14. If you are unsure of the location of an executable mycommand on a Linux system, how would you find it?

    - whereis mycommand

    - fetch mycommand

    - **which mycommand**

    - find mycommand

15. Before the apropos command will work on a new system, it may be necessary to run another command first. Which command would you run to make sure apropos has access to all of the information it needs?

    - dbupdate

    - apropos -update

    - **updatedb**

    - mandb

16. When a Linux system mounts the EFI partition, where is it usually mounted?

    - /efi/

    - /boot/grub/efi/

    - **/boot/efi/**

    - /mnt/efi/

17. You have added a new hard drive to a system. You know that the hard drive has no defects, but the system cannot boot. Where would you go to begin troubleshooting this problem?

    - The manufacturer’s website.

    - **The BIOS setup utility.**

    - An Internet forum.

    - The manual for the hard drive.

18. Which command can be used to rename an existing file or directory?

    - cp

    - mv

    - touch

    - ls

19. Where are repository files stored for DNF and YUM?

    - **/etc/yum.repos.d/**

    - /etc/repos.d/

    - /etc/yum/repos.d/

    - /etc/yum/repos/

20. Which filesystem would you use for the ESP partition?

    - ext2

    - **fat32**

    - xfs

    - ntfs

21. Which of the following would search the contents of the /etc/ directory for the pattern “kodekloud” and write only the errors to a file a /home/kodekloud/errors.list?

    - **grep -r ‘kodekloud’ /etc/ 2> /home/kodekloud/errors.list**

    - grep -r ‘kodekloud’ /etc/ > /home/kodekloud/errors.list

    - grep -r ‘kodekloud’ /etc/ 1> /home/kodekloud/errors.list

    - grep -r ‘kodekloud’ /etc/ 2>&1 /home/kodekloud/errors.list

22. In addition to swap partitions, Linux can make use of swap files. Where is the swap file typically located?

    - /swap

    - **/swapfile**

    - /mnt/swap

    - /mnt/swapfile

23. Which command could be used to create an archive named backup.cpio containing all of the files and directories in the current working directory?

    - **ls | cpio -o > backup.cpio**

    - cpio -o * > backup.cpio

    - cpio * > backup.cpio

    - cpio -o > backup.cpio

24. Removable storage, such as CD-ROMs and flash drives are mounted to the _____ directory.

    - **/media**

    - /home

    - /mnt

    - /run

25. Which command can be used to print only the desired field from text?

    - grep

    - find

    - **cut**

    - sed

26. Which command would change the permissions of the file “myfile” to read, write, and execute for the user owner, read and write for the group owner, and no permissions for all other users? Select all that apply.

    - chmod 660 myfile

    - chmod u=rw,g=rw=u= myfile

    - **chmod 760 myfile**

    - **chmod u=rwx,g=rw,u= myfile**

27. When trying to unmount a filesystem, you get an error saying the target is busy. Which command can you use to see the program that is keeping the disk busy?

    - lsfiles

    - **lsof**

    - lsio

    - iowait

28. A friend is visiting you and brings a portable USB hard drive to share some files with you. You have one SATA drive in your Linux machine. Which name will be given to your friend’s portable USB hard drive in the /dev/ directory of your Linux machine?

    - /dev/sba

    - **/dev/sdb**

    - /dev/sata2

    - /dev/usb1

29. To view dynamically updated information on system processes and resources, we can use the _____ command.

    - ps

    - **top**

    - uptime

    - jobs

30. To set the priority for a process when it is run, we can use the _____ command.

    - top

    - **nice**

    - ps

    - renice

31. Which option for sed indicates that every instance of a term should be replaced?

    - **g**

    - ?

    - a
    - .

32. Which command would take the contents of the /home/kodekloud/ directory and create a gzipped tar archive of the contents in a file called kodekloud.tar.gz?

    - tar -cvf /home/kodekloud/ kodekloud.tar.gz

    - **tar -czvf kodekloud.tar.gz /home/kodekloud/**

    - tar -czvf /home/kodekloud/ kodekloud.tar.gz

    - tar -cvf kodekloud.tar.gz /home/kodekloud/

33. Which command would search the /etc/ directory for the pattern “kodekloud” and redirect all output (stdout and stderr) to the file at /home/kodekloud/output.list?

    - grep -r ‘kodekloud’ /etc/ > /home/kodekloud/output.list

    - grep -r ‘kodekloud’ /etc/ 2> /home/kodekloud/output.list

    - **grep -r ‘kodekloud’ /etc/ 2>&1 /home/kodekloud/output.list**

    - grep -r ‘kodekloud’ /etc/ 1> /home/kodekloud/output.list

34. You have compiled a custom kernel, and the filesystem type used by your Linux system’s root filesystem is compiled as a module. What would you need to include along with the kernel to make sure your system loads the root filesystem correctly?

    - A copy of /etc/modules.conf.d/

    - EFI applications

    - bootstrap

    - **initramfs**

35. Which methods can be used on Linux to move memory pages from RAM to the hard disk?

    - virtual memory

    - **swap partition**

    - disk cache

    - **swap file**

36. Which parameter would you add to dpkg-query to show which package contains a particular file?

    - -W

    - **-S**

    - -s

    - -l

37. Which command(s) can we use to view the priority of a process that is already running? Select all that apply.

    - **top**

    - **ps**

    - renice

    - nice

38. You see myphoto.jpg -> photo in the output of the ls command. What type of link does this show?

    - **Soft**

    - Hard

39. To add execute permissions for the user-owner of a file to existing permissions, which command would you use?

    - chmod +x

    - chmod -x

    - chmod u-x

    - **chmod u+x**

40. Which apt-cache command will provide information for a package?

    - apt-cache search

    - apt-cache info

    - apt-cache print

    - **apt-cache show**

41. You have set a variable called kodekloud using the export command. Which command would print the value of the kodekloud variable?

    - print kodekloud

    - **echo $kodekloud**

    - read $kodekloud

    - echo kodekloud

42. Temporary files can be located in _____. Select any that apply.

    - **/var/tmp**

    - **/run**

    - **/tmp**

    - /usr/tmp

43. When using vi in normal mode, which command will delete the line at the cursor?

    - yy

    - ZZ

    - **dd**

    - d

44. On a Debian system, which command would remove a package and all of its configuration files?

    - dpkg -r

    - **dpkg -P**

    - dpkg --remove

    - dkpg --erase

45. Which command can be used to show information about all block devices on the system?

    - ls /dev/

    - mount

    - **lsblk**

    - disks

46. A file named “myfile” has the user owner “kodekloud” and the group owner “users.” Which command(s) could be use to change the group owner to “friends”? Select all that apply.

    - **chgrp friends myfile**

    - chown myfile kodekloud:friends

    - **chown kodekloud:friends myfile**

    - chgrp myfile friends

47. Which type of virtualization requires the guest to be capable of running all instructions on virtual hardware?

    - paravirtualization

    - **full virtualization**

    - bare metal

    - hybrid virtualization

48. Which of the following are features of BTRFS? Select all that apply.

    - **snapshots**

    - encryption

    - **subvolumes**

    - **compression**

49. Which yum command will bring repository metadata to the most recent version?

    - yum metadata

    - yum check-metadata

    - yum upgrade

    - **yum update**

50. ## The naming format for shared libraries is:

    - [libraryname.versionnumber.so](http://libraryname.versionnumber.so/)

    - **libraryname.so.versionnumber**

    - [libraryname-versionnumber.so](http://libraryname-versionnumber.so/)

    - libraryname-so.versionnumber

51. Which operator can be used to append text to a file, without overwriting the existing contents?

    - <<

    - <
    - .
    - **\>\>**

52. Before checking a filesystem for errors and repairing any that are found, you should first use the ____ command on the filesystem to get it ready for this process.

    - fsck

    - xfs_repair

    - **umount**

    - mount

53. Which option can be used with grep when the case (upper or lower) of the term does not matter?

    - -e

    - **-i**

    - -k

    - -f

54. In addition to the device’s disk identifier and partition number (e.g., /dev/sda1), what else can be used in /etc/fstab to identify a partition? Select all that apply.

    - FSID

    - **label**

    - blkid

    - **UUID**

55. The default configuration file for GNU screen is located at _____.

    - /etc/screen/screenrc

    - /etc/screen/conf/screenrc

    - **/etc/screenrc**

    - /etc/screen.conf.d/screenrc

56. When using vi, in normal mode, which key allows us to search the file?

    - **/**

    - f

    - t

    - s

57. Given a theoretical file located at /etc/rc3.d/S45 ethernet, what would happen to any services listed in this file when the system enters runlevel 3?

    - They will be restarted.

    - **They will start.**

    - They will be suspended.

    - They will stop.

58. Using YUM or DNF, which option would uninstall a package from the system, along with any packages that depend on that package?

    - delete

    - uninstall

    - purge

    - **remove**

59. On SysV systems, which file contains the default init configuration?

    - /etc/defaults/inittab

    - /etc/init.d/defaults

    - /etc/conf.d/inittab

    - **/etc/inittab**

60. To get detailed information about a process when we already have the PID (process ID), we can use the _____ command.

    - **ps**

    - proc

    - pgrep

    - pkill

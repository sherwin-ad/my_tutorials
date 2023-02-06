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

3. ## Which command would you use to view only the last ten lines of the initialization log?

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

   - .a

   - .lib

   










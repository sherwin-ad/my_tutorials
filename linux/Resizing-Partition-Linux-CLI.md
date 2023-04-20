# Resizing a Partition + Filesystem on Linux from the CLI

1. Check disk/partition info

   ```
   $ lsblk
   NAME    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
   loop0     7:0    0     4K  1 loop /snap/bare/5
   loop1     7:1    0  55.6M  1 loop /snap/core18/2654
   loop2     7:2    0  63.2M  1 loop /snap/core20/1738
   loop3     7:3    0  55.6M  1 loop /snap/core18/2667
   loop4     7:4    0 240.8M  1 loop /snap/gnome-3-34-1804/24
   loop5     7:5    0  63.3M  1 loop /snap/core20/1778
   loop6     7:6    0 346.3M  1 loop /snap/gnome-3-38-2004/115
   loop7     7:7    0 346.3M  1 loop /snap/gnome-3-38-2004/119
   loop8     7:8    0   219M  1 loop /snap/gnome-3-34-1804/77
   loop9     7:9    0  91.7M  1 loop /snap/gtk-common-themes/1535
   loop10    7:10   0  81.3M  1 loop /snap/gtk-common-themes/1534
   loop11    7:11   0  45.9M  1 loop /snap/snap-store/599
   loop12    7:12   0    46M  1 loop /snap/snap-store/638
   loop13    7:13   0  49.6M  1 loop /snap/snapd/17883
   sda       8:0    0    64G  0 disk
   ├─sda1    8:1    0  11.9G  0 part /
   ├─sda14   8:14   0     4M  0 part
   └─sda15   8:15   0   106M  0 part /boot/efi
   ```

   ```
   $ df -h
   Filesystem      Size  Used Avail Use% Mounted on
   udev            1.9G     0  1.9G   0% /dev
   tmpfs           386M  1.2M  385M   1% /run
   /dev/sda1        12G  9.0G  2.6G  78% /
   tmpfs           1.9G   76K  1.9G   1% /dev/shm
   tmpfs           5.0M     0  5.0M   0% /run/lock
   tmpfs           1.9G     0  1.9G   0% /sys/fs/cgroup
   /dev/loop0      128K  128K     0 100% /snap/bare/5
   /dev/loop2       64M   64M     0 100% /snap/core20/1738
   /dev/loop1       56M   56M     0 100% /snap/core18/2654
   /dev/loop4      241M  241M     0 100% /snap/gnome-3-34-1804/24
   /dev/loop3       56M   56M     0 100% /snap/core18/2667
   /dev/loop5       64M   64M     0 100% /snap/core20/1778
   /dev/loop6      347M  347M     0 100% /snap/gnome-3-38-2004/115
   /dev/loop8      219M  219M     0 100% /snap/gnome-3-34-1804/77
   /dev/loop13      50M   50M     0 100% /snap/snapd/17883
   /dev/loop7      347M  347M     0 100% /snap/gnome-3-38-2004/119
   /dev/loop11      46M   46M     0 100% /snap/snap-store/599
   /dev/loop9       92M   92M     0 100% /snap/gtk-common-themes/1535
   /dev/loop10      82M   82M     0 100% /snap/gtk-common-themes/1534
   /dev/loop12      46M   46M     0 100% /snap/snap-store/638
   /dev/sda15      105M  6.6M   98M   7% /boot/efi
   tmpfs           386M   24K  386M   1% /run/user/125
   tmpfs           386M  8.0K  386M   1% /run/user/1000
   ```

   ```
   $ sudo fdisk -l /dev/sda
   GPT PMBR size mismatch (25165823 != 134217727) will be corrected by write.
   The backup GPT table is not on the end of the device. This problem will be corrected by write.
   Disk /dev/sda: 64 GiB, 68719476736 bytes, 134217728 sectors
   Disk model: Virtual Disk
   Units: sectors of 1 * 512 = 512 bytes
   Sector size (logical/physical): 512 bytes / 512 bytes
   I/O size (minimum/optimal): 512 bytes / 512 bytes
   Disklabel type: gpt
   Disk identifier: FB54BF5A-F6A4-4AA7-86BE-6A0448B95C46
   
   Device      Start      End  Sectors  Size Type
   /dev/sda1  227328 25165790 24938463 11.9G Linux filesystem
   /dev/sda14   2048    10239     8192    4M BIOS boot
   /dev/sda15  10240   227327   217088  106M EFI System
   
   Partition table entries are not in disk order.
   ```

2. Resize the disk partition ("physical" partition) on your partition table using parted

   ```
   $ sudo parted /dev/sda
   GNU Parted 3.3
   Using /dev/sda
   Welcome to GNU Parted! Type 'help' to view a list of commands.
   (parted) print
   Warning: Not all of the space available to /dev/sda appears to be used, you can fix the GPT to use all of the space (an
   extra 109051904 blocks) or continue with the current setting?
   Fix/Ignore? Fix
   Model: Msft Virtual Disk (scsi)
   Disk /dev/sda: 68.7GB
   Sector size (logical/physical): 512B/512B
   Partition Table: gpt
   Disk Flags:
   
   Number  Start   End     Size    File system  Name  Flags
   14      1049kB  5243kB  4194kB                     bios_grub
   15      5243kB  116MB   111MB   fat32              boot, esp
    1      116MB   12.9GB  12.8GB  ext4
   
   (parted) resizepart 1
   Warning: Partition /dev/sda1 is being used. Are you sure you want to continue?
   Yes/No? Yes
   End?  [12.9GB]? 64GB
   (parted) print
   Model: Msft Virtual Disk (scsi)
   Disk /dev/sda: 68.7GB
   Sector size (logical/physical): 512B/512B
   Partition Table: gpt
   Disk Flags:
   
   Number  Start   End     Size    File system  Name  Flags
   14      1049kB  5243kB  4194kB                     bios_grub
   15      5243kB  116MB   111MB   fat32              boot, esp
    1      116MB   64.0GB  63.9GB  ext4
   
   (parted)
   ```

3. Resize the actual filesystem to fit the grown partition

   Check the filesystem used

   ```
   $ lsblk -f
   NAME    FSTYPE   LABEL          UUID                                 FSAVAIL FSUSE% MOUNTPOINT
   loop0   squashfs                                                           0   100% /snap/bare/5
   loop1   squashfs                                                           0   100% /snap/core18/2654
   loop2   squashfs                                                           0   100% /snap/core18/2667
   loop3   squashfs                                                           0   100% /snap/core20/1738
   loop4   squashfs                                                           0   100% /snap/core20/1778
   loop5   squashfs                                                           0   100% /snap/gnome-3-34-1804/77
   loop6   squashfs                                                           0   100% /snap/gnome-3-38-2004/119
   loop7   squashfs                                                           0   100% /snap/gtk-common-themes/1535
   loop8   squashfs                                                           0   100% /snap/snap-store/638
   loop9   squashfs                                                           0   100% /snap/snap-store/599
   loop10  squashfs                                                           0   100% /snap/gtk-common-themes/1534
   loop11  squashfs                                                           0   100% /snap/snapd/17883
   loop12  squashfs                                                           0   100% /snap/gnome-3-34-1804/24
   loop13  squashfs                                                           0   100% /snap/gnome-3-38-2004/115
   sda
   ├─sda1  ext4     desktop-rootfs 04dc73b5-e778-4da0-ba66-f120a0b3f38c    2.5G    78% /
   ├─sda14
   └─sda15 vfat     UEFI           C554-ABCB                              97.8M     6% /boot/efi
   ```

   To grow an `ext2`, `ext3` or `ext4` filesystem, use the command (where `/dev/sda1` is the partition device to resize):

   ```
   sudo resize2fs /dev/sda1
   ```

   To grow an `xfs` filesystem, use the command (where `/` is the MOUNTPOINT of the XFS formatted device):

   ```
   sudo xfs_growfs /
   ```

   To grow a `btrfs` filesystem, use the command (where `/` is the MOUNTPOINT of the Btrfs formatted device):

   ```
   sudo btrfs filesystem resize max /
   ```

   Finally, **check the filesystem was resized** by running `df -h` to list the size, used space, and avail space on all mounts:

   ```
   df -h
   ```

   


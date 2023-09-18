# Linux Challenge 1

The database server called centos-host is running short on space! You have been asked to add an LVM volume for the Database team using some of the existing disks on this server.

All the tasks require you to be root, so the first step is to become root

```bash
sudo -i
```

# Individual Steps

### Linux Server

Install the correct packages that will allow the use of "lvm" on the centos machine.

First we need to discover what the correct package is that needs to be installed. A google search will lead you to `lvm2`

<details>
<summary>Install package</summary>

```bash
yum install -y lvm2
```
</details>


### dba_users

<details>
<summary>Create a group called "dba_users" and add the user called 'bob' to this group</summary>

```bash
groupadd dba_users
```
</details>

<details>
<summary>Add bob to group</summary>

```bash
usermod -G dba_users bob
```
</details>

### /dev/vdb

<details>
<summary>Create a Physical Volume for "/dev/vdb"</summary>

```bash
pvcreate /dev/vdb
```
</details>

### /dev/vdc

<details>
<summary>Create a Physical Volume for "/dev/vdc"</summary>

```bash
pvcreate /dev/vdc
```
</details>

### volume-group

<details>
<summary>Create a volume group called "dba_storage" using the physical volumes "/dev/vdb" and "/dev/vdc"</summary>

```bash
vgcreate dba_storage /dev/vdb /dev/vdc
```
</details>

### lvm

<details>
<summary>Create an "lvm" called "volume_1" from the volume group called "dba_storage". Make use of the entire space available in the volume group.</summary>

```bash
lvcreate -n volume_1 -l 100%FREE dba_storage
```
</details>

### persistent-mountpoint

<details>
<summary>Format the lvm volume "volume_1" as an "XFS" filesystem</summary>

```bash
mkfs.xfs /dev/dba_storage/volume_1
```
</details>

<details>
<summary>Mount the filesystem at the path "/mnt/dba_storage".</summary>

```bash
mkdir -p /mnt/dba_storage
mount -t xfs /dev/dba_storage/volume_1 /mnt/dba_storage
```
</details>

<details>
<summary>Make sure that this mount point is persistent across reboots with the correct default options.</summary>

```bash
vi /etc/fstab
```

Add the following line to the end of the file and save.

```
/dev/mapper/dba_storage-volume_1 /mnt/dba_storage xfs defaults 0 0
```
</details>

### group-permission

<details>
<summary>Ensure that the mountpoint "/mnt/dba_storage" has the group ownership set to the "dba_users" group</summary>

```bash
chown :dba_users /mnt/dba_storage
```
</details>

<details>
<summary>Ensure that the mount point "/mnt/dba_storage" has "read/write" and execute permissions for the owner and group and no permissions for anyone else.</summary>

```bash
chmod 770 /mnt/dba_storage
```
</details>

# Automate the entire lab in a single script!

Pretty much everything done above, in the same order. We automate the `vi` step by using the append redirection to `/etc/fstab`

<details>
<summary>Single Script Automation</summary>

```bash
{
# Start lab and paste this entire script to the command prompt.
# When it completes, press the check button.
sudo -i

## Install lvm

yum install -y lvm2

## dba_users

# Create group
groupadd dba_users
# Add bob
usermod -G dba_users bob

## Create PVs

pvcreate /dev/vdb
pvcreate /dev/vdc

## Create VG

vgcreate dba_storage /dev/vdb /dev/vdc

## Create LVM

lvcreate -n volume_1 -l 100%FREE dba_storage

## Persistent mountpoint

# Format
mkfs.xfs /dev/dba_storage/volume_1
# Mount
mkdir -p /mnt/dba_storage
mount -t xfs /dev/dba_storage/volume_1 /mnt/dba_storage
# Make persistent
echo "/dev/mapper/dba_storage-volume_1 /mnt/dba_storage xfs defaults 0 0" >> /etc/fstab
# Ensure that the mountpoint "/mnt/dba_storage" has the group ownership set to the "dba_users" group
chown :dba_users /mnt/dba_storage
# Ensure that the mount point "/mnt/dba_storage" has "read/write" and execute permissions for the owner and group and no permissions for anyone else.
chmod 770 /mnt/dba_storage
}
```

</details>
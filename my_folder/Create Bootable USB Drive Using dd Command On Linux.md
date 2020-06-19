## Create Bootable USB Drive Using dd Command On Linux

```
umount /dev/sdb*
```



```
sudo fdisk –l
```



Format pendrive

```
mkfs.vfat /dev/sdb –I
```



```
sudo dd if=/home/sherwinowen/Desktop/en_windows_10_enterprise_x64_dvd_6851151.iso of=/dev/sdc status="progress"

```


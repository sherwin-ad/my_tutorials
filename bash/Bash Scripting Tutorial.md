[TOC]

# Bash Scripting Tutorial



## File System Hierarchy



| Directory | Description                                                  |
| :-------- | :----------------------------------------------------------- |
| `/`       | *Primary hierarchy* root and [root directory](https://en.wikipedia.org/wiki/Root_directory) of the entire file system hierarchy. |
| `/bin`    | Essential command [binaries](https://en.wikipedia.org/wiki/Executable) that need to be available in [single-user mode](https://en.wikipedia.org/wiki/Single-user_mode), including to bring up the system or repair it,[[3\]](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard#cite_note-3) for all users (e.g., [cat](https://en.wikipedia.org/wiki/Cat_(Unix)), [ls](https://en.wikipedia.org/wiki/Ls), [cp](https://en.wikipedia.org/wiki/Cp_(Unix))). |
| `/boot`   | [Boot loader](https://en.wikipedia.org/wiki/Boot_loader) files (e.g., [kernels](https://en.wikipedia.org/wiki/Kernel_(operating_system)), [initrd](https://en.wikipedia.org/wiki/Initrd)). |
| `/dev`    | [Device files](https://en.wikipedia.org/wiki/Device_file) (e.g., `/dev/null`, `/dev/disk0`, `/dev/sda1`, `/dev/tty`, `/dev/random`). |
| `/etc`    | Host-specific system-wide [configuration files](https://en.wikipedia.org/wiki/Configuration_file). |
| /home`    | Users' [home directories](https://en.wikipedia.org/wiki/Home_directory), containing saved files, personal settings, etc. |
| `/lib`    | [Libraries](https://en.wikipedia.org/wiki/Library_(computer_science)) essential for the [binaries](https://en.wikipedia.org/wiki/Binaries) in `/bin` and `/sbin`. |
| /media`   | Mount points for [removable media](https://en.wikipedia.org/wiki/Removable_media) such as [CD-ROMs](https://en.wikipedia.org/wiki/CD-ROM) (appeared in FHS-2.3 in 2004). |
| `/mnt`    | Temporarily [mounted](https://en.wikipedia.org/wiki/Mount_(computing)) filesystems. |
| `/opt`    | Add-on [application software](https://en.wikipedia.org/wiki/Application_software) [packages](https://en.wikipedia.org/wiki/Software_package_(installation)).[[7\]](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard#cite_note-/opt-7) |
| `/proc`   | Virtual [filesystem](https://en.wikipedia.org/wiki/File_system) providing [process](https://en.wikipedia.org/wiki/Process_(computing)) and [kernel](https://en.wikipedia.org/wiki/Kernel_(operating_system)) information as files. In Linux, corresponds to a [procfs](https://en.wikipedia.org/wiki/Procfs) mount. Generally, automatically generated and populated by the system, on the fly. |
| `/root`   | [Home directory](https://en.wikipedia.org/wiki/Home_directory) for the [root](https://en.wikipedia.org/wiki/Superuser) user. |
| `/run`    | Run-time variable data: Information about the running system since last boot, e.g., currently logged-in users and running [daemons](https://en.wikipedia.org/wiki/Daemon_(computer_software)). Files under this directory must be either removed or truncated at the beginning of the boot process, but this is not necessary on systems that provide this directory as a [temporary filesystem](https://en.wikipedia.org/wiki/Temporary_filesystem) ([tmpfs](https://en.wikipedia.org/wiki/Tmpfs)). |
| `/sbin`   | Essential system binaries (e.g., [fsck](https://en.wikipedia.org/wiki/Fsck), [init](https://en.wikipedia.org/wiki/Init), [route](https://en.wikipedia.org/wiki/Route_(command))). |
| `/srv`    | Site-specific data served by this system, such as data and scripts for web servers, data offered by [FTP](https://en.wikipedia.org/wiki/FTP) servers, and repositories for [version control systems](https://en.wikipedia.org/wiki/Version_control_systems) (appeared in FHS-2.3 in 2004). |
| `/sys`    | Contains information about devices, drivers, and some kernel features.[[8\]](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard#cite_note-/sys-8) |
| `/tmp`    | [Directory for temporary files](https://en.wikipedia.org/wiki/Temporary_folder) (see also `/var/tmp`). Often not preserved between system reboots and may be severely size-restricted. |
| `/usr`    | *Secondary hierarchy* for read-only user data; contains the majority of ([multi-](https://en.wikipedia.org/wiki/Multi-user))user utilities and applications. Should be shareable and read-only.[[9\]](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard#cite_note-9)[[10\]](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard#cite_note-10) |
| `/var`    | Variable files: files whose content is expected to continually change during normal operation of the system, such as logs, spool files, and temporary e-mail files. |

## Bash Scripting Basics

**File extension**: script_name.sh

```
#!/bin/bash
echo This is our first Bash Script
```

**Make bash script executable**

```
chmod +x test.sh

chmod -R 777 test.sh	
```

**Execute script**

```
bash test.sh

./test.sh

sudo cp test.sh /bin/test_new.sh
test_new.sh
```



## Variables

| Variable                                  | Definition                            |
| ----------------------------------------- | ------------------------------------- |
| echo "Hello World"                        | Write a String                        |
| echo 4                                    | Write an Integer                      |
| a=3                                       | User Variables                        |
| echo $a                                   | Create a variable and call it in echo |
| echo $BASH; echo $BASH_VERSION; echo $PWD | System Variables                      |

```bash
#!/bin/bash
x=5

echo "Hello World!"

echo $x 
echo $BASH
echo $BASH_VERSION
echo $PWD
```

```
#!/bin/bash 
echo $1 $2 $3

./test1.sh cat dog bird 
cat dog bird

./test1.sh cat dog bird frog
cat dog bird
```

```
echo $0
$ test.sh cat dog bird
output: /usr/bin/test.sh

echo $2
$ test.sh cat dog bird
output: dog

echo S@
$ test.sh cat dog bird
output: cat dog bird

echo $#
$ test.sh cat dog bird frog
output: 4
```

## Shift

```
shift [n]
```

The **shift** command takes only one argument:

| ***n*** | **The number of positions that parameters should be shifted to the left. This value can be any non-negative [integer](https://www.computerhope.com/jargon/i/integer.htm). If *n* is zero (0), no parameter shift will be performed. The default value of *n* is 1.** |
| ------- | ------------------------------------------------------------ |

```
#!/bin/bash
echo 1 - $1
echo 2 - $2
echo 3 - $3
echo 4 - $4
shift
echo 1 - $1
echo 2 - $2
echo 3 - $3
echo 4 - $4
```

**Output**

```
$ ./test2.sh cat dog bird frog
1 - cat
2 - dog
3 - bird
4 - frog
1 - dog
2 - bird
3 - frog
4 -
```

**test2.sh**

```
#!/bin/bash
echo 1 - $1
echo 2 - $2
echo 3 - $3
echo 4 - $4
shift 0
echo 1 - $1
echo 2 - $2
echo 3 - $3
echo 4 - $4
```

**Output**

```
./test2.sh cat dog bird frog
1 - cat
2 - dog
3 - bird
4 - frog
1 - cat
2 - dog
3 - bird
4 - frog
```

```
#!/bin/bash
echo 1 - $1
echo 2 - $2
echo 3 - $3
echo 4 - $4
shift 2
echo 1 - $1
echo 2 - $2
echo 3 - $3
echo 4 - $4
```

**Output**

```
./test2.sh cat dog bird frog
1 - cat
2 - dog
3 - bird
4 - frog
1 - bird
2 - frog
3 -
4 -
```


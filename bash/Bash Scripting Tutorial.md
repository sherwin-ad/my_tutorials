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

## Shift Command

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

## Read Command

test_read.sh

```
#!/bin/bash

echo "What is your first name? : " 
read name

echo "What is your midle name? : " 
read 

read -p "What is your last name? : " lastname

echo "May full name is $name $REPLY $lastname."
```

**Output**

```
./test_read.sh 
What is your first name? : 
Sherwin
What is your midle name? : 
Santiago
What is your last name? : Adriano
May full name is Sherwin Santiago Adriano.
```

## Quotes in bash

```
#!/bin/bash 

x=5
y=date

echo 'date'
echo "date"
echo `date\n`

echo '$x'
echo "$x"
echo `$x\n`

echo '$y'
echo "$y"
echo `$y`
```

**Output**

```
$ ./test1.sh 
date
date
./test1.sh: line 8: daten: command not found

$x
5
./test1.sh: line 12: 5n: command not found

$y
date
Wednesday, 13 July, 2022 09:41:47 AM PST
```

## If condition

```
if [ condition ]
then
  State
fi
```

```
if [ condition ]
then
  state
elif [ condition ]
then
  state
else
  state
fi
```

| Condition | Definition            |
| --------- | --------------------- |
| -eq       | equal                 |
| -ne       | not equal             |
| -gt       | greater than          |
| -ge       | greater than or equal |
| -It       | less than             |
| -le       | less than or equal    |

**Example:**

if [ $a -eq $b ]

| Condition | Definition            |
| --------- | --------------------- |
| ==        | equal                 |
| !=        | not equal             |
| >         | greater than          |
| >=        | greater than or equal |
| <         | less                  |
| <=        | less than             |

**Example**

if (( $a == $b ))

```
#!/bin/bash

x=10

if [ $x -eq 10 ]
then
 echo 'ok'
 fi

if (( $x == 10 ))
then
 echo 'ok'
 fi 

if (( $x < 10 ))
then
  echo $x 'is less 10'
elif (( $x > 10 ))
then
  echo $x 'is greater than 10'
else
  echo $x 'is equal 10'
fi
```

Output

```
./test_if.sh 
ok
ok
10 is equal 10
```



## AND and OR Operators



| Operator | Symbol       |
| -------- | ------------ |
| AND      | && or (-a)   |
| OR       | \|\| or (-o) |

```
#!/bin/bash

x=12

if (( $x >= 10 )) && (( $x <= 20))
then
  echo 'x is in range'

else
 echo 'x is not in range'

fi
```

Output

```
./test_and_or.sh 
x is in range
```

## Aritmetic Oprations

```
#!/bin/bash

x=5
y=2

echo 1+1            # Show as string
echo $(( 1 + 1))    # Calculate as integer and show as result

echo $(( x + y))  # add
echo $(( x - y))  # subtract
echo $(( x * y))  # multiply
echo $(( x / y))  # divide
echo $(( x % y))  # remainder
```

**Output**

```
./test.sh 
1+1
2
7
3
10
2
1
```

## Basic Calculator

```
#!/bin/bash

echo "10.5 + 20" | bc
echo $((10 + 20))

echo "20 / 3" | bc
echo "scale=2; 20 / 3" | bc
echo "scale=10; 20 / 3" | bc

echo "sqrt(20)" | bc
echo "scale=10;sqrt(20)" | bc
```

**Output**

```
./test.sh 
30.5
30
6
6.66
6.6666666666
4
4.4721359549
```

## File Verification Operators

-e file exist
-f file exist and regular file
-s file content is empty or not,false (empty)
-d check whether directory or not
-r read
-w write
-x executable

```
#!/bin/bash

echo -n "Enter File Name: "
read filename

if [ -e $filename ]
then
  echo "$filename is found"
else
 echo '$filename is not found'
fi
```

**Output**

```
./test.sh 
Enter File Name: test1.sh
test1.sh is found
```



## Case Statement

```
case expression in
  pattern-1)
    statement ;;
  
  pattern-2.a | pattern-2.b | pattern--2.c)
    statement ;;

  pattern-n)
    statement ;;
esac
```

```
#!/bin/bash

echo -n "Enter animal name: "
read animal
echo -n "The animal type of $animal is "

case $animal in

  chicken )
    echo 'bird' ;;

  butterfly )
    echo 'insect' ;;

  cat | dog | lion )
    echo 'mammal' ;;

  * )
    echo 'unknown' ;;

esac
```

**Output**

```
./test.sh 
Enter animal name: chicken
The animal type of chicken is bird

./test.sh 
Enter animal name: cat
The animal type of cat is mammal

./test.sh 
Enter animal name: butterfly
The animal type of butterfly is insect

./test.sh 
Enter animal name: from
The animal type of from is unknown
```

**Output**

```
./test.sh 
Enter a character: b
$letter is between a-z

./test.sh 
Enter a character: 7
$letter is between 0-9

./test.sh 
Enter a character: #
$letter is a special character

./test.sh 
Enter a character: top
$letter is an unknown character
```

## Arrays

| Syntax                    | Definition                                |
| ------------------------- | ----------------------------------------- |
| declare -a animals        | Create an empty array                     |
| animals=(1 2 “cat” “dog”) | Create an array with items                |
| animals[4]=4              | Add new item (or change) to array         |
| echo ${animals[@]}        | Show all items in array (@ or *)          |
| echo ${!animals[@]}       | Show index all index numbers of an array  |
| echo ${#animals[@]}       | Show total count of all items of an array |
| echo ${animals[2]}        | Show item-2 of the array                  |
| unset animals[1]          | Delete an item in array                   |

```
#!/bin/bash

declare -a animals
animals=(1 2 "cat" "dog")
echo ${animals[@]}
echo ${animals[2]}
echo ${!animals[@]}
echo ${#animals[@]}

animals[2]=bird
animals[4]=frog
unset animals[1]
echo ${animals[@]}
```

**Output**

```
./test_array.sh 
1 2 cat dog
cat
0 1 2 3
4
1 bird dog frog
```

## For Loops

### Sample 1

```
for item in [list]
do 
  [ commands]
done
```

```
#!/bin/bash
 
for i in pwd ls "ls -l"
do
  echo "---$i---"
  $i
  echo
done
```

**Output**

```
./test_for.sh 
---pwd---
/home/sherwinowen/Documents/my_tutorials/bash/my_bash_scripts

---ls---
test1.sh  test2.sh  test_and_or.sh  test_array.sh  test_for.sh	test_if.sh  test_read.sh  test.sh

---ls -l---
total 96
-rwxr-xr-x 1 sherwinowen sherwinowen 128 Jul 13 09:41 test1.sh
-rwxr-xr-x 1 sherwinowen sherwinowen 116 Jul 12 20:42 test2.sh
-rwxr-xr-x 1 sherwinowen sherwinowen 122 Jul 13 16:34 test_and_or.sh
-rwxr-xr-x 1 sherwinowen sherwinowen 206 Jul 18 15:51 test_array.sh
-rwxr-xr-x 1 sherwinowen sherwinowen  76 Jul 18 17:05 test_for.sh
-rwxr-xr-x 1 sherwinowen sherwinowen 230 Jul 13 15:56 test_if.sh
-rwxr-xr-x 1 sherwinowen sherwinowen 201 Jul 13 09:30 test_read.sh
-rwxr-xr-x 1 sherwinowen sherwinowen 278 Jul 18 16:56 test.sh
```

### Sample 2

```
for (( Initialization; Test Step))
do 
  [ commands ]
done
```

```
#!/bin/bash

for (( i=1; i<=10; i++ ))
do
  echo $i
done

echo

for x in {11..20}
do
  echo $x
done

echo

for y in {22..30..2}
do
  echo $y
done
```

```
./test_for_1.sh 
1
2
3
4
5
6
7
8
9
10

11
12
13
14
15
16
17
18
19
20

22
24
26
28
30
```

## Select

### Sample 1

```
select item in [ list ]
do
  [ commands ]
done
```

```
 #!/bin/bash

select animal in cat dog bird frog turtle
do
  echo "Selected animal: $animal"
  echo "Selected number: $REPLY"
done
```

**Output**

```
./test_select.sh 
1) cat
2) dog
3) bird
4) frog
5) turtle
#? 3
Selected animal: bird
Selected number: 3
```

### Sample 2

```
 #!/bin/bash

fruit_list=( apple banana grapes orange "pine apple"  )

select fruit in "${fruit_list[@]}"
do
  echo "Selected fruit: $fruit"
  echo "Selected number: $REPLY"
done
```

**Output**

```
./test_select_1.sh 
1) apple
2) banana
3) grapes
4) orange
5) pine apple
#? 4
Selected fruit: orange
Selected number: 4
```

### Sample 3

```
 #!/bin/bash

select cal in add subtract multiply divide quit;
do 
  case $cal in
    add)
      echo $cal
      read -p "x= " x
      read -p "y= " y
      echo "$x + $y = $(($x+$y))" ;;
    
    subtract) 
      echo $cal
      read -p "x= " x
      read -p "y= " y
      echo "$x - $y = $(($x-$y))" ;;

    multiply)  
      read -p "x= " x
      read -p "y= " y
      echo "$x * $y = $(($x*$y))" ;;

    divide)  
      read -p "x= " x
      read -p "y= " y
      echo "$x / $y = $(($x/$y))" ;;

    quit)
      break ;;     #Finish the loop

    *)
      echo "Invalid option $REPLY" ;; 
  esac
done
```

**Output**

```
./test_select_2.sh 
1) add
2) subtract
3) multiply
4) divide
5) quit
#? 4
x= 10
y= 5
10 / 5 = 2
#? 3
x= 5
y= 5
5 * 5 = 25
```

## While Loop

```
while [ condition ]
do
  [ commands ]
done  
```

```
#!/bin/bash
x=1
while (( $x <= 10 )) # OR [ $x -le 10 ]
do
  echo $x
  ((x++))       # x = x + 1
  sleep .2
done  
```

**Output**

```
./test_while.sh 
1
2
3
4
5
6
7
8
9
10
```

## Until Loop

```
until [ condition ]
do
  [ commands ]
done  
```

```
#!/bin/bash

x=20

until (( $x <= 10))
do
  echo $x
  ((x--))       # x = x - 1
done  
```

**Output**

```
 ./test_until.sh 
20
19
18
17
16
15
14
13
12
11
```

## Break

```
#!/bin/bash

for (( x=0; x<=10; x++ ))
do
  if [ $x -eq 5 ]
  then
  break
  fi
  echo "$x"
done  
```

**Output**

```
./test_break.sh 
0
1
2
3
4
```

## Continue

```
#!/bin/bash

for (( x=0; x<=10; x++ ))
do
  if [ $x -eq 5 ]
  then
  continue
  fi
  echo "$x"
done  
```

**Output**

```
$ ./test_continue.sh 
0
1
2
3
4
6
7
8
9
10
```

## Functions

```
function_name () {
  commands
}

function_name

OR

function_name () { commands; }

function_name
```

### Sample 1

```
#!/bin/bash

function test_function () {
    echo "This is s Bash Script Function"
}

test_function
```

**Output**

```
./test_function.sh 
This is s Bash Script Function
```

### Sample 2

```
#!/bin/bash

echo "Enter a number: "

read x

function square_of_number () {
    echo "Square of x is: $((x*x))"
}

square_of_number
```

**Output**

```
./test_function_1.sh 
Enter a number: 
25
Square of x is: 625
```

## Global and Local Variables

### Sample 1 

```
#!/bin/bash

myfunction () {
  x=10
  local y=20

  echo "x = $x"
  echo "y = $y"
}

myfunction
```

**Output**

```
./test_local.sh 
x = 10
y = 20
```

### Sample 2

```
#!/bin/bash

myfunction () {
  x=10
  local y=20
}

myfunction

echo "x = $x"
echo "y = $y"
```

 **Output**

```
./test_local.sh 
x = 10
y = 
```

## Bash Scripts Debugging

### Sample 1

```
#!/bin/bash

x=1

while (( x <= 10 ))
do 
  sleep 0.3
  echo $x
  ((x++))
done
```

**Output**

```
$ bash -x test_debug.sh 
+ x=1
+ ((  x <= 10  ))
+ sleep 0.3
+ echo 1
1
+ (( x++ ))
+ ((  x <= 10  ))
+ sleep 0.3
+ echo 2
2
+ (( x++ ))
+ ((  x <= 10  ))
+ sleep 0.3
+ echo 3
3
+ (( x++ ))
+ ((  x <= 10  ))
+ sleep 0.3
+ echo 4
4
+ (( x++ ))
+ ((  x <= 10  ))
+ sleep 0.3
+ echo 5
5
+ (( x++ ))
+ ((  x <= 10  ))
+ sleep 0.3
+ echo 6
6
+ (( x++ ))
+ ((  x <= 10  ))
+ sleep 0.3
+ echo 7
7
+ (( x++ ))
+ ((  x <= 10  ))
+ sleep 0.3
+ echo 8
8
+ (( x++ ))
+ ((  x <= 10  ))
+ sleep 0.3
+ echo 9
9
+ (( x++ ))
+ ((  x <= 10  ))
+ sleep 0.3
+ echo 10
10
+ (( x++ ))
+ ((  x <= 10  ))
```

### Sample 2

```
#!/bin/bash

set -x
x=1
set +x

while (( x <= 10 ))
do 
  sleep 0.3
  echo $x
  ((x++))
done
```

**Output**

```
$ bash -x test_debug.sh 
+ set -x
+ x=1
+ set +x
1
2
3
4
5
6
7
8
9
10
```

## Bash Script - Create directory

```
#!/bin/bash

echo "Enter directory name:"
read make_directory

if [ -d "/home/sherwinowen/Documents/my_tutorials/bash/my_bash_scripts/$make_directory" ]
then
  echo "Directory is already exist"
else
  `mkdir /home/sherwinowen/Documents/my_tutorials/bash/my_bash_scripts/$make_directory`
  echo "Directory is created"
fi    
```

**Output**

```
$ ./create_dir.sh 
Enter directory name:
test
Directory is created

./create_dir.sh 
Enter directory name:
test
Directory is already exist
```

## Bash Script - Check if file exist

```
#!/bin/bash

filename=$1

if [ -f "$filename" ];
then
  echo 'File exists'
else
 echo 'File does not exist'
fi  
```

**Output**

```
./check_file.sh test.sh
File exists

./check_file.sh test20.sh
File does not exist
```

## Bash Script - Find Device Information

```
#!/bin/bash

login_name=`whoami`
path=`pwd`
device_name=`uname -n`
os_version=`uname -v`

echo "My login name is: $login_name"
echo "My current directory is: $path"
echo "Device name is: $device_name"
echo "OS version: $os_version"
```

**Output**

```
./device_info.sh 
My login name is: sherwinowen
My current directory is: /home/sherwinowen/Documents/my_tutorials/bash/my_bash_scripts
Device name is: owenbox
OS version: #137-Ubuntu SMP Wed Jun 15 13:33:07 UTC 2022
```

## Bash Script - SSH Connection

```
#!/bin/bash

host="10.10.10.10"
username="sherwinowen"
password="password"

sshpass - p $password ssh $username@$host <<EOF

ls
touch new_file.txt
ls

EOF
```






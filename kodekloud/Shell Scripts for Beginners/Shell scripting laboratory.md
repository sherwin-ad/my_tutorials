# Shell scripting laboratory



## SHELL SCRIPT INTRODUCTION, LAB: PROJECT INTRODUCTION

1. Rocket commands have been configured on your system. Let's test it out. Run the `rocket-ls` command to list all rockets.

   Bob's password is `caleston123`

   ```
   bob@caleston-lp10:~$ rocket-ls
   
   --------------------------------------------
             ROCKET MISSIONS           
   --------------------------------------------
     Name                   Status
   --------------------------------------------
   
             Total Missions - 0
   ```

2. Let's create a new directory for our new mission. Every mission requires a new directory created by the mission name. Create a new directory at `/home/bob` named `lunar-mission`.

   Note that all future `rocket` commands must be run from the parent directory of this mission directory. That is `/home/bob` in your case

   Check

   - Directory `lunar-mission` exists

   ```
   bob@caleston-lp10:~$ mkdir lunar-mission
   ```

3. Now let's create a rocket. Make sure your current working directory is at `/home/bob` and run the `rocket-add lunar-mission` command.

   Check

   - Rocket created

   ```
   bob@caleston-lp10:~$ rocket-add lunar-mission 
   
   --------------------------------------------
             PROJECT lunar-mission           
   --------------------------------------------
   Creating a new rocket....Done!
   ```

4. Next step is to start auxiliary power. Run the `rocket-start-power lunar-mission` command

   ```
   bob@caleston-lp10:~$ rocket-start-power lunar-mission
   
   Starting power ....Done!
   ```

5. Great job! Next step is to switch to internal power. Run the `rocket-internal-power lunar-mission` command

   Check

   - Switched to internal power

   ```
   bob@caleston-lp10:~$ rocket-internal-power lunar-mission
   
   Switching to internal ....Done!
   bob@caleston-lp10:~$ 
   ```

6. Awesome! Next step is to initiate auto sequence. Run the `rocket-start-sequence lunar-mission` command.

   Check

   - Auto-sequence initiated

   ```
   bob@caleston-lp10:~$ rocket-start-sequence lunar-mission
   
   Starting auto sequence ....Done!
   ```

7. Perfect! Just 2 more steps. Next, start the main engine. Run the `rocket-start-engine lunar-mission` command.

   Check

   - Start Engine

   ```
   bob@caleston-lp10:~$ rocket-start-engine lunar-mission
   
   Starting engine ....Done!
   ```

8. Finally! Let's now initiate Lift off!!! Run the `rocket-lift-off lunar-mission` command.

   Once done, wait for the status to be `success`. Give it a few seconds.

   Check

   - Lift off!!

   ```
   bob@caleston-lp10:~$ rocket-lift-off lunar-mission
   
   Initiating lift off ....
           Countdown
             10
             9
             8
             7
             6
             5
             4
             3
             2
             1
             0
      !!!!Lift off!!!
   Done!
   [53;24HBlast Off! 
   
   
                                                ^
                                               / \
                                              /___\
                                             |=   =|
                                             |  K  |
                                             |  O  |
                                             |  D  |
                                             |  E  |
                                             |  K  |
                                             |  L  |
                                             |  O  |
                                             |  U  |
                                             |  D  |
                                            /|##!##|\
                                           / |##!##| \
                                          /  |##!##|  \
                                         |  / ((:)) \  |
                                         | / (((:))) \ |
                                            ((((:)))))
                                           (((((:))))))
                                          ((((((:)))))))
                                         (((((((:))))))))
                                        ((((((((:)))))))))
                                       (((((((((:))))))))))                       
   ```

9. Let's check the status of the launch. Run the `rocket-status lunar-mission` command to check the status of the launch.

   What's the status of your launch?

   - launching
   - **success**
   - failed

   ```
   bob@caleston-lp10:~$ rocket-status lunar-mission
   success
   ```

10. reat job! You have successfully completed your first mission. Want to go again? Why not launch another rocket - this time to mars? Follow the same steps as before to launch a `mars-mission`. Below are the commands for your convenience.

   First create a directory `mars-mission`.

   Then run the below commands. Remember to provide the mission name on each command.

   ```
   rocket-add
   rocket-start-power
   rocket-internal-power
   rocket-start-sequence
   rocket-start-engine
   rocket-lift-off
   rocket-status
   ```

   Check

   - Launch successful

   ```
   bob@caleston-lp10:~$ mkdir mars-mission
   bob@caleston-lp10:~$ rocket-add mars-mission 
   
   --------------------------------------------
             PROJECT mars-mission           
   --------------------------------------------
   Creating a new rocket....Done!
   
   
   bob@caleston-lp10:~$ rocket-start-power mars-mission 
   
   Starting power ....Done!
   
   
   bob@caleston-lp10:~$ rocket-internal-power mars-mission 
   
   Switching to internal ....Done!
   
   
   bob@caleston-lp10:~$ rocket-start-sequence mars-mission 
   
   Starting auto sequence ....Done!
   
   bob@caleston-lp10:~$ rocket-start-engine mars-mission 
   
   Starting engine ....Done!
        aleston-lp10:~$ rocket-lift-off mars-mission 
        
   bob@caleston-lp10:~$ rocket-lift-off mars-mission
   
   bob@caleston-lp10:~$ rocket-status mars-mission 
   success
   ```

11. Great job!!! Run the `rocket-ls` command to list all rockets.

    in the next lab, we will see how to automate these using shell scripts. Good Luck!!!

    Ok

    ```
    bob@caleston-lp10:~$ rocket-ls
    
    --------------------------------------------
              ROCKET MISSIONS           
    --------------------------------------------
      Name                   Status
    --------------------------------------------
    lunar-mission            success
    mars-mission             success
    
              Total Missions - 2
    ```

    
## SHELL SCRIPT INTRODUCTION, LAB: CREATING YOUR FIRST SHELL SCRIPT

1. Let's create our first script. Create a script named `create-and-launch-rocket` at the path `/home/bob` and add the below commands to it.

   ```
   mkdir lunar-mission
   rocket-add lunar-mission
   rocket-start-power lunar-mission
   rocket-internal-power lunar-mission
   rocket-start-sequence lunar-mission
   rocket-start-engine lunar-mission
   rocket-lift-off lunar-mission
   rocket-status lunar-mission
   ```

   CheckCompleteIncomplete

   - Script contains mkdir
   - Script contains all rocket-commands
   - Script runs as expected

   Using a text editor such as `vi/vim` or `nano`, create a new file called `create-and-launch-rocket`.
   For example, here we are using the `VI` editor to create the file:

   ```sh
   bob@caleston-lp10:~$ vi /home/bob/create-and-launch-rocket
   ```

   Next, go to insert mode in `VI Editor` by pressing the `i` key and copy paste the each command specified in the question to it:

   ```sh
   mkdir lunar-mission
   
   rocket-add lunar-mission
   
   rocket-start-power lunar-mission
   rocket-internal-power lunar-mission
   rocket-start-sequence lunar-mission
   rocket-start-engine lunar-mission
   rocket-lift-off lunar-mission
   
   rocket-status lunar-mission
   ```

   Once done, hit the `Esc` button and type `:wq!` to save and exit the file.

2. Assign `execute` permissions to the script

   Check

   - Execute permissions assigned to the script

   ```
   bob@caleston-lp10:~$ chmod +x create-and-launch-rocket 
   ```

3. Run your script and make sure `lunar-mission` is created as expected.

   Check

   - Script works as expected

   Run the command `./create-and-launch-rocket` or `bash create-and-launch-rocket`

   ```
   bob@caleston-lp10:~$ ./create-and-launch-rocket 
   
   --------------------------------------------
             PROJECT lunar-mission           
   --------------------------------------------
   Creating a new rocket....Done!
   
   Starting power ....Done!
   
   Switching to internal ....Done!
   
   Starting auto sequence ....Done!
   
   Starting engine ....Done!
   
   Initiating lift off ....
           Countdown
             10
             9
             8
             7
             6
             5
             4
             3
   ```

4. Let's look at some other general scripts. The script `/home/bob/say_hello.sh` does not execute. Fix it.

   Try running `/home/bob/say_hello.sh`

   Check

   - Script works as expected

   Run: `chmod +x /home/bob/say_hello.sh` to add execute permissions to the script.

   say_hello.sh

   ```
   echo hello
   ```

   ```
   bob@caleston-lp10:~$ chmod +x say_hello.sh 
   
   bob@caleston-lp10:~$ ./say_hello.sh 
   hello
   ```

5. Create a shell script in the home directory called `create-directory-structure.sh`. The script should do the following tasks:

   1. Create the following directories under `/home/bob/countries` - `USA`, `UK`, `India`
   2. Create a file under each directory by the name `capital.txt`
   3. Add the capital cities name in the file - `Washington, D.C`, `London`, `New Delhi`
   4. Print `uptime` of the system

   Check

   - Task completed?

   ```
   bob@caleston-lp10:~$ vi create-directory-structure.sh
   ```

   create-directory-structure.sh

   ```
   mkdir countries
   
   cd countries
   
   mkdir USA India UK
   
   echo "Washington, D.C" > USA/capital.txt
   
   echo "London" > UK/capital.txt
   
   echo "New Delhi" > India/capital.txt
   
   uptime
   ```

   ```
   bob@caleston-lp10:~$ chmod +x create-directory-structure.sh 
   
   bob@caleston-lp10:~$ ./create-directory-structure.sh 
    02:10:16 up 39 min,  0 users,  load average: 8.46, 7.46, 6.57
   ```

6. We have placed a new version of the same script in your home directory named - `create-directory-structure-v2.sh`. However there is a problem with it. Inspect the script and identify the cause of the problem and try to fix it.

   Tip: This is more of a logical error with the script. While troubleshooting a script, read the script line by line and try to imagine the impact of each command. Imagine the directories and files each command creates/deletes/modifies as well as the present working directory within the script execution.

   If you can't figure out the issue easily, another approach is to copy each command within the script line by line and execute it on your shell. This will give you a clear picture of what happens when the script executes.

   Check

   - Task completed?

   create-directory-structure-v2.sh

   ```
   mkdir countries
   cd countries
   
   mkdir USA India UK
   
   echo "Washington, D.C" > countries/USA/capital.txt
   echo "London" > countries/UK/capital.txt
   echo "New Delhi" > countries/India/capital.txt
   
   uptime
   ```

   Change to this script

   ```
   mkdir countries
   cd countries
   
   mkdir USA India UK
   
   echo "Washington, D.C" > USA/capital.txt
   echo "London" > UK/capital.txt
   echo "New Delhi" > India/capital.txt
   
   uptime
   ```



## SHELL SCRIPT INTRODUCTION, LAB: VARIABLES

1. Let's update our script to use a variable by the name `mission_name`.

   The script is available at the path `/home/bob/create-and-launch-rocket`. Update it to define a variable `mission_name` and set it's value to `lunar-mission`. Replace all instances of `lunar-mission` with the new variable `$mission_name`

   Check

   - mission_name is defined
   - mission_name variable is used
   - Script contains all rocket-commands
   - Script runs as expected

   Update the file `/home/bob/create-and-launch-rocket` as shown below:

   create-and-launch-rocket.sh

   ```
   mission_name=lunar-mission
   
   mkdir $mission_name
   
   rocket-add $mission_name
   rocket-start-power $mission_name
   rocket-internal-power $mission_name
   rocket-start-sequence $mission_name
   rocket-start-engine $mission_name
   rocket-lift-off $mission_name
   
   rocket-status $mission_name
   ```

2. A script by the name `print-welcome-message.sh` is placed in your home directory at `/home/bob`.

   It must print the welcome message with the user name as expected. However it doesn't. Please inspect and fix the problem with the script.

   Check

   - Script is fixed

   Variable name must be in the same case as defined `$user_name`

   print-welcome-message.sh

   ```
   user_name=Michael
     
   echo "Hi $user_name, Welcome to xFusionCorp Industries. We and the rest of the management are glad to have you on board"
   ```

3. Another script by the name `print-uptime.sh` is placed in your home directory at `/home/bob`.

   It must print the uptime of the system as expected. However it's not working'. Please inspect and fix the problem with the script.

   Check

   - Script is fixed

   Variable name should not have a dashes. Correct it.

   print-uptime.sh

   ```
   up-time=$(uptime)
   
   echo "The uptime of the system is $up-time"
   ```

   Edit print-uptime.sh

   ```
   up_time=$(uptime)
   
   echo "The uptime of the system is $up_time"
   ```

   

4. Another script by the name `backup-file.sh` is placed in your home directory at `/home/bob`.

   This script creates a backup of a file by creating a copy of the same file and apending `_bkp` to it's name. However it's not working'. Please inspect and fix the problem with the script.

   Check

   - Script is fixed

   Variable should be encapsulated in `{ }`. Change variable to `${file_name}_bkp`

   backup-file.sh

   ```
   backup-file.sh# This script creates a backup of a given file by creating a copy as bkp
   # For example some-file is backed up as some-file_bkp
   
   file_name="create-and-launch-rocket"
   
   cp $file_name $file_name_bkp
   ```

   Edit backup-file.sh

   ```
   backup-file.sh# This script creates a backup of a given file by creating a copy as bkp
   # For example some-file is backed up as some-file_bkp
   
   file_name="create-and-launch-rocket"
   
   cp $file_name ${file_name}_bkp
   ```

5. Another script by the name `create_files.sh` is placed in your home directory at `/home/bob`.

   This script creates files by making use of variables. However, there is something wrong with the script, and not all the files have been created. Please fix it.

   Check

   - Script is fixed

   create_files.sh

   ```
   FILE01="Japan"
   FILE02="Egypt"
   FILEO3="Canada"
   
   cd /home/bob
   
   echo "Creating file called $FILE01"
   touch $FILE01
   
   echo "Creating file called $FILE02"
   touch $FILE02
   
   echo "Creating file called $FILE03"
   touch $FILE02
   ```

   Edit create_files.sh

   ````
   FILE01="Japan"
   FILE02="Egypt"
   FILE03="Canada"
   
   cd /home/bob
   
   echo "Creating file called $FILE01"
   touch $FILE01
   
   echo "Creating file called $FILE02"
   touch $FILE02
   
   echo "Creating file called $FILE03"
   touch $FILE03
   ````

6. Inspect and run the script called `logged_username.sh`. It uses a variable called `USER`. What is the value assigned to this variable in this `script`?

   - Michael
   - Dave
   - User
   - **Uses the Environment variable $USER to print the current User**

   logged_username.sh

   ```
   echo "My name is $USER"
   ```

   ```
   bob@caleston-lp10:~$ bash logged_username.sh 
   My name is bob
   ```





## SHELL SCRIPT INTRODUCTION, LAB: COMMAND LINE ARGUMENTS & INPUTS

1. Let's update our script to use a command line variable in the place of `lunar-mission`

   The script is available at the path `/home/bob/create-and-launch-rocket`. Set the variable `mission_name` to the command line argument `$1`

   Check

   - Script uses $1
   - Script contains all rocket-commands
   - Script runs as expected

   Update the script `/home/bob/create-and-launch-rocket` as shown below:

   ```
   mission_name=$1
     
   mkdir $mission_name
   
   rocket-add $mission_name
   
   rocket-start-power $mission_name
   rocket-internal-power $mission_name
   rocket-start-sequence $mission_name
   rocket-start-engine $mission_name
   rocket-lift-off $mission_name
   
   rocket-status $mission_name
   ```

   ```
   bob@caleston-lp10:~$ bash create-and-launch-rocket lunar-mission
   
   --------------------------------------------
             PROJECT lunar-mission           
   --------------------------------------------
   Creating a new rocket....Done!
   
   Starting power ....Done!
   
   Switching to internal ....Done!
   
   Starting auto sequence ....Done!
   
   Starting engine ....Done!
   
   Initiating lift off ....
           Countdown
             10
             9
             8
   ```

2. A shell script `/home/bob/print-capital.sh` is created for you. When run it currently prints a static message. What's the message you see?

   If permissions are not set, please set the correct permissions and execute the script.

   - She sells seashells by the seashore
   - Nothing
   - Capital city of USA is Washington
   - Capital city of UK is London

   print-capital.sh 

   ```
   echo "Capital city of UK is London"
   ```

   ```
   bob@caleston-lp10:~$ bash print-capital.sh 
   Capital city of UK is London
   ```

3. Update the script to use 2 command line variables `$1` and `$2` for `country` and `capital` respectively. When the script is executed it should now print the country and its capital using the values passed in as command line arguments.

   eg: `./print-capital.sh Nigeria Abuja` should print `Capital city of Nigeria is Abuja`

   Check

   - Script uses $1 and $2
   - Script prints the expected message

   print-capital.sh 

   ```
   echo "Capital city of $1 is $2"
   ```

   ```
   bob@caleston-lp10:~$ ./print-capital.sh Nigeria Abuja
   Capital city of Nigeria is Abuja
   ```

4. We have created a new script named `/home/bob/backup-file.sh` to create a backup of any given file. Update the script to use command line argument `$1` for the filename to be backed up instead of the hard-coded filename.

   eg: `./backup-file.sh create-and-launch-rocket` should backup `create-and-launch-rocket` to `create-and-launch-rocket_bkp`

   Check

   - Script uses $1

   - Script executes as expected

   backup-file.sh

   ```
   # This script creates a backup of a given file by creating a copy as bkp
   # For example some-file is backed up as some-file_bkp
   set -e
   
   file_name="some-file"
   
   cp $file_name ${file_name}_bkp
   
   echo "Done"
   ```

   Edit backup-file.sh

   ```\
   # This script creates a backup of a given file by creating a copy as bkp
   # For example some-file is backed up as some-file_bkp
   set -e
   
   file_name=$1
   
   cp $file_name ${file_name}_bkp
   
   echo "Done"
   ```

   ```
   bob@caleston-lp10:~$ ./backup-file.sh create-and-launch-rocket
   Done
   ```

5. How many command-line arguments does the script `/home/bob/update_shell.sh` use?

   - **2**
   - 5
   - 0
   - 3

   ```
   bob@caleston-lp10:~$ cat update_shell.sh 
   new_shell="$2"
   user_name="$1"
   usermod -s  $user_name $new_shell
   ```

6. There is something wrong with the script `/home/bob/update_shell.sh`. Find out the issue and fix it.

   This script should update the bob's home directory and default shell if valid command-line arguments are provided but it is not working correctly.

   Check

   - Script fixed?

   update_shell.sh

   ```
   new_shell="$2"
   user_name="$1"
   usermod -s $user_name $new_shell
   ```

   Edit update_shell.sh

   ```
   new_shell="$2"
   user_name="$1"
   usermod -s $new_shell $user_name
   ```



## SHELL SCRIPT INTRODUCTION, LAB: AIRTHMETIC OPERATIONS

1. Let's try some arithmetic operations. We have created a shell script - `calculation.sh` - that has 2 variables defined - `A` and `B`. Update the shell script to print the Sum, Difference, Product and Quotient of these values.

   Check

   - Script uses arithmetic operators

   - Script works as expected

   calculation.sh

   ```
   A=20
   B=10
   
   echo "Sum is "
   
   echo "Difference is "
   
   echo "Product is "
   
   echo "Quotient is "
   ```

   Edit calculation.sh

   ```
   A=20
   B=10
   
   echo "Sum is $((A+B))"
   
   echo "Difference is $((A-B))" 
   
   echo "Product is $((A*B))"
   
   echo "Quotient is $((A/B))"
   ```

   ```
   bob@caleston-lp10:~$ ./calculation.sh 
   Sum is 30
   Difference is 10
   Product is 200
   Quotient is 2
   ```

2. Update the script to use two command line arguments `$1` and `$2` instead of the statically defined values for `A` and `B`.

   Once done, you should be able to pass in the value for both variables like this `./calculation.sh 10 5`

   Note: If you are using command line variables directly within the expression `$(( ))` then you must use `$1` and `$2` and not just `1` and `2` eg: `$(( $1 + $2 ))`.

   Check

   - Script works for numbers 10 and 5
   - Script works for numbers 9 and 3

   calculation.sh

   ```
   A=$1
   B=$2
   
   echo "Sum is $((A+B))"
   
   echo "Difference is $((A-B))" 
   
   echo "Product is $((A*B))"
   
   echo "Quotient is $((A/B))"
   ```

   OR

   ```
   echo "Sum is $(($1+$2))"
   
   echo "Difference is $(($1-$2))" 
   
   echo "Product is $(($1*$2))"
   
   echo "Quotient is $(($1/$2))"
   ```

   ```
   bob@caleston-lp10:~$ ./calculation.sh 10 5
   Sum is 15
   Difference is 5
   Product is 50
   Quotient is 2
   ```

3. Create a shell script called `/home/bob/calculate-price.sh` and it must accept 2 numbers as command line parameters `$1` and `$2`. It must print the product (multiplied value) of the numbers as output. But this time in a new format - `The total price for items is 1000 dollars`

   Check

   - Script prints price of 4 and 5
   - Script prints price of 10 and 100

   calculate-price.sh

   ```
   echo "The total price for items is $(( $1 * $2)) dollars"
   ```

   OR

   ```
   price=$(( $1 * $2 ))
   
   echo "The total price for items is ${price} dollars"
   ```

   ```
   bob@caleston-lp10:~$ ./calculate-price.sh 4 5
   The total price for items is 20 dollars
   bob@caleston-lp10:~$ ./calculate-price.sh 10 100
   The total price for items is 1000 dollars
   ```

4. A new shell script is created in your home directory by the name `/home/bob/calculate-total-apples.sh` and it prints the number of total apples using the formula `total_apples = baskets x apples_per_basket`. However the script does not execute as expected. Troubleshoot and fix the issue.

   Check

   - Script prints total count of apples

   ```
   bob@caleston-lp10:~$ ./calculate-total-apples.sh 
   expr: syntax error
   Total Apples = 
   ```

   calculate-total-apples.sh

   ```
   baskets=4
   apples_per_basket=5
   
   total_apples=`expr $baskets * $apples_per_basket`
   
   echo "Total Apples = $total_apples"
   ```

   Edit calculate-total-apples.sh

   - The `*` should be escaped as `\*` for multiplication using `expr` statement.

   ```
   baskets=4
   apples_per_basket=5
   
   total_apples=`expr $baskets \* $apples_per_basket`
   
   echo "Total Apples = $total_apples"
   ```

   ```
   bob@caleston-lp10:~$ ./calculate-total-apples.sh 
   Total Apples = 20
   ```

5. Create a new script called `calculate-average.sh`. The script should accept exactly 3 `command-line` arguments and calculate the average.

   The result should not round the value to the nearest integer.

   Check

   - Average works for number 1,2, 1?

   calculate-average.sh

   ```
   num1=$1
   num2=$2
   num3=$3
   
   sum=$(( num1 + num2 + num3 ))
   
   ave=$(echo "$sum / 3" | bc -l)
   
   echo "The average is $ave"
   ```

   ```
   bob@caleston-lp10:~$ ./calculate-average.sh 1 2 1
   The average is 1.33333333333333333333
   ```



## FLOW CONTROL, LAB: CONDITIONAL LOGIC

1. Let's update our script to use a conditional statement to print the cause if the status is `failed`

   The script is available at the path `/home/bob/create-and-launch-rocket`. Add a conditional statement at the end to check if `rocket_status` variable is set to `failed`. If it is run the `rocket-debug` command

   Check

   - Script uses if statement
   - Script contains all rocket-commands
   - Script runs as expected

   create-and-launch-rocket.sh

   ```
   mission_name=$1
     
   mkdir $mission_name
   
   rocket-add $mission_name
   
   rocket-start-power $mission_name
   rocket-internal-power $mission_name
   rocket-start-sequence $mission_name
   rocket-start-engine $mission_name
   rocket-lift-off $mission_name
   
   rocket_status=$(rocket-status $mission_name)
   
   echo "The status of launch is $rocket_status"
   ```

   Edit create-and-launch-rocket.sh

   ```
   mission_name=$1
   
   mkdir $mission_name
   
   rocket-add $mission_name
   
   rocket-start-power $mission_name
   rocket-internal-power $mission_name
   rocket-start-sequence $mission_name
   rocket-start-engine $mission_name
   rocket-lift-off $mission_name
   
   rocket_status=$(rocket-status $mission_name)
   
   echo "The status of launch is $rocket_status"
   
   if [ $rocket_status = "failed" ]
   then
     rocket-debug $mission_name
   fi
   ```

2. Create a shell script in the home directory called `check_dir.sh`. The script should print the line `Directory exists` if the directory `/home/bob/caleston` exists. If not, it should print `Directory not found`

   Check

   - Task completed?

   check_dir.sh

   ```
   if [ -d "/home/bob/caleston" ]
   then
     echo "Directory exists"
   else
     echo "Directory not found"
   fi
   ```

   ```
   bob@caleston-lp10:~$ ls -l 
   total 20
   drwxrwxr-x 2 bob bob 4096 Feb  1 07:35 caleston
   -rwxrwxr-x 1 bob bob  102 Feb  1 07:34 check_dir.sh
   -rwxr-xr-x 1 bob bob  397 Feb  1 07:21 create-and-launch-rocket
   drwxrwxr-x 2 bob bob 4096 Feb  1 07:24 lunar-mission
   drwxr-xr-x 1 bob bob 4096 Apr 15  2020 media
   
   bob@caleston-lp10:~$ ./check_dir.sh 
   Directory exists
   ```

3. Create a shell script in the home directory called `check_greater.sh`. The script should check the greater of the two command line arguments `$1` and `$2` and print which ever is greater

   Check

   - Task completed?

   check_greater.sh

   ```
   if [ $1 -gt $2 ]
   then
       echo $1
   else
       echo $2
   fi
   ```

   ```
   bob@caleston-lp10:~$ ./check_greater.sh 10 8
   10
   
   bob@caleston-lp10:~$ ./check_greater.sh 102 180 
   180
   ```

   

4. Develop a shell script `/home/bob/print-month-name.sh` that accepts the number of a month as input and prints the name of the respective month. eg `./print-month-name.sh 1` should print `January` and `./print-month-name.sh 5` should print `May`. Also keep these in mind.

   1. The script must accept a month number as a command line argument.
   2. If a month number is not provided as command line argument, the script must exit with the message `No month number given`.
   3. The script must not accept a value other than `1` to `12`. If not the script must exit with the error `Invalid month number given`.

   Check

   - Script runs as expected.
   - Script prints "No month number given" if no month number is given.
   - Script prints "Invalid month number given" if month number is not 1 to 12.

   Use `-z $1` to check for command line argument.

   print-month-name.sh

   ```
   month_number=$1
   
   if [ -z $month_number ]
   then
     echo "No month number given. Please enter a month number as a command line argument."
     echo "eg: ./print-month-number 5"
     exit
   fi
   
   if [[ $month_number -lt 1 ]] || [[ $month_number -gt 12 ]]
   then
     echo "Invalid month number given. Please enter a valid number - 1 to 12."
     exit
   fi
   
   if [ $month_number -eq 1 ]
   then
     echo "January"
   elif [ $month_number -eq 2 ]
   then
     echo "February"
   elif [ $month_number -eq 3 ]
   then
     echo "March"
   elif [ $month_number -eq 4 ]
   then
     echo "April"
   elif [ $month_number -eq 5 ]
   then
     echo "May"
   elif [ $month_number -eq 6 ]
   then
     echo "June"
   elif [ $month_number -eq 7 ]
   then
     echo "July"
   elif [ $month_number -eq 8 ]
   then
     echo "August"
   elif [ $month_number -eq 9 ]
   then
     echo "September"
   elif [ $month_number -eq 10 ]
   then
     echo "October"
   elif [ $month_number -eq 11 ]
   then
     echo "November"
   elif [ $month_number -eq 12 ]
   then
     echo December
   fi
   ```



## FLOW CONTROL, LAB: FOR LOOPS



1. Develop a new script at `/home/bob/launch-rockets.sh` to call the `create-and-launch-rocket` script to launch 5 rockets for the following missions using a `for` loop.

   lunar-mission`, `mars-mission`, `jupiter-mission`, `saturn-mission`, `mercury-mission

   Check

   - Script runs as expected
   - Script uses for loop

   launch-rockets.sh

   ```
   for mission in lunar-mission mars-mission jupiter-mission saturn-mission mercury-mission
   do
           bash /home/bob/create-and-launch-rocket $mission
   done
   ```

2. Let us now update the script `/home/bob/launch-rockets.sh` to read mission names from a file.

   Mission names are located at `/tmp/assets/mission-names.txt`

   Check

   - Script runs as expected

   /tmp/assets/mission-names.txt

   ```
   ACE
   AIM
   Analog
   Apollo
   Apollo-Soyuz
   Aqua
   Aquarius
   ARCTAS
   ASTRO-1
   ASTRO-2
   Astro-E2
   ATTREX
   Aura
   DART
   Dawn
   Deep
   DISCOVER-AQ
   Dragonfly
   GALEX
   Galileo
   Gemini
   Genesis
   Geotail
   GLAST
   Glory
   GOES
   GRAIL
   Gravity
   Herschel
   HETE-2
   Heliophysics
   Hinode
   Hitomi
   Hubble
   Hurricanes
   ```

   Update launch-rockets.sh

   ```
   for mission_name in $(cat /tmp/assets/mission-names.txt)
   do
       bash /home/bob/create-and-launch-rocket $mission_name
   done
   ```

3. Create a simple script called `loop.sh` at `/home/bob`. The script should make use of a loop and print the `numbers 31 to 40` with each number in a new line.

   Check

   - Task completed?

   loop.sh

   ```
   for num in {31..40}
   do
           echo $num
   done
   ```

   ````
   bob@caleston-lp10:~$ ./loop.sh 
   31
   32
   33
   34
   35
   36
   37
   38
   39
   40
   ````

4. We have a few different applications running on this system. The list of applications are stored at `/tmp/assets/apps.txt` file. Each application has it's logs stored in `/var/log/apps` directory under a file with its name. Check it out!

   A simple version of the script has been developed for you `/home/bob/count-requests.sh` that inspects the log file of an application and prints the number of GET, POST, and DELETE requests. Update the script to use a `for loop` to read the list of applications from the `apps.txt` file and count number of requests for each application and display it in a tabular format like this.

   ```
   Log name GET POST DELETE
   - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Finance 10 20 50
   Marketing 20 10 30
   ```

   Check

   - Script uses for loop
   - Script runs as expected

   /tmp/assets/apps.txt

   ```
   finance
   marketing
   partners
   pay
   ```

   finance_app.log

   ```
   117.253.164.5 - - [01/Jul/2020:08:33:05 +0000] "GET /fieldsets HTTP/1.1" 403 4067
   127.33.30.153 - - [01/Jul/2020:08:33:05 +0000] "PUT /events HTTP/1.1" 503 4337
   80.96.119.213 - - [01/Jul/2020:08:33:05 +0000] "PATCH /playbooks HTTP/1.1" 400 2439
   176.151.149.154 - - [01/Jul/2020:08:33:05 +0000] "PUT /fieldsets HTTP/1.1" 300 2194
   63.22.80.23 - - [01/Jul/2020:08:33:05 +0000] "DELETE /fieldsets HTTP/1.1" 404 3331
   65.148.242.138 - - [01/Jul/2020:08:33:05 +0000] "PUT /lists HTTP/1.1" 204 4002
   106.15.119.193 - - [01/Jul/2020:08:33:06 +0000] "DELETE /events HTTP/1.1" 404 4228
   106.95.124.32 - - [01/Jul/2020:08:33:06 +0000] "POST /lists HTTP/1.1" 201 3846
   20.240.146.141 - - [01/Jul/2020:08:33:06 +0000] "POST /auth HTTP/1.1" 300 2007
   101.243.210.157 - - [01/Jul/2020:08:33:06 +0000] "GET /lists HTTP/1.1" 503 4090
   77.173.49.78 - - [01/Jul/2020:08:33:06 +0000] "GET /alerts HTTP/1.1" 503 4242
   9.11.114.104 - - [01/Jul/2020:08:33:07 +0000] "PATCH /playbooks HTTP/1.1" 201 2902
   172.82.174.109 - - [01/Jul/2020:08:33:07 +0000] "PATCH /collectors HTTP/1.1" 300 2474
   61.44.5.84 - - [01/Jul/2020:08:33:07 +0000] "DELETE /alerts HTTP/1.1" 400 2625
   74.176.247.141 - - [01/Jul/2020:08:33:07 +0000] "PUT /auth HTTP/1.1" 200 2445
   51.108.111.187 - - [01/Jul/2020:08:33:07 +0000] "DELETE /collectors HTTP/1.1" 404 2234
   74.240.148.31 - - [01/Jul/2020:08:33:07 +0000] "PUT /events HTTP/1.1" 403 2273
   90.13.28.85 - - [01/Jul/2020:08:33:07 +0000] "DELETE /alerts HTTP/1.1" 404 4338
   48.134.80.205 - - [01/Jul/2020:08:33:08 +0000] "DELETE /parsers HTTP/1.1" 201 4380
   216.166.36.210 - - [01/Jul/2020:08:33:08 +0000] "POST /fieldsets HTTP/1.1" 200 2061
   22.77.102.134 - - [01/Jul/2020:08:33:08 +0000] "POST /parsers HTTP/1.1" 400 3415
   234.73.29.59 - - [01/Jul/2020:08:33:08 +0000] "PATCH /users HTTP/1.1" 404 2191
   197.92.12.37 - - [01/Jul/2020:08:33:08 +0000] "PATCH /events HTTP/1.1" 300 4710
   83.147.79.252 - - [01/Jul/2020:08:33:08 +0000] "POST /alerts HTTP/1.1" 200 3089
   29.96.255.189 - - [01/Jul/2020:08:33:08 +0000] "PATCH /auth HTTP/1.1" 201 3100
   134.150.33.152 - - [01/Jul/2020:08:33:08 +0000] "GET /auth HTTP/1.1" 300 4414
   15.237.32.175 - - [01/Jul/2020:08:33:08 +0000] "PATCH /collectors HTTP/1.1" 500 4872
   128.135.228.135 - - [01/Jul/2020:08:33:09 +0000] "GET /lists HTTP/1.1" 201 3732
   12.134.107.71 - - [01/Jul/2020:08:33:09 +0000] "POST /auth HTTP/1.1" 400 4655
   168.169.81.160 - - [01/Jul/2020:08:33:09 +0000] "GET /lists HTTP/1.1" 400 3771
   0.211.31.129 - - [01/Jul/2020:08:33:09 +0000] "DELETE /parsers HTTP/1.1" 301 2127
   3.105.105.219 - - [01/Jul/2020:08:33:09 +0000] "DELETE /collectors HTTP/1.1" 300 4027
   164.230.147.95 - - [01/Jul/2020:08:33:09 +0000] "DELETE /auth HTTP/1.1" 201 2192
   214.120.103.121 - - [01/Jul/2020:08:33:10 +0000] "POST /fieldsets HTTP/1.1" 401 2144
   126.243.98.66 - - [01/Jul/2020:08:33:10 +0000] "POST /customers HTTP/1.1" 204 2095
   55.161.133.102 - - [01/Jul/2020:08:33:10 +0000] "PUT /customers HTTP/1.1" 500 3487
   142.25.168.13 - - [01/Jul/2020:08:33:10 +0000] "DELETE /parsers HTTP/1.1" 200 3427
   152.25.119.164 - - [01/Jul/2020:08:33:10 +0000] "PUT /playbooks HTTP/1.1" 200 4953
   147.90.244.112 - - [01/Jul/2020:08:33:10 +0000] "POST /alerts HTTP/1.1" 301 2624
   16.43.209.216 - - [01/Jul/2020:08:33:10 +0000] "PUT /collectors HTTP/1.1" 503 3175
   111.223.97.80 - - [01/Jul/2020:08:33:10 +0000] "POST /alerts HTTP/1.1" 401 2488
   29.20.233.51 - - [01/Jul/2020:08:33:10 +0000] "POST /customers HTTP/1.1" 403 4329
   82.166.32.163 - - [01/Jul/2020:08:33:10 +0000] "DELETE /fieldsets HTTP/1.1" 401 2478
   22.144.153.81 - - [01/Jul/2020:08:33:10 +0000] "POST /users HTTP/1.1" 300 3620
   232.88.139.70 - - [01/Jul/2020:08:33:10 +0000] "PATCH /users HTTP/1.1" 404 2392
   31.52.72.136 - - [01/Jul/2020:08:33:10 +0000] "GET /users HTTP/1.1" 500 3265
   36.168.6.250 - - [01/Jul/2020:08:33:10 +0000] "PATCH /fieldsets HTTP/1.1" 301 3152
   226.117.47.160 - - [01/Jul/2020:08:33:11 +0000] "PATCH /playbooks HTTP/1.1" 204 4637
   185.49.51.36 - - [01/Jul/2020:08:33:11 +0000] "PUT /alerts HTTP/1.1" 200 2832
   243.204.229.67 - - [01/Jul/2020:08:33:11 +0000] "PUT /auth HTTP/1.1" 403 3490
   178.243.202.236 - - [01/Jul/2020:08:33:11 +0000] "DELETE /users HTTP/1.1" 401 3123
   221.63.143.112 - - [01/Jul/2020:08:33:11 +0000] "POST /auth HTTP/1.1" 300 3809
   43.248.13.232 - - [01/Jul/2020:08:33:11 +0000] "PUT /lists HTTP/1.1" 400 4197
   116.73.16.178 - - [01/Jul/2020:08:33:11 +0000] "PATCH /users HTTP/1.1" 401 4723
   155.83.163.249 - - [01/Jul/2020:08:33:11 +0000] "DELETE /users HTTP/1.1" 403 3335
   138.79.202.139 - - [01/Jul/2020:08:33:12 +0000] "PATCH /events HTTP/1.1" 401 2625
   68.239.92.233 - - [01/Jul/2020:08:33:12 +0000] "DELETE /collectors HTTP/1.1" 401 2804
   238.240.23.220 - - [01/Jul/2020:08:33:12 +0000] "POST /collectors HTTP/1.1" 204 4934
   215.234.39.238 - - [01/Jul/2020:08:33:12 +0000] "PATCH /alerts HTTP/1.1" 401 3922
   97.128.243.160 - - [01/Jul/2020:08:33:12 +0000] "DELETE /lists HTTP/1.1" 301 2727
   214.209.233.25 - - [01/Jul/2020:08:33:12 +0000] "POST /users HTTP/1.1" 201 3998
   12.113.227.128 - - [01/Jul/2020:08:33:12 +0000] "PUT /collectors HTTP/1.1" 503 4493
   103.109.56.222 - - [01/Jul/2020:08:33:12 +0000] "DELETE /events HTTP/1.1" 403 2376
   43.109.230.120 - - [01/Jul/2020:08:33:12 +0000] "DELETE /alerts HTTP/1.1" 401 4077
   15.115.38.254 - - [01/Jul/2020:08:33:12 +0000] "DELETE /users HTTP/1.1" 403 4845
   ```

   marketing_app.log

   ```
   0.177.28.166 - - [01/Jul/2020:08:32:53 +0000] "PUT /lists HTTP/1.1" 301 2239
   76.161.134.209 - - [01/Jul/2020:08:32:53 +0000] "DELETE /playbooks HTTP/1.1" 201 2940
   106.120.106.205 - - [01/Jul/2020:08:32:53 +0000] "DELETE /alerts HTTP/1.1" 204 2951
   23.98.155.124 - - [01/Jul/2020:08:32:53 +0000] "DELETE /fieldsets HTTP/1.1" 400 4141
   208.139.106.253 - - [01/Jul/2020:08:32:53 +0000] "PUT /users HTTP/1.1" 200 3172
   63.127.50.30 - - [01/Jul/2020:08:32:53 +0000] "DELETE /alerts HTTP/1.1" 403 4783
   85.244.187.186 - - [01/Jul/2020:08:32:54 +0000] "DELETE /events HTTP/1.1" 300 2620
   254.96.59.172 - - [01/Jul/2020:08:32:54 +0000] "PUT /events HTTP/1.1" 201 4191
   50.148.11.18 - - [01/Jul/2020:08:32:54 +0000] "PUT /parsers HTTP/1.1" 404 3095
   160.58.139.201 - - [01/Jul/2020:08:32:54 +0000] "POST /collectors HTTP/1.1" 201 3232
   152.210.147.101 - - [01/Jul/2020:08:32:54 +0000] "PUT /playbooks HTTP/1.1" 403 3380
   182.20.117.93 - - [01/Jul/2020:08:32:54 +0000] "DELETE /events HTTP/1.1" 301 4072
   145.144.5.80 - - [01/Jul/2020:08:32:54 +0000] "PATCH /customers HTTP/1.1" 401 4760
   245.150.149.232 - - [01/Jul/2020:08:32:55 +0000] "PUT /events HTTP/1.1" 201 2047
   32.213.96.68 - - [01/Jul/2020:08:32:55 +0000] "PATCH /parsers HTTP/1.1" 300 3516
   46.246.2.72 - - [01/Jul/2020:08:32:55 +0000] "GET /parsers HTTP/1.1" 403 3857
   78.76.105.189 - - [01/Jul/2020:08:32:55 +0000] "PUT /alerts HTTP/1.1" 503 4185
   227.34.28.210 - - [01/Jul/2020:08:32:55 +0000] "POST /events HTTP/1.1" 404 4886
   122.242.22.232 - - [01/Jul/2020:08:32:55 +0000] "GET /users HTTP/1.1" 401 4423
   141.12.13.23 - - [01/Jul/2020:08:32:55 +0000] "PUT /auth HTTP/1.1" 200 4955
   50.123.176.215 - - [01/Jul/2020:08:32:55 +0000] "PATCH /playbooks HTTP/1.1" 503 4982
   56.242.211.12 - - [01/Jul/2020:08:32:55 +0000] "PATCH /events HTTP/1.1" 201 4669
   121.152.79.120 - - [01/Jul/2020:08:32:55 +0000] "DELETE /lists HTTP/1.1" 404 2572
   158.43.217.231 - - [01/Jul/2020:08:32:55 +0000] "DELETE /playbooks HTTP/1.1" 300 2004
   194.237.128.21 - - [01/Jul/2020:08:32:55 +0000] "POST /fieldsets HTTP/1.1" 404 4494
   49.255.243.172 - - [01/Jul/2020:08:32:55 +0000] "GET /fieldsets HTTP/1.1" 201 3673
   214.150.16.110 - - [01/Jul/2020:08:32:55 +0000] "PUT /fieldsets HTTP/1.1" 404 2986
   8.242.195.27 - - [01/Jul/2020:08:32:55 +0000] "GET /alerts HTTP/1.1" 201 3578
   170.29.13.170 - - [01/Jul/2020:08:32:55 +0000] "GET /auth HTTP/1.1" 500 4094
   150.189.108.226 - - [01/Jul/2020:08:32:56 +0000] "POST /lists HTTP/1.1" 401 2161
   59.246.192.218 - - [01/Jul/2020:08:32:56 +0000] "PATCH /collectors HTTP/1.1" 403 3743
   242.181.4.144 - - [01/Jul/2020:08:32:56 +0000] "GET /lists HTTP/1.1" 503 4980
   30.25.32.107 - - [01/Jul/2020:08:32:56 +0000] "PATCH /parsers HTTP/1.1" 300 4971
   242.53.20.50 - - [01/Jul/2020:08:32:56 +0000] "PATCH /customers HTTP/1.1" 400 3712
   99.98.96.1 - - [01/Jul/2020:08:32:57 +0000] "DELETE /users HTTP/1.1" 503 3935
   65.243.154.105 - - [01/Jul/2020:08:32:57 +0000] "PUT /alerts HTTP/1.1" 503 2921
   157.253.228.247 - - [01/Jul/2020:08:32:57 +0000] "PATCH /lists HTTP/1.1" 301 4265
   133.15.78.36 - - [01/Jul/2020:08:32:57 +0000] "DELETE /lists HTTP/1.1" 204 3455
   39.145.102.34 - - [01/Jul/2020:08:32:57 +0000] "PUT /fieldsets HTTP/1.1" 301 4910
   185.66.64.249 - - [01/Jul/2020:08:32:57 +0000] "POST /parsers HTTP/1.1" 404 3307
   59.195.208.178 - - [01/Jul/2020:08:32:57 +0000] "PUT /auth HTTP/1.1" 400 3031
   120.236.115.208 - - [01/Jul/2020:08:32:58 +0000] "DELETE /alerts HTTP/1.1" 300 2593
   194.43.162.173 - - [01/Jul/2020:08:32:58 +0000] "PUT /events HTTP/1.1" 301 3711
   70.20.214.216 - - [01/Jul/2020:08:32:58 +0000] "PATCH /events HTTP/1.1" 201 2277
   139.99.34.24 - - [01/Jul/2020:08:32:58 +0000] "PATCH /users HTTP/1.1" 204 2182
   187.229.184.69 - - [01/Jul/2020:08:32:58 +0000] "PUT /users HTTP/1.1" 201 2783
   169.89.246.9 - - [01/Jul/2020:08:32:58 +0000] "DELETE /auth HTTP/1.1" 204 2265
   180.223.201.160 - - [01/Jul/2020:08:32:58 +0000] "PUT /parsers HTTP/1.1" 300 3748
   217.49.185.6 - - [01/Jul/2020:08:32:58 +0000] "POST /parsers HTTP/1.1" 204 4968
   160.5.206.46 - - [01/Jul/2020:08:32:58 +0000] "GET /events HTTP/1.1" 301 2734
   20.254.197.19 - - [01/Jul/2020:08:32:59 +0000] "DELETE /events HTTP/1.1" 200 3213
   129.243.212.114 - - [01/Jul/2020:08:32:59 +0000] "PATCH /collectors HTTP/1.1" 403 2010
   3.187.111.59 - - [01/Jul/2020:08:32:59 +0000] "DELETE /playbooks HTTP/1.1" 400 3848
   13.8.23.162 - - [01/Jul/2020:08:32:59 +0000] "GET /alerts HTTP/1.1" 404 2992
   78.91.187.125 - - [01/Jul/2020:08:32:59 +0000] "POST /collectors HTTP/1.1" 200 3116
   61.55.36.31 - - [01/Jul/2020:08:32:59 +0000] "DELETE /parsers HTTP/1.1" 200 4674
   217.175.16.207 - - [01/Jul/2020:08:32:59 +0000] "PUT /auth HTTP/1.1" 204 4249
   88.138.232.117 - - [01/Jul/2020:08:32:59 +0000] "PATCH /auth HTTP/1.1" 404 2225
   130.119.66.200 - - [01/Jul/2020:08:32:59 +0000] "GET /lists HTTP/1.1" 204 4557
   138.61.218.44 - - [01/Jul/2020:08:32:59 +0000] "PUT /events HTTP/1.1" 204 2095
   229.168.24.22 - - [01/Jul/2020:08:32:59 +0000] "PUT /lists HTTP/1.1" 404 2734
   116.156.43.141 - - [01/Jul/2020:08:32:59 +0000] "PATCH /customers HTTP/1.1" 301 2603
   46.241.145.98 - - [01/Jul/2020:08:32:59 +0000] "POST /lists HTTP/1.1" 200 2759
   233.190.161.19 - - [01/Jul/2020:08:32:59 +0000] "DELETE /customers HTTP/1.1" 401 4998
   ```

   partners_app.log

   ```
   119.81.239.238 - - [01/Jul/2020:08:33:13 +0000] "DELETE /collectors HTTP/1.1" 201 4740
   120.95.31.185 - - [01/Jul/2020:08:33:13 +0000] "DELETE /parsers HTTP/1.1" 500 3248
   243.114.94.160 - - [01/Jul/2020:08:33:13 +0000] "DELETE /lists HTTP/1.1" 300 3937
   255.78.135.49 - - [01/Jul/2020:08:33:13 +0000] "PATCH /collectors HTTP/1.1" 401 2731
   10.5.155.146 - - [01/Jul/2020:08:33:13 +0000] "POST /users HTTP/1.1" 200 4391
   234.111.117.21 - - [01/Jul/2020:08:33:13 +0000] "DELETE /auth HTTP/1.1" 201 2832
   132.165.82.153 - - [01/Jul/2020:08:33:13 +0000] "POST /alerts HTTP/1.1" 204 4286
   123.132.103.173 - - [01/Jul/2020:08:33:13 +0000] "GET /events HTTP/1.1" 400 4616
   32.31.43.12 - - [01/Jul/2020:08:33:14 +0000] "PUT /events HTTP/1.1" 301 3084
   86.244.56.18 - - [01/Jul/2020:08:33:14 +0000] "PATCH /users HTTP/1.1" 401 3075
   223.206.8.254 - - [01/Jul/2020:08:33:14 +0000] "DELETE /collectors HTTP/1.1" 300 2762
   88.23.19.162 - - [01/Jul/2020:08:33:14 +0000] "DELETE /customers HTTP/1.1" 500 2169
   55.171.193.239 - - [01/Jul/2020:08:33:14 +0000] "DELETE /parsers HTTP/1.1" 204 4656
   252.138.54.84 - - [01/Jul/2020:08:33:14 +0000] "GET /parsers HTTP/1.1" 204 3495
   67.189.191.7 - - [01/Jul/2020:08:33:14 +0000] "PATCH /events HTTP/1.1" 300 3360
   53.81.162.34 - - [01/Jul/2020:08:33:14 +0000] "PATCH /fieldsets HTTP/1.1" 403 2685
   126.77.209.122 - - [01/Jul/2020:08:33:14 +0000] "DELETE /parsers HTTP/1.1" 301 3431
   103.38.178.224 - - [01/Jul/2020:08:33:14 +0000] "PUT /auth HTTP/1.1" 400 2227
   141.143.220.116 - - [01/Jul/2020:08:33:15 +0000] "GET /lists HTTP/1.1" 201 2865
   93.27.252.40 - - [01/Jul/2020:08:33:15 +0000] "DELETE /playbooks HTTP/1.1" 201 3392
   15.105.32.7 - - [01/Jul/2020:08:33:15 +0000] "PUT /alerts HTTP/1.1" 200 4834
   223.254.149.158 - - [01/Jul/2020:08:33:16 +0000] "PATCH /playbooks HTTP/1.1" 403 4079
   29.46.240.110 - - [01/Jul/2020:08:33:16 +0000] "GET /alerts HTTP/1.1" 300 3283
   10.177.92.182 - - [01/Jul/2020:08:33:16 +0000] "POST /alerts HTTP/1.1" 201 3923
   228.86.114.54 - - [01/Jul/2020:08:33:16 +0000] "GET /customers HTTP/1.1" 200 3293
   90.27.13.202 - - [01/Jul/2020:08:33:16 +0000] "PATCH /customers HTTP/1.1" 200 2033
   137.11.71.25 - - [01/Jul/2020:08:33:16 +0000] "POST /customers HTTP/1.1" 300 4265
   122.83.240.90 - - [01/Jul/2020:08:33:16 +0000] "PUT /events HTTP/1.1" 404 3543
   187.232.111.80 - - [01/Jul/2020:08:33:16 +0000] "DELETE /users HTTP/1.1" 401 3330
   176.147.59.9 - - [01/Jul/2020:08:33:16 +0000] "GET /users HTTP/1.1" 200 2961
   91.194.137.4 - - [01/Jul/2020:08:33:16 +0000] "GET /fieldsets HTTP/1.1" 400 4904
   6.46.102.83 - - [01/Jul/2020:08:33:16 +0000] "PATCH /events HTTP/1.1" 401 4257
   242.231.77.142 - - [01/Jul/2020:08:33:16 +0000] "POST /fieldsets HTTP/1.1" 404 4301
   46.102.87.141 - - [01/Jul/2020:08:33:16 +0000] "PUT /playbooks HTTP/1.1" 503 3282
   29.105.76.55 - - [01/Jul/2020:08:33:16 +0000] "GET /fieldsets HTTP/1.1" 201 4454
   79.64.251.98 - - [01/Jul/2020:08:33:16 +0000] "POST /auth HTTP/1.1" 401 4651
   118.222.108.66 - - [01/Jul/2020:08:33:16 +0000] "PATCH /alerts HTTP/1.1" 500 3055
   49.65.128.190 - - [01/Jul/2020:08:33:16 +0000] "PATCH /customers HTTP/1.1" 300 4193
   50.243.190.176 - - [01/Jul/2020:08:33:16 +0000] "DELETE /events HTTP/1.1" 201 2297
   227.128.60.198 - - [01/Jul/2020:08:33:16 +0000] "GET /alerts HTTP/1.1" 401 2526
   200.19.198.241 - - [01/Jul/2020:08:33:17 +0000] "DELETE /events HTTP/1.1" 404 2479
   102.38.82.93 - - [01/Jul/2020:08:33:17 +0000] "GET /customers HTTP/1.1" 300 2458
   52.245.187.22 - - [01/Jul/2020:08:33:17 +0000] "GET /fieldsets HTTP/1.1" 300 4327
   69.220.115.144 - - [01/Jul/2020:08:33:17 +0000] "PATCH /lists HTTP/1.1" 401 3577
   151.233.106.35 - - [01/Jul/2020:08:33:17 +0000] "PUT /auth HTTP/1.1" 500 3774
   205.204.179.191 - - [01/Jul/2020:08:33:17 +0000] "PUT /playbooks HTTP/1.1" 500 4817
   217.69.172.129 - - [01/Jul/2020:08:33:17 +0000] "POST /auth HTTP/1.1" 201 3970
   178.52.249.246 - - [01/Jul/2020:08:33:17 +0000] "POST /parsers HTTP/1.1" 301 3667
   40.87.26.4 - - [01/Jul/2020:08:33:17 +0000] "POST /events HTTP/1.1" 204 4336
   31.189.91.112 - - [01/Jul/2020:08:33:18 +0000] "POST /users HTTP/1.1" 204 3451
   245.62.138.237 - - [01/Jul/2020:08:33:18 +0000] "PUT /playbooks HTTP/1.1" 400 2953
   44.217.109.82 - - [01/Jul/2020:08:33:19 +0000] "GET /alerts HTTP/1.1" 404 4002
   111.79.173.74 - - [01/Jul/2020:08:33:19 +0000] "PUT /lists HTTP/1.1" 301 2477
   254.10.69.209 - - [01/Jul/2020:08:33:19 +0000] "DELETE /parsers HTTP/1.1" 200 4550
   42.193.52.49 - - [01/Jul/2020:08:33:19 +0000] "PUT /collectors HTTP/1.1" 301 3968
   78.90.56.53 - - [01/Jul/2020:08:33:19 +0000] "POST /lists HTTP/1.1" 300 3457
   222.218.188.155 - - [01/Jul/2020:08:33:19 +0000] "PUT /lists HTTP/1.1" 401 2593
   110.211.8.17 - - [01/Jul/2020:08:33:19 +0000] "DELETE /playbooks HTTP/1.1" 500 3184
   21.198.85.222 - - [01/Jul/2020:08:33:19 +0000] "PATCH /playbooks HTTP/1.1" 401 3226
   12.5.157.255 - - [01/Jul/2020:08:33:19 +0000] "DELETE /users HTTP/1.1" 404 2238
   139.195.177.153 - - [01/Jul/2020:08:33:19 +0000] "GET /auth HTTP/1.1" 200 3248
   46.122.73.235 - - [01/Jul/2020:08:33:19 +0000] "PATCH /fieldsets HTTP/1.1" 301 4199
   141.105.63.154 - - [01/Jul/2020:08:33:19 +0000] "GET /auth HTTP/1.1" 503 3076
   187.97.59.220 - - [01/Jul/2020:08:33:19 +0000] "DELETE /alerts HTTP/1.1" 204 3048
   247.210.164.227 - - [01/Jul/2020:08:33:20 +0000] "PUT /parsers HTTP/1.1" 204 3849
   84.52.186.248 - - [01/Jul/2020:08:33:20 +0000] "DELETE /users HTTP/1.1" 201 3768
   233.188.71.16 - - [01/Jul/2020:08:33:20 +0000] "PUT /auth HTTP/1.1" 503 2789
   55.170.175.149 - - [01/Jul/2020:08:33:20 +0000] "PATCH /events HTTP/1.1" 503 3096
   212.94.33.248 - - [01/Jul/2020:08:33:20 +0000] "PATCH /playbooks HTTP/1.1" 503 4002
   ```

   pay_app.log

   ```
   191.24.179.82 - - [01/Jul/2020:08:33:00 +0000] "POST /parsers HTTP/1.1" 400 3232
   49.58.90.203 - - [01/Jul/2020:08:33:00 +0000] "DELETE /collectors HTTP/1.1" 301 4903
   119.251.172.214 - - [01/Jul/2020:08:33:00 +0000] "PATCH /events HTTP/1.1" 503 4026
   104.68.141.38 - - [01/Jul/2020:08:33:00 +0000] "DELETE /auth HTTP/1.1" 500 4461
   130.46.114.34 - - [01/Jul/2020:08:33:00 +0000] "DELETE /alerts HTTP/1.1" 401 4502
   69.22.185.190 - - [01/Jul/2020:08:33:00 +0000] "PATCH /users HTTP/1.1" 500 3855
   181.222.246.174 - - [01/Jul/2020:08:33:00 +0000] "DELETE /alerts HTTP/1.1" 401 3273
   217.6.242.228 - - [01/Jul/2020:08:33:01 +0000] "PUT /collectors HTTP/1.1" 204 2612
   243.148.58.88 - - [01/Jul/2020:08:33:01 +0000] "PUT /auth HTTP/1.1" 204 4620
   39.162.55.12 - - [01/Jul/2020:08:33:01 +0000] "DELETE /customers HTTP/1.1" 503 2617
   219.181.26.217 - - [01/Jul/2020:08:33:01 +0000] "DELETE /auth HTTP/1.1" 403 4417
   127.4.47.171 - - [01/Jul/2020:08:33:02 +0000] "PATCH /customers HTTP/1.1" 400 4304
   41.223.0.80 - - [01/Jul/2020:08:33:02 +0000] "DELETE /users HTTP/1.1" 200 2850
   197.220.39.88 - - [01/Jul/2020:08:33:02 +0000] "POST /parsers HTTP/1.1" 200 3155
   178.99.79.67 - - [01/Jul/2020:08:33:02 +0000] "PUT /lists HTTP/1.1" 204 3444
   253.148.51.184 - - [01/Jul/2020:08:33:02 +0000] "DELETE /playbooks HTTP/1.1" 300 3473
   96.238.142.172 - - [01/Jul/2020:08:33:02 +0000] "DELETE /auth HTTP/1.1" 400 2824
   132.34.241.149 - - [01/Jul/2020:08:33:03 +0000] "GET /customers HTTP/1.1" 500 4974
   56.182.66.168 - - [01/Jul/2020:08:33:03 +0000] "DELETE /lists HTTP/1.1" 301 4422
   114.148.91.17 - - [01/Jul/2020:08:33:03 +0000] "PATCH /users HTTP/1.1" 401 4950
   80.153.173.29 - - [01/Jul/2020:08:33:03 +0000] "PATCH /alerts HTTP/1.1" 301 4313
   175.198.76.146 - - [01/Jul/2020:08:33:03 +0000] "PATCH /playbooks HTTP/1.1" 301 4715
   97.214.55.126 - - [01/Jul/2020:08:33:03 +0000] "GET /customers HTTP/1.1" 400 3979
   212.228.14.147 - - [01/Jul/2020:08:33:03 +0000] "POST /events HTTP/1.1" 201 3976
   114.110.117.27 - - [01/Jul/2020:08:33:03 +0000] "POST /parsers HTTP/1.1" 300 4098
   49.119.129.155 - - [01/Jul/2020:08:33:03 +0000] "GET /parsers HTTP/1.1" 204 3161
   203.54.247.19 - - [01/Jul/2020:08:33:03 +0000] "POST /parsers HTTP/1.1" 200 4738
   29.181.141.41 - - [01/Jul/2020:08:33:03 +0000] "POST /customers HTTP/1.1" 500 3980
   173.217.157.56 - - [01/Jul/2020:08:33:03 +0000] "PATCH /customers HTTP/1.1" 503 2655
   27.37.91.73 - - [01/Jul/2020:08:33:03 +0000] "PATCH /auth HTTP/1.1" 401 3505
   131.101.142.188 - - [01/Jul/2020:08:33:03 +0000] "DELETE /lists HTTP/1.1" 204 2510
   144.22.184.51 - - [01/Jul/2020:08:33:04 +0000] "GET /lists HTTP/1.1" 204 2392
   161.165.37.89 - - [01/Jul/2020:08:33:04 +0000] "POST /collectors HTTP/1.1" 500 2105
   70.9.114.174 - - [01/Jul/2020:08:33:04 +0000] "PUT /customers HTTP/1.1" 503 2855
   88.52.122.182 - - [01/Jul/2020:08:33:04 +0000] "POST /users HTTP/1.1" 400 3288
   140.36.154.44 - - [01/Jul/2020:08:33:04 +0000] "GET /alerts HTTP/1.1" 200 3488
   42.187.188.152 - - [01/Jul/2020:08:33:05 +0000] "PATCH /playbooks HTTP/1.1" 201 3654
   10.72.51.161 - - [01/Jul/2020:08:33:05 +0000] "PATCH /parsers HTTP/1.1" 301 4555
   250.120.227.138 - - [01/Jul/2020:08:33:05 +0000] "PUT /alerts HTTP/1.1" 401 3930
   ```

   /home/bob/count-requests.sh

   ```
   
   echo -e " Log name   \t      GET      \t      POST    \t   DELETE "
   echo -e "------------------------------------------------------------"
   
   get_requests=$(cat finance_app.log | grep "GET" | wc -l)
   post_requests=$(cat finance_app.log | grep "POST" | wc -l)
   delete_requests=$(cat finance_app.log | grep "DELETE" | wc -l)
   echo -e " Finance    \t ${get_requests}    \t    ${post_requests}   \t   ${delete_requests}"
   ```

   Update /home/bob/count-requests.sh

   ```
   echo -e " Log name   \t      GET      \t      POST    \t   DELETE "
   echo -e "------------------------------------------------------------"
   
   for app in $(cat /tmp/assets/apps.txt)
   do
     get_requests=$(cat /var/log/apps/${app}_app.log | grep "GET" | wc -l)
     post_requests=$(cat /var/log/apps/${app}_app.log | grep "POST" | wc -l)
     delete_requests=$(cat /var/log/apps/${app}_app.log | grep "DELETE" | wc -l)
     echo -e " ${app}    \t ${get_requests}    \t    ${post_requests}   \t   ${delete_requests}"
   
   done
   ```

   ```
   bob@caleston-lp10:~$ ./count-requests.sh 
    Log name             GET             POST         DELETE 
   ------------------------------------------------------------
    finance         7          15             18
    marketing       9          8              16
    partners        14         11             17
    pay             5          8              11
   ```

5. We have some images under the directory `/home/bob/images`. Develop a script `/home/bob/rename-images.sh` to rename all files within the images folder that has extension `jpeg` to `jpg`. A file with any other extension should remain the same.

   Tip: Use a for loop to iterate over the files within `/home/bob/images`

   Tip: Use an `if` conditional to check if the file extension is `jpeg`.

   Tip: Use `mv` to rename a file.

   To replace jpeg to jpg in a filename use `echo user1.jpeg | sed 's/jpeg/jpg/g'`.

   Check

   - Reset files
   - Script runs as expected

   ```
   bob@caleston-lp10:~$ ls -l images/
   total 0
   -rw-r--r-- 1 bob bob 0 Feb  1 09:22 user1.jpeg
   -rw-r--r-- 1 bob bob 0 Feb  1 09:22 user2.jpeg
   -rw-r--r-- 1 bob bob 0 Feb  1 09:22 user3.png
   -rw-r--r-- 1 bob bob 0 Feb  1 09:22 user4.jpeg
   -rw-r--r-- 1 bob bob 0 Feb  1 09:22 user5.png
   ```

   rename-images.sh

   ```
   for file in $(ls images)
   do
           if [[ $file = *.jpeg ]]
                   then
                   new_name=$(echo $file| sed 's/jpeg/jpg/g')
                   mv images/$file images/$new_name
           fi
   done
   ```

   ```
   bob@caleston-lp10:~$ ./rename-images.sh 
   
   bob@caleston-lp10:~$ ls -l images/
   total 0
   -rw-r--r-- 1 bob bob 0 Feb  1 09:22 user1.jpg
   -rw-r--r-- 1 bob bob 0 Feb  1 09:22 user2.jpg
   -rw-r--r-- 1 bob bob 0 Feb  1 09:22 user3.png
   -rw-r--r-- 1 bob bob 0 Feb  1 09:22 user4.jpg
   -rw-r--r-- 1 bob bob 0 Feb  1 09:22 user5.png
   ```





## FLOW CONTROL, LABS: WHILE LOOPS

1. Let's update our script to take into consideration the time a rocket spends in a `launching` state.

   The script is available at the path `/home/bob/create-and-launch-rocket`. Add a while loop before the if conditional statements that checks the status of rocket to wait until the rocket is in a `launching` state

   Check

   - Script uses while loop
   - Script contains all rocket-commands
   - Script runs as expected

   create-and-launch-rocket.sh

   ```
   mission_name=$1
     
   mkdir $mission_name
   
   rocket-add $mission_name
   
   rocket-start-power $mission_name
   rocket-internal-power $mission_name
   rocket-start-sequence $mission_name
   rocket-start-engine $mission_name
   rocket-lift-off $mission_name
   
   rocket_status=$(rocket-status $mission_name)
   
   echo "The status of launch is $rocket_status"
   
   if [ $rocket_status = "failed" ]
   then
     rocket-debug
   fi
   ```

   Update create-and-launch-rocket.sh

   ```
   mission_name=$1
   
   mkdir $mission_name
   
   rocket-add $mission_name
   
   rocket-start-power $mission_name
   rocket-internal-power $mission_name
   rocket-start-sequence $mission_name
   rocket-start-engine $mission_name
   rocket-lift-off $mission_name
   
   rocket_status=$(rocket-status $mission_name)
   
   echo "The status of launch is $rocket_status"
   
   while [ $rocket_status = "launching" ]
   do
     sleep 2
     rocket_status=$(rocket-status $mission_name)
   done
   
   if [ $rocket_status = "failed" ]
   then
     rocket-debug
   fi
   ```

2. A script called `print-numbers.sh` is created in the home directory. There is a syntax error in the script. Identify it and fix it so that it works

   Execute the script with a number as an argument - `./print-numbers.sh 10`. Do not make any other changes to the script other than fixing the error.
   Note :- Run the command `chmod +x` to make it script executable .

   Check

   - Task completed?

   print-numbers.sh

   ```
   to_number=$1
   number=0
   while [ $number -lt $to_number ]
     echo $(( number++ ))
   done
   ```

   print-numbers.sh

   Edit print-numbers.sh

   The script is missing the `do` statement.

   ```
   to_number=$1
   number=0
   while [ $number -lt $to_number ]
   do
     echo $(( number++ ))
   done
   ```

3. Now that you fixed the script. Find out what it does.

   Which of the following is appropriate?

   - Prints numbers from 1 to 5
   - Prints numbers from 0 to 10
   - **Print numbers from 0 to a given number**
   - Print nothing

   ```
   bob@caleston-lp10:~$ ./print-numbers.sh 10
   0
   1
   2
   3
   4
   5
   6
   7
   8
   9
   ```

   

4. Let us now build a menu driven calculator program. Develop a script `/home/bob/calculator.sh` that when run:

   - Shows a menu driven program with the following options:
     1. Add
     2. Subtract
     3. Multiply
     4. Divide
     5. Quit
   - Depending on the input the program must ask for 2 numbers - `Number1` and `Number2` and then print the result in the form `Answer=6`.
   - The program must then show the menu again until user selects option 5 to quit.
     Note :- Script should be in an executable format, run command `chmod +x` to make it executable.

   CheckCompleteIncomplete

   - Script can add
   - Script can subtract
   - Script can multiply
   - Script can divide

   calculator.sh

   ```
   while true
   do
     echo "1. Add"
     echo "2. Subtract"
     echo "3. Multiply"
     echo "4. Divide"
     echo "5. Quit"
   
     read -p "Enter your choice: " choice
   
     if [ $choice -eq 1 ]
     then
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 + $number2 ))
     elif [ $choice -eq 2 ]
     then
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 - $number2 ))
     elif [ $choice -eq 3 ]
     then
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 * $number2 ))
     elif [ $choice -eq 4 ]
     then
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 / $number2 ))
     elif [ $choice -eq 5 ]
     then
       break
     fi
   
   done
   ```



## FLOW CONTROL, LABS: CASE STATEMENTS

1. A script called `print-pkm.sh` is created in the home directory. There are multiple syntax errors in the script. Identify and fix those so that the script works

   Execute the script with a number as an argument - `./print-pkm.sh`.

   Check

   - Script works as expected

   

   print-pkm.sh

   ```
   os=Fedora
   
   case $os
     "Fedora") echo "Uses RPM package manager" ;;
   
     "RHEL") echo "Uses RPM package manager"
   
     "CentOS") echo "Uses RPM package manager"
   
     "Debian" echo "Uses DEB package manager" ;;
   
     "Ubuntu")
               echo "Uses DEB package manager" ;;
   esacprint-pkm.sh
   ```

   

   The script is missing the `in` keyword on line 4. Lines 7 and 9 is missing `;;`. Line 11 is missing `)`.

   Update the script as follows:

   ```
   os=Fedora
   
   case $os in
     "Fedora") echo "Uses RPM package manager" ;;
   
     "RHEL") echo "Uses RPM package manager" ;;
   
     "CentOS") echo "Uses RPM package manager" ;;
   
     "Debian") echo "Uses DEB package manager" ;;
   
     "Ubuntu")
               echo "Uses DEB package manager" ;;
   esac
   ```

   ```
   bob@caleston-lp10:~$ ./print-pkm.sh 
   Uses RPM package manager
   ```

2. The script we developed in one of the labs earlier called `print-month-name.sh` is placed in the home directory. Update the script to use `case` statements.

   Execute the script with a number as an argument - `./print-month-name.sh 10` should print October. Do not make any other changes to the script other than fixing the error.

   Check

   - Script uses case statements
   - Script works as expected

   print-month-name.sh

   ```
   print-month-name.shmonth_number=$1
     
   if [ -z $month_number ]
   then
     echo "No month number given. Please enter a month number as a command line argument."
     echo "eg: ./print-month-number 5"
     exit
   fi
   
   if [[ $month_number -lt 1 && $month_number -gt 12 ]]
   then
     echo "Invalid month number given. Please enter a valid number - 1 to 12."
     exit
   fi
   
   if [ $month_number -eq 1 ]
   then
     echo "January"
   elif [ $month_number -eq 2 ]
   then
     echo "February"
   elif [ $month_number -eq 3 ]
   then
     echo "March"
   elif [ $month_number -eq 4 ]
   then
     echo "April"
   elif [ $month_number -eq 5 ]
   then
     echo "May"
   elif [ $month_number -eq 6 ]
   then
     echo "June"
   elif [ $month_number -eq 7 ]
   then
     echo "July"
   elif [ $month_number -eq 8 ]
   then
     echo "August"
   elif [ $month_number -eq 9 ]
   then
     echo "September"
   elif [ $month_number -eq 10 ]
   then
     echo "October"
   elif [ $month_number -eq 11 ]
   then
     echo "November"
   elif [ $month_number -eq 12 ]
   then
     echo "December"
   fi
   ```

   Update the script as follows:

   ```
   month_number=$1
   
   if [ -z $month_number ]
   then
     echo "No month number given. Please enter a month number as a command line argument."
     echo "eg: ./print-month-number 5"
     exit
   fi
   
   if [[ $month_number -lt 1 && $month_number -gt 12 ]]
   then
     echo "Invalid month number given. Please enter a valid number - 1 to 12."
     exit
   fi
   
   case $month_number in
     1) echo "January" ;;
     2) echo "February" ;;
     3) echo "March" ;;
     4) echo "April" ;;
     5) echo "May" ;;
     6) echo "June" ;;
     7) echo "July" ;;
     8) echo "August" ;;
     9) echo "September" ;;
     10) echo "October" ;;
     11) echo "November" ;;
     12) echo "December" ;;
   esac
   ```

3. Let us now improve the calculator script we built in the previous lecture to use case statements.

   The script is available at the path `/home/bob/calculator.sh`. Replace the if conditionals with `case` statements.

   Check

   - Script does not use if statements
   - Script uses case statements
   - Script can add
   - Script can substract
   - Script can multiply
   - Script can divide

   calculator.sh

   ```
   while true
   do
     echo "1. Add"
     echo "2. Subsctract"
     echo "3. Multiply"
     echo "4. Divide"
     echo "5. Quit"
   
     read -p "Enter your choice: " choice
   
     if [ $choice -eq 1 ]
     then
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 + $number2 ))
     elif [ $choice -eq 2 ]
     then
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 - $number2 ))
     elif [ $choice -eq 3 ]
     then
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 * $number2 ))
     elif [ $choice -eq 4 ]
     then
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 / $number2 ))
     elif [ $choice -eq 5 ]
     then
       break
     fi
   
   done
   ```

   

   Update the script as follows:

   ```
   while true
   do
     echo "1. Add"
     echo "2. Subtract"
     echo "3. Multiply"
     echo "4. Divide"
     echo "5. Quit"
   
     read -p "Enter your choice: " choice
   
     case $choice in
       1)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 + $number2 ))
           ;;
       2)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 - $number2 ))
           ;;
   
       3)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 * $number2 ))
           ;;
       4)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 / $number2 ))
           ;;
       5)
           break
           ;;
     esac
   
   done
   ```

4. Now, let's improve the `calculator.sh` the script even further by adding another option to calculate the average of `two` numbers.

   The `option number 5` should calculate the average and `option 6` should quit the script.

   Check

   - Script Updated?

   

   Update script as follows:

   ```
   while true
   do
     echo "1. Add"
     echo "2. Subtract"
     echo "3. Multiply"
     echo "4. Divide"
     echo "5. Average"
     echo "6. Quit"
   
     read -p "Enter your choice: " choice
   
     case $choice in
       1)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 + $number2 ))
           ;;
       2)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 - $number2 ))
           ;;
   
       3)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 * $number2 ))
           ;;
       4)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 / $number2 ))
           ;;
       5)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           sum=$(( number1 + number2 ))
           echo Answer=$(echo "$sum / 2" | bc -l)
           ;;
       6)
           break
           ;;
     esac
   
   done
   ```

5. A script called `print-color.sh` is created in the home directory. This script accepts a single `command-line` variable, which, if set to `red` or `green`, prints a colored sentence accordingly.
   Update this script so that if we input any other color or value besides `red` or `green`, it should print the sentence `red and green are the only choices`.

   Check

   - Script Updated?
   - Prints Red?
   - Prints Green?

   print-color.sh

   ```
   color=$1
   red=`tput setaf 1`
   green=`tput setaf 2`
   reset=`tput sgr0`
   
   
             case $color in
                       red) echo "${red}this is red${reset}";;
                       green) echo "${green}this is green${reset}"
               esac
   ```

   ```
   bob@caleston-lp10:~$ ./print-color.sh red
   this is red
   
   bob@caleston-lp10:~$ ./print-color.sh green
   this is green
   ```

   

   Update the script as follows:

   ```
   color=$1
   red=`tput setaf 1`
   green=`tput setaf 2`
   reset=`tput sgr0`
   
   
             case $color in
                       red) echo "${red}this is red${reset}";;
                       green) echo "${green}this is green${reset}";;
                       *) echo "red and green are the only choices"
               esac
   ```



## SHEBANG, LAB: SHEBANG

1. A script called `loop.sh` is created in the home directory. Run it using the command `./loop.sh` and check what it does.

   Select the right answer below

   - Print numbers from 0 to a given number
   - **Prints numbers from 31 to 40**
   - Prints {31..40}
   - Print nothing

   loop.sh

   ```
   for i in {31..40}
   do
           echo $i
   done
   ```

   ```
   bob@caleston-lp10:~$ ./loop.sh 
   31
   32
   33
   34
   35
   36
   37
   38
   39
   40
   ```

2. You are currently in `bash` shell (Bourne again). Go to Bourne shell using the command `sh`. Then try to run the script again using the command `./loop.sh` and check what it does.

   Select the right answer below

   - Print numbers from 0 to a given number
   - Prints numbers from 31 to 40
   - **Prints {31..40}**
   - Print nothing

   ```
   bob@caleston-lp10:~$ sh
   
   $ ./loop.sh
   {31..40}
   ```

3. Add the `shebang` line to the top of the script so that even if the script is run from other unsupported shells, it uses the `/bin/bash` interpreter.

   Check

   - Script has shebang statement
   - Script works as expected

   Add `#!/bin/bash` to the top of the script.

   ```
   #!/bin/bash
   for i in {31..40}
   do
           echo $i
   done
   ```

   ```
   bob@caleston-lp10:~$ sh
   $ ./loop.sh
   31
   32
   33
   34
   35
   36
   37
   38
   39
   40
   ```

4. There are several scripts created in the directory `/home/bob/scripts`. One of them does not work as expected when you run it `/home/bob/scripts/<script_name.sh>`.

   Which script does not work?

   - print_number1.sh
   - print_number3.sh
   - **print_number4.sh**
   - print_number2.sh

   print_number1.sh

   ```
   #!/bin/bash
   echo {0..10}
   ```

   ```
   bob@caleston-lp10:~/scripts$ ./print_number1.sh 
   0 1 2 3 4 5 6 7 8 9 10
   ```

   print_number2.sh

   ```
   #!/bin/bash
   for j in `seq 1 10`
   do
   echo $j
   done
   ```

   ```
   bob@caleston-lp10:~/scripts$ ./print_number2.sh 
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

   print_number3.sh

   ```
   echo `seq 1 10`
   ```

   ```
   bob@caleston-lp10:~/scripts$ ./print_number3.sh 
   1 2 3 4 5 6 7 8 9 10
   ```

   print_number4.sh

   ```
   #!/bin/sh
   echo {1..10}
   ```

   ```
   bob@caleston-lp10:~/scripts$ ./print_number4.sh 
   {1..10}
   ```

5. Fix the broken script so that it prints the numbers `1 to 10` like the other scripts.

   Check

   - Script fixed?

   print_number4.sh

   ```
   #!/bin/bash
   echo {1..10}
   ```

   ```
   bob@caleston-lp10:~/scripts$ ./print_number4.sh 
   1 2 3 4 5 6 7 8 9 10
   ```





## SHEBANG, LAB: EXIT CODES



1. what is the exit status of the command `uptime`

   - **0**
   - 1
   - Success
   - 127

   Run: `echo $?` immediately after running the command `uptime`

   ```
   bob@caleston-lp10:~$ uptime 
    23:54:02 up 20 min,  0 users,  load average: 11.66, 12.43, 13.50
   
   bob@caleston-lp10:~$ echo $?
   0
   ```

2. What is the exit status after you run the command `nmap` ?

   It's ok if it returns an error. We are only interested in finding the right exit code.

   - 1
   - **127**
   - 126
   - 0

   Run: `echo $?` immediately after running the command `nmap`

   ```
   bob@caleston-lp10:~$ nmap
   -su: nmap: command not found
   
   bob@caleston-lp10:~$ echo $?
   127
   ```

3. A script called `create-rocket.sh` has been created under `/home/bob`. Try to run this command and determine the exit status

   Run: `/home/bob/create-rocket.sh jupiter-mission` to run the script.

   - 1
   - 0
   - **126**
   - 25

   Run: `/home/bob/create-rocket.sh jupiter-mission` and then `echo $?`

   ```
   bob@caleston-lp10:~$ /home/bob/create-rocket.sh jupiter-mission
   -su: /home/bob/create-rocket.sh: Permission denied
   
   bob@caleston-lp10:~$ echo $?
   126
   ```

4. Let's update our script to exit with the correct exit code.

   The script is available at the path `/home/bob/create-and-launch-rocket`. Update the script to exit with `exit code 25` if the status is failed, after printing the debug reason.

   Check

   - Script uses exit codes
   - Script contains all rocket-commands
   - Script exits with code 25 when failed.

   create-and-launch-rocket

   ```
   mission_name=$1
     
   mkdir $mission_name
   
   rocket-add $mission_name
   
   rocket-start-power $mission_name
   rocket-internal-power $mission_name
   rocket-start-sequence $mission_name
   rocket-start-engine $mission_name
   rocket-lift-off $mission_name
   
   rocket_status=$(rocket-status $mission_name)
   
   echo "The status of launch is $rocket_status"
   
   if [ $rocket_status = "launching" ]
   then
     sleep 2
     rocket_status=$(rocket-status $mission_name)
   fi
   
   if [ $rocket_status = "failed" ]
   then
     rocket-debug
   fi
   ```

   Update the script as follows:

   ```
   mission_name=$1
   
   mkdir $mission_name
   
   rocket-add $mission_name
   
   rocket-start-power $mission_name
   rocket-internal-power $mission_name
   rocket-start-sequence $mission_name
   rocket-start-engine $mission_name
   rocket-lift-off $mission_name
   
   rocket_status=$(rocket-status $mission_name)
   
   echo "The status of launch is $rocket_status"
   
   if [ $rocket_status = "launching" ]
   then
     sleep 2
     rocket_status=$(rocket-status $mission_name)
   fi
   
   if [ $rocket_status = "failed" ]
   then
     rocket-debug
     exit 25
   fi
   ```





## SHEBANG, LAB: FUNCTIONS



1. We have created a script at /home/bob/create-directories.sh to create a directory structure using a function. What is the name of the function?

   - create-directories
   - mkdir
   - function
   - **prepare-directory-structure**

   The name of the function is after the `function` keyword and before the double brackets `()`

   create-directories.sh

   ```shell
   function prepare-directory-structure()
     mkdir apps
     cd apps
     mkdir app1 app2 app3
     touch app1/logs app2/logs app3/logs
   }
   
   prepare-directory-structure
   ```

2. There seems to be a syntax error with the function definition. Identify and fix the issue.

   Try executing the script to see the error.

   Check

   - Script works as expected

   The function definition is missing the opening brackets `{` on the first line.

   create-directories.sh

   ```sh
   function prepare-directory-structure(){
     mkdir apps
     cd apps
     mkdir app1 app2 app3
     touch app1/logs app2/logs app3/logs
   }
   ```

3. A new script has been created `/home/bob/sum.sh`. There seems to be a syntax error with the function definition. Identify and fix the issue.

   Check

   - Script works as expected

   sum.sh

   ```
   function add{
     sum=$(( $1 + $2 ))
   
   }
   
   result=$(add 3 5)
   echo "The result is $result"
   ```

   The function definition is missing the double parenthesis `( )` after the function name on the first line.

   Update the script as follows:

   ```sh
   function add(){
     sum=$(( $1 + $2 ))
   }
   
   result=$(add 3 5)
   echo "The result is $result"
   ```

4. The script `/home/bob/sum.sh` does not seem to be functioning as expected. We would like the script to print the sum of 2 numbers. However it doesn't seem to be doing that.

   Identify and fix the issue.

   Check

   - Script works as expected

   The function must `echo` the result so that it can be captured in the `result` variable.

   Update the script as follows:

   ```
   function add(){
     sum=$(( $1 + $2 ))
     echo $sum
   }
   
   result=$(add 3 5)
   echo "The result is $result"
   ```

   ```
   bob@caleston-lp10:~$ ./sum.sh    
   The result is 8
   ```

5. Let us now improve the calculator script we built before. It is located at `/home/bob/calculator.sh`. Which among the below are duplicate lines of code that are repeating in the script.

   Look for lines of code that are exactly similar

   - break
   - **read -p "Enter Number1: " number1**
   - while true
   - echo

   calculator.sh

   ```shell
   #!/bin/bash
     
   while true
   do
     echo "1. Add"
     echo "2. Subtract"
     echo "3. Multiply"
     echo "4. Divide"
     echo "5. Quit"
   
     read -p "Enter your choice: " choice
   
     case $choice in
       1)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 + $number2 ))
           ;;
       2)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 - $number2 ))
           ;;
   
       3)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 * $number2 ))
           ;;
       4)
           read -p "Enter Number1: " number1
           read -p "Enter Number2: " number2
           echo Answer=$(( $number1 / $number2 ))
           ;;
       5)
           break
           ;;
     esac
   
   done
   ```

6. Move the similar lines of codes into a new function named `read_numbers`. Then replace all lines with a call to this function.

   Move Lines `14`, `15`, `19`, `20`, `25`, `26`, `30`, `31`

   Check

   - Script uses function read_numbers
   - Script can add
   - Script can substract
   - Script can multiply
   - Script can divide

   Update the script as follows:

   ```sh
   #!/bin/bash
   function read_numbers(){
     read -p "Enter Number1: " number1
     read -p "Enter Number2: " number2
   }
   
   while true
   do
     echo "1. Add"
     echo "2. Subtract"
     echo "3. Multiply"
     echo "4. Divide"
     echo "5. Quit"
   
     read -p "Enter your choice: " choice
   
     case $choice in
       1)  read_numbers
           echo $(( $number1 + $number2 )) ;;
       2)
           read_numbers
           echo $(( $number1 - $number2 )) ;;
   
       3)
           read_numbers
           echo $(( $number1 * $number2 )) ;;
   
       4)
           read_numbers
           echo $(( $number1 / $number2 )) ;;
   
       5)  break
     esac
   
   done
   ```

7. Let's improve the `create-and-launch-rocket` script to use a function. The script is available at `/home/bob`

   Move all code related to launch rocket sequence to a function named `launch_rocket`. Then call the function and pass in command line argument `$1` as function argument so that you can run the script in the format `create-and-launch-rocket lunar-mission`

   Check

   - Script uses function launch-rockets
   - Script contains all rocket-commands
   - Script runs as expected

   create-and-launch-rocket.sh

   ```sh
   mission_name=$1
     
   mkdir $mission_name
   
   rocket-add $mission_name
   
   rocket-start-power $mission_name
   rocket-internal-power $mission_name
   rocket-start-sequence $mission_name
   rocket-start-engine $mission_name
   rocket-lift-off $mission_name
   
   rocket_status=$(rocket-status $mission_name)
   
   echo "The status of launch is $rocket_status"
   
   if [ $rocket_status = "launching" ]
   then
     sleep 2
     rocket_status=$(rocket-status $mission_name)
   fi
   
   if [ $rocket_status = "failed" ]
   then
     rocket-debug
   fi
   ```

   

   Update the script as follows:

   ```sh
   function launch_rocket(){
     mission_name=$1
   
     mkdir $mission_name
   
     rocket-add $mission_name
   
     rocket-start-power $mission_name
     rocket-internal-power $mission_name
     rocket-start-sequence $mission_name
     rocket-start-engine $mission_name
     rocket-lift-off $mission_name
   
     rocket_status=$(rocket-status $mission_name)
   
     echo "The status of launch is $rocket_status"
   
     if [ $rocket_status = "launching" ]
     then
       sleep 2
       rocket_status=$(rocket-status $mission_name)
     fi
   
     if [ $rocket_status = "failed" ]
     then
       rocket-debug
       exit 1
     fi
   }
   launch_rocket $1
   ```



## PROJECT – E-COMMERCE APPLICATION, LAB – PROJECT

1. Develop a shell script - `/home/bob/deploy-ecommerce-application.sh` - to automate the deployment of the `KodeKloud E-Commerce Application`. Click on the tab called `documentation` on the top-right of the terminal.

   You may view the web application to verify by clicking on the `KodeKloud E-Commerce Application` tab at the top of your terminal. Ensure the web application is accessible visible and it lists all products.

   Remember, Bob's password - `caleston123`

   Check

   - Cleaning up
   - Executing Script
   - Pre-requisite packages installed
   - Database - MariaDB configured
   - WebServer - HTTPD configured

   Here is an example script that takes care of all the requirements:

   ```sh
   #!/bin/bash
   #
   # Automate ECommerce Application Deployment
   # Author: Mumshad Mannambeth
   
   #######################################
   # Print a message in a given color.
   # Arguments:
   #   Color. eg: green, red
   #######################################
   function print_color(){
     NC='\033[0m' # No Color
   
     case $1 in
       "green") COLOR='\033[0;32m' ;;
       "red") COLOR='\033[0;31m' ;;
       "*") COLOR='\033[0m' ;;
     esac
   
     echo -e "${COLOR} $2 ${NC}"
   }
   
   #######################################
   # Check the status of a given service. If not active exit script
   # Arguments:
   #   Service Name. eg: firewalld, mariadb
   #######################################
   function check_service_status(){
     service_is_active=$(sudo systemctl is-active $1)
   
     if [ $service_is_active = "active" ]
     then
       echo "$1 is active and running"
     else
       echo "$1 is not active/running"
       exit 1
     fi
   }
   
   #######################################
   # Check the status of a firewalld rule. If not configured exit.
   # Arguments:
   #   Port Number. eg: 3306, 80
   #######################################
   function is_firewalld_rule_configured(){
   
     firewalld_ports=$(sudo firewall-cmd --list-all --zone=public | grep ports)
   
     if [[ $firewalld_ports == *$1* ]]
     then
       echo "FirewallD has port $1 configured"
     else
       echo "FirewallD port $1 is not configured"
       exit 1
     fi
   }
   
   #######################################
   # Check if a given item is present in an output
   # Arguments:
   #   1 - Output
   #   2 - Item
   #######################################
   function check_item(){
     if [[ $1 = *$2* ]]
     then
       print_color "green" "Item $2 is present on the web page"
     else
       print_color "red" "Item $2 is not present on the web page"
     fi
   }
   
   
   
   
   
   
   echo "---------------- Setup Database Server ------------------"
   
   # Install and configure firewalld
   print_color "green" "Installing FirewallD.. "
   sudo yum install -y firewalld
   
   print_color "green" "Installing FirewallD.. "
   sudo service firewalld start
   sudo systemctl enable firewalld
   
   # Check FirewallD Service is running
   check_service_status firewalld
   
   # Install and configure Maria-DB
   print_color "green" "Installing MariaDB Server.."
   sudo yum install -y mariadb-server
   
   print_color "green" "Starting MariaDB Server.."
   sudo service mariadb start
   sudo systemctl enable mariadb
   
   # Check FirewallD Service is running
   check_service_status mariadb
   
   # Configure Firewall rules for Database
   print_color "green" "Configuring FirewallD rules for database.."
   sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
   sudo firewall-cmd --reload
   
   is_firewalld_rule_configured 3306
   
   
   # Configuring Database
   print_color "green" "Setting up database.."
   cat > setup-db.sql <<-EOF
     CREATE DATABASE ecomdb;
     CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
     GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
     FLUSH PRIVILEGES;
   EOF
   
   sudo mysql < setup-db.sql
   
   # Loading inventory into Database
   print_color "green" "Loading inventory data into database"
   cat > db-load-script.sql <<-EOF
   USE ecomdb;
   CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;
   
   INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");
   
   EOF
   
   sudo mysql < db-load-script.sql
   
   mysql_db_results=$(sudo mysql -e "use ecomdb; select * from products;")
   
   if [[ $mysql_db_results == *Laptop* ]]
   then
     print_color "green" "Inventory data loaded into MySQl"
   else
     print_color "green" "Inventory data not loaded into MySQl"
     exit 1
   fi
   
   
   print_color "green" "---------------- Setup Database Server - Finished ------------------"
   
   print_color "green" "---------------- Setup Web Server ------------------"
   
   # Install web server packages
   print_color "green" "Installing Web Server Packages .."
   sudo yum install -y httpd php php-mysql
   
   # Configure firewalld rules
   print_color "green" "Configuring FirewallD rules.."
   sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
   sudo firewall-cmd --reload
   
   is_firewalld_rule_configured 80
   
   # Update index.php
   sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf
   
   # Start httpd service
   print_color "green" "Start httpd service.."
   sudo service httpd start
   sudo systemctl enable httpd
   
   # Check FirewallD Service is running
   check_service_status httpd
   
   # Download code
   print_color "green" "Install GIT.."
   sudo yum install -y git
   sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/
   
   print_color "green" "Updating index.php.."
   sudo sed -i 's/172.20.1.101/localhost/g' /var/www/html/index.php
   
   print_color "green" "---------------- Setup Web Server - Finished ------------------"
   
   # Test Script
   web_page=$(curl http://localhost)
   
   for item in Laptop Drone VR Watch Phone
   do
     check_item "$web_page" $item
   done
   ```



# Tips & Tricks

## ShellCheck

- finds bugs in your shell scripts.

Install shellcheck

```
apt install shellcheck
```

Use shellcheck

```
shelcheck <scriptname>
```

## Google Shell Style Guide

- https://github.com/google/styleguide/blob/gh-pages/shellguide.md




# SHELL SCRIPT INTRODUCTION, LAB: CREATING YOUR FIRST SHELL SCRIPT

1. Let's create our first script. Create a script named `create-and-launch-rocket` at the path `/home/bob` and add the below commands to it.

   ```
   $ vi /home/bob/create-and-launch-rocket
   ```

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

2. Assign `execute` permissions to the script

   ```
   chmod +x create-and-launch-rocket
   ```

3. Run your script and make sure `lunar-mission` is created as expected.

   ```
   ./create-and-launch-rocket 
   
   OR
   
   bash create-and-launch-rocket
   ```

4. Let's look at some other general scripts. The script `/home/bob/say_hello.sh` does not execute. Fix it.

   Try running `/home/bob/say_hello.sh`

   ```
   $ chmod +x say_hello.sh 
   ```

5. Create a shell script in the home directory called `create-directory-structure.sh`. The script should do the following tasks:

   Create the following directories under `/home/bob/countries` - `USA`, `UK`, `India`

   Create a file under each directory by the name `capital.txt`

   Add the capital cities name in the file - `Washington, D.C`, `London`, `New Delhi`

   Print `uptime` of the system

   ```
   create-directory-structure.sh
   ```

   ```
   mkdir countries
   cd countries
   mkdir USA India UK
   echo "Washington, D.C" > USA/capital.txt
   echo "London" > UK/capital.txt
   echo "New Delhi" > India/capital.txt
   uptime
   ```

6. We have placed a new version of the same script in your home directory named - `create-directory-structure-v2.sh`. However there is a problem with it. Inspect the script and identify the cause of the problem and try to fix it.

   Tip: This is more of a logical error with the script. While troubleshooting a script, read the script line by line and try to imagine the impact of each command. Imagine the directories and files each command creates/deletes/modifies as well as the present working directory within the script execution.

   If you can't figure out the issue easily, another approach is to copy each command within the script line by line and execute it on your shell. This will give you a clear picture of what happens when the script executes.

   **wrong**

   ```
   mkdir countries
   cd countries
   
   mkdir USA India UK
   
   echo "Washington, D.C" > countries/USA/capital.txt
   echo "London" > countries/UK/capital.txt
   echo "New Delhi" > countries/India/capital.txt
   
   uptime
   ```

   **correct**

   ```
   mkdir countries
   cd countries
   
   mkdir USA India UK
   
   echo "Washington, D.C" > USA/capital.txt
   echo "London" > UK/capital.txt
   echo "New Delhi" > India/capital.txt
   
   uptime
   ```



# SHELL SCRIPT INTRODUCTION, LAB: VARIABLES

1. Let's update our script to use a variable by the name `mission_name`.

   The script is available at the path `/home/bob/create-and-launch-rocket`. Update it to define a variable `mission_name` and set it's value to `lunar-mission`. Replace all instances of `lunar-mission` with the new variable `$mission_name`

   Check

   - mission_name is defined
   - mission_name variable is used
   - Script contains all rocket-commands
   - Script runs as expected

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

   **Wrong**

   ```
   user_name=Michael
   
   echo "Hi $USER_NAME, Welcome to xFusionCorp Industries. We and the rest of the management are glad to have you on board"
   ```

   **Correct**

   ```
   user_name=Michael
   
   echo "Hi $user_name, Welcome to xFusionCorp Industries. We and the rest of the management are glad to have you on board"
   ```

3. Another script by the name `print-uptime.sh` is placed in your home directory at `/home/bob`.

   It must print the uptime of the system as expected. However it's not working'. Please inspect and fix the problem with the script.

   Check

   - Script is fixed

   **Wrong**

   ```
   up-time=$(uptime)
   
   echo "The uptime of the system is $up-time"bob@caleston-lp10:~$ 
   ```

   **Correct**

   ```
   up_time=$(uptime)
   
   echo "The uptime of the system is $up_time"
   ```

4. Another script by the name `backup-file.sh` is placed in your home directory at `/home/bob`.

   This script creates a backup of a file by creating a copy of the same file and apending `_bkp` to it's name. However it's not working'. Please inspect and fix the problem with the script.

   Check

   - Script is fixed

   **Wrong**

   ````
   # This script creates a backup of a given file by creating a copy as bkp
   # For example some-file is backed up as some-file_bkp
   
   file_name="create-and-launch-rocket"
   
   cp $file_name $file_name_bkp
   ````

   **Correct**

   ```
   # This script creates a backup of a given file by creating a copy as bkp
   # For example some-file is backed up as some-file_bkp
   
   file_name="create-and-launch-rocket"
   
   cp $file_name ${file_name}_bkp
   ```

5. Another script by the name `create_files.sh` is placed in your home directory at `/home/bob`.

   This script creates files by making use of variables. However, there is something wrong with the script, and not all the files have been created. Please fix it.

   Check

   - Script is fixed

   **Wrong**

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
   ```

   **Correct**

   ```
   FILE01="Japan"
   FILE02="Egypt"
   FILE03="Canada"
   
   cd /home/bob
   
   echo "Creating file called $FILE01"
   touch $FILE01
   
   echo "Creating file called $FILE02"
   touch $FILE02
   
   echo "Creating file called $FILE03"
   touch $FILE03FILE01="Japan"
   FILE02="Egypt"
   FILE03="Canada"
   
   cd /home/bob
   
   echo "Creating file called $FILE01"
   touch $FILE01
   
   echo "Creating file called $FILE02"
   touch $FILE02
   
   echo "Creating file called $FILE03"
   touch $FILE03
   ```

6. Inspect and run the script called `logged_username.sh`. It uses a variable called `USER`. What is the value assigned to this variable in this `script`?

   - Michael
   - Dave
   - **Uses the Environment variable $USER to print the current User**
   - User

   ```
   echo "My name is $USER"
   ```



# SHELL SCRIPT INTRODUCTION, LAB: COMMAND LINE ARGUMENTS & INPUTS

1. Let's update our script to use a command line variable in the place of `lunar-mission`

   The script is available at the path `/home/bob/create-and-launch-rocket`. Set the variable `mission_name` to the command line argument `$1`

   Check

   - Script uses $1
   - Script contains all rocket-commands
   - Script runs as expected

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

2. A shell script `/home/bob/print-capital.sh` is created for you. When run it currently prints a static message. What's the message you see?

   If permissions are not set, please set the correct permissions and execute the script.

   - Nothing
   - **Capital city of UK is London**
   - She sells seashells by the seashore
   - Capital city of USA is Washington

   ```
   ./print-capital.sh 
   Capital city of UK is London
   ```

3. Update the script to use 2 command line variables `$1` and `$2` for `country` and `capital` respectively. When the script is executed it should now print the country and its capital using the values passed in as command line arguments.

   eg: `./print-capital.sh Nigeria Abuja` should print `Capital city of Nigeria is Abuja`

   CheckCompleteIncomplete

   - Script uses $1 and $2
   - Script prints the expected message

   ```
   echo "Capital city of UK is London"
   ```

   ```
   echo "Capital city of $1 is $2
   ```

   ```
   $ ./print-capital.sh Nigeria Abuja
   Capital city of Nigeria is Abuja
   ```

4. We have created a new script named `/home/bob/backup-file.sh` to create a backup of any given file. Update the script to use command line argument `$1` for the filename to be backed up instead of the hard-coded filename.

   eg: `./backup-file.sh create-and-launch-rocket` should backup `create-and-launch-rocket` to `create-and-launch-rocket_bkp`

   Check

   - Script uses $1
   - Script executes as expected

   ```
   # This script creates a backup of a given file by creating a copy as bkp
   # For example some-file is backed up as some-file_bkp
   set -e
   
   file_name="some-file"
   
   cp $file_name ${file_name}_bkp
   
   echo "Done"
   ```

   ````
   # This script creates a backup of a given file by creating a copy as bkp
   # For example some-file is backed up as some-file_bkp
   set -e
   
   file_name=$1
   
   cp $file_name ${file_name}_bkp
   
   echo "Done"
   ````

5. How many command-line arguments does the script `/home/bob/update_shell.sh` use?

   - 5
   - 0
   - **2**
   - 3

   update_shell.sh

   ```
   new_shell="$2"
   user_name="$1"
   usermod -s  $user_name $new_shell
   ```

6. There is something wrong with the script `/home/bob/update_shell.sh`. Find out the issue and fix it.

   This script should update the bob's home directory and default shell if valid command-line arguments are provided but it is not working correctly.

   Check

   - Script fixed?

   ```
   new_shell="$2"
   user_name="$1"
   usermod -s  $user_name $new_shell
   ```

   ```
   new_shell="$2"
   user_name="$1"
   usermod -s $new_shell $user_name
   ```

   

   

   










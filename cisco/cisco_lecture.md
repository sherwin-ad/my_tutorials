[TOC]



# Cisco 



## Enable SSH on Cisco 

1. Setup Management IP

   ```
   # ip default-gateway 192.168.101.1
   
   # interface vlan 101
   (config-if)# ip address 192.168.101.2 255.255.255.0
   ```

   

2.  Set hostname and domain-name

   ```
   # config t
   (config)# hostname myswitch
   (config)# ip domain-name thegeekstuff.com
   ```

3. Generate the RSA Keys

   ```
   myswitch(config)# crypto key generate rsa
    The name for the keys will be: myswitch.thegeekstuff.com
    Choose the size of the key modulus in the range of 360 to 2048 for your
      General Purpose Keys. Choosing a key modulus greater than 512 may take
      a few minutes.
   
   How many bits in the modulus [512]: 1024
    % Generating 1024 bit RSA keys, keys will be non-exportable...[OK]
   ```

4. Setup the Line VTY configurations

   ```
   line vty 0 4
   (config-line)# transport input ssh
   (config-line)# login local
   (config-line)# password 7
   (config-line)# exit
   ```

   If you have not set the console line yet, set it to the following values.

   ```
   # line console 0
   (config-line)# logging synchronous
   (config-line)# login local
   ```

5. Create the username password

   ```
   myswitch# config t
   Enter configuration commands, one per line.  End with CNTL/Z.
   myswitch(config)# username ramesh password mypassword
   ```

   Note: If you don’t have the enable password setup properly, do it now.

   ```
   myswitch# enable secret myenablepassword
   ```

   Make sure the password-encryption service is turned-on, which will encrypt the password, and when you do “sh run”, you’ll seee only the encrypted password and not clear-text password.

   ```
   myswitch# service password-encryption
   ```

6. Verify SSH access

   ```
   myswitch# sh ip ssh
   SSH Enabled - version 1.99
   Authentication timeout: 120 secs; Authentication retries: 3
   ```

   In this example, 192.168.101.2 is the management ip-address of the switch.

   ```
   remote-machine# ssh 192.168.101.2
   login as: ramesh
   Using keyboard-interactive authentication.
   Password:
   
   myswitch>en
   Password:
   myswitch#
   ```

   


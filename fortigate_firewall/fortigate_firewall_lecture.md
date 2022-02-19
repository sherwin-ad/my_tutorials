[TOC]



# Fortigate Firewall

<img src="images/image-20220219085322791.png" alt="image-20220219085322791" style="zoom:150%;" />



## Creating VPN IPSec Site to Site connection

1. Go to VPN - IPsec Tunnels - Create New

   - Input Name and click Custom 

   ![image-20220219091148512](images/image-20220219091148512.png)

   - Input IP Address, Interface and Pre-shared Key

   - Phase 1 Proposal Encryption (SHA-256)

   ![image-20220219092220338](images/image-20220219092220338.png)

   

   - Phase 2 Selectors 

   - Input Local and Remote Address
   - Encryption (SHA-256)

   

   ![image-20220219092900235](images/image-20220219092900235.png)

   - Click Advanced check encryption and Diffie-Helman Group is the same

     ![image-20220219095127756](images/image-20220219095127756.png)

4. Create IPv4 Policy

   - To allow outgoing traffic from local network (192.168.22.0/24) to remote network (192.168.44.0/24) specified in VPN settings 

   - Disable NAT

     ![image-20220219100755235](images/image-20220219100755235.png)

   - To allow incoming traffic from remote network (192.168.44.0/24 to local network (192.168.22.0/24)

   - Disable NAT

     ![image-20220219101016518](images/image-20220219101016518.png)

3. Create Static Route

   - Create route to remote network (192.168.44.0/24) through VPN interface

     ![image-20220219102409644](images/image-20220219102409644.png)


1. Install Active Directory Domain Services Role

- Server Manager > Add Roles and Features

 

2. Access in the MMC console the Active Directory Users and Computers 

- Add the user credentials of the users that will be given access to SSL VPN 

 

 ## Migrating DHCP Server 



 

1. Export your current DHCP database.

- Open a PowerShell console (must be as an administrator) and running the command.

  ```
  Export-DhcpServer -File C:\DHCPDB\DHCPDB.xml -Leases -Force -ComputerName <ServerName> –Verbose
  ```
  
  or
  
  ```
  netsh DHCP server export C:\dhcp.tx
  ```
  
  

2. Import the DHCP databse XML to new Windows DHCP Server

- Copy the file you exported in Step 1 to the new server and import it.

- Again you will need an administrative PowerShell console. Run the command

  ```
  Import-DhcpServer -File C:\DHCPDB\DHCPDB.xml -BackupPath C:\DHCPDB\ -Leases -ScopeOverwrite -Force -ComputerName <WS2019Server Name> –Verbose
  ```

  or

  ```
  netsh DHCP server import C:\dhcp.txt
  ```

3. Authorize the New DHCP Server

- Open DHCP management console on the new server.
- In the console tree, right-click DHCP.
- Select “Authorize”.



## Migrating DNS 



**Move zone files**

To move zone files from one server to another, follow these steps:

 Note

To use the following method, the Windows 2000 DNS Server service must be installed on a new Windows 2000-based server. The DNS Server service should not be configured yet.

1. On the DNS server that is currently hosting the DNS zone(s),  change any Active Directory-integrated zones to standard primary. This  action creates the zone files that are needed for the destination DNS  server.

2. Stop the DNS Server service on both DNS servers.

3. Manually copy the entire contents (subfolders included) of the  Windows\System32\DNS folder from the source server to the  destination server.

4. On the current DNS server, I export the Zones entry to a registry file.

5. Locate and click the following registry subkey:

   `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\DNS\Zones`

   `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones`

9. On the New DNS server, double-click each registry file to import the Zones subkeys into the registry.

10. Bring the current DNS server down and transfer its IP address to the New DNS server.

11. On the New DNS server, start the DNS Server service. To  initiate the registration of the server's A and PTR resource records,  run the following command at a command prompt:

    Console

```console
ipconfig /registerdns
```

12. stop and restart the  Net Logon service to register the Service (SRV) records, or run the  following command at a command prompt:

Console

```console
netdiag /fix
```

13. Change back the mode of the zones to Active Directory-integrated 





## Decomission Domain Controller without using DCPROMO



1. Log in to DC server as Domain/Enterprise administrator and navigate to **Server Manager > Tools > Active Directory Users and Computers

   **

2. Expand the **Domain > Domain Controllers** 

   [![meta1](http://www.rebeladmin.com/wp-content/uploads/2016/01/meta1.png)](http://www.rebeladmin.com/wp-content/uploads/2016/01/meta1.png) 

3. Right click on the Domain Controller you need to manually remove and click Delete

   ![thumbnail image 1 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58795i4F97EA6E54386773/image-size/large?v=1.0&px=999)**

    

    

4. Click Yes  to confirm within the Active Directory Domain Services dialog box

   ![thumbnail image 2 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58796i8F50A3456B14F82F/image-size/large?v=1.0&px=999)

    

5. In next dialog box, select 

   This Domain Controller is  permanently offline and can no longer be demoted using the Active  Directory Domain Services Installation Wizard (DCPROMO)

    and click 

   **Delete 
   
   ![thumbnail image 3 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58797iE22F9E3C045E3531/image-size/large?v=1.0&px=999)**

    

    

6. If the domain controller is global catalog server, in next window click **Yes** to continue with deletion
   
7. If the domain controller holds any FSMO roles in next window, click **Ok** to move them to the domain controller which is available

1. Go to **Server manager > Tools > Active Directory Sites and Services 
   
   **

2. Expand the Sites and go to the server which need to remove
   
3. Right click on the server you which to remove and click 

   **Delete 
   
   ![thumbnail image 4 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58798i2E502DC00CAB07D9/image-size/large?v=1.0&px=999)**

    

    

4. Click Yes  to confirm 

   ![thumbnail image 5 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58799i231E5FA5B874BC6B/image-size/large?v=1.0&px=999)

    

1. Right Click on Start > Command Prompt (admin)
   
2. Type  ntdsutil  and enter 

   ![thumbnail image 6 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58800iC8BD362A1AFC3DC7/image-size/large?v=1.0&px=999)

    

3. You are then presented with the **metadata cleanup** prompt
    [![meta8](http://www.rebeladmin.com/wp-content/uploads/2016/01/meta8.png)](http://www.rebeladmin.com/wp-content/uploads/2016/01/meta8.png)
    
4. Next type 

   remove selected server <servername>

   NOTE:

    Replace <servername> with domain Controller server you wish to remove

   ![thumbnail image 7 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58804i8AA8F1248028C58C/image-size/large?v=1.0&px=999)

    

5. Click 

   Yes

    to proceed when presented with the warning window 

    

6. Execute the **quit** command twice to exit out of the console





## Migrating AD





**Migrate FSMO Roles to windows server 2016 AD**

 

I assume by now you have idea what is FSMO roles. If not search my blog and you will find article explaining those roles. 

There are 2 ways to move the FSMO roles from one AD server to  another. One is using GUI and other one is using command line. I had  already written articles about GUI method before so I am going to use  PowerShell this time to move FSMO roles. If you like to use GUI mode  search my blog and you will find articles on it. 

 

1) Log in to windows server 2016 AD as enterprise administrator

2) Open up the Powershell as administrator. Then type netdom query fsmo. This will list down the FSMO roles and its current owner. 

[![updc25](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc25.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc25.png)

 

3) In my demo, the windows server 2012 R2 DC server holds all 5 fsmo roles. Now to move fsmo roles over, type **Move-ADDirectoryServerOperationMasterRole -Identity REBELTEST-PDC01 -OperationMasterRole SchemaMaster,  DomainNamingMaster, PDCEmulator, RIDMaster, InfrastructureMaster** and press **enter**

 

In here REBELTEST-PDC01 is the windows server 2016 DC. If FSMO  roles are placed on different servers, you can migrate each and every  FSMO roles to different servers. 

[![updc26](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc26.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc26.png)

 

4) Once its completed, type **netdom query fsmo** again and you can see now its windows server 2016 DC is the new FSMO roles owner. 

[![updc27](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc27.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc27.png)



 

 

**Update the forest and domain functional levels to windows server 2016**

 

Now we have the windows server 2012 R2 domain controllers demoted, next step is to upgrade domain and forest functional levels. 

 

1) Log in to windows server 2016 DC as enterprise administrator 

2) Open PowerShell as administrator

3) Then type **Set-ADDomainMode –identity rebeladmin.net -DomainMode Windows2016Domain** to upgrade domain functional level to windows server 2016.  In here **rebeladmin.net** is the domain name. 

[![updc31](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc31.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc31.png)

 

4) Then type **Set-ADForestMode -Identity rebeladmin.net -ForestMode Windows2016Forest** to upgrade forest functional level.

[![updc32](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc32.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc32.png)

 

5) Once done you can run **Get-ADDomain | fl Name,DomainMode** and **Get-ADForest | fl Name,ForestMode** to confirm new domain and functional level 

[![updc33](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc33.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc33.png)

 

**Uninstall AD role from windows server 2012 R2**

 

Now we moved FSMO roles but we still running system on windows 2012 R2 domain and forest functional levels. In order to upgrade it, first  we need to decommission AD roles from existing windows server 2012 R2  servers. 

 

1) Log in to windows 2012 R2 domain server as enterprise administrator

2) Open the PowerShell as administrator

3) Then type **Uninstall-ADDSDomainController -DemoteOperationMasterRole -RemoveApplicationPartition** and press enter. It will ask for **local administrator** password. provide new password for local administrator and press enter.

[![updc28](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc28.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc28.png)

[![updc29](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc29.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc29.png)

[![updc30](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc30.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc30.png)

 

4) Once its completed it will restart the server.


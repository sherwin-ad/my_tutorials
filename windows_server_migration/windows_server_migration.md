[TOC]

## Distributed file system (DFS)

Distributed file system (DFS) is a method of storing and accessing [files](https://www.webopedia.com/definitions/file/) based in a [client/server architecture](https://www.webopedia.com/definitions/client-server-architecture/). In a distributed file system, one or more central servers store files that can be accessed, with proper authorization rights, by any number of remote clients in the network.



### File and Storage Services 

DFS Namespace
DFS Replication



### DFS Management



## Network Policy Server (NPS)

### Network Policy and Access Services





## Install Active Directory



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
  netsh DHCP server export C:\dhcp.txt
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



### DNS Records

- **Address Mapping record (A Record)**—also known as a DNS host record, stores a hostname and its corresponding IPv4 address.
- **IP Version 6 Address record (AAAA Record**)—stores a hostname and its corresponding IPv6 address.
- **Canonical Name record (CNAME Record)**—can be used to alias a hostname to another hostname. When a DNS client requests a record that contains a CNAME, which points to another hostname, the DNS resolution process is repeated with the new hostname.
- **Mail exchanger record (MX Record)**—specifies an SMTP email server for the domain, used to route outgoing emails to an email server.
- **Name Server records (NS Record)**—specifies that a DNS Zone, such as “example.com” is delegated to a specific Authoritative Name Server, and provides the address of the name server.
- **Reverse-lookup Pointer records (PTR Record)**—allows a DNS resolver to provide an IP address and receive a hostname (reverse DNS lookup).
- **Certificate record (CERT Record)**—stores encryption certificates—PKIX, SPKI, PGP, and so on.
- **Service Location (SRV Record)**—a service location record, like MX but for other communication protocols.
- **Text Record (TXT Record)**—typically carries machine-readable data such as opportunistic encryption, sender policy framework, DKIM, DMARC, etc.
- **Start of Authority (SOA Record)**—this record appears at the beginning of a DNS zone file, and indicates the Authoritative Name Server for the current DNS zone, contact details for the domain administrator, domain serial number, and information on how frequently DNS information for this zone should be refreshed.

### Moving  zone files

To move zone files from one server to another, follow these steps:

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

9. stop and restart the  Net Logon service to register the Service (SRV) records, or run the  following command at a command prompt:

Console

```console
netdiag /fix
```

10. Change back the mode of the zones to Active Directory-integrated 





## Decomission Domain Controller without using DCPROMO



1. Log in to DC server as Domain/Enterprise administrator and navigate to **Server Manager > Tools > Active Directory Users and Computers**

2. Expand the **Domain > Domain Controllers** 

   [![meta1](http://www.rebeladmin.com/wp-content/uploads/2016/01/meta1.png)](http://www.rebeladmin.com/wp-content/uploads/2016/01/meta1.png) 

3. Right click on the Domain Controller you need to manually remove and click Delete

   ![thumbnail image 1 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58795i4F97EA6E54386773/image-size/large?v=1.0&px=999)**

    

    

4. Click Yes  to confirm within the Active Directory Domain Services dialog box

   ![thumbnail image 2 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58796i8F50A3456B14F82F/image-size/large?v=1.0&px=999)

    

5. In next dialog box, select 

   This Domain Controller is  permanently offline and can no longer be demoted using the Active  Directory Domain Services Installation Wizard (DCPROMO)  and click **Delete** 

   ![thumbnail image 3 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58797iE22F9E3C045E3531/image-size/large?v=1.0&px=999)**

     
   
6. If the domain controller is global catalog server, in next window click **Yes** to continue with deletion
   
7. If the domain controller holds any FSMO roles in next window, click **Ok** to move them to the domain controller which is available

1. Go to **Server manager > Tools > Active Directory Sites and Services **
   
2. Expand the Sites and go to the server which need to remove
   
3. Right click on the server you which to remove and click  **Delete**

   ![thumbnail image 4 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58798i2E502DC00CAB07D9/image-size/large?v=1.0&px=999)**
   
    

    

4. Click Yes  to confirm 

   ![thumbnail image 5 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58799i231E5FA5B874BC6B/image-size/large?v=1.0&px=999)

    

1. Right Click on Start > Command Prompt (admin)
   
2. Type  ntdsutil  and enter 

   ![thumbnail image 6 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58800iC8BD362A1AFC3DC7/image-size/large?v=1.0&px=999)

    

3. You are then presented with the **metadata cleanup** prompt
    [![meta8](http://www.rebeladmin.com/wp-content/uploads/2016/01/meta8.png)](http://www.rebeladmin.com/wp-content/uploads/2016/01/meta8.png)
    
15. Next type 

    ``` 
    remove selected server <servername>
    ```

    NOTE:

     Replace <servername> with domain Controller server you wish to remove

    ![thumbnail image 7 of blog post titled  	 	 	  	 	 	 				 		 			 				 						 							Step-By-Step: Manually Removing A Domain Controller Server 							 						 					 			 		 	 			 	 	 	 	 	 ](https://techcommunity.microsoft.com/t5/image/serverpage/image-id/58804i8AA8F1248028C58C/image-size/large?v=1.0&px=999)

     

5. Click  Yes  to proceed when presented with the warning window 

    

17. Execute the **quit** command twice to exit out of the console

     

## FSMO (Flexible Single Master Operation)



### The 5 FSMO roles are:

1. **Schema Master** – one per forest

   The Schema Master role manages the read-write copy of your Active Directory schema. The AD Schema defines all the attributes – things like employee ID, phone number, email address, and login name – that you can apply to an object in your AD database.

2. **Domain Naming Master** – one per forest

   The Domain Naming Master makes sure that you don’t create a second domain in the same forest with the same name as another. It is the master of your domain names. Creating new domains isn’t something that happens often, so of all the roles, this one is most likely to live on the same DC with another role.

3. **Relative ID (RID) Master** – one per domain

   The Relative ID Master assigns blocks of Security Identifiers (SID) to different DCs they can use for newly created objects. Each object in AD has an SID, and the last few digits of the SID are the Relative portion. In order to keep multiple objects from having the same SID, the RID Master grants each DC the privilege of assigning certain SIDs.

4. **Primary Domain Controller (PDC) Emulator** – one per domain

   The DC with the Primary Domain Controller Emulator role is the authoritative DC in the domain. The PDC Emulator responds to authentication requests, changes passwords, and manages Group Policy Objects. And the PDC Emulator tells everyone else what time it is! It’s good to be the PDC.

5. **Infrastructure Master** – one per domain

   The Infrastructure Master role translates Globally Unique Identifiers (GUID), SIDs, and Distinguished Names (DN) between domains. If you have multiple domains in your forest, the Infrastructure Master is the Babelfish that lives between them. If the Infrastructure Master doesn’t do its job correctly you will see SIDs in place of resolved names in your Access Control Lists (ACL).



## Migrating AD

### Migrate FSMO Roles to windows server 2016 AD

I assume by now you have idea what is FSMO roles. If not search my blog and you will find article explaining those roles. 

There are 2 ways to move the FSMO roles from one AD server to  another. One is using GUI and other one is using command line. I had  already written articles about GUI method before so I am going to use  PowerShell this time to move FSMO roles. If you like to use GUI mode  search my blog and you will find articles on it. 

 

1. Log in to windows server 2016 AD as enterprise administrator

2. Open up the Powershell as administrator. Then type netdom query fsmo. This will list down the FSMO roles and its current owner. 

```
netdom query fsmo
```

[![updc25](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc25.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc25.png)

3. In my demo, the windows server 2012 R2 DC server holds all 5 fsmo roles. Now to move fsmo roles over, 

 ```
Move-ADDirectoryServerOperationMasterRole -Identity REBELTEST-PDC01 -OperationMasterRole SchemaMaster,  DomainNamingMaster, PDCEmulator, RIDMaster, InfrastructureMaster
 ```



In here REBELTEST-PDC01 is the windows server 2016 DC. If FSMO  roles are placed on different servers, you can migrate each and every  FSMO roles to different servers. 

[![updc26](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc26.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc26.png)

 

4. Once its completed, type **netdom query fsmo** again and you can see now its windows server 2016 DC is the new FSMO roles owner. 

   ```
   netdom query fsmo
   ```

   

[![updc27](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc27.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc27.png)



 

 

### Update the forest and domain functional levels to windows server 2016

Now we have the windows server 2012 R2 domain controllers demoted, next step is to upgrade domain and forest functional levels. 

1. Log in to windows server 2016 DC as enterprise administrator 

2. Open PowerShell as administrator

3. Then type **Set-ADDomainMode –identity rebeladmin.net -DomainMode Windows2016Domain** to upgrade domain functional level to windows server 2016.  In here **rebeladmin.net** is the domain name. 

[![updc31](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc31.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc31.png)

 

4. Then type **Set-ADForestMode -Identity rebeladmin.net -ForestMode Windows2016Forest** to upgrade forest functional level.

[![updc32](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc32.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc32.png)

 

5. Once done you can run **Get-ADDomain | fl Name,DomainMode** and **Get-ADForest | fl Name,ForestMode** to confirm new domain and functional level 

[![updc33](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc33.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc33.png)

 

### Uninstall AD role from windows server 2012 R2

 

Now we moved FSMO roles but we still running system on windows 2012 R2 domain and forest functional levels. In order to upgrade it, first  we need to decommission AD roles from existing windows server 2012 R2  servers. 

1. Log in to windows 2012 R2 domain server as enterprise administrator

2. Open the PowerShell as administrator

3. Then type **Uninstall-ADDSDomainController -DemoteOperationMasterRole -RemoveApplicationPartition** and press enter. It will ask for **local administrator** password. provide new password for local administrator and press enter.

[![updc28](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc28.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc28.png)

[![updc29](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc29.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc29.png)

[![updc30](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc30.png)](https://www.rebeladmin.com/wp-content/uploads/2016/10/updc30.png)

 

4. Once its completed it will restart the server.





## Install Print Services Role in Windows Server

First of all, we need to install Print and document services role on Windows server 2016. Consequently you can use Windows server print services.

### Role Installation

**1.** Open Server Manger and click on **Add roles and features** to install Print and document services role.

[![Add roles and features](https://www.tactig.com/wp-content/uploads/2016/10/img1-min-1.png)](https://www.tactig.com/wp-content/uploads/2016/10/img1-min-1.png)Add roles and features

**2.** In the Welcome we’ve got nothing to do at all. Click on **Next** button. In **Select destination server** page, elect the Select a server from the server pool. Select the server you want to install the role on from the list below. Click on **Next** button.

[![Select a server from server pool](https://www.tactig.com/wp-content/uploads/2016/10/img2-min-1.png)](https://www.tactig.com/wp-content/uploads/2016/10/img2-min-1.png)Select a server from server pool

**3.** Put a check mark in the box next to Print and document services. A small windows pops up and wants you to add some features for print services management. Click on Add features to install management tools. If you don’t install the management features, you just install the core service.

[![Print and document services](https://www.tactig.com/wp-content/uploads/2016/10/img3-min-1.png)](https://www.tactig.com/wp-content/uploads/2016/10/img3-min-1.png)Print and document services

**4.** In the **Print and Document Services** page, provided essential information about the services to be noted. Finally click on **Next** button.

[![Print and Document Services](https://www.tactig.com/wp-content/uploads/2016/10/Print-and-Document-Services-1.png)](https://www.tactig.com/wp-content/uploads/2016/10/Print-and-Document-Services-1.png)Print and Document Services

**5.** In the **Select role services** page four options are visible:

 **1. Print Server:** It is the actual print server. Selecting this option you can manage print services components as printers and drivers and furthermore things.

**2. Distributed Scan Server:** allows you to send scanned images to specific users or   groups in the domain.

**3. Internet Printing:** It creates a web page and gives the access to printer clients using printers through IIS web server.

**4. LPD Service:** This option enables UNIX clients running line printer remote (LPR) to send print   jobs to Windows printers. I install only Print Server.

[![Select Role Services](https://www.tactig.com/wp-content/uploads/2016/10/Select-Role-Services.png)](https://www.tactig.com/wp-content/uploads/2016/10/Select-Role-Services.png)Select Role Services

**6.** We’re almost done. Click on **Install** button for installing the role on server. No reboot is needed.

[![Confirm installation selections](https://www.tactig.com/wp-content/uploads/2016/10/Confirm-installation-selections-1.png)](https://www.tactig.com/wp-content/uploads/2016/10/Confirm-installation-selections-1.png)Confirm installation selections

## Configure Print Services in Windows Server

First of all we need to add some printers and drivers on the server and manage them.

Open Server Manager, click on **Tools** dropdown menu and select **Print Management** services. Using this tool we can add and manage print services easily.

[![Server Manager](https://www.tactig.com/wp-content/uploads/2016/10/img1-min-2.png)](https://www.tactig.com/wp-content/uploads/2016/10/img1-min-2.png)Server Manager

While Print Management tool is opened. Expand **Custom Filters** on the left pane to see the custom filters. You see four default filters:

1. **All Printers:** It shows the list of all printer connected to the domain from all print servers.
2. **All Drivers:** You can see a complete list of all drivers available for your clients through all the domain.
3. **Printers Not Ready:** It shows you list the servers which are not available to clients. They don’t work, fix them.
4. **Printers With Jobs:** Shows the list of printers currently doing print jobs.

Below Custom Filters another option is visible by the name **Print Servers**. Expand it to see all the print server in your domain. You can add all print servers in the domain here for easy management. Just right-click on Print Servers and select **Add Server** and go on.

[![Print Management Window](https://www.tactig.com/wp-content/uploads/2016/10/img3-min-2.png)](https://www.tactig.com/wp-content/uploads/2016/10/img3-min-2.png)Print Management Window

You can see the same options like drivers and printer below the SVR-A server as the below Custom Filters. So the difference between this and the Custom Filter is that which the printers shown below the filter is the list of all printers in the domain. The printers below the Print Servers is the list of printers installed on each print server.

### Add Printer

**1.** Print Management tool opened, expand **Print Servers** and right-click on the server and select **Add Printer** option.

[![Add Printer](https://www.tactig.com/wp-content/uploads/2016/10/img4-min.png)](https://www.tactig.com/wp-content/uploads/2016/10/img4-min.png)Add Printer

**2.** In the Welcome page we’ve nothing to do so just click on **Next** button. In the **Printer Installation** page select the **Add a new printer using an existing port**. Elect a port and hit **Next** button.

[![Add new printer using this port](https://www.tactig.com/wp-content/uploads/2016/10/img5-min-1.png)](https://www.tactig.com/wp-content/uploads/2016/10/img5-min-1.png)Add new printer using this port

**3.** In the **Printer Driver** page select **Use an existing printer driver on the computer** option. From the drop-down list select a driver that matches your printer device manufacturer and model.

[![Use an existing printer driver](https://www.tactig.com/wp-content/uploads/2016/10/img7-min-1.png)](https://www.tactig.com/wp-content/uploads/2016/10/img7-min-1.png)Use an existing printer driver

**4.** Now you need to type a name for the printer in the box shown in the picture below. Below the Printer Name you can also see another option: Share this printer. As a result you can choose a share name and location for the printer. If needed you can leave a comment for users guidance.

[![Printer Share Name and location](https://www.tactig.com/wp-content/uploads/2016/10/img8-min-1.png)](https://www.tactig.com/wp-content/uploads/2016/10/img8-min-1.png)Printer Share Name and location

**5.** Finally we are done with adding printer on a server. Just click on **Finish** button to finish the wizard. While finished the wizard you can find the printer in **All Printers** option in the left pane. If you would like to print a test page selecting **Print a test page** at the bottom of the wizard also you can add another printer by selecting **Add another printer**.

[![Finish the wizard](https://www.tactig.com/wp-content/uploads/2016/10/img9-min-1.png)](https://www.tactig.com/wp-content/uploads/2016/10/img9-min-1.png)Finish the wizard

### Add Driver

Maybe you need different kinds of drivers for client computers to use be able to use print device. So you need to have 32-bit and 64-bit drivers.

**1.** First of all you need to right-click on **Drivers** option below the server which you want to add driver to. Select the **Add driver** option.

[![Add Driver](https://www.tactig.com/wp-content/uploads/2016/10/img10-min-1.png)](https://www.tactig.com/wp-content/uploads/2016/10/img10-min-1.png)Add Driver

**2.** In the Welcome page we have nothing to do. In the **Processor Selection** page you need to specify which kind of processors do your clients use. You can one or both of the options and hit **Next**.

[![Processor selection](https://www.tactig.com/wp-content/uploads/2016/10/Processor-selection.png)](https://www.tactig.com/wp-content/uploads/2016/10/Processor-selection.png)Processor selection

**3.** In the **Printer Driver Selection** page you need to specify two things. First of all you should specify your devices’s manufacturer. Secondly specify the printer model. In addition to these you have one more useful option. If you have driver on a disk, you can click on **Have Disk** button and find path of the source and add it.

[![Printer Driver Selection](https://www.tactig.com/wp-content/uploads/2016/10/Printer-Driver-Selection.png)](https://www.tactig.com/wp-content/uploads/2016/10/Printer-Driver-Selection.png)Printer Driver Selection

**4.** We are done and the driver was added to the server. So click on **Finish** button due to finish the wizard.

[![Finish the Wizard](https://www.tactig.com/wp-content/uploads/2016/10/Finish-the-Wizard.png)](https://www.tactig.com/wp-content/uploads/2016/10/Finish-the-Wizard.png)Finish the Wizard



- Is your network cable plugged in? (physical)
- Is there a link light on the Ethernet switch and Ethernet NIC? (data-link)
- Do you have an IP address? (network)
- Can you ping your default gateway? (network, testing LAN IP connectivity)

- Do you have DNS server information?
- Can you ping your DNS server? (network, testing IP connectivity)
- Do you have a firewall configured? (network on up to application)
- Can you ping the host you are trying to get to by name? (application, DNS and network WAN IP connectivity)
- What format is the graphic in? Do you have a viewer for that format? (presentation)
- Can your web browser open up another website? (basic application troubleshooting)
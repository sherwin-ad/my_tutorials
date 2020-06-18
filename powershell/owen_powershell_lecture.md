# Powershell

## Table of Contents
* [Finding and discovering commands](#Finding-an-discovering-commands)
* [Docker Advantages](#docker-advantages)


## Kubernetes Meaning

* Kubernetes is an open-source system for automating deployment, scaling, and management of containerized applications.

## Kubernetes Architecture
![Kubernetes Architecture](kubernetes_diagram.svg)
![Kubernetes Architecture1](kubernetes_architecture.png)

### Node
* The node serves as a worker machine in a K8s cluster
* Node can be physical computer or a virtual machine

#### Run powershell container

```
$ docker run --name "owen-ps" -it --volume PSScripts:/scripts mcr.microsoft.com/powershell:latest
```

### Essential PowerShell Commands


#### Get-Commands
```
Get-Command
  
Get-Command -CommandType Cmdlet

Get-Command -Module ActiveDirectory
    
Get-Command -ListImported -CommandType Cmdlet

Get-Command -Verb Get
    
Get-Command -Noun Item
```

#### Get-Help
```
Get-Help -Name Get-Process
```

#### Set-ExecutionPolicy
```
PS C:\> Set-ExecutionPolicy

```

When setting the execution policy, you have four options to choose from:

    Restricted – The default execution policy that stops scripts from running.
    All Signed – Will run scripts if they are signed by a trusted publisher
    Remote Signed – Allows scripts to run which have been created locally
    Unrestricted – A policy with no restrictions on running scripts

#### Get-ExecutionPolicy
```
PS C:\> Get-ExecutionPolicy
Restricted
```

#### Service
Get-Service
New-Service
Restart-Service
Resume-Service
Set-Service
Start-Service
Stop-Service
Suspend-Service

Get-Service, you would be shown a list of all services on your computer, their statuses, and display names.

```
# List all services
Get-Service

# List all running services
Get-Service | Where-Object {$_.Status -eq “Running”}

# to retrieve all services that begin with WMI
Get-Service WMI*
```

#### ConvertTo-HTML
```
# This will then generate an HTML file in table form
Get-PSDrive | ConvertTo-Html > c:\psdrive.html
```

#### Export-CSV
This command is primarily used to create spreadsheets
```
Get-Service | Export-CSV c:\service.csv
Get-Service | Select-Object Name, Status | Export-CSV c:\Service.csv
```

#### Process
Debug-Process
Get-Process
Start-Process
Stop-Process
Wait-Process
```
# List all active processes
Get-Process

# Displays all available properties
Get-Process explorer | Format-List *

# To pick a specific process
PS C:\Windows\system32> Get-Process explorer

Handles  NPM(K)    PM(K)      WS(K) VM(M)   CPU(s)     Id  SI ProcessName

-------  ------    -----      ----- -----   ------     --  -- -----------
   1707      74    24912      62348 ...66     7.78   2972   2 explorer

# To pick a specific process
PS C:\Windows\system32> Get-Process explorer | Format-List


Id      : 2972
Handles : 1707
CPU     : 7.78125
SI      : 2
Name    : explorer

# Stop process
Stop-Process -Name “notepad”
Stop-Process 3171

```

#### Get-EventLog
To access your computer’s event logs

Parameters you can use to search event logs include:

    After – User specifies a date and time and the cmdlet will locate events that occurred after
    AsBaseObject – Provides a System.Diagnostics.EventLogEntry for each event
    AsString – Returns the output as strings
    Before – User specifies a date and time and the cmdlet will locate events that occurred before
    ComputerName – Used to refer to a remote computer
    EntryType – Specifies the entry type of events (Error, Failure Audit, Success Audit, Information, Warning)
    Index – Specifies index values the cmdlet finds events from
    List – Provides a list of event logs
    UserName – Specifies usernames associated with a given event

```
PS C:\Windows\system32> Get-EventLog  -List

  Max(K) Retain OverflowAction        Entries Log
  ------ ------ --------------        ------- ---
  20,480      0 OverwriteAsNeeded         752 Application
  20,480      0 OverwriteAsNeeded           0 HardwareEvents
     512      7 OverwriteOlder              0 Internet Explorer
  20,480      0 OverwriteAsNeeded           0 Key Management Service
  20,480      0 OverwriteAsNeeded      10,445 Security
  20,480      0 OverwriteAsNeeded         715 System
  15,360      0 OverwriteAsNeeded          25 Windows PowerShell

# If you want to see error events in your log, simply type:
Get-EventLog -LogName System -EntryType Error

# If you want to get event logs from multiple computers, specify which devices you want to view
Get-EventLog - LogName “Windows PowerShell” -ComputerName “local computer”, “Server1”, “Server2”
```


### Listing folder and files

 ```
Get-ChildItem -Path C:\Windows\

# List Directories
Get-ChildItem -Path C:\Windows\ -Directory

# List Files
Get-ChildItem -Path C:\Windows\ -File
 ```

#### Windows Update CmdLet in powershell
```
PS C:\Windows\system32> Get-Command -Module PSWindowsUpdate

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           Get-WindowsUpdate                                  1.5.2.6    PSWindowsUpdate
Alias           Hide-WindowsUpdate                                 1.5.2.6    PSWindowsUpdate
Alias           Install-WindowsUpdate                              1.5.2.6    PSWindowsUpdate
Alias           Uninstall-WindowsUpdate                            1.5.2.6    PSWindowsUpdate
Function        Add-WUOfflineSync                                  1.5.2.6    PSWindowsUpdate
Function        Add-WUServiceManager                               1.5.2.6    PSWindowsUpdate
Function        Get-WUHistory                                      1.5.2.6    PSWindowsUpdate
Function        Get-WUInstall                                      1.5.2.6    PSWindowsUpdate
Function        Get-WUInstallerStatus                              1.5.2.6    PSWindowsUpdate
Function        Get-WUList                                         1.5.2.6    PSWindowsUpdate
Function        Get-WURebootStatus                                 1.5.2.6    PSWindowsUpdate
Function        Get-WUServiceManager                               1.5.2.6    PSWindowsUpdate
Function        Get-WUUninstall                                    1.5.2.6    PSWindowsUpdate
Function        Hide-WUUpdate                                      1.5.2.6    PSWindowsUpdate
Function        Invoke-WUInstall                                   1.5.2.6    PSWindowsUpdate
Function        Remove-WUOfflineSync                               1.5.2.6    PSWindowsUpdate
Function        Remove-WUServiceManager                            1.5.2.6    PSWindowsUpdate
```

Let’s describe the usage of the module commands in brief:

* Clear-WUJob – use the Get-WUJob to call the WUJob in Task Scheduler;
* Download-WindowsUpdate (alias for Get-WindowsUpdate –Download) — get a list of updates and download them;
* Get-WUInstall, Install-WindowsUpdate (alias for Get-WindowsUpdate –Install) – install updates;
* Hide-WindowsUpdate (alias for Get-WindowsUpdate -Hide:$false) – hide update;
* Uninstall-WindowsUpdate – remove update using Remove-WindowsUpdate;
* Add-WUServiceManager – register the update server (Windows Update Service Manager) on the computer;
* Enable-WURemoting — enable Windows firewall rules to allow remote use of the PSWindowsUpdate cmdlets;
* Get-WindowsUpdate (Get-WUList) — displays a list of updates that match the specified criteria, allows you to find and install the updates. This is the main cmdlet of the PSWindowsUpdate module. Allows to download and install updates from a WSUS server or Microsoft Update. Allows you to select update categories, specific updates and set the rules of a computer restart when installing the updates;
* Get-WUApiVersion – get the Windows Update Agent version on the computer;
* Get-WUHistory – display a list of installed updates (update history);
* Get-WUInstallerStatus — check the Windows Installer service status;
* Get-WUJob – run WUJob update tasks in the Task Scheduler;
* Get-WULastResults — dates of the last search and installation of updates (LastSearchSuccessDate and LastInstallationSuccessDate);
* Get-WURebootStatus — allows you to check whether a reboot is needed to apply a specific update;
* Get-WUServiceManager – list update sources;
* Get-WUSettings – get Windows Update client settings;
* Invoke-WUJob – remotely call WUJobs jobs in the Task Scheduler to immediately execute PSWindowsUpdate commands;
* Remove-WindowsUpdate – allows to uninstall an update by KB ID;
* Remove-WUServiceManager – disable Windows Update Service Manager;
* Set-PSWUSettings – save PSWindowsUpdate module settings to the XML file;
* Set-WUSettings – configure Windows Update client settings;
* Update-WUModule – update the PSWindowsUpdate module version (you can update the module on a remote computer by copying it from the current one, or updating from PSGallery).

```
# List the updates available for this computer

Get-WUList
ComputerName Status KB          Size Title
------------ ------ --          ---- -----
DESKTOP-K... D----- KB3012973   3 GB Feature update to Windows 10, version 1903
DESKTOP-K... ------ KB2267602 562 MB Security Intelligence Update for Windows Defender Antivirus

# To check the list of available updates on a remote computer, run this command:
Get-WUList –ComputerName server2

# You can check where your Windows should get updates from. Run the following command:
Get-WUServiceManager
PS C:\Windows\system32> Get-WUServiceManager

ServiceID                            IsManaged IsDefault Name
---------                            --------- --------- ----
117cab2d-82b1-4b5a-a08c-4d62dbee7782 False     False     Windows Store
855e8a7c-ecb4-4ca3-b045-1dfa50104289 False     False     Windows Store (DCat Prod)
9482f4b4-e343-43b6-b170-9a65bc822c77 False     True      Windows Update

# Get the list of updates installed on a computer
PS C:\Windows\system32> Get-WUHistory

ComputerName Date                KB        Title
------------ ----                --        -----
DESKTOP-K... 14/04/2020 6:12:... KB3172729 Security Update for Windows 10 Version 1511 for x64-based Systems (KB3172...
DESKTOP-K... 14/04/2020 6:12:... KB3150513 Update for Windows 10 Version 1511 for x64-based Systems (KB3150513)
DESKTOP-K... 14/04/2020 6:11:... KB2267602 Security Intelligence Update for Windows Defender Antivirus - KB2267602 (...
DESKTOP-K... 14/04/2020 3:54:... KB2267602 Security Intelligence Update for Windows Defender Antivirus - KB2267602 (...
Windows 10 Version 1511 for x64-based Syste...

# Remove-WindowsUpdate: Uninstalling Windows Updates
Remove-WindowsUpdate -KBArticleID KB4489873 -NoRestart

# Hide-WindowsUpdate: How to Hide Windows Updates with PowerShell
$HideList = "KB4489873", "KB4489243"
Get-WindowsUpdate -KBArticleID $HideList –Hide

# This is how you can display the list of updates hidden on this computer:
Get-WindowsUpdate –IsHidden

# To remove an update from hidden ones, run this command:
Get-WindowsUpdate -KBArticleID $HideList -WithHidden -Hide:$false
or:
Show-WindowsUpdate -KBArticleID $HideList

# To automatically download and install all available updates for your computer, run the command:
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot

# The AcceptAll key accepts installation of all update packages, and AutoReboot allows Windows to automatically restart after the updates are installed.

You can save the update installation history to the log file (you can use it instead of WindowsUpdate.log file).

Install-WindowsUpdate -AcceptAll -Install -AutoReboot | Out-File "c:\logs\$(get-date -f yyyy-MM-dd)-WindowsUpdate.log" -force

# You can install only the specific update packages by KB number:
Get-WindowsUpdate -KBArticleID KB2267602, KB4533002 -Install
```
## Virtual Machine Scale Set

**Image creation**

In our case, we have to generalise (sysprep) the Windows before the VM image is captured, so the instances created based on this image will be provisioned properly.

https://learn.microsoft.com/en-gb/azure/virtual-machines/generalize#windows

1. Remove the whole directory '**C:\Windows\Panther**'

2. Check in registry the value of '**Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cdrom\start**' is set to 1

3. Bring up a cmd prompt with administrator privileges and execute 

   ```
   sysprep.exe /oobe /generalize /shutdown
   ```

4. After the VM is shutdown, open the cloudshell and execute the command below to mark VM as generalized.

   ```
   Set-AzVm -ResourceGroupName $rgName -Name $vmName -Generalized
   ```

5. Then, we shall capture VM as an image. Please be aware, it has to be captured as a ***generalised image\***.

 

**VMSS part**

1. After the image was captured and stored into Azure Compute Gallery, we proceeded with VMSS creation and configuration.
2. Custom scaling rule was configured to increase the instance count by 1 when the average CPU usage goes over 70% for 10 minutes and to decrease the instance count by 1 when the average CPU usage goes below 25% for 10 minutes.
3. The VMSS will have at maximum 5 instances and 2 instances at minimum.
4. We executed cmd script to bring CPU on fly which goes over 80% on average. VMSS auto scaled out new instances without issues.
5. We also configured auto repair rules with HTTP probe at port 80. VMSS will automatically remove any instance which has no responses from port 80 after 10 minutes and create new instance to meet the minimum requirements.

 

**Timezone issue after sysprep**

We have a few options to solve this, e.g. use an unattended xml file to configure sysprep, or use CSE to alter the timezone after the instance is created and etc. We went with the '**Custom Script Extension**' option as the quickest solution.

1. We created a .ps1 file with the content below and uploaded to a container of your storage account.

   ```
   tzutil /s "Singapore Standard Time"
   ```

2. Then we installed 'Custom Script Extension' on VMSS and chosen this file from the storage account.
3. After we upgraded the instances to the latest model, the timezone was corrected without hassles.

 
---
lab:
    title: 'Lab: Azure resource management with PowerShell'
    module: 'Module 9: Managing Azure resources with PowerShell'
---

<!--
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    HINT
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    ANSWER
    ```
    </Strong></details> 
-->

###### _

# Lab: Azure resource management with PowerShell

## Scenario

You're a system administrator for the London branch office of Adatum Corporation. You need to evaluate the Microsoft Azure platform to run virtual machines (VMs) and other resources for your company. As part of your evaluation, you also want to test PowerShell administration of Azure-based resources.

# Objectives

After completing this lab, you'll be able to:

- Install the Az module for Windows PowerShell.
- Run and use the Azure Cloud Shell environment.
- Manage Azure VMs and disks by using PowerShell.

## Estimated time: 60 minutes

## Lab setup

Virtual machines: **LON-DC1** and **LON-CL1**

Username: **Adatum\\Administrator**

Password: **Pa55w.rd**

For this lab, you'll use the available virtual machine environment. Before you begin the lab, complete the following steps:

1. Open **LON-DC1** and sign in as **Adatum\\Administrator** with the password **Pa55w.rd**.
1. Repeat step 1 for **LON-CL1**.

## Exercise 1: Signing into the Azure cloud slicing subscription 
## Exercise 2: Installing the PowerShell Az module

### Scenario 1

The main tasks for this exercise are:

1. Sign in to the Azure portal.
1. Install the Azure Az module for PowerShell. 

### Task 1: Sign into Azure portal and activate the cloud slicing subscription

1. On **LON-CL1**, open Microsoft Edge browser.
3. In the address bar type the following:

    ``` 
    https://portal.azure.com
    ```
    
3. Use the Username and Password in the Resources tab of the lab instructions
   - The username will be very long and be similar format to: User1-21764458@LODSPRODMCA.onmicrosoft.com
4. In the Azure portal choose "Maybe Later" on the Guided tour dialog box
5. In the search bar at the top of the portal type "Subscriptions"
6. Choose Subscriptions from the drop down menu
7. Check to see if the MOC Subscription has been activated yet (This subscription takes some time to be created and activated)

 > Do not wait for this to appear, continue on with the rest of the lab and the subscription will appear later.


### Task 2: Install the Azure Az module for PowerShell

1. On **LON-CL1**, start the PowerShell 7.1 environment.
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    # this is powershell 7 not Windows PowerShell
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    pwsh.exe
    ```
    </Strong></details> 
3. Check your version of PowerShell by using `$PSVersionTable.PSVersion`.
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    $PSVersionTable
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    $PSVersionTable.PSVersion
    ```
    </Strong></details> 
5. Set the execution policy to **RemoteSigned** for the current user.
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Get-Help Set-ExecutionPolicy -ShowWindow
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
    ```
    </Strong></details> 
7. From the PowerShell Gallery, install the Az module for the current user by using the **Install-Module** command.
    > This will take some time to install, wait until the installation of all of the AZ modules have fininshed
   
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Get-Help Install-Module -ShowWindow
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    Install-Module AZ -Verbose -Force
    ```
    </Strong></details> 
9. Use **Connect-AzAccount** to sign in to your Azure subscription.
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Get-Help Connect-AzAccount -ShowWindow
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    # When you run this command it will show website asking you to sign in
    # Sign in with your Username you found in the Resourses tab of the lab instructions
    Connect-AzAccount
    ```
    </Strong></details> 

## Exercise 2: Using Azure Cloud Shell

### Scenario 2

To work with other Azure resources such as Azure VMs, you need to create an Azure resource group. You decide to use Azure Cloud Shell to perform this task.

The main task for this exercise is:

- Use Azure Cloud Shell to create a resource group.

### Task 1: Use Azure Cloud Shell to create a resource group

1. Check your Azure tenant in the Azure portal to ensure that no Azure VMs or storage accounts exist.
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Get-Co
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    ANSWER
    ```
    </Strong></details> 
3. Start the Azure Cloud Shell environment.
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    HINT
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    ANSWER
    ```
    </Strong></details> 
5. Check your subscription by using the **Get-AzSubscription** command.
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    HINT
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    ANSWER
    ```
    </Strong></details> 
7. Use the **Get-AzResourceGroup** command to verify that no resource groups exist.
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    HINT
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    ANSWER
    ```
    </Strong></details> 
9. Switch to the **Bash** environment in Azure Cloud Shell and then use **az account list** and **az resource list** to check subscriptions and resource groups. Switch back to the PowerShell environment in Azure Cloud Shell.
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    HINT
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    ANSWER
    ```
    </Strong></details> 
11. Use the **New-AzResourceGroup** command to create a new resource group in the West Europe region. Name the resource group Mod9Lab.
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    HINT
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    ANSWER
    ```
    </Strong></details> 
## Exercise 3: Managing Azure resources with Azure PowerShell

After you create the Azure subscription and resource group, you want to use PowerShell to create an Azure VM based on a Windows Server 2016 image.

The main tasks for this exercise are as follows:

1. Create an Azure VM by using PowerShell.
1. Add a disk to Azure VM by using PowerShell.

### Task 1: Create an Azure VM by using PowerShell

1. In the PowerShell 7.1 window, use the **Get-Credential** command to store admin credentials for the new Azure VM in the `$cred` variable. Do not use name Admin for administrator.
1. In the PowerShell 7.1 window, use the following command to define the VM parameters:

   ```powershell
   $vmParams = @{
     ResourceGroupName = 'Mod9Lab'
     Name = 'TestVM1'
     Location = 'westeurope'
     ImageName = 'Win2016Datacenter'
     PublicIpAddressName = 'TestPublicIp'
     Credential = $cred
     OpenPorts = 3389
   }
   ```

1. Use the **New-AzVM** command to create a new VM with the parameters defined in the previous step. Store this in the `$NewVM1` variable.
   ```powershell
   $NewVM1 = New-AzVM @VmParams
   ```
1. To check the parameters on the new VM, enter the following commands, and then select Enter:

   ```powershell
   $NewVM1
   $newVM1.OSProfile | Select-Object ComputerName,AdminUserName
   $newVM1 | Get-AzNetworkInterface | Select-Object -ExpandProperty IpConfigurations | Select-Object Name,PrivateIpAddress
   ```

1. To find the public IP address on the Azure VM you created so you can connect to it, enter the following commands, and then select Enter:

   ```powershell
   $publicIp = Get-AzPublicIpAddress -Name TestPublicIp -ResourceGroupName Mod9Lab
   
   $publicIp | Select-Object Name,IpAddress,@{label='FQDN';expression={$_.DnsSettings.Fqdn}}
   ```

1. Note the value of IPAddress in the table output.
1. Use the **mstsc.exe** tool to connect to the Azure VM you created. Sign in with the credentials that you defined in the first step.

### Task 2: Add a disk to the Azure VM by using PowerShell

1. Use the Azure portal to navigate to the properties for **TestVM1**.
1. Ensure that **TestVM1** has only operating system disk installed.
1. Create a data disk for the existing VM by using the following commands and selecting Enter after each:

   ```powershell
   $VirtualMachine = Get-AzVM -ResourceGroupName "Mod9Lab" -Name "TestVM1"
   Add-AzVMDataDisk -VM $VirtualMachine -Name "disk1" -LUN 0 -Caching ReadOnly -DiskSizeinGB 1 -CreateOption Empty
   Update-AzVM -ResourceGroupName "Mod9Lab" -VM $VirtualMachine
   ```

1. Switch to the Azure portal and refresh the **Disks** page. Ensure that there's a new disk called **disk1** in the **Data disks** section.

[Go to next lab](AZ-040-Lab-10.md#_)

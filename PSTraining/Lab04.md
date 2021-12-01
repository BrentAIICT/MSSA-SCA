---
lab:
    title: 'Lab: Using PSProviders and PSDrives with PowerShell'
    module: 'Module 4: Using PSProviders and PSDrives'
---

<!-- <details><summary>Click to see the answer</summary><Strong> REPLACEME </Strong></details> -->

# Lab: Using PSProviders and PSDrives with PowerShell

## Scenario

You're a system administrator for the London branch office of Adatum Corporation. You must reconfigure several settings in your environment. You've recently learned about PSProviders and PSDrives, and that you can use them to access data stores. You've decided to use PSDrives to reconfigure these settings.

## Objectives

After completing this lab, you'll be able to:

- Use a PSDrive to create files and folders.
- Create registry keys and values.
- Use a PSDrive to create and view Active Directory objects.

## Estimated time: 30 minutes

## Lab Setup

Virtual machines:

- **LON-DC1**
- **LON-SVR1**
- **LON-CL1**

Username: **Adatum\\Administrator**

Password: **Pa55w.rd**

For this lab, you'll use the available virtual machine environment. Before you begin the lab, complete the following steps:

1. Open **LON-DC1**, and then sign in as **Adatum\\Administrator** with the password **Pa55w.rd**.
1. Repeat step 1 for **LON-SVR1**, and **LON-CL1**.

## Exercise 1: Creating files and folders on a remote computer

### Exercise scenario 1

You need to make sure that you can create folders and files on a remote computer so that you're able to copy automation scripts to the computer in the future. You've decided not to use the **MkDir** command or any of its aliases so you can be sure that you're using the cmdlets associated with PSProviders and PSDrives.

The main tasks for this exercise are as follows:

1. Create a new folder on a remote computer.
1. Create a new PSDrive mapping to the remote file folder.
1. Create a file on the mapped drive.

### Task 1: Create a new folder on a remote computer

1. On **LON-CL1**, open Windows PowerShell as an administrator.
1. Review the complete help for the **New-Item** cmdlet. Notice the *–Name* and *–ItemType* parameters, and then review the example commands. <details><summary>Click to see the answer</summary><Strong> Get-Help New-Item -ShowWindow </Strong></details>
1. Use **New-Item** to create a new folder (directory) named **ScriptShare** on **\\\LON-SVR1\C$**.<details><summary>Click to see the answer</summary><Strong> New-Item -Path \\Lon-Svr1\C$\ -Name ScriptShare -ItemType Directory </Strong></details>

### Task 2: Create a new PSDrive mapping to the remote file folder

1. In the Windows PowerShell console, review the complete help for the **New-PSDrive** command.<details><summary>Click to see the answer</summary><Strong> Get-Help New-PSDrive -ShowWindow </Strong></details>
1. Create a new PSDrive named **ScriptShare**, which is mapped to **\\\LON-SVR1\C$\ScriptShare**.<details><summary>Click to see the answer</summary><Strong> New-PSDrive -Name ScriptShare -Root \\Lon-Svr1\c$\ScriptShare -PSProvider FileSystem </Strong></details>

### Task 3: Create a file on the mapped drive

1. In the Windows PowerShell console, review the complete help for the **Set-Location** cmdlet.<details><summary>Click to see the answer</summary><Strong> Get-Help Set-Location -ShowWindow </Strong></details>
1. Set the current working folder location to the mapped drive **ScriptShare**.<details><summary>Click to see the answer</summary><Strong> Set-Location ScriptShare: </Strong></details>
1. In the **ScriptShare** drive, use the **New-Item** cmdlet to create a text file named **script.txt**.<details><summary>Click to see the answer</summary><Strong> New-Item script.txt </Strong></details>
1. List the items in the **ScriptShare** drive and confirm that it contains the **script.txt** file.<details><summary>Click to see the answer</summary><Strong> Get-ChildItem </Strong></details>

## Exercise 2: Creating a registry key for your future scripts

### Scenario 2

In this exercise, you will create a new registry key to store configuration data for scripts that you'll develop in the future. You'll also create a registry value in that key where you'll store the name of the PSDrive for the scripts to use. You want to verify that you can retrieve the value from the registry in scripts that you'll create later.

The main tasks for this exercise are as follows:

1. Create the registry key to store script configurations.
1. Create a new registry value to store the name of the PSDrive.

### Task 1: Create the registry key to store script configurations

1. In the **Windows PowerShell** console, enter a command to verify that the registry key **HKEY_CURRENT_USER\Software** does not have a subkey named **Scripts**.<details><summary>Click to see the answer</summary><Strong> Get-ChildItem -Path HKCU:\Software </Strong></details>
1. In the console, run a command to create a registry key named **Scripts** in **HKEY_CURRENT_USER\Software**.<details><summary>Click to see the answer</summary><Strong> New-Item -Path HKCU:\Software -Name Scripts </Strong></details>

### Task 2: Create a new registry setting to store the name of the PSDrive

1. In the **Windows PowerShell** console, run a command to set the current working location to the path of the registry key that you created.<details><summary>Click to see the answer</summary><Strong> Set-Location HKCU:\Software\Scripts </Strong></details>
1. Create a registry value to store the PSDrive name with the following configuration:

   - Name: **PSDriveName**
   - Value: **ScriptShare**
<details><summary>Click to see the answer</summary><Strong> New-ItemProperty -Path HKCU:\Software\Scripts -Name "PSDriveName" -Value "ScriptShare" </Strong></details>

1. Verify that you can retrieve the **PSDriveName** setting from the **HKey_Current_User\Software\Scripts** key.<details><summary>Click to see the answer</summary><Strong> Get-ItemProperty . -Name PSDriveName </Strong></details>

## Exercise 3: Creating a new Active Directory group

You want the ability to manage all AD DS object types through a PSDrive that's mapped to the User organizational unit in Active Directory. This PSDrive will use the ActiveDirectory provider. Once the new PSDrive is mapped, you want to create a new London Developers group that you can use to assign permissions to the developers in the London office.

The main tasks for this exercise are as follows:

1. Create a PSDrive that maps to the Users container in AD DS.
1. Create the London Developers group.

### Task 1: Create a PSDrive that maps to the Users container in AD DS

1. In the **Windows PowerShell** console, load the **ActiveDirectory** module.<details><summary>Click to see the answer</summary><Strong> Import-Module ActiveDirectory </Strong></details>
1. Use the **New-PSDrive** cmdlet to create a new PSDrive with the following settings:

   - Name: **AdatumUsers**
   - Root: **CN=Users,DC=Adatum,DC=com**
   - PSProvider: **ActiveDirectory**
<details><summary>Click to see the answer</summary><Strong> New-PSDrive -Name AdatumUsers -Root "CN=Users,DC=Adatum,DC=com" -PSProvider ActiveDirectory </Strong></details>
1. Set the current working location to the new PSDrive.<details><summary>Click to see the answer</summary><Strong> Set-Location AdatumUsers: </Strong></details>

### Task 2: Create the London Developers group

1. In the **Windows PowerShell** console, use the **New-Item** cmdlet to create a group named **London Developers** in the **AdatumUsers** PSDrive.<details><summary>Click to see the answer</summary><Strong> New-Item -ItemType group -Path . -Name "CN=London Developers" </Strong></details>
1. Use the **Get-ChildItem** cmdlet to verify that the new group was created.<details><summary>Click to see the answer</summary><Strong> Get-ChildItem </Strong></details>

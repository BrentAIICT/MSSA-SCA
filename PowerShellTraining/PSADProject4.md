
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

# Disable AD users   

  > Run this script to make the list of user to be disabled 
 
## Complete the following before starting this project


  ```PowerShell
  $SalesUsers = Get-ADUser -filter {Department -eq 'Sales'} -Properties Department
  $ADDisabledOU = if (-not (Test-Path 'AD:\OU=DisabledUsers,DC=Adatum,DC=com')) {New-ADOrganizationalUnit   -Path 'DC=adatum,DC=com' -Name DisabledUsers} 
  $UsersToDisable = $SalesUsers | Get-Random -Count 5
  $UsersToDisable | 
     Select-Object -Property Name, Department | 
     ConvertTo-Csv -NoTypeInformation |
     Out-File e:\DisableList.csv -Force
  
  ```

<br>

---

<br>

# Use following brief to complete this project via PowerShell

- Create a PowerShell function within **PowerShell ISE** or **VSCode**
  - Include Comment Based Help
  - Use the E:\DisableList.csv to find and diable the users in the list
  - When disabling the users do all of the following:
    - Modify the Users "Info" attribute to include the original DN of the user
      - "CN=Brian Ferry,OU=Sales,DC=Adatum,DC=com was the original DN"  
    - Disable the Account
    - Change the password to a random password with 1 number, 7 lowercase, 3 uppercase characters
    - Move the diabled account to the OU called "DisabledUsers"

## What must the PowerShell function achieve

- Disable and move users that are to be disabled so they cannot be accidently accessed[...](PSADProjectSolutions.md#solutions-for-the-ps-projects)

## HINTS
```
# Use your PowerShell skills to research what commands will be neded

```

## Test the results by doing the following, after running your function:
   
- Check in the Disabled Users OU for the users
- Try to login to one of the user accounts
- Enable that account
- Try again to login to that account using the default password "Pa55w.rd"

  > All login attempts should fail!
   
<!--


### This solution provides the basic answer

<details><summary>Click to see the answer</summary><Strong> 
    
```
function Find-AssociatedGroupMembership {
  Param ($SamAccountName)
  function Get-MemberOf {
    Param($ADObject)
    $Groups = Get-ADPrincipalGroupMembership -Identity $ADObject
    foreach ($Group in $Groups) {
      $Group | Select-Object -Property Name,GroupScope
      Get-MemberOf -ADObject $Group
    }
  }
  $ADAccount = Get-ADUser -Identity $SamAccountName
  Get-MemberOf -ADObject $ADAccount
} 
    
```
    

</Strong></details> 

<br>

### This solution provides a better answer

<details><summary>Click to see an advanced answer</summary><Strong> 
    
```
function Find-AssociatedGroupMembership {
  Param ($SamAccountName)
  function Get-MemberOf {
    Param($ADObject)
    $Level++
    $Groups = Get-ADPrincipalGroupMembership -Identity $ADObject
    foreach ($Group in $Groups) {
      [PSCustomObject][Ordered]@{
        ObjectInGroup = $ADObject.SamAccountName
        Group = $Group.SamAccountName
        GroupScope = $Group.GroupScope
        Level = $Level
      }
      Get-MemberOf -ADObject $Group
    }
  }
  $Level = 0
  [System.Collections.ArrayList]$GroupMemberships = @()
  $ADAccount = Get-ADUser -Identity $SamAccountName
  $GroupInfo = Get-MemberOf -ADObject $ADAccount
  return $GroupInfo | Sort-Object -Property Level,ObjectInGroup,Group
} 
    
```

</Strong></details> 
-->


## Links to the Projects

[Go to Project 1](PSADProject1.md#create-new-users-in-active-directory-from-a-csv-file)<br>
[Go to Project 2](PSADProject2.md#restore-an-accidently-deleted-ad-user-account-from-the-recycle-bin)<br>
[Go to Project 3](PSADProject3.md#find-all-direct-and-indirect-groups-an-ad-user-is-a-member-of)<br>
[Go to Project 4](PSADProject4.md#disable-ad-users)<br>

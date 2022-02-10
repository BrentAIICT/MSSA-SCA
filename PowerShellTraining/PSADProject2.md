
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

# Complete the following before starting this project

## Turn on the AD Recycle Bin
- Run this from LON-CL1
  ```
  Invoke-Command -ComputerName LON-DC1 -ScriptBlock {
    $RecycleBin = Get-ADOptionalFeature 'Recycle Bin Feature'
    if ($RecycleBin.EnabledScopes.Count -eq 0) {
      Enable-ADOptionalFeature 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target adatum.com -confirm:$false
    }
  }  
  ```
  
## Delete 10 random users
- Run this script to delete 10 random users from Active Directory
- Run this from LON-CL1
  ```
  Invoke-Command -ComputerName LON-DC1 -ScriptBlock {  
    Get-ADUser -Filter * -Properties Department | Where-Object {$_.Department -in @('Sales','Mareting','Managers')} | Get-Random -Count 10 | Remove-ADUser -Confirm:$false
  }  
  ```
- 10 Random users have now been deleted 
<br>
<br>

---

<br>

# Use following brief to complete this project via PowerShell

## Recover deleted user from Domain controller Recycle-Bin

- Write a function that does the following:
  - Lists all deleted object using Out-Gridview
  - Allows someone to choose which deleted user/s are to be restored
  - Restore the chosen user/s
  - Show the restored AD object on screen to prove restoration was successful 
  - Add this function to the previous module from Project 1

## HINTS (You will need these commands to complete your task)
```
# This command finds deleted objects
Get-ADObject -LDAPFilter:"(msDS-LastKnownRDN=*)" -IncludeDeletedObjects | Where-Object {$_.Deleted -eq $true}

# This command restores a deleted object 
Restore-ADObject 

# This command can help produce a menu of choices
Out-Gridview
```

<details><summary>Click to see the answer</summary><Strong> 
    
```
function Restore-DeletedADObject {
  # Find all of the deleted objects in AD  
  $DeletedObjects = Get-ADObject -LDAPFilter:"(msDS-LastKnownRDN=*)" -IncludeDeletedObjects | Where-Object {$_.Deleted -eq $true}
  $ADObjectsChosen = $DeletedObjects | Out-GridView -OutputMode Multiple  # Choose which objects to restore
  $ADObjectsChosen | Restore-ADObject -confirm:$false # This restores the chosen object
  # this finds the restored objects in AD  
  $RestoredObjects = Get-ADObject -Filter * | Where-Object {$_.ObjectGuid -in $ADObjectsChosen.ObjectGuid}  
  return $RestoredObjects   # Show the restored objects on the screen (this is the optional requirement)
}
    
```

</Strong></details> 

[Try the next Project](PSADProject3.md)

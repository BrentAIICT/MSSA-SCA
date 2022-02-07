## To Prepare for this Project run the following:

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
## Delete random users
- Run this script to delete some random users from Active Directory
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

# AD User Recovery Project
## Recover deleted user from Domain controller Recycle-Bin

- Write a function that does the following
  - Lists all deleted object using the Out-Gridview
  - Allows someone to choose which user to restore

## HINTS
```
# This command finds deleted objects
Get-ADObject -LDAPFilter:"(msDS-LastKnownRDN=*)" -IncludeDeletedObjects | Where-Object {$_.Deleted -eq $true}

# This command restores a deleted object 
Restore-ADObject 
```



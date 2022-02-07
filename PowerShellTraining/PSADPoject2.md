# AD User Recovery
## Recover deleted user from Domain controller Recycle-Bin

- Turn on the AD Recycle Bin
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
    Get-ADUser -Filter * -Properties Department | Where-Object {$_.Department -in @('Sales','Mareting','Managers')} | Get-Random -Count 10 | Remove-ADUser -Force
  }  
  ```
- 10 Random users have now been deleted

## Recover a deleted user

- Write a function that does the following
  - Lists all deleted object using the Out-Gridview
  - Allows someone to choose which user to restore

HINTS

```
Get-ADObject -LDAPFilter:"(msDS-LastKnownRDN=*)" -IncludeDeletedObjects # Finds deleted objects
Restore-ADObject # Restores a deleted object 
```



# Solutions for the PS projects

## Project 3

### This solution provides the basic answer

    
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
    

<br>

### This solution provides a better answer

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


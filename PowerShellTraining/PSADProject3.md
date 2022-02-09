
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

## To Prepare for this Project run the following:

## Create groups and group memberships
- Run this from LON-CL1
  ```
  New-ADGroup -Name 'LonSales' -GroupScope Global -Path 'OU=Sales,DC=adatum,DC=com' -PassThru | Add-ADGroupMember -Members 'Evan'
  New-ADGroup -Name 'ReadDB' -GroupScope Global -Path 'OU=Sales,DC=adatum,DC=com' -PassThru | Add-ADGroupMember -Members 'G_S_Sales'
  New-ADGroup -Name 'WriteReports' -GroupScope Global -Path 'OU=Sales,DC=adatum,DC=com'  -PassThru | Add-ADGroupMember -Members 'G_S_Sales'    
  New-ADGroup -Name 'PrintColorPrinter' -GroupScope Global -Path 'OU=Sales,DC=adatum,DC=com' -PassThru | Add-ADGroupMember -Members 'G_S_Sales'  
  New-ADGroup -Name 'ReadReports' -GroupScope Global -Path 'OU=Sales,DC=adatum,DC=com' -PassThru | Add-ADGroupMember -Members 'G_S_Sales'

  ```

<br>

---

<br>

# AD Group Membership Project
## Given a user identity, list all related groups

- Groups can be members of other groups (Nested Groups), so therfore:
  - Find all of the groups that a **user is a member of**
  - For **each of these groups**, **find all the groups they are members of** , and **repeat this** until you have found all of the nested groups.
  - **Display the Name and Scope** of each group

- Find the associated groups for the user **"Evan"**


## HINTS
```
# This command lists all groups an AD object is a  member of
Get-ADPrincipalGroupMembership 

```

<details><summary>Click to see the answer</summary><Strong> 
    
```
function Find-AssociatedGroupMembership {
  Param ($SamAccountName)
  function MemberOf {
    Param($ADObject)
    $Groups = Get-ADPrincipalGroupMembership -Identity $ADObject
    foreach ($Group in $Groups) {
      $Group | Select-Object -Property Name,GroupScope
      MemberOf -ADObject $Group
    }
  }
  $ADAccount = Get-ADUser -Identity $SamAccountName
  MemberOf -ADObject $ADAccount
} 
    
```

</Strong></details> 


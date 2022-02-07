
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
  New-ADGroup -Name G_S_Sales -P  
  ```

<br>

---

<br>

# AD Group Membership Project
## Given a user identity, list all related groups

- Groups can be members of other groups so therfore
  - Find all of the groups that the user is a member of
  - For each of these groups find all the groups they are members of as well
  - Display the Name and Scope of each group


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



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
  $SalsesUsers = Get-ADUser -filter {Department -eq Sales}
  $UsersToDisable = $SalesUsers | Get-Random -Count 5

  ```

<br>

---

<br>

# Use following brief to complete this project via PowerShell

- Create a PowerShell function within **PowerShell ISE** or **VSCode**
  - Include Comment Based Help
  - use a parameter for the SamAccountName of the user, 
    - make sure the parameter has a default value of "Jasper"
  - Save the function in the same module you created for Project 1 
  - Test the new PowerShell command you have created




## What must the PowerShell function achieve

- Given a user's SamAccountName, list all their related groups (immediate and nested groups)<br>
  *Nested Groups are groups placed inside other groups* 
  - Find all of the groups that the **user is a member of**
  - For **each of these groups**, **find all the groups they are members of** , and **repeat this** until you have found all of the nested groups.
  - **Display the Name and Scope** of each group on screen[...](PSADProjectSolutions.md#solutions-for-the-ps-projects)

## HINTS
```
# You will need this command for the project, it lists all of the groups that an AD object is a member of

Get-ADPrincipalGroupMembership 

```

## Test the results by running your function:
   
- Run your new function with the SamAccountName of **"Jasper"** and then **"Ada"**

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

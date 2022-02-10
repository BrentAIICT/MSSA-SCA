
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
  # Create OU
  New-ADOrganizationalUnit -Name AdatumGroups -Path 'DC=adatum,DC=com'
  
  # Global groups
  New-ADGroup -Name SalesAdmin -GroupScope Global  -Path 'ou=AdatumGroups,dc=adatum,dc=com'
  New-ADGroup -Name MktgAdmin -GroupScope Global  -Path 'ou=AdatumGroups,dc=adatum,dc=com'
  New-ADGroup -Name DevAdmin -GroupScope Global  -Path 'ou=AdatumGroups,dc=adatum,dc=com'
  
  # Universal groups
  New-ADGroup -Name AllAdmin -GroupScope Universal  -Path 'ou=AdatumGroups,dc=adatum,dc=com'
  
  # Domain Local groups
  New-ADGroup -Name ColorPtr -GroupScope DomainLocal  -Path 'ou=AdatumGroups,dc=adatum,dc=com'
  New-ADGroup -Name SalesDB -GroupScope DomainLocal  -Path 'ou=AdatumGroups,dc=adatum,dc=com'
  New-ADGroup -Name MktgData -GroupScope DomainLocal  -Path 'ou=AdatumGroups,dc=adatum,dc=com'
  New-ADGroup -Name CommonData -GroupScope DomainLocal  -Path 'ou=AdatumGroups,dc=adatum,dc=com'
  New-ADGroup -Name BWPtr -GroupScope DomainLocal  -Path 'ou=AdatumGroups,dc=adatum,dc=com'
  New-ADGroup -Name CustomerDB -GroupScope DomainLocal  -Path 'ou=AdatumGroups,dc=adatum,dc=com'
  New-ADGroup -Name AllowRemote -GroupScope DomainLocal  -Path 'ou=AdatumGroups,dc=adatum,dc=com'
  
  # Nesting groups
  Add-ADGroupMember -Identity ColorPtr -Members (Get-ADGroup -Filter {Name -eq 'MktgAdmin'})
  Add-ADGroupMember -Identity SalesDB -Members (Get-ADGroup -Filter * | Where-Object {$_.Name -in ('SalesAdmin','MktgAdmin')})
  Add-ADGroupMember -Identity MktgData -Members (Get-ADGroup -Filter {Name -eq 'MktgAdmin'})
  Add-ADGroupMember -Identity CommonData -Members (Get-ADGroup -Filter {Name -eq 'AllAdmin'})
  Add-ADGroupMember -Identity BWPtr -Members (Get-ADGroup -Filter {Name -eq 'AllAdmin'})
  Add-ADGroupMember -Identity CustomerDB -Members (Get-ADGroup -Filter * | Where-Object {$_.Name -in ('SalesAdmin','DevAdmin')})
  Add-ADGroupMember -Identity AllowRemote -Members (Get-ADGroup -Filter {Name -eq 'SalesAdmin'})
  Add-ADGroupMember -Identity AllAdmin -Members (Get-ADGroup -Filter * | Where-Object {$_.Name -in ('SalesAdmin','DevAdmin','MktgAdmin')})
  
  # Adding Admin users from each department to relevant Global groups
  Add-ADGroupMember -Identity SalesAdmin -Members (Get-ADUser -Filter * | Where-Object {$_.SamAccountname -in ('Maureen','Allan','Jessie')})
  Add-ADGroupMember -Identity MktgAdmin -Members (Get-ADUser -Filter * | Where-Object {$_.SamAccountname -in ('Ada','Ernie','Julian')})
  Add-ADGroupMember -Identity DevAdmin -Members (Get-ADUser -Filter * | Where-Object {$_.SamAccountname -in ('Jasper','Margret','Jodie')})
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

- Find the associated groups for the user **"Jasper"** and then **"Ada"**

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


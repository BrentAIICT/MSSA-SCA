# Solutions for the PS projects

## Project 1 - Creating users from a CSV file

```
function Add-NewUser {
  <#
  .SYNOPSIS
    This command will create AD users based on a specific CSV file format
  .DESCRIPTION
    This command will create AD users based on a specific CSV file format. 
    The CSV file must have the following format:
      "firstname","lastname","upn","department","streetaddress","city","mobilephone","password","officename"
      "Binky","Cavanagh","Binky.Cavanagh@adatum.com","Marketing","653 Oak Valley Parkway","London","0488071773","xZhwF@t?qm","Lon-100"
      "Ilsa","Eykel","Ilsa.Eykel@adatum.com","Marketing","06392 Linden Park","Toronto","0413669454","@dwtuM!xVb","Tor-200"
      "Abram","Filipyev","Abram.Filipyev@adatum.com","HR","43885 8th Street","Toronto","0441239058","cMmyG?je#n","Tor-300"
  .PARAMETER CSVFilePath 
    This is the path to the CSV file. The contents of this file will be used to create the new AD users
  .EXAMPLE
    Add-NewUser -CSVFilePath e:\NewHires.csv
    This will create all of the users that are decribed in the CSV file as AD Users.
  .NOTES
    General notes
      Created By: Brent Denny
      Created On: 01-Feb-2022
  #>
  [cmdletBinding()]
  Param($CSVFilePath = 'E:\NewHires.csv')

  $Users = Import-Csv -Path $CSVFilePath
  $DepartmentNames = $Users.Department | Select-Object -Unique # Get an array of all of the Departments that are needed
  $CurrentOUNames = (Get-ADOrganizationalUnit -Filter *).Name # Get an array of OU names
  $CurrentGroupNames = (Get-ADGroup -Filter *).Name # Get an array of Group names
  foreach ($DepartmentName in $DepartmentNames) { # Checking to see if the OUs and Groups are already created
    if ($DepartmentName -notin $CurrentOUNames) {
      New-ADOrganizationalUnit -Name $DepartmentName -Path 'dc=adatum,dc=com'
    }
    if ($DepartmentName -notin $CurrentGroupNames) {
      New-ADGroup -GroupScope Global -Name $DepartmentName -Path "ou=$DepartmentName,dc=adatum,dc=com"
    }
  }
  $UserTotalCount = $Users.Count
  $CurrentUserCount = 0  
  foreach ($User in $Users) {
    $CurrentUserCount++
    Write-Progress -Activity "Creating Users" -PercentComplete ($CurrentUserCount/$UserTotalCount*100) -CurrentOperation  "Creating User: $($User.FirstName + ' ' + $User.LastName)"
    # Creating all of the information needed to create the user
    $Name = $User.firstname + ' ' + $User.lastname
    $OU = 'OU=' + $User.department + ',DC=adatum,DC=com'
    $secPwd = $User.password | ConvertTo-SecureString -AsPlainText -Force
    $SamAccountName = $User.firstname.SubString(0,1) + $User.lastname
    
    $Parameters = @{ # Splatting the paramaters for New-ADUser, instead of listing parameters on one line after the command
      Name=$Name
      Path=$OU
      GivenName=$User.firstname
      Surname=$User.lastname
      SamAccountName=$SamAccountName
      AccountPassword=$secPwd 
      Department=$User.department 
      Office=$User.officename 
      UserPrincipalName=$user.upn 
      MobilePhone=$User.mobilephone 
      City=$User.city 
      StreetAddress=$User.streetaddress
    }
    New-ADUser @Parameters # Creating the new user
    $NewUser = Get-ADUser -Identity $SamAccountName
    Add-ADGroupMember -Identity $User.department -Members $NewUser  # Adding the new user to the relevant group
  }
}
```
 
## Project 2 - Restoring deleted AD users from the AD recycle bin

```
function Restore-DeletedADObject {
  <#
  .SYNOPSIS
    This command will restore AD users from the AD Recycle bin
  .DESCRIPTION
    This command will check for all deleted users and list them in a GUI, allowing the users that 
    need to be restored to be slected and then automatically restored to AD
  .EXAMPLE
    Restore-DeletedADObject
    This will present a list of deleted users for selection to resore them to AD
  .NOTES
    General notes
      Created By: Brent Denny
      Created On: 01-Feb-2022
  #>
  # Find all of the deleted objects in AD  
  $DeletedObjects = Get-ADObject -LDAPFilter:"(msDS-LastKnownRDN=*)" -IncludeDeletedObjects | Where-Object {$_.Deleted -eq $true}
  $ADObjectsChosen = $DeletedObjects | Out-GridView -OutputMode Multiple  # Choose which objects to restore
  $ADObjectsChosen | Restore-ADObject -confirm:$false # This restores the chosen object
  # this finds the restored objects in AD  
  $RestoredObjects = Get-ADObject -Filter * | Where-Object {$_.ObjectGuid -in $ADObjectsChosen.ObjectGuid}  
  return $RestoredObjects   # Show the restored objects on the screen (this is the optional requirement)
}
    
```

## Project 3 - Find all groups related to an AD user

### This solution provides the basic solution
    
```
function Find-AssociatedGroupMembership {
  <#
  .SYNOPSIS
    This command will find all related groups given a users samaccountname
  .DESCRIPTION
    This command will find all of the groups a user is a member of and then
    will located all groups that those groups are a member of and repeat this 
    until no more memberships can be found. These groups will then be displayed
    as output
  .EXAMPLE
    Find-AssociatedGroupMembership
    This command will find all related groups given a users samaccountname
  .PARAMETER SamAccountName
    This is the SamAccountName that is associated with the use in question  
  .NOTES
    General notes
      Created By: Brent Denny
      Created On: 01-Feb-2022
  #>
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
  <#
  .SYNOPSIS
    This command will find all related groups given a users samaccountname
  .DESCRIPTION
    This command will find all of the groups a user is a member of and then
    will located all groups that those groups are a member of and repeat this 
    until no more memberships can be found. These groups will then be displayed
    as output
  .EXAMPLE
    Find-AssociatedGroupMembership
    This command will find all related groups given a users samaccountname
  .PARAMETER SamAccountName
    This is the SamAccountName that is associated with the use in question  
  .NOTES
    General notes
      Created By: Brent Denny
      Created On: 01-Feb-2022
  #>
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


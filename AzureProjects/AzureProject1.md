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
# Network Challenge

# Use following brief to complete this project via PowerShell

- Create three Virtual Networks (VNet01, VNet02, VNet03)
- VNet01
  - IPAddress: 10.1.0.0/16
  - Subnet: 10.1.0.0/24
  - Two Virtual Machines (VM1, VM2)
  - VM1
    - OS: Windows 2019 Server
    - IP: Fixed IP address 10.1.0.10/24
    - Feature Installed: Web Server
  - VM2
    - OS: Windows 2019 Server
    - IP: Fixed IP address 10.1.0.20/24
    - Feature Installed: Web Server
  - NSGs
    - Create NSG that allow web traffic from VNet02/Subnet to access VM1
    - Create NSG that allow web traffic from VNet01/Subnet to access VM2
- VNet02
  - IPAddress: 131.107.0.0/16
  - Subnet:  131.107.0.0/24
  - One Virtual Machine (VM3)
  - VM3
    - OS: Windows 2019 Server
    - IP: Dynamic IP address 
    - Feature Installed: None
  - NSGs
    - Create NSG that allow web traffic to VNet01/Subnet from VNet02/subnet
- VNet02
  - IPAddress: 197.10.0.0/16
  - Subnet:  131.107.0.0/24
  - One Virtual Machine (VM3)
  - VM3
    - OS: Windows 2019 Server
    - IP: Dynamic IP address 
    - Feature Installed: None
  - NSGs
    - Create NSG that allow web traffic to VNet01/Subnet from VNet02/subnet


## What must the PowerShell function achieve

- Use the NewHires.csv file to create the new employees Active Directory
- Check first to see if OUs and Groups exist for all of the users that will be created 
  - if not, have the PowerShell create OUs and Global Security Groups for any departments that are missing 
- Use Powershell to create each of these new users (from the NewHires.csv file)
  - Each user **must** 
    - Be created within the **OU relating to their department**
    - Be added to the **Security Group that relates to their department**
    - Have the unique **password (found in the NewHires.csv file) set for their user account**
    - Have all of the AD properties added as per the NewHires.csv file
    - Have the AD property called "SamAccountName" created comprising of the First letter of the FirstName and the LastName combined, all in lowercase
      - for example "FirstName = Ben, LastName =  Smith", 
      - you will need to use an AD property called, **"SamAccountName"** that have the value **"bsmith"**    
    - Have the AD Property called "Name" created which consists of "FirstName LastName"
      - for example "FirstName = Ben, LastName =  Smith", 
      - you will need to use an AD property called, **"Name"** that have the value **"Ben Smith"**[.](PSADProjectSolutions.md#solutions-for-the-ps-projects)   

## Test if your function worked by running:
   
```
# If your function worked this will show users within the contractors group
Get-ADGroupMember -Identity Contractors
```


<br>
<!--
<details><summary>Click to see the answer</summary><Strong>  

```
function Add-NewUser {
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
    
</Strong></details> 
-->
<!--
-->

[Go to Project 1](PSADProject1.md#create-new-users-in-active-directory-from-a-csv-file)<br>
[Go to Project 2](PSADProject2.md#restore-an-accidently-deleted-ad-user-account-from-the-recycle-bin)<br>
[Go to Project 3](PSADProject3.md#find-all-direct-and-indirect-groups-an-ad-user-is-a-member-of)<br>

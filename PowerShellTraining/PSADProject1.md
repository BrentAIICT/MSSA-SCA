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

- Launch the PowerShell lab virtual mahines (AZ-040)
- Logon to LON-CL1 as the ADATUM\Administrator
  - From LON-CL1 
    - Launch PowerShell 7 (pwsh.exe)
    - Run the following command 
    ```
    Install-Module GitHubToolsBD -Force
    ```
    - Run this command
    ```
    Get-FilesFromRepo -GitHubUserName brentaiict -Repository MSSA-SCA -PathInRepo PowerShellTraining -FilesToRetrieve NewHires.csv -Destination E:\ 
    ```

# Use following brief to complete this task via PowerShell

- Task to complete  
  - Create a PowerShell function within **PowerShell ISE**
    - only use Parameters for information input, the function must run without interruption 
    - use a parameter for the CSV file, 
      - make sure the parameter has a default value for the path to the "e:\NewHires.csv" file 
    - Save the function as a module in an autoloading directory ($env:PSModulePath will list the correct directories to choose from) 

- Write the function to achieve the following:
   
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
        - you will need to use an AD property called, **"Name"** that have the value **"Ben Smith"**   
 

<br>

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
  
  foreach ($User in $Users) {
    # Creating all of the information needed to create the user
    $Name = $User.firstname + ' ' + $User.lastname
    $OU = 'OU=' + $User.department + ',DC=adatum,DC=com'
    $secPwd = $User.password | ConvertTo-SecureString -AsPlainText -Force
    $SamAccountName = $User.firstname[0] + $User.lastname
    
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
  

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
  - Create a PowerShell function
    - only use Parameters for information input, the function must run without interruption 
    - use a parameter for the CSV file, 
      - make sure the parameter has a default value for the path to the "e:\NewHires.csv" file 

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
        - for example "FirstName = Ben, LastName =  Smith", you will need to create an AD property called, **"SamAccountName"** that have the value **"bsmith"**    
      - Have the AD Property called "Name" created which consists of "FirstName LastName"
        - for example "FirstName = Ben, LastName =  Smith", you will need to create an AD property called, **"Name"** that have the value **"Ben Smith"**     

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

# Entry Level PowerShell Quiz

  > Make sure all of these functions get saved in your GitHub Repository 

## 1 Using pipelines

- Q1.1 Write a pipeline that displays all running services and show the following properties sorted by the StartType and then by Name
  - Properties to show Status, StartType, Name, DisplayName

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Think about the following:
    - What PowerShell command will find services 
    - What PowerShell command will sort the information
    - How do I just show running services
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Get-Service | Where-Object {$_.Status -eq 'Running'} | Sort-Object -Property StartType,Name | Select-Object -Property Status,StartType,Name,DisplayName

    ```
    </Strong></details> 

- Q1.2 Write a pipeline that will show the some properties of the BIOS information using a CimInstance command
  - Show the following properties: BIOSVersion,ReleaseDate

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Consider:
    - How do I find a CIM class that shows bios inforamtion
    - How do I just show two of the properties
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Get-CimInstance -ClassName Win32_BIOS | Select-Object -Property BIOSVersion,ReleaseDate
    ```
    </Strong></details> 
    
- Q1.3 Write a pipeline that shows the four most recent System event log entries and only shows the following
  - The EventID and how long ago the entries were geneated in minutes

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Consider:
    - How do I find a command that shows event logs
    - How do I show a property that I have to calculate 
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Get-EventLog -LogName System -Newest 4 | Select-Object -Property EventID,@{n='MinutesAgo';e={((Get-Date) - $_.TimeGenerated).Minutes}}
    ```
    </Strong></details> 


## 2 Using Help

### Open the full help page for the cmdlet Get-Process to answer the following questions

  - Q2.1 Determine what type of object can the ComputerName parameter accept
 
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Help -Full Get-Process
    # Or you could use the following
    Get-Help -ShowWindow Get-Process
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    Look for the information directly after the Parameter name "ComputerName" 
    
    -ComputerName <System.String[]>
    
    "String" is the answer, also note that String has "[]" at the end which menas that 
    This parameter can accept one or more strings as an array of strings
    ```
    </Strong></details>    
 
  - Q2.2 Determine which parameters can accept pipeline input and take note of the pipeline method  
    
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Help -Full Get-Process
    # Or you could use the following
    Get-Help -ShowWindow Get-Process
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    Inspect all of the parameters for those that report "True" for "Accept pipeline input"?
    For Example:
    -ComputerName <System.String[]>
       Specifies the computers for which this cmdlet gets active processes. The default is the local computer.
       
       Required?                    false
       Position?                    named
       Default value                Local computer
       Accept pipeline input?       True (ByPropertyName)
       Accept wildcard characters?  false    
    
    This is one of the parameters that can "Accept pipeline input"
    and it does so by the "ByPropertyName" procedure    
    ```
    </Strong></details>   
 
  - Q2.3 Determine how many different ways this cmdlet can be run we call it "parameter sets"

    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Help -Full Get-Process
    # Or you could use the following
    Get-Help -ShowWindow Get-Process
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    Look for the "Syntax" section and count the number of ways this cmdlet can be run
    For Example:
    
    Syntax
        Get-Process [[-Name] <System.String[]>] [-ComputerName <System.String[]>] [-FileVersionInfo ] [-Module ] [<CommonParameters>]
        Get-Process [-ComputerName <System.String[]>] [-FileVersionInfo ] -Id <System.Int32[]> [-Module ] [<CommonParameters>]
        Get-Process [-ComputerName <System.String[]>] [-FileVersionInfo ] -InputObject <System.Diagnostics.Process[]> [-Module ] [<CommonParameters>]
        Get-Process -Id <System.Int32[]> -IncludeUserName  [<CommonParameters>]
        Get-Process [[-Name] <System.String[]>] -IncludeUserName  [<CommonParameters>] 
        Get-Process -IncludeUserName  -InputObject <System.Diagnostics.Process[]> [<CommonParameters>]   
    
    The answer is: there are six different ways of running this cmdlet with different parameters     
    ```
    </Strong></details>         

  - Q2.4 Find an example in the help that shows processes with a working set greater than a specified size 

    
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Help -Full Get-Process
    # Or you could use the following
    Get-Help -ShowWindow Get-Process
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    Look throught the help until you find the examples and then look for the specific example 
    For Example:
    Example 3: Get all processes with a working set greater than a specified size
    Get-Process | Where-Object {$_.WorkingSet -gt 20000000}
    
    Read the comments associated with this example
    ```
    </Strong></details>           

        
## 3 Discovering what is the output/result of running a cmdlet using Get-Member

### Find what object is created when you run the Get-Service cmdlet

  - Q3.1 What is the name of the object that is the result/output of the cmdlet 
 
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Help -Full Get-Member
    
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Get-Service | Get-Member 
    
    # Look for the TypeName information
    # The Answer is:
    #   System.ServiceProcess.ServiceController 
    # The last name is important when learning how to use PowerShell: 
    #   ServiceController 
    ```
    </Strong></details>    
 
  - Q3.2 What Properties are available in the Object produced by this cmdlet  
    
    <details><summary>Click for hint</summary><Strong> 

    ```
    Look for all of the MemberTypes that have the word Property in the typename
        
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    Answer is :
    Name                MemberType    Definition
    ----                ----------    ----------
    Name                AliasProperty Name = ServiceName                                           
    RequiredServices    AliasProperty RequiredServices = ServicesDependedOn
    CanPauseAndContinue Property      bool CanPauseAndContinue {get;}
    CanShutdown         Property      bool CanShutdown {get;}
    CanStop             Property      bool CanStop {get;}
    Container           Property      System.ComponentModel.IContainer Container {get;}
    DependentServices   Property      System.ServiceProcess.ServiceController[] DependentServices {get;}
    DisplayName         Property      string DisplayName {get;set;}
    MachineName         Property      string MachineName {get;set;}
    ServiceHandle       Property      System.Runtime.InteropServices.SafeHandle ServiceHandle {get;}
    ServiceName         Property      string ServiceName {get;set;}
    ServicesDependedOn  Property      System.ServiceProcess.ServiceController[] ServicesDependedOn {get;}
    ServiceType         Property      System.ServiceProcess.ServiceType ServiceType {get;}
    Site                Property      System.ComponentModel.ISite Site {get;set;}
    StartType           Property      System.ServiceProcess.ServiceStartMode StartType {get;}
    Status              Property      System.ServiceProcess.ServiceControllerStatus Status {get;}
    ```
    </Strong></details>   
 
  - Q3.3 What methods are available in the Object produced by this cmdlet  
    
    <details><summary>Click for hint</summary><Strong> 

    ```
    Look for all of the MemberTypes that have the word Method in the typename
        
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    Answer is :
    Name                      MemberType   Definition
    ----                      ----------   ----------
    Close                     Method       void Close()
    Continue                  Method       void Continue()
    CreateObjRef              Method       System.Runtime.Remoting.ObjRef CreateObjRef(type requestedType)
    Dispose                   Method       void Dispose(), void IDisposable.Dispose()
    Equals                    Method       bool Equals(System.Object obj)
    ExecuteCommand            Method       void ExecuteCommand(int command)
    GetHashCode               Method       int GetHashCode()
    GetLifetimeService        Method       System.Object GetLifetimeService()
    GetType                   Method       type GetType()
    InitializeLifetimeService Method       System.Object InitializeLifetimeService()
    Pause                     Method       void Pause()
    Refresh                   Method       void Refresh()
    Start                     Method       void Start(), void Start(string[] args)
    Stop                      Method       void Stop()
    WaitForStatus             Method       void WaitForStatus(System.ServiceProcess.ServiceControllerStatus desiredStatus), void WaitForStatus(System....
    ToString                  ScriptMethod System.Object ToString();


    ```
    </Strong></details>   
 
- Q3.4 Find the object types that are contained within the following properties: Name, DisplayName, CanStop, Status   
    
    <details><summary>Click for hint</summary><Strong> 

    ```
    Look in the Definition column for each of the given properties 
        
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    Name        MemberType    Definition
    ----        ----------    ----------
    Name        AliasProperty Name = ServiceName
    CanStop     Property      bool CanStop {get;}
    DisplayName Property      string DisplayName {get;set;}
    ServiceName Property      string ServiceName {get;set;}
    Status      Property      System.ServiceProcess.ServiceControllerStatus Status {get;}
    
    The Answer is:
      Name is an Alias Property so we follow the alias, Name -> ServiceName 
        and find that ServiceName contains a "string" object
        therefore Name contains a "String" object
      CanStop contains a "Boolean" object
      DisplayName contains a "String" object
      Status contains a "System.ServiceProcess.ServiceControllerStatus" object   
        
    ```
    </Strong></details>   
 
 ## 4 Discovering Modules


  - Q4.1 List all of the modules that are available  
 
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Command *module*
    # Get the full help for the command you have found to show all the modules that are available    
    
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Get-Module -ListAvailable 
    
    # Look for the TypeName information
    # The Answer is:
    #   System.ServiceProcess.ServiceController 
    # The last name is important when learning how to use PowerShell: 
    #   ServiceController 
    ```
    </Strong></details>    
 
  - Q4.2 From the results of the previous command what folders are the modules found in   
    
    <details><summary>Click for hint</summary><Strong> 

    ```
    Look at the results of the Get-Module -ListAvailable to find the folder locations
    on the computer where modules are stored     
        
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    The answers will differ depending on whether you are using PowerShell 7 and PowerShell 5
    PowerShell 7 
       C:\Users\<USERNAME>\Documents\PowerShell\Modules
       C:\Program Files\PowerShell\Modules
       c:\program files\powershell\7\Modules
       C:\Program Files\WindowsPowerShell\Modules
       C:\Windows\system32\WindowsPowerShell\v1.0\Modules   
        
    PowerShell 5    
      C:\Users\<USERNAME>\Documents\WindowsPowerShell\Modules
      C:\Program Files\WindowsPowerShell\Modules
      C:\Windows\system32\WindowsPowerShell\v1.0\Modules    
        
    ```
    </Strong></details>   
 
  - Q4.3 What command would you use to install the module "SubnetTools" from the PowerShell Gallery  
    
    <details><summary>Click for hint</summary><Strong> 

    ```
    Look for commands that come from the PowerShellGet module
        
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    Answer is :
      Install-Module -Name SubnetTools
        
    ```
    </Strong></details>   
 

## BONUS QUIZ
        
    - List all Active Directory Users that are in the Sales Department, that live in London
    - Store these user objects in a variable of your choice
    - Change all of their passwords to a different random password per user
    - store the usename and password of each user in a file called NewPasswords.txt
    <details><summary>Click for hint</summary><Strong> 

    ```
    Find out how to create a random password that contains upper and lower case letters and numbers and a special character
    Read the help for Set-ADUser    
        
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
   
        
    ```
    </Strong></details>           
        
        

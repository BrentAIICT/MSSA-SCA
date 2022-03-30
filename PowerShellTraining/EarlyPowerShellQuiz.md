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

- Open the full help page for the cmdlet Get-Process to answer the following questions

  - Q2.1 determine what type of object can the ComputerName parameter accept
 
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
 
  - Q2.2 determine which parameters can accept pipeline input and take note of the pipeline method  
    
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
 
  - Q2.3 determine how many different ways this cmdlet can be run we call it "parameter sets"

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

        

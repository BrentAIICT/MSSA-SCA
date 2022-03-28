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
    
    ```
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
    
    ```
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
    
    ```
    Get-EventLog -LogName System -Newest 4 | Select-Object -Property EventID,@{n='MinutesAgo';e={((Get-Date) - $_.TimeGenerated).Minutes}}
    ```
    </Strong></details> 

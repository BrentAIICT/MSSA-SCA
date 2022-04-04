# ByPropertyName pipelines 
# The output of the first cmdlet it broken down into it individual properties
# The second cmdlet dictates which properties can be consumed by matching 
#   - the spelling of the property from the first cmdlet and associated parameter from the second cmdlet 
#   - the object types must also match

# The best way to see how the ByPropertyName piple line works is by seeing when it fails

# ByPropertyName Pipeline example that does not work:
# For some reason the computer information built by Get-ADCompter is not piping to the Get-Service cmdlet
Get-ADComputer -Filter * | Get-Service -Name Spooler

# Just a quick note about ByPropertyName pipeline
# The second cmdlet cannot consume a pipeline property if it is uses that corresponding parameter on the command line

# To find out why this did not work we will get the help for the Get-Service command
# Looking for every parameter that can pipeline ByPropertyName
Get-Help -ShowWindow -Name Get-Service 

###
###    Parameters
###        -ComputerName <System.String[]>
###            Gets the services running on the specified computers. The default is the local computer.
###            
###    
###            Required?                    false
###            Position?                    named
###            Default value                None
###            Accept pipeline input?       True (ByPropertyName)
###            Accept wildcard characters?  false
###    
###    
###        -Name <System.String[]>
###            Specifies the service names of services to be retrieved. Wildcards are permitted. By default, this cmdlet gets all of the services on the computer.
###    
###            Required?                    false
###            Position?                    0
###            Default value                None
###            Accept pipeline input?       True (ByPropertyName, ByValue)
###            Accept wildcard characters?  true
###    
###    

# Name is out because we are using that in the command line in the second cmdlet
# So the ComputerName paramter is the only left 

# Now lets find out why the pipeline is not working
# To do so we need to look at the properties produced by Get-ADComputer -Filter *
Get-ADComputer -Filter * | Select-Object -Property *

###    DistinguishedName  : CN=LON-DC1,CN=Computers,DC=Adatum,DC=com
###    DNSHostName        : LON-DC1.Adatum.com
###    Enabled            : True
###    Name               : LON-DC1
###    ObjectClass        : computer
###    ObjectGUID         : ae50fd8d-6034-4a1c-b33d-26a399fb82d8
###    SamAccountName     : LON-DC1$
###    SID                : S-1-5-21-913749354-169946239-1665692169-3103
###    UserPrincipalName  : 
###    PropertyNames      : {DistinguishedName, DNSHostName, Enabled, Name...}
###    AddedProperties    : {}
###    RemovedProperties  : {}
###    ModifiedProperties : {}
###    PropertyCount      : 9
###            

# DNSHostName has the full DNS name of the computer, the Get-Service cmdlet was expecting ComputerName 
# ComputerName does not exist in the list of properties, so we will build it instead.

Get-ADComputer -Filter * | 
Select-Object -Property @{n='ComputerName';e={$_.DNSHostName}} |
Get-Service -Name Spooler |
Select-Object Status,Name,DisplayName,MachineName
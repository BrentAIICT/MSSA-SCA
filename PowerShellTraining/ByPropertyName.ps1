# PowerShell pipelines always tries ByValue pipeline first.
# If ByValue is not possible then it tries to send information across the pipeline ByPropertyName

# Pipeline that does not work:
# For this to succeed the Stop-Service cmdlet must be able to consume individual properties of the object produced by Get-Service
Get-ADComputer -Filter * | Get-Service -Name Spooler

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

# Name is out because we are using that in the command line 
# So ComputerName is the only parameter left 

# Now lets find out why the pipeline is not working
# To do so we need to look at the properties produced by Get-ADComputer -Filter *
Get-ADComputer -Filter * | Get-Member 




###       TypeName: System.ServiceProcess.ServiceController
###    
###    Name                      MemberType    Definition                                                                                                                      
###    ----                      ----------    ----------                                                                                                                      
###    Name                      AliasProperty Name = ServiceName                                                                                                              
###    RequiredServices          AliasProperty RequiredServices = ServicesDependedOn                                                                                           
###    Disposed                  Event         System.EventHandler Disposed(System.Object, System.EventArgs)                                                                   
###    Close                     Method        void Close()     

# The second command can consume the entire object created by running Get-Service then the pipeline will use ByValue                 
# PowerShell pipelines always tries ByValue pipeline first.
# If ByValue is not possible then it tries to send information across the pipeline ByPropertyName

# ByValue example:
# For this to succeed the Stop-Service cmdlet must be able to consume the entire object produced by Get-Service
Get-Service -Name BITS | Stop-Service

# To prove this look a the help for Stop-Service looking for pipeline ByValue parameters
Get-Help -ShowWindow -Name Stop-Service

###    -InputObject <System.ServiceProcess.ServiceController[]>
###        Specifies ServiceController objects that represent the services to stop. Enter a variable that contains the objects, or type a command or expression that gets the objects.
###
###        Required?                    true
###        Position?                    0
###        Default value                None
###        Accept pipeline input?       True (ByValue)
###        Accept wildcard characters?  false
###
###    -Name <System.String[]>
###        Specifies the service names of the services to stop. Wildcard characters are permitted.
###
###        Required?                    true
###        Position?                    0
###        Default value                None
###        Accept pipeline input?       True (ByPropertyName, ByValue)
###        Accept wildcard characters?  true

# To complete the second part of the proof find the object that is produced by the Get-Service
Get-Service -Name bits | Get-Member 


###       TypeName: System.ServiceProcess.ServiceController
###    
###    Name                      MemberType    Definition                                                                                                                      
###    ----                      ----------    ----------                                                                                                                      
###    Name                      AliasProperty Name = ServiceName                                                                                                              
###    RequiredServices          AliasProperty RequiredServices = ServicesDependedOn                                                                                           
###    Disposed                  Event         System.EventHandler Disposed(System.Object, System.EventArgs)                                                                   
###    Close                     Method        void Close()     

# The second command can consume the entire object created by running Get-Service then the pipeline will use ByValue                 
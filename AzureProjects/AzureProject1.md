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
# Azure Network Securty Challenge

# Use following brief to complete this project via PowerShell

- Create four Virtual Networks (VNet01, VNet02, VNet03)
- Create the required Virtual Network peerings
- VNet01
  - IPAddress: 10.1.0.0/16
  - Subnet1: 10.1.0.0/24
  - Subnet2: 10.1.1.0/24
  - Two Virtual Machines (VM1, VM2)
    - join VM1 to subnet1
    - join VM2 to subnet2
  - VM1
    - OS: Windows 2019 Server
    - IP: Fixed IP address 10.1.0.10/24
    - Feature Installed: Web Server
  - VM2
    - OS: Windows 2019 Server
    - IP: Fixed IP address 10.1.1.20/24
    - Feature Installed: Web Server
  - NSGs
    - Create NSG rule that allows web traffic from VM4 to VM1 and VM2 for http traffic
    - Create NSG rule that allows web traffic from VM3 to VM2 for http traffic (but not to VM1)
- VNet02
  - IPAddress: 131.107.0.0/16
  - Subnet1:  131.107.0.0/24
  - One Virtual Machine (VM3)
  - VM3
    - OS: Windows 2019 Server
    - IP: Dynamic IP address 
    - Feature Installed: None
  - NSGs
    - None
- VNet03
  - IPAddress: 197.10.0.0/16
  - Subnet1: 197.10.0.0/24
  - One Virtual Machine (VM4)
    - Add VM4 to subnet1
  - VM3
    - OS: Windows 2019 Server
    - IP: Dynamic IP address 
    - Feature Installed: None
  - NSGs
    - none

## What must the lab achieve

- Creation of the network infrastructure 
- VM1 and VM2 as web servers
- Create the routing infrastructure needed to communicate VNet to VNet
- NSG rules to allow only the allowed machine access 

## Test if your Azure security:

- After crating the infrastucure 
  - Open a web browser on VM3 and VM4 and try to access the VM1 and VM2 websites
  - VM3 should be able to access both VM1 and VM2
  - VM4 should only be able to access VM2
   

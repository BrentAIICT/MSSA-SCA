# Find the subnets that on organisation requires from the following information

# Quiz 1

## Network Information
- Current IP address 193.1.2.0/24
- Subnets required:  3
- Hosts per subnet: 60

## Please create for the company:
- The three subnet ranges showing the following for each subnet:
  - Subnet address
  - Usable addresses
  - Broadcast address

<details><summary>Click for hint</summary><Strong> 

``` 
How many bits are required for the subnets required?
How many bits are required for the hosts/subnets
Create the new subnet mask
Workout your subnet ranges; 
  remember first address in the subnet is Subnet address and the last address is the Broadcast address   
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
   
```
Mask SubnetID    FirstValidIP LastValidIP BroadcastIP HostsPerSubnet Subnet TotalSubnets
---- --------    ------------ ----------- ----------- -------------- ------ ------------
  26 193.1.2.0   193.1.2.1    193.1.2.62  193.1.2.63              62      1            4
  26 193.1.2.64  193.1.2.65   193.1.2.126 193.1.2.127             62      2            4
  26 193.1.2.128 193.1.2.129  193.1.2.190 193.1.2.191             62      3            4
  26 193.1.2.192 193.1.2.193  193.1.2.254 193.1.2.255             62      4            4

```
</Strong></details> 


# Quiz 2

## Network Information
- Class C addresses 
  - 193.1.15.0/24
  - 193.1.16.0/24
  - 193.1.17.0/24
  - 193.1.18.0/24
  - 193.1.19.0/24
  - 193.1.20.0/24
  - 193.1.21.0/24
  - 193.1.22.0/24
  - 193.1.23.0/24
  - 193.1.24.0/24
  - 193.1.25.0/24
- Subnets required:  1 
- Hosts per subnet: 2000

## Please create for the company:
- From the class C networks provided
- Create a supernet range that will allow 2000 clients to be on one subnet

<details><summary>Click for hint</summary><Strong> 

``` 
Determine how many host bits would be required to make a single subnet of 2000 hosts
You need to reduce the /24 mask so that multiple networks can be supernetted as on subnet
The number of bit you are subtracting will also tell you haw many /24 networks you need
Remember that the bits you are subtracting must:
  start with 0's in the first network and 
  end in 1's in the last network
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
   
```
193.1.16.0/21 
  
  Which combines these 8 subnets 192.1.16.0 -> 192.1.23.0
```
</Strong></details> 

# Quiz 3

## Network Information
- Current IP address 161.0.0.0/16
- Subnets required:  300
- Hosts per subnet: 110

## Please create for the client:
- Display the first five subnets ranges showing the following for each subnet:
  - Subnet address
  - Usable addresses
  - Broadcast address

<details><summary>Click for hint</summary><Strong> 

``` 
How many bits are required for the subnets required?
How many bits are required for the hosts/subnets
Create the new subnet mask
Workout your subnet ranges; 
  remember first address in the subnet is Subnet address and the last address is the Broadcast address   
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
   
```
Mask SubnetID      FirstValidIP  LastValidIP   BroadcastIP   HostsPerSubnet Subnet TotalSubnets
---- --------      ------------  -----------   -----------   -------------- ------ ------------
  25 161.0.0.0     161.0.0.1     161.0.0.126   161.0.0.127              126      1          512
  25 161.0.0.128   161.0.0.129   161.0.0.254   161.0.0.255              126      2          512
  25 161.0.1.0     161.0.1.1     161.0.1.126   161.0.1.127              126      3          512
  25 161.0.1.128   161.0.1.129   161.0.1.254   161.0.1.255              126      4          512
  25 161.0.2.0     161.0.2.1     161.0.2.126   161.0.2.127              126      5          512
```
</Strong></details> 

# Quiz 4 (Very difficult)

## Network Information
- Current IP address 193.1.2.0/24
- Subnets needed showing city and hosts required
  - London 100
  - Sydney 29
  - Auckland 10
  - Denver 13
  - WAN Lon-Syd 2
  - WAN Syd-Auck 2
  - WAN Lon-Den 2

## Please create for the company:
- Use VLSM to create subnets for all of these networks from the one Class C address above
- Show 
  - Network address and CIDR mask for each network

<details><summary>Click for hint</summary><Strong> 

``` 
Make the most of one Class C address
The different sized subnets allow us to subnet a subnet etc. until you get to the right size subnet for each city
Use the box method to help visualise the subnets of subnets  
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
   
```
Mask SubnetID    FirstValidIP LastValidIP BroadcastIP HostsPerSubnet
---- --------    ------------ ----------- ----------- --------------
  25 193.1.2.0   193.1.2.1    193.1.2.126 193.1.2.127            126
  27 193.1.2.128 193.1.2.129  193.1.2.158 193.1.2.159             30
  28 193.1.2.160 193.1.2.161  193.1.2.174 193.1.2.175             14
  28 193.1.2.176 193.1.2.177  193.1.2.190 193.1.2.191             14
  30 193.1.2.192 193.1.2.193  193.1.2.194 193.1.2.195              2
  30 193.1.2.196 193.1.2.197  193.1.2.198 193.1.2.199              2
  30 193.1.2.200 193.1.2.201  193.1.2.202 193.1.2.203              2
```
</Strong></details> 

# Quiz 5

## Network Information
- Current IP address 131.107.0.0/16
- Subnets required:  110
- Hosts per subnet: 280

## Please create for the client:
- Display the first five subnets ranges showing the following for each subnet:
  - Subnet address
  - Usable addresses
  - Broadcast address

<details><summary>Click for hint</summary><Strong> 

``` 
How many bits are required for the subnets required?
How many bits are required for the hosts/subnets
Create the new subnet mask
Workout your subnet ranges; 
  remember first address in the subnet is Subnet address and the last address is the Broadcast address   
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
   
```
Mask SubnetID      FirstValidIP  LastValidIP     BroadcastIP     HostsPerSubnet Subnet TotalSubnets
---- --------      ------------  -----------     -----------     -------------- ------ ------------
  23 131.107.0.0   131.107.0.1   131.107.1.254   131.107.1.255              510      1          128
  23 131.107.2.0   131.107.2.1   131.107.3.254   131.107.3.255              510      2          128
  23 131.107.4.0   131.107.4.1   131.107.5.254   131.107.5.255              510      3          128
  23 131.107.6.0   131.107.6.1   131.107.7.254   131.107.7.255              510      4          128
  23 131.107.8.0   131.107.8.1   131.107.9.254   131.107.9.255              510      5          128
```
</Strong></details> 

# Quiz 6

## Network Information
- Class C addresses 
  - 192.10.15.0/24
  - 192.10.16.0/24
  - 192.10.17.0/24
  - 192.10.18.0/24
  - 192.10.19.0/24
  - 192.10.20.0/24
  - 192.10.21.0/24
  - 192.10.22.0/24
  - 192.10.23.0/24
  - 192.10.24.0/24
  - 192.10.25.0/24
- Subnets required:  1 
- Hosts per subnet: 280
## Please create for the company:
- From the class C networks provided
- Create a supernet range that will allow 280 clients to be on one subnet

<details><summary>Click for hint</summary><Strong> 

``` 
Determine how many host bits would be required to make a single subnet of 280 hosts
You need to reduce the /24 mask so that multiple networks can be supernetted as on subnet
The number of bit you are subtracting will also tell you haw many /24 networks you need
Remember that the bits you are subtracting must:
  start with 0's in the first network 
    and 
  end in 1's in the last network
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
   
```
192.168.16.0/23 
  (This combines 192.168.16.0 and 192.168.17.0)
  
  or these also would work
    192.168.18.0/23 or 192.168.20.0/23 or 192.168.22.0/23 or 192.168.24.0/23  
```
</Strong></details> 

# Quiz 7

## Network Information
- Current IP address 222.0.0.0/24
- Subnets required:  30
- Hosts per subnet: 6

## Please create for the client:
- Display the six subnets ranges showing the following for each subnet:
  - Subnet address
  - Usable addresses
  - Broadcast address

<details><summary>Click for hint</summary><Strong> 

``` 
How many bits are required for the subnets required?
How many bits are required for the hosts/subnets
Create the new subnet mask
Workout your subnet ranges; 
  remember first address in the subnet is Subnet address and the last address is the Broadcast address   
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
   
```
Mask SubnetID    FirstValidIP LastValidIP BroadcastIP HostsPerSubnet Subnet TotalSubnets
---- --------    ------------ ----------- ----------- -------------- ------ ------------
  29 222.0.0.0   222.0.0.1    222.0.0.6   222.0.0.7                6      1           32
  29 222.0.0.8   222.0.0.9    222.0.0.14  222.0.0.15               6      2           32
  29 222.0.0.16  222.0.0.17   222.0.0.22  222.0.0.23               6      3           32
  29 222.0.0.24  222.0.0.25   222.0.0.30  222.0.0.31               6      4           32
  29 222.0.0.32  222.0.0.33   222.0.0.38  222.0.0.39               6      5           32
  29 222.0.0.40  222.0.0.41   222.0.0.46  222.0.0.47               6      6           32
```
  
</Strong></details> 

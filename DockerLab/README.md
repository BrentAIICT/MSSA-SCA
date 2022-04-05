# Prep Windows for containers
- Start the AZ-040 lab from LearnOnDemand.net
- Login to the server LON-SVR1 as Administrator
- Run a PowerShell Console "As Administrator"
- Run all of the following commands in the PowerShell Console
- Answer **Y** to and prompts to proceed for any of these steps
<br>
<!--
  This lab was written with help from these sites
  https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server#install-docker
  https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server
  https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/run-your-first-container
  https://hub.docker.com/_/microsoft-windows-servercore-iis
-->

## From LON-SVR1 - Set the TLS version to be 1.2
```PowerShell
# Set the TLS version used by the PowerShell client to TLS 1.2.
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
```

## From LON-SVR1 - Install the Docker-Microsoft PackageManagement Provider
- The provider enables the containers feature in Windows and installs the Docker engine and client
```PowerShell
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
```

## From LON-SVR1 - Install the latest version of Docker
- Use the PackageManagement PowerShell module to install the latest version of Docker.
```PowerShell
Install-Package -Name docker -ProviderName DockerMsftProvider
```

## From LON-SVR1 - Restart the computer

```PowerShell
Restart-Computer -Force
```

# Run your first Windows container

## From LON-SVR1 - Set the TLS version to be 1.2
- You will need to log on to the LON-SVR1 machine after the restart
```PowerShell
# Set the TLS version used by the PowerShell client to TLS 1.2.
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
```


## From LON-SVR1 - Download and install the base image
- All containers are created from container images. 
- This procedures pulls the image **mcr.microsoft.com/windows/servercore/iis** from a Container Registry (like  Docker Hub) to your local machine
```PowerShell
docker pull mcr.microsoft.com/windows/servercore/iis
```
> This will probably take 10-15 minutes to complete

## From LON-SVR1 - Querying your local docker image repository

```PowerShell
docker images
```

## From LON-SVR1 - Run the windows container
- This next command will start the container running in the background
- With port 80 on the local machine mapped to port 80 in the container
- Windows uses a NAT IP address to connect to the container
```PowerShell
$ContainerID = docker run -dit -p 80:80 mcr.microsoft.com/windows/servercore/iis
```

> *Record the first six characters of the running container, called the container ID*

## From LON-SVR1 - Check the container is running
- Check to see if the container is running
```PowerShell
docker ps
```

## From LON-SVR1 - Find the IP to access the container
- This next command finds the NAT IP address that the docker container uses to alloe access to the container
> when typing this next command remember to replace ContinerID with the 6 characters recorded earlier
```PowerShell
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $ContainerID
```

>*Take note of the IP Address of the container*

## From LON-SRV1 - Access the IIS web site on the container

> Open a web browser and type the ipaddress of the container into the address bar <br>
> The default IIS web site should appear

## From LON-SVR1 - Stop the container 

> when typing this next command remember to replace ContinerID with the 6 characters recorded earlier
```PowerShell
Docker stop $ContainerID
```

## From LON-SRV1 - Try accessing the web site again

- This should no longer work as we have stopped the container from running
> Open a web browser and type the ipaddress of the container into the address bar <br>
> The browser will **fail** to locate the web site now

## Congratulations you have successfully deployed a container!

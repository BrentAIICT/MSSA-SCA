# Prep Windows for containers
- Run all of the following commands from the PowerShell Console
- Answer **y** to and prompts to proceed for any of these steps
<br>
<!--
This lab was written with help from these sites
https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server
https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/run-your-first-container
https://hub.docker.com/_/microsoft-windows-servercore-iis
-->

## Set the TLS version to be 1.2
```
# Set the TLS version used by the PowerShell client to TLS 1.2.
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
```

## Install the Docker-Microsoft PackageManagement Provider
- The provider enables the containers feature in Windows and installs the Docker engine and client
```
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
```

## Install the latest version of Docker
- Use the PackageManagement PowerShell module to install the latest version of Docker.
```
Install-Package -Name docker -ProviderName DockerMsftProvider
```

## Restart the computer

```
Restart-Computer -Force
```

# Run your first Windows container

## Set the TLS version to be 1.2
```
# Set the TLS version used by the PowerShell client to TLS 1.2.
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
```


## Download and install the base image
- All containers are created from container images. 
- This procedures pulls the image **mcr.microsoft.com/windows/servercore/iis** from a Container Registry (like  Docker Hub) to your local machine
```
docker pull mcr.microsoft.com/windows/servercore/iis
```
> This will probably take 10 minutes to finish

## Querying your local docker image repository

```
docker images
```

## Run the windows container
- This next command will start the container running in the background
- With port 80 on the local machine mapped to port 80 in the container
- Windows uses a NAT IP address to connect to the container
```
docker run -dit -p 80:80 mcr.microsoft.com/windows/servercore/iis
```

> *Record the first six characters of the running container, called the container ID*

## Check the container is running
- Check to see if the container is running
```
docker ps
```

## Find the IP to access the container
- This next command finds the NAT IP address that the docker container uses to alloe access to the container
> when typing this next command remember to replace ContinerID with the 6 characters recorded earlier
```
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" ContainerID
```

>*Take note of the IP Address of the container*

## Access the IIS web site on the container

> Open a web browser and type the ipaddress of the container into the address bar <br>
> The default IIS web site should appear

## Stop the container and try accessing the web site again

> when typing this next command remember to replace ContinerID with the 6 characters recorded earlier
```
Docker stop ContainerID
```
- This should no longer work as we have stopped the container from running
> Open a web browser and type the ipaddress of the container into the address bar <br>
> The browser will fail to locate the web site now

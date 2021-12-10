# Prep Windows for containers

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

```
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
```

## Install the latest version of Docker

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

```
docker pull mcr.microsoft.com/windows/servercore/iis
```
> This will probably take 10 minutes to finish

## Querying your local docker image repository

```
docker images
```

## Run the windows container

```
docker run -dit -p 80:80 mcr.microsoft.com/windows/servercore/iis
```

> *Record the first six characters of the running container, called the container ID*

## Check the container is running

```
docker ps
```

## Find the IP to access the container

> when typing this next command remember to replace ContinerID with the 6 characters recorded earlier
```
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" ContainerID
```

>*Take note of the IP Address of the container*

## Access the IIS web site on the container

> Open a web browser and type the ipaddress of the container into the address bar <br>
> The blue geeting default IIS web site should appear

## Stop the container and try accessing the web site again

> when typing this next command remember to replace ContinerID with the 6 characters recorded earlier
```
Docker stop ContainerID
```

> Open a web browser and type the ipaddress of the container into the address bar <br>
> The browser will fail to locate the web site now

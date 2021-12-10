# Prep Windows for containers

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

## Download and install the base image

```
docker pull mcr.microsoft.com/windows/servercore/iis
```

## Querying your local docker image repository

```
docker images
```

## Run the windows container

```
docker run -dit -p 80:80 mcr.microsoft.com/windows/servercore/iis
```

> *Take note of the first six characters of the running container, called the container ID*

## Check the container is running

```
docker ps
```

## Find the IP to access the container

```
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" *\<Container ID\>*
```

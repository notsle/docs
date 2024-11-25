---
layout: post
title: 'Docker'
date: '2023-10-11 12:00:00 -0400'
categories: [docker,it,install]
tags: [docker,devops]
sidebar_label: 'Install Docker on Windows Server'
sidebar_position: 3
---

## INSTALL DOCKER ON Windows 2019, Windows 2022 Server
:::danger 
The below steps will install required Windows features. Running this **WILL REBOOT** the server automatically. After reboot, you must sign in with the same user to finish the install.  Please ensure all users are signed out of the server before proceeding.
:::

:::info
Be aware that any anti-virus can interfere with the installation of docker or the downloading of containers (i.e.: Acronis). If issues arise, we recommend turning off live scanning of `C:\ProgramData\docker` specifically, and when possible temporarily disabling anti-virus tools during install.
:::

In an Administrator Powershell window: 
(From [Microsoft.com](https://learn.microsoft.com/en-us/virtualization/windowscontainers/quick-start/set-up-environment?tabs=dockerce#windows-server-1))
1. Run Docker install powershell script from Microsoft:
  ```powershell
  $ProgressPreference = 'SilentlyContinue'
  Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/microsoft/Windows-Containers/Main/helpful_tools/Install-DockerCE/install-docker-ce.ps1" -o install-docker-ce.ps1
  .\install-docker-ce.ps1
  ```

  <small>in some cases TLS1.2 is not enabled,  run `[Net.ServicePointManager]::SecurityProtocol =[Net.SecurityProtocolType]::Tls12` before the above commands to enable it</small>

2. Download Docker-Compose from Docker

  The Windows version of docker does not include docker-compose. This must be installed separately. 
  ```powershell
  cd (Split-Path (Get-Command docker).Path)
  $ProgressPreference = 'SilentlyContinue'
  Invoke-WebRequest "https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-windows-x86_64.exe" -UseBasicParsing -OutFile docker-compose.exe
  ```
3. Confirm Docker installed successfully

  To confirm docker is installed properly. run the official `hello-world` container

  ```powershell
  docker run hello-world
  ```

  If successful, you should see...

  ```powershell
  PS C:\Windows\system32> docker run hello-world
  Unable to find image 'hello-world:latest' locally
  latest: Pulling from library/hello-world
  fff54800e037: Pull complete
  365b066dfa8d: Pull complete
  6f16e5b22025: Pull complete
  Digest: sha256:88ec0acaa3ec199d3b7eaf73588f4518c25f9d34f58ce9a0df68429c5af48e8d
  Status: Downloaded newer image for hello-world:latest

  Hello from Docker!
  This message shows that your installation appears to be working correctly.

  To generate this message, Docker took the following steps:
    1. The Docker client contacted the Docker daemon.
    2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
        (windows-amd64, nanoserver-ltsc2022)
    3. The Docker daemon created a new container from that image which runs the
        executable that produces the output you are currently reading.
    4. The Docker daemon streamed that output to the Docker client, which sent it
        to your terminal.

  To try something more ambitious, you can run a Windows Server container with:
  PS C:\> docker run -it mcr.microsoft.com/windows/servercore:ltsc2022 powershell

  Share images, automate workflows, and more with a free Docker ID:
  https://hub.docker.com/

  For more examples and ideas, visit:
  https://docs.docker.com/get-started/

  PS C:\Windows\system32>
  ```
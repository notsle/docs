<!-- ---
title: 'Install Docker Linux OS'
categories: [docker,it,install]
tags: [docker,devops,linux,deploy]
sidebar_label: 'Install Docker Linux OS'
sidebar_position: 3
--- -->

## INSTALL DOCKER CE

### LINUX

If running Debian, Ubuntu, Rasbian, CentOS, Redhat Enterprise Linux, or OpenSuse, you can use the below scripts to install docker. If using another distrabution, refer to your OS documentation on installing docker. 

1. This will install Docker using your OS package manager, which will allow for simple upgrades in the future. 
  ```bash
  # install official docker engine and cli
  wget -qO- https://get.docker.com/ | sudo sh

  # Add your user to the docker group
  sudo usermod -aG docker $USER
  ```

2. To confirm docker is installed properly. run the official `hello-world` container

  ```bash
  sudo docker run hello-world
  ```

  If successful, you should see...
  ```bash
  sudo docker run hello-world
  Unable to find image 'hello-world:latest' locally
  latest: Pulling from library/hello-world
  719385e32844: Pull complete
  Digest: sha256:88ec0acaa3ec199d3b7eaf73588f4518c25f9d34f58ce9a0df68429c5af48e8d
  Status: Downloaded newer image for hello-world:latest

  Hello from Docker!
  This message shows that your installation appears to be working correctly.

  To generate this message, Docker took the following steps:
  1. The Docker client contacted the Docker daemon.
  2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
      (amd64)
  3. The Docker daemon created a new container from that image which runs the
      executable that produces the output you are currently reading.
  4. The Docker daemon streamed that output to the Docker client, which sent it
      to your terminal.

  To try something more ambitious, you can run an Ubuntu container with:
  $ docker run -it ubuntu bash

  Share images, automate workflows, and more with a free Docker ID:
  https://hub.docker.com/

  For more examples and ideas, visit:
  https://docs.docker.com/get-started/
  ```
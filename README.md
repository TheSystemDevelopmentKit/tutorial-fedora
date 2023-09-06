# Tutorial-Fedora Docker image

## Introduction
The purpose of this Docker image is to provide a self-containing Fedora Linux
playground for studies of TheSyDeKick and some other Open Source electroniccs 
desing tools. It provides a simple command line interface with X11 capabilities
and a elementary text editor (vim) for editing the files, all the needed software 
for running TheSyDeKick simulations with Open Source simulator tools, added with KiCAD 
electronics design software for drawing schematics and printed circuit boards.    

## How to install and run the image 
To use this Docker image you must have Docker installed in your host operating system.
 
### Default user and home directory
The default user in the docker image is 'procoder' and the setup is made and documented so that 
it uses home directory '/home/procoder'. Default password for the user is 'procoderpasswd'

### Prerequisites for installation
<details>
<summary>Linux</summary>

In Linux the installation is performed with command line assuming you have Docker installed and running.

</details>

<details>
<summary>Windows</summary>

On Windows, you need Windows Subsystem for Linux. Installation instructions are here: https://learn.microsoft.com/en-us/windows/wsl/install
Default Ubuntu and basic settings should work.

You also need Docker Desktop, installation and download instructions here: https://docs.docker.com/desktop/install/windows-install/

After both are installed, open a new Powershell window and start WSL with the command `wsl`.
 
</details>

<details>
<summary>macOS</summary>

On MacOS, you need docker as well as socat and xquartz. The easiest way to install these is with Homebrew. Installation instructions for Homebrew are at: https://brew.sh .

After you have installed Homebrew, you can install the the aforementioned programs using the terminal:   
`brew install docker`  
`brew install socat`  
`brew install --cask xquartz`  

You MUST log out and back in after installing `xquartz`.
</details>

### Create Docker volume 'Filesystem'
To store your work, you need a persistent filesystem for your Docker image called 'Docker volume'.
Create it with

`docker volume create procoder-home`

Name 'procoder-home' refers to the home directory of the user 'procoder'.

To examine the existing volumes, use
`docker volume ls`
`docker volume inspect procoder-home`

To remove volumes you do not need, you can
`docker volume rm my-vol` (and you  will lose all data on that volume)

More information about volumes at [https://docs.docker.com/storage/volumes/](https://docs.docker.com/storage/volumes/)

### Pull and run the image
<details>
<summary>Linux and Windows (WSL)</summary>
	
#### For AMD/Intel processors (most machines):
	
```
docker pull ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest
docker run --device /dev/dri -it --rm --mount source=procoder-home,target=/home/procoder -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest xterm
```

#### For ARM64 processors:

```
docker pull ghcr.io/thesystemdevelopmentkit/tutorial-fedora-arm64:latest
docker run --device /dev/dri -it --rm --mount source=procoder-home,target=/home/procoder -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix ghcr.io/thesystemdevelopmentkit/tutorial-fedora-arm64:latest xterm
```

It should launch a new 'xterm' terminal. If the terminal for some reason freezes with the first run, use CTRL-C to abort the docker run, and re-run it. Helped for me at least.
In arm64 architectures you receive and permisison error, that currently remains to unsolved. However, it does not seem to affect anything.

</details>

<details>
<summary>macOS</summary>

#### For Intel processors (Macs introduced before 2020):
```
docker pull ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest
```
Open a new terminal window (⌘-N) for socat:
```
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
```
Start the Docker-image (in the original window):
```
docker run  --rm --mount source=procoder-home,target=/home/procoder -e DISPLAY=docker.for.mac.host.internal:0 -v /tmp/.X11-unix:/tmp/.X11-unix ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest xterm
```

#### For ARM64 processors (Apple Silicon, Macs introduced 2020 or later):
```
docker pull ghcr.io/thesystemdevelopmentkit/tutorial-fedora:arm64-latest
```
Open a new terminal window (⌘-N) for socat:
```
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
```
Start the Docker-image (in the original window):
```
docker run  --rm --mount source=procoder-home,target=/home/procoder -e DISPLAY=docker.for.mac.host.internal:0 -v /tmp/.X11-unix:/tmp/.X11-unix ghcr.io/thesystemdevelopmentkit/tutorial-fedora:arm64-latest xterm
```
It should launch a new 'xterm' terminal. If the terminal for some reason freezes with the first run, use CTRL-C to abort the docker run, and re-run it. Helped for me at least.
In arm64 architectures you receive and permisison error, that currently remains to unsolved. HOwever, it does not seem to affect anything.
</details>

## Cleaning up docker builds and images
https://kenanbek.medium.com/docker-cleanup-build-and-force-to-rebuild-images-containers-volumes-and-networks-dc70fd4ccec0
`docker system prune -a`




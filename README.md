# Tutorial-Fedora Docker image

## Introduction
The purpose of this Docker image is to provide a self-containing Fedora Linux
playground for studies of TheSyDeKick and some other Open Source electroniccs 
desing tools. It provides a simple command line interface with X11 capabilities
and a elementary text editor (vim) for editing the files, all the needed software 
for running TheSyDeKick simulations with Open Source simulator tools, added with KiCAD 
electronics design software for drawing schematics and printed circuit boards.    

## How to install and run the image 
To use tutorial fedora docker you  must have

  1. Github account at [https://github.com](https://github.com)
  2. Personal Access token (classic in this case) with at least 'read' permissions for
     packages as instructed at [https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic).
     Use your considerations if you wish to add more access rights to the token. REMEMBER TO STORE THE TOKEN preferably safely. 
  4. Docker installed in your host operating system.

### Default user and home directory
The default user in the docker image is 'procoder' and the setup is made and documented so that 
it uses home directory '/home/proceder'. Default password for the user is 'procoderpasswd'

### Linux
Although it does not mae much sense to use Linux docker image inside Linux,
here are the instructions. All the commands given below are assumed to be ran on command line.

#### Create Docker volume 'Filesystem'
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

#### Pull and run the image
Login to github package registry with your personal access token (stored in this case to ./TOKEN.txt 
file)
```
cat TOKEN.txt | docker login ghcr.io --username <YOUR_USERNAME> --password-stdin

docker pull ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest

docker run --device /dev/dri -it --rm --mount source=procoder-home,target=/home/procoder -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest xterm
```

It should launch a new 'xterm' terminal. If the terminal for some reason freezes with the first run, use CTRL-C to abort the docker run, and re-run it. Helped for me at least.

### Windows
#### Create Docker volume 'Filesystem'
TBD
#### Pull and run the image
TBD


### MacOS
#### Create Docker volume 'Filesystem'
TBD
#### Pull and run the image
TBD

## Cleaning up docker builds and images
### Linux
https://kenanbek.medium.com/docker-cleanup-build-and-force-to-rebuild-images-containers-volumes-and-networks-dc70fd4ccec0
`docker system prune -a`

### Windows

### MacOS



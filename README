# Setup.
Great instructions setting up Docker for X11 applications is here
https://blog.yadutaf.fr/2017/09/10/running-a-graphical-app-in-a-docker-container-on-a-remote-server

No remote server needed, we just want to run an Xterm
Launch it with 
`docker run -it --rm -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix
course/fedora-36:latest xterm `

# Mounting volumes
https://docs.docker.com/storage/volumes/


# Cleaning up docker builds and images
https://kenanbek.medium.com/docker-cleanup-build-and-force-to-rebuild-images-containers-volumes-and-networks-dc70fd4ccec0

`docker system prune -a`


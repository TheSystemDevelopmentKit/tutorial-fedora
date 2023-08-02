# Building a Docker image

The contents of the image is defined with Dockerfile.

Build it in the directory containing the Dockerfile with
`docker build .`

Useful commands for building

```
cat ~/.gnupg/Github_token.txt | docker login ghcr.io --username mkosunen --password-stdin
docker build -t ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest .
docker push -t ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest
docker pull  ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest
docker run --device /dev/dri -it --rm --mount source=procoder-home,target=/home/procoder -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix  ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest xterm
```



To build it to be a container registry of a project for Gitlab
```
docker login registry.gitlab.com
docker build -t <server>/<group>/<project> .
docker push <server>/<group>/<project>
```

For this project, the build and update process is automated with CI-procedure controlled with .github/workflows/main.yaml file.

## Setup for X11 applications.
Great instructions setting up Docker for X11 applications is here
https://blog.yadutaf.fr/2017/09/10/running-a-graphical-app-in-a-docker-container-on-a-remote-server

### Random notes
Using container registry in Gitlab
==================================
At minimum, you need a .gitlab-ci.yaml file. This example builds
documentation. (The contents of the 'pages' pipeline is assumed to be in directory 'pubic').
```
default:
  image: registry.gitlab.com/coursegit/exercise_manager:latest
      # We could build an image registry with the dependencies installed.
      #registry.gitlab.com/a-core/a-core_thesydekick/thesydekick-docs-build:main

pages:
  stage: deploy
  script:
      - ./CI-helpers/build_docs.sh -c -m "$(pwd)" 

  artifacts:
    paths:
      - public

  only:
      - master
```


Building a Docker image
=======================

The contents of the image is defined with Dockerfile.

Build it in the directory containing the Dockerfile with
`docker build .`

To build it to be a container registry of a project gfo Gitlab
```
docker login registry.gitlab.com
docker build -t <server>/<group>/<project> .
docker push <server>/<group>/<project>
```

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




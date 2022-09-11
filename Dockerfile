FROM fedora:36
# Needed for mosaic_BAG documentation CI builds
RUN  dnf -y install tcsh make git python3 python3-pip python3-sphinx


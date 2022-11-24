#!/usr/bin/env bash

for module in "PyYaml \
    numpy \
    scipy \
    h5py \
    zmq \
    shapely \
    rtree \
    future \
    jinja2 \
    IPython \
    openmdao \
    sphinx_rtd_theme \
    python-gitlab \
    "; do
    pip3 install --user $module
done
exit 0


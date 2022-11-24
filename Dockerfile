#############################################################################
# Docker image for running OS simulation and buiild environemnts inteaching
#
# Initialized by Marko Kosunen 20221123, marko.kosunen@aalto.fi 
#############################################################################
FROM fedora:36
RUN dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-36.noarch.rpm
RUN dnf -y install hostname pciutils qt qt-x11 qt5-qtbase qt5-qtwayland qt6-qtbase qt6-qtwayland
RUN dnf install -y xorg-x11-drv-intel xorg-x11-drv-ati
RUN dnf install -y libva-intel-driver.x86_64 libva-intel-driver.i686 libva-intel-hybrid-driver intel-gpu-firmware 
#RUN dnf -y install mesa-libGL mesa-libGL*
#RUN dnf -y install libdrm mesa-dri-drivers.i686 mesa-dri-drivers.x86_64 
RUN dnf -y install tcsh xterm make git screen vim-X11 
RUN dnf -y install ngspice iverilog 
RUN dnf -y install python3 python3-pip python3-sphinx 
RUN mkdir -p /root/.local/bin
RUN export PATH=${PATH}:/root/.local:/root/.local/bin
RUN for module in "PyYaml  numpy  scipy  h5py  wheel zmq  shapely  rtree  future  jinja2  IPython  openmdao  sphinx_rtd_theme  python-gitlab  "; do pip3 install $module; done
RUN useradd -ms /bin/tcsh procoder
USER procoder
WORKDIR /home/procoder



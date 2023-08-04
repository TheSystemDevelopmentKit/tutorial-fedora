#############################################################################
# Docker image for running OS simulation and build environemnts for teaching
#
# Initialized by Marko Kosunen 20221123, marko.kosunen@aalto.fi 
#############################################################################
#FROM fedora:36
# Use thesdk testimage as basis as it has all Thesdkdependencies already.
FROM ghcr.io/thesystemdevelopmentkit/thesdktestimage:latest
RUN sed -i '/tsflags=nodocs/d' /etc/dnf/dnf.conf
RUN dnf install -y man-pages man-db coreutils-common coreutils
RUN dnf reinstall -y man-pages man-db coreutils-common coreutils
# Software installations from repositories
RUN dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-36.noarch.rpm
RUN dnf -y install hostname pciutils xrdb qt qt-x11 qt5-qtbase qt5-qtwayland qt6-qtbase qt6-qtwayland
RUN dnf install -y xorg-x11-drv-intel xorg-x11-drv-ati
RUN dnf install -y libva-intel-driver.x86_64 libva-intel-driver.i686 libva-intel-hybrid-driver intel-gpu-firmware 
#RUN dnf -y install mesa-libGL mesa-libGL*
#RUN dnf -y install libdrm mesa-dri-drivers.i686 mesa-dri-drivers.x86_64 
RUN dnf install -y tcsh xterm make screen vim-X11 emacs wget gcc-gnat
RUN dnf -y install kicad okular evince
RUN mkdir -p /root/.local/bin
RUN export PATH=${PATH}:/root/.local:/root/.local/bin
# Add user default setup files
ADD --chown=root:root ./etc/skel/.cshrc /etc/skel/.cshrc
ADD --chown=root:root ./etc/skel/.ctags /etc/skel/.ctags
ADD --chown=root:root ./etc/skel/.login /etc/skel/.login
ADD --chown=root:root ./etc/skel/.screenrc /etc/skel/.screenrc
ADD --chown=root:root ./etc/skel/.vimrc /etc/skel/.vimrc
ADD --chown=root:root ./etc/skel/xfexinitrc /etc/skel/xfexinitrc
ADD --chown=root:root ./etc/skel/.Xresources /etc/skel/.Xresources
ADD --chown=root:root ./etc/skel/Xresources.desktop /etc/skel/Xresources.desktop
RUN useradd -ms /bin/tcsh procoder

# At his point we are ready for TheSDK and KiCAD

# Let's install Xschem
#RUN dnf -y install tk-devel libXpm-devel flex bison
#RUN git clone https://github.com/StefanSchippers/xschem.git
#RUN cd xschem && git checkout 3.4.2 && ./configure && make && \
#make install && cd ../ && rm -rf ./xschem
# Let's install open pdk's
#RUN dnf -y install magic magic-doc python3-chardet
#RUN git clone git://opencircuitdesign.com/open_pdks
#RUN cd open_pdks/ && git checkout 1.0.425 && ./configure --enable-sky130-pdk --enable-sram-sky130 --prefix /usr/local/open-sky130 && make && make install && cd .. && rm -rf open-pdks

USER procoder
WORKDIR /home/procoder


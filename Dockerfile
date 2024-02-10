#############################################################################
# Docker image for running OS simulation and build environemnts for teaching
#
# Initialized by Marko Kosunen 20221123, marko.kosunen@aalto.fi 
#############################################################################
# Use thesdk testimage as basis as it has all Thesdkdependencies already.
FROM ghcr.io/thesystemdevelopmentkit/thesdktestimage:latest
RUN echo "fastestmirror=True" >> /etc/dnf/dnf.conf
RUN sed -i '/tsflags=nodocs/d' /etc/dnf/dnf.conf
RUN dnf install -y man-pages man-db coreutils-common coreutils
RUN dnf reinstall -y man-pages man-db coreutils-common coreutils
# Software installations from repositories
RUN dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-38.noarch.rpm
RUN dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-38.noarch.rpm
RUN dnf -y install hostname pciutils xrdb qt qt-x11 qt5-qtbase qt5-qtwayland qt6-qtbase qt6-qtwayland
RUN dnf install -y xorg-x11-drivers
RUN dnf -y install libdrm mesa-dri-drivers.i686 mesa-dri-drivers.x86_64 
RUN dnf install -y libva-intel-driver.x86_64 libva-intel-driver.i686 libva-intel-hybrid-driver intel-gpu-firmware 
RUN dnf install -y tcsh xterm make screen xsel vim-X11 emacs wget gcc-gnat git-core git-core-doc git-subtree firefox
RUN dnf -y install kicad okular evince gtkwave spectacle xv
RUN dnf -y install passwd 
RUN dnf -y install x11vnc net-tools openssl tigervnc tigervnc-server
RUN dnf -y group install  "LXQt Desktop"
# config lxqt
#RUN mkdir -p /etc/skel/.config/lxqt && \
#    echo '[General]\n\
#__userfile__=true\n\
#icon_theme=Adwaita\n\
#single_click_activate=false\n\
#theme=ambiance\n\
#tool_button_style=ToolButtonTextBesideIcon\n\
#\n\
#[Qt]\n\
#doubleClickInterval=400\n\
#font="Sans,11,-1,5,50,0,0,0,0,0"\n\
#style=Fusion\n\
#wheelScrollLines=3\n\
#' >/etc/skel/.config/lxqt/lxqt.conf && \
#    echo '[General]\n\
#__userfile__=true\n\
#[Environment]\n\
#TERM=term\n\
#' >/etc/skel/.config/lxqt/session.conf
#
#RUN mkdir -p /etc/xdg/lxqt && echo '[quicklaunch]\n\
#alignment=Left\n\
#apps\\1\desktop=/usr/share/applications/pcmanfm-qt.desktop\n\
#apps\\2\desktop=/usr/share/applications/qterminal.desktop\n\
#apps\\3\desktop=/usr/share/applications/juffed.desktop\n\
#apps\size=3\n\
#type=quicklaunch\n\
#' >> /etc/xdg/lxqt/panel.conf


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
ADD --chown=root:root ./xstartup /etc/skel/xstartup
ADD --chown=root:root ./entrypoint.sh /etc/entrypoint.sh

#Add passwd just to have something if asked.
RUN useradd -ms /bin/tcsh procoder && echo procoderpasswd | passwd procoder --stdin
ENV DISPLAY :20
EXPOSE 5920

# At his point we are ready with TheSDK and KiCAD

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



#!/bin/bash
export DISPLAY=:20
vncserver $DISPLAY -depth 24 -geometry $VNC_GEOMETRY -localhost no -fg -xstartup ${HOME}/.vnc/xstartup


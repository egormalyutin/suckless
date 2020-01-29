#!/bin/bash
devmon &
start-pulseaudio-x11 &
export _JAVA_AWT_WM_NONREPARENTING=1
exec /usr/local/bin/dwm
# exec /usr/bin/compiz

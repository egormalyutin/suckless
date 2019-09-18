#!/bin/bash

Xephyr -screen 1000x600 :80 &
sleep 1

DISPLAY=:80 ./dwm &
DISPLAY=:80 ./bar.sh

killall Xephyr

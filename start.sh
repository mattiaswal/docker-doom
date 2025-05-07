#!/bin/bash
Xorg -noreset -config /etc/X11/xorg.conf :0 &
sleep 10
export DISPLAY=:0
xset s off
xset -dpms
xset s noblank
DISPLAY=:0 freedm  -geometry $(xrandr | grep current | awk '{print $8"x"$10}')

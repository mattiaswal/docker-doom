#!/bin/sh
sleep 2
export DISPLAY=:0
xset s off
xset -dpms
xset s noblank
DISPLAY=:0 freedm  -geometry $(xrandr | grep current | awk '{print $8"x"$10}')


#!/bin/sh
xrandr \
  --output DP-0 --off \
  --output DP-1 --off \
  --output HDMI-0 --mode 1920x1080 --pos 4480x0 --rotate left \
  --output DP-2 --mode 1920x1080 --pos 0x840 --rotate normal \
  --output DP-3 --mode 2560x1440 --pos 1920x480 --rotate normal \
  --output DP-4 --off

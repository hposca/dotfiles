#!/bin/sh

echo "First attempt..."
xrandr \
	--output eDP --primary --mode 1920x1200 --pos 0x720 --rotate normal \
	--output HDMI-A-0 --off \
	--output DisplayPort-0 --off \
	--output DisplayPort-1 --off \
	--output DisplayPort-2 --off \
	--output DisplayPort-3 --off \
	--output DisplayPort-4 --off \
	--output DisplayPort-5 --off \
	--output DisplayPort-6 --off \
	--output DisplayPort-7 --off \
	--output DisplayPort-8 --off \
	--output DisplayPort-9 --mode 2560x1440 --pos 1920x480 --rotate normal \
	--output DisplayPort-10 --mode 1920x1080 --pos 4480x0 --rotate left ||
	true

echo "Second attempt..."
xrandr \
	--output eDP --primary --mode 1920x1200 --pos 0x720 --rotate normal \
	--output HDMI-A-0 --off \
	--output DisplayPort-0 --off \
	--output DisplayPort-1 --off \
	--output DisplayPort-2 --off \
	--output DisplayPort-3 --off \
	--output DisplayPort-4 --off \
	--output DisplayPort-5 --off \
	--output DisplayPort-6 --off \
	--output DisplayPort-7 --mode 2560x1440 --pos 1920x480 --rotate normal \
	--output DisplayPort-8 --mode 1920x1080 --pos 4480x0 --rotate left ||
	true

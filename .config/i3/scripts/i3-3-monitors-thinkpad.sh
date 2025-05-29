#!/usr/bin/env bash

declare -A primary=(["mode"]="1920x1200" ["pos"]="0x720" ["rotate"]="normal")
declare -A normal=(["mode"]="2560x1440" ["pos"]="1920x480" ["rotate"]="normal")
declare -A left=(["mode"]="1920x1080" ["pos"]="4480x0" ["rotate"]="left")

connected=$(xrandr --query | grep " connected" | cut -d" " -f1 | grep -i DisplayPort)
IFS=$'\n' read -r -d '' -a ports <<<"$connected"

xrandr \
	--output eDP --primary --mode "${primary["mode"]}" --pos "${primary["pos"]}" --rotate "${primary["rotate"]}" \
	--output "${ports[0]}" --mode "${normal["mode"]}" --pos "${normal["pos"]}" --rotate "${normal["rotate"]}" \
	--output "${ports[1]}" --mode "${left["mode"]}" --pos "${left["pos"]}" --rotate "${left["rotate"]}"

nohup feh --bg-fill /usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png &>/dev/null

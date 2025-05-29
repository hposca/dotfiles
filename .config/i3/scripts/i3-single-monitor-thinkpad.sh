#!/usr/bin/env bash

declare -A primary=(["mode"]="1920x1200" ["pos"]="0x0" ["rotate"]="normal")

connected=$(xrandr --query | grep " connected" | cut -d" " -f1 | grep -i DisplayPort)
IFS=$'\n' read -r -d '' -a ports <<<"$connected"

if [ ${#ports[@]} -eq 0 ]; then
	xrandr \
		--output eDP --primary --mode "${primary["mode"]}" --pos "${primary["pos"]}" --rotate "${primary["rotate"]}"
else
	xrandr \
		--output eDP --primary --mode "${primary["mode"]}" --pos "${primary["pos"]}" --rotate "${primary["rotate"]}" \
		--output "${ports[0]}" --off \
		--output "${ports[1]}" --off
fi

nohup feh --bg-fill /usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png &>/dev/null

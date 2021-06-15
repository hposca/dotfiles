#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch example bar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example 2>&1 | tee -a /tmp/polybarexample-$m.log & disown
  done
else
  echo "---" | tee -a /tmp/polybarexample.log
  polybar --reload example 2>&1 | tee -a /tmp/polybarexample.log & disown
fi

echo "Bars launched..."

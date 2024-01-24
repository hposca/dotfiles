#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch bars
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [[ m -eq "HDMI-0" ]]; then
      MONITOR=$m polybar --reload bottom 2>&1 | tee -a /tmp/polybarbottom-$m.log &
      disown
    else
      MONITOR=$m polybar --reload main 2>&1 | tee -a /tmp/polybarmain-$m.log &
      disown
    fi
  done
else
  echo "---" | tee -a /tmp/polybarmain.log
  polybar --reload main 2>&1 | tee -a /tmp/polybarmain.log &
  disown
fi

echo "Bars launched..."

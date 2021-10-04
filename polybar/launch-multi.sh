#!/usr/bin/env sh

## Add this to your wm startup file.

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -r -c ~/.config/polybar/config.ini workspaces & 
polybar -r -c ~/.config/polybar/config.ini window &
polybar -r -c ~/.config/polybar/config.ini time &
polybar -r -c ~/.config/polybar/config.ini power &
polybar -r -c ~/.config/polybar/config.ini system &

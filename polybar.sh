#! /usr/bin/bash
killall -q polybar
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -r bottombar & polybar -r bottombar-2 & polybar -r bottombar-3
polybar-msg cmd hide

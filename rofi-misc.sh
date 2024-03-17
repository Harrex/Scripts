#!/bin/bash
#rofi -modi power:rofi-power.sh -show power

# if [ x"$@" = x"quit" ]
# then
#     exit 0
# fi

case x"$@" in

  x"monitor vertical")
    echo "source = ~/.config/hypr/monitors-vertical.conf" > ~/.config/hypr/monitors.conf
    exit 0
    ;;

  x"monitor horizontal")
    echo "source = ~/.config/hypr/monitors-horizontal.conf" > ~/.config/hypr/monitors.conf
    exit 0
    ;;

esac

for option in "monitor vertical" "monitor horizontal"
do
  echo $option
done

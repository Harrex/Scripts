#!/bin/bash
#rofi -modi power:rofi-power.sh -show power

# if [ x"$@" = x"quit" ]
# then
#     exit 0
# fi

case x"$@" in

  x"reboot")
    reboot
    exit 0
    ;;

  x"logout")
      pkill -u $(whoami)
    exit 0
  ;;

  x"shutdown")
    shutdown now
    exit 0
    ;;

  x"suspend")
    systemctl suspend
    exit 0
    ;;

  

esac

for option in suspend reboot logout shutdown
do
  echo $option
done

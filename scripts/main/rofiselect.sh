#!/bin/bash

selected=$(echo "logout
list phone
mount phone
unmount phone
mount storage
shutdown
reboot
Nill" | rofi -dmenu -p "Script To run" )

#echo You Picked: " $selected"

if [ "$selected" == "logout" ]; then
       sudo pkill -KILL -u rajatv
elif [ "$selected" == "shutdown" ]; then
       shutdownnow
elif [ "$selected" == "reboot" ]; then
       reboot
elif [ "$selected" == "mount storage" ];then
       /home/rajatv/mysetup/scripts/mountntfs.sh
elif [ "$selected" == "mount phone" ];then
	simple-mtpfs --device 1 ~/phone/
elif [ "$selected" == "list phone" ];then
	simple-mtpfs -l
elif [ "$selected" == "unmount phone" ];then
       echo Logout
fi

#if ["$selected" == ""];then
#fi

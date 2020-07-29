#!/bin/bash

selected=$(echo "logout
list phone
mount phone
unmount phone | close all programs displaying or using phone
mount storage
shutdown
reboot
Nill" | rofi -dmenu -p "Script To run" )


if [ "$selected" == "logout" ]; then
	SUDO_ASKPASS=~/mysetup/scripts/main/askpass-rofi sudo -A pkill -KILL -u rajatv
elif [ "$selected" == "shutdown" ]; then
       shutdownnow
elif [ "$selected" == "reboot" ]; then
       reboot
elif [ "$selected" == "mount storage" ];then
	SUDO_ASKPASS=/home/rajatv/mysetup/scripts/main/askpass-rofi sudo -A /home/rajatv/mysetup/scripts/mountntfs.sh
elif [ "$selected" == "mount phone" ];then
	simple-mtpfs --device 1 /home/rajatv/phone/
elif [ "$selected" == "unmount phone | close all programs displaying or using phone" ];then
	fusermount -u /home/rajatv/phone/
elif [ "$selected" == "list phone" ];then
	# TODO : send this data to visual output like notify-send
	notify-send simple-mtpfs -l
elif [ "$selected" == "unmount phone" ];then
       echo Logout
fi


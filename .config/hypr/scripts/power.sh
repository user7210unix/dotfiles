#!/bin/sh

. ~/.config/hypr/scripts/vars.sh

p_exit="Exit ${WM_NAME}"
p_reboot="Reboot"
p_poweroff="Shutdown"
p_cancel="Cancel"

o_chose="$(echo "$p_cancel
$p_exit
$p_reboot
$p_poweroff" | eval "rofi ${ROFI_FLAGS} -dmenu -p 'Exit ${WM_NAME}?'")"

case "$o_chose" in
	"$p_exit")
		echo "Bye bye... T~T"
		hyprctl dispatch exit
	;;
	"$p_reboot")
		pkexec reboot
	;;
	"$p_poweroff")
		pkexec poweroff
	;;
	"$p_cancel")
		echo "Yay! You stayed! \\(^u^)/"
	;;
esac

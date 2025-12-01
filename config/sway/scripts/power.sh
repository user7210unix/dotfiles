#!/bin/sh

p_exit="Exit Sway"
p_reboot="Reboot"
p_poweroff="Shutdown"
p_cancel="Cancel"

o_chose="$(echo "$p_cancel\n$p_exit\n$p_reboot\n$p_poweroff" | rofi -dmenu -p 'Exit Sway?')"

case "$o_chose" in
    "$p_exit")
        echo "Bye bye... T~T"
        swaymsg exit
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

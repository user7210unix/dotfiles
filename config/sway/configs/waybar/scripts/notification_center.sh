#!/bin/sh

mode="$1"

cnotify () {
    notify-send -e -t 1200 -i bell "Notification Center" "$1"
}

case $mode in
    "toggle")
        sleep 0.1
        swaync-client -t & disown
    ;;
    "count")
        cnotify "There are $(swaync-client -c) notifications..."
    ;;
    "clear")
        swaync-client --close-all
        cnotify "Cleared all notifications!"
    ;;
esac

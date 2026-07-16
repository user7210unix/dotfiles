#!/bin/sh

launch_xdg_desktop_portal () {
    echo xdg-desktop-portal${1}
    /usr/libexec/xdg-desktop-portal${1} || /usr/lib/xdg-desktop-portal${1}
}

sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal-gtk
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal
sleep 1
launch_xdg_desktop_portal -hyprland &
sleep 2
launch_xdg_desktop_portal &

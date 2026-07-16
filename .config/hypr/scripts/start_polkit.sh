#!/bin/sh

. ~/.config/hypr/scripts/lib.sh

PATH=$PATH:/usr/libexec; export PATH

polkit_agent='xfce-polkit'

pick_new_polkit_agent () {
    if command -v lxsession; then
        polkit_agent='lxsession'
    fi
}

command -v "${polkit_agent}" || pick_new_polkit_agent

exec_once "${polkit_agent}" & disown

#!/bin/sh

PATH=$PATH:/usr/libexec; export PATH

polkit_agent='xfce-polkit'

pick_new_polkit_agent() {
    if command -v lxpolkit; then
        polkit_agent='lxpolkit'
    else
        notify-send "Polkit Error" "No polkit agent found (xfce-polkit or lxpolkit required)"
        exit 1
    fi
}

command -v "${polkit_agent}" || pick_new_polkit_agent

pkill -u $USER -x "${polkit_agent}"  # Ensure only one instance runs
"${polkit_agent}" & disown

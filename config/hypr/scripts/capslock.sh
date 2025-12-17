#!/bin/bash
if [[ $(hyprctl devices -j | jq -r '.keyboards[] | select(.main==true) | .capsLock') == "true" ]]; then
    echo "CAPS LOCK ON"
fi

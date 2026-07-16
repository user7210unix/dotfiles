#!/usr/bin/env bash

# Hyprland Screenshot Utility Script
#
# This script is made for OgloTheNerd's Hyprland rice (https://gitlab.com/Oglo12/hyprland-rice),
# but this script can also work on any Hyprland rice.
# The only requirements needed to use this script are the following commands:
# - grim
# - slurp
# - wl-copy
#
# (MODIFIED VERSION !! STRIPPED DOWN FOR THIS MINIMAL RICE)

notify_name="Screenshot Utility"

tmp_path="/tmp/hyprland_rice_screenshot_tool"
shot_path="$tmp_path/screenshot.png"

theme_id_for_cover_color="window-border"
cover_color_opacity_hex="50"
cover_color_hue_hex="83a598"
cover_color="#${cover_color_hue_hex}${cover_color_opacity_hex}"

notify_critical () {
    notify-send -u critical "$notify_name" "$1"
}

notify_normal () {
    notify-send "$notify_name" "$1"
}

die () {
    echo "$1    (T~T)" >&2
    notify_critical "$1"
    exit 1
}

cmd_depends=(
    "grim"
    "slurp"
    "wl-copy"
)

for i in ${cmd_depends[@]}; do
    if command -v $i > /dev/null 2>&1; then
        echo "$i - OK"
    else
        die "Command '$i' not found!"
    fi
done

[[ -d "$tmp_path" ]] || mkdir -p "$tmp_path" || die "Failed to create: '${tmp_path}'"

get_area () {
    slurp -c "#00000000" -b "$cover_color"
}

copy_to_clipboard () {
    cat "$shot_path" | wl-copy --type image/png
}

abort_screenshot () {
    notify_normal "Screenshot aborted!"
    exit 1
}

take_screenshot () {
    if [[ -f "$shot_path" ]]; then
        echo "Removing old temporary screenshot... '$shot_path'"
        rm "$shot_path" || die "Unable to remove old temporary screenshot!"
    fi

    pre_pre_cmd=""
    pre_cmd=""
    grim_cmd='grim -t png <EXTRA> "$shot_path"'

    if [[ "$1" == "area" ]]; then
        pre_pre_cmd='export SHOT_AREA="$(get_area)" && echo "Screenshot Area: $SHOT_AREA"'
        pre_cmd='[[ "$SHOT_AREA" == "" ]] && abort_screenshot || export SHOT_AREA="$SHOT_AREA"'
        grim_cmd="$(echo "$grim_cmd" | sed 's/<EXTRA>/-g "$SHOT_AREA"/g')"
    elif [[ "$1" == "monitor" ]]; then
        export FOCUSED_MONITOR="$(hyprctl activeworkspace | grep "workspace ID" | tr ' ' '\n' | tail --lines 1 | sed 's/:$//')"
        grim_cmd="$(echo "$grim_cmd" | sed 's/<EXTRA>/-o "$FOCUSED_MONITOR"/g')"
    elif [[ "$1" == "all" ]]; then
        grim_cmd="$(echo "$grim_cmd" | sed 's/<EXTRA>//g')"
    else
        die "Invalid argument passed to take_screenshot()!"
    fi

    echo "Taking screenshot..."
    eval "$pre_pre_cmd" || die "Failed to run pre-pre-screenshot commands!"
    eval "$pre_cmd" || die "Failed to run pre-screenshot commands!"
    eval "$grim_cmd" || die "Failed to take screenshot!"
}

take_screenshot_area () {
    take_screenshot "area"
    copy_to_clipboard
}

take_screenshot_monitor () {
    take_screenshot "monitor"
    copy_to_clipboard
}

take_screenshot_all () {
    take_screenshot "all"
    copy_to_clipboard
}

if [[ "$1" == "area" ]]; then
    take_screenshot_area
elif [[ "$1" == "monitor" ]]; then
    take_screenshot_monitor && notify_normal "Screenshot taken! (Focused Monitor)"
elif [[ "$1" == "all" ]]; then
    take_screenshot_all && notify_normal "Screenshot taken! (All Monitors)"
else
    echo -e "\nAll Possible Options: 'area', 'monitor', 'all'" >&2
    die "Invalid argument! ($1)"
fi

echo "Removing temporary screenshot..."
rm "$shot_path" || die "Unable to remove temporary screenshot!"

#echo "Reloading Hyprland..."
#hyprctl reload || die "Failed to reload Hyprland!"

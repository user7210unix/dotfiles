~/.fehbg &

picom &

obmenu-generator -p &

xrdb ~/.Xresources &

#/home/user/slimwm/./slimwm
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session openbox-session

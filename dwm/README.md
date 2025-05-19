# DWM
dwm is a dynamic window manager for X. It manages windows in tiled, monocle and floating layouts. All of the layouts can be applied dynamically, optimising the environment for the application in use and the task performed.

# Preview
<p align="center">
    <img src="https://github.com/motolla/dwm/blob/main/img/2023-01-29_23-43.png">
    <img src="https://github.com/motolla/dwm/blob/main/img/st-preview%231.png">
</p>

# Quick Keybind
```
# Open Terminal (st)
Alt + Enter

# Close & Kill Program
Alt + q

# Switch Focus Window
Alt + j/k

# Toggle Layout
Alt + Space
```

# Patch Applied
+ [dwm-actualfullscreen-20211013-cb3f58a.diff](https://dwm.suckless.org/patches/actualfullscreen/dwm-actualfullscreen-20211013-cb3f58a.diff)
+ [dwm-alttagsdecoration-2020010304-cb3f58a.diff](https://dwm.suckless.org/patches/alttagsdecoration/dwm-alttagsdecoration-2020010304-cb3f58a.diff)
+ [dwm-alwayscenter-20200625-f04cac6.diff](https://dwm.suckless.org/patches/alwayscenter/dwm-alwayscenter-20200625-f04cac6.diff)
+ [dwm-cfacts-20200913-61bb8b2.diff](https://dwm.suckless.org/patches/cfacts/dwm-cfacts-20200913-61bb8b2.diff)
+ [dwm-cfacts-vanitygaps-6.2.diff](https://dwm.suckless.org/patches/vanitygaps/dwm-cfacts-vanitygaps-6.2.diff)
+ [dwm-rainbowtags-6.2.diff](https://dwm.suckless.org/patches/rainbowtags/dwm-rainbowtags-6.2.diff)
+ [dwm-status2d-6.3.diff](https://dwm.suckless.org/patches/status2d/dwm-status2d-6.3.diff)
+ [dwm-notitle-20210715-138b405.diff](https://dwm.suckless.org/patches/notitle/dwm-notitle-20210715-138b405.diff)

# Requirements
+ Void
```
xbps-install libXft-devel libX11-devel libXinerama-devel
```
```
Nerd Font JetBrains
```
# Build & Install
+ Clone the repo

```
git clone https://github.com/gillgrite/dwm.git
```
+ Build & Install dwm
```
./dwmclean
```

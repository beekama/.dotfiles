#!/bin/zsh


projection=$(echo "Default
Asus new (HDMI)
Cip3 (HDMI2)
Asus old (HDMI)
drei" | rofi -dmenu -p "Select Monitor Setup: ")

herbstclient detect_monitors;

if [ "$projection"=="Default" ]; then
    xrandr --output HDMI-2 --off
fi
if [ "$projection"=="Asus new (HDMI)" ]; then
    xrandr --output HDMI-2 --right-of eDP-1 --mode 3840x2160 --fb 8192x4320 --pos 0x0
fi
if [ "$projection"=="Asus old (HDMI)" ]; then
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1920x0 --output HDMI-2 --mode 1920x1080 --pos 0x0
fi
if [ "$projection"=="Cip3 (HDMI)" ]; then
    xrandr --output HDMI-2 --right-of eDP-1 --mode 2560x1440 --pos 0x0
fi
if [ "$projection"=="drei" ]; then
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 3840x0 --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-2-2 --mode 1920x1080 --pos 1920x0 --output DP-2-3 --mode 1920x1080 --pos 0x0
fi
herbstclient detect_monitors;
herbstclient reload;
exit

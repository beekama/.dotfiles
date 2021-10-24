#!/bin/zsh


projection=$(echo "Default
Asus new (HDMI)" | rofi -dmenu -p "Select Monitor Setup: ")

herbstclient detect_monitors;

if [ "$projection"=="Default" ]; then
    xrandr --output HDMI-2 --off
fi
if [ "$projection"=="Asus new (HDMI)" ]; then
    xrandr --output HDMI-2 --right-of eDP-1 --mode 3840x2160 --fb 8192x4320 --pos 0x0
fi

herbstclient detect_monitors;
herbstclient reload;
exit

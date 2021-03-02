#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Apr 17 02:36:31 2020

@author: kathi
"""

import subprocess,re
import datetime
from PIL import Image

#colors and seperator:
col1 = "^fg(#ffff00)"
col2 = "^fg(#ccaa00)"
col3 = "^fg(#22ff00)"
tab = "     "

#homepath:
from pathlib import Path
herbstluftwmPath = str(Path.home())+'/.config/herbstluftwm/';

#import own modules:
import sys
sys.path.append(herbstluftwmPath)
import BatteryState as battery
import wifiConnectionState as wlan

#musik
musik = subprocess.run(['playerctl',  'metadata',  '--format', '{{playerName}}: {{artist}} {{lc(status)}} {{duration(position)}}|{{duration(mpris:length)}}' ],text=True, stdout=subprocess.PIPE).stdout
musik = str(musik).replace('b', '').rstrip()

#time
now = datetime.datetime.now()
dow = now.strftime("%B ")
day = now.strftime("%d - ")
time = now.strftime("%H:%M ")

#Image or no image
image=herbstluftwmPath+r'/panda.jpg'
#Image=""

out=str( col2 + musik + tab + battery.get_batteryStatus(image) + tab + col1 + " | " + col2 + wlan.get_wlanid() + col2 +" | " + tab  + col2 + dow + col1 + day + col2 + time)
print(out)

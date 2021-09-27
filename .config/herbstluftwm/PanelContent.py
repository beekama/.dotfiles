#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Apr 17 02:36:31 2020

@author: kathi
"""

import subprocess,re
from PIL import Image


#homepath:
from pathlib import Path
herbstluftwmPath = str(Path.home())+'/.config/herbstluftwm/';

#import own modules:
import sys
sys.path.append(herbstluftwmPath)
import BatteryState as battery
import wifiConnectionState as wlan

separator="^fg(#22ff00)| "

#Image or no image
image=herbstluftwmPath+r'/panda.jpg'
#Image=""


out=str(battery.get_batteryStatus(image)+separator+wlan.get_wlanid())
print(out)

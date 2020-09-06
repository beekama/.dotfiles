#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Feb  7 13:19:34 2020
@author: kathi
"""
import subprocess,re
from PIL import Image


def rgb_to_hex(r,g,b):
    return '%02x%02x%02x' % (r,g,b)

def get_batteryStatus(img):

    acpiBat = subprocess.check_output('acpi')
    #extract capacity of acpi-output and remove blanks and %
    capacity = re.findall(r'..[0-9]%', str(acpiBat))
    #capacity = capacity[0][:-1].split()[0]
    capacity = re.sub("\D", "", capacity[0])
    
    #extract remaining time:
    try:
        remaining=re.findall(r'[0-9][0-9]:[0-9][0-9]:[0-9][0-9]',str(acpiBat))[0]
    except:
        remaining=""
    
    #extract charging status:
    if "Discharging" in str(acpiBat):
        status="DIS"
    elif "Charging" in str(acpiBat):
        status="CHAR"
    else:
        status="UNKNOWN"
    
    #calculate color:
    green=255*int(capacity)/100
    red=255*(100-int(capacity))/100
    hexColor="#" + str(rgb_to_hex(int(red),int(green),0))
    
    #print stuff:
    if int(capacity)>10:
        return("^fg("+hexColor+")"+status+" "+capacity+"% "+remaining)
   # elif (img!="") and (int(capacity)<8 and status=="DIS"):
    #    im=Image.open(img)
     #   im.show()
    else:
        return("^bg(#ff0000)^fg(#efefef) "+status+" "+capacity+"% "+remaining)
        
if __name__ == "__main__":
    print(get_batteryStatus())
    

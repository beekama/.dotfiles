#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Mar 24 13:44:36 2020

@author: kathi
"""
import subprocess

def get_wlanid():
    try:
        whichInt = subprocess.check_output("/usr/sbin/iwgetid").decode().split()[0]
        whichWifi = subprocess.check_output(["/usr/sbin/iwgetid","-r"]).decode().strip()
    except subprocess.CalledProcessError:
        whichWifi=""
        whichInt=""
    return("^fg(#ffff00)"+ whichInt+"-"+whichWifi+" ")

#!/usr/bin/python3.9

import subprocess
import shlex
import psutil
import sys



## fundamentally copied from https://github.com/FAUSheppy/config/herbstluftwm/hl_start_urxvt_cwd.py

## get current window ##
displays = subprocess.check_output('xdpyinfo').decode()

window = -1
for line in displays.split('\n'):
    if line.startswith('focus'):
        for info in line.split(' '):
            info = info.rstrip(',')
            if info.startswith('0x'):
                window  = int(info, 16)

if (window == -1):
    sys.exit("no current-window found")

## get pid from current window ##
pid = -1
process = subprocess.check_output(['xprop','-id',hex(window)]).decode().split('\n')
for line in process:
    if line.startswith('WM_CLASS(STRING)') and 'urxvt' in line:
        break

for line in process:
    if line.startswith('_NET_WM_PID(CARDINAL)'):
        pid = int(line.split(' ')[-1])

if (pid == -1):
    sys.exit("no pid found")

## start terminal ##
proc = psutil.Process(pid)
for p in proc.children():
    if p.name() in ['zsh', 'bash']:
        subprocess.Popen(('urxvt -cd ' + p.cwd()), shell=True)
        break

sys.exit()

#!/bin/bash

#backuping automatically to pi with help of rsync:
#take files from:
SOURCES="/"

#take files to:
TARGET="piRoot:/media/secure/backup/LINUX_notebook/"

#parameters
PARMS="--delete"

#exclude files saved in this file:
EXCLUDE="--exclude-from=/mnt/daten/spielewiese/backuping/exclude.txt"

#logfile
LOGFILE="/mnt/daten/spielewiese/backuping/rsync_log.log"

#place of binary-rsync-file:
RSYNC=`which rsync`

#command:
sudo $RSYNC -aAXv --log-file=rsync.log $PARMS $EXCLUDE $SOURCES $TARGET  > $LOGFILE
	
exit 0

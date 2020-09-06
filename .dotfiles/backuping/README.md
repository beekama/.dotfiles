Backupscript:

automatic daily backups to Pi via ssh.

currently just added this entry to /etc/crontab:

0 22 * * * 	root 	/usr/bin/rsync -aAXv --delete --exclude-from=/mnt/daten/spielewiese/backuping/exclude.txt / piRoot:/media/secure/backup/LINUX_notebook/ > /mnt/daten/spielewiese/backuping/rsync_log.log




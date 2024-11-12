#!/bin/bash
#
echo "------------------------------------"
echo "--- Call recording backup script ---"
echo "------------------------------------"

SOURCE_DIR="/home/ubuntu/call_recordings"
BACKUP_DIR="/home/ubuntu/call_backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_PATH="$BACKUP_DIR/backup_$TIMESTAMP"

if [ ! -d "$BACKUP_DIR" ]; then
mkdir -p "$BACKUP_DIR"
echo "Backup directory has been created at $BACKUP_DIR"
fi

mkdir $BACKUP_PATH

echo "Backup directory has been created at $BACKUP_PATH"
cp -r "$SOURCE_DIR"/* "$BACKUP_PATH"
echo "Files from $SOURCE_DIR have been backup to $BACKUP_PATH"
echo "Backup completed successfully at $(date)"

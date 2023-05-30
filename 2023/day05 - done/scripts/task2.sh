#!/bin/sh

# Set the backup directory path
backup_dir="/Users/esteban/Desktop/test"

# Set the name of the backup file with a timestamp
backup_file="backup_$(date +"%Y%m%d_%H%M%S").tar.gz"

# Create the backup archive
tar -czf $backup_dir/$backup_file -C /Users/esteban/Desktop/test/backup .

# Check if the backup was created successfully
if [ -f "$backup_dir/$backup_file" ]; then
    echo "Backup created successfully"
else
    echo "Backup failed"
    exit 1
fi
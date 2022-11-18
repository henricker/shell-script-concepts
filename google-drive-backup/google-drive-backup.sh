#!/usr/bin/env bash

# To run this script to any directory, you need to create a symbolic link to it
# sudo ln -s /path/to/google-drive-backup.sh /usr/local/bin/google-drive-backup

# --- GLOBAL VARIABLES ---
BACKUP_FILE_NAME="backup"

# --- EXECUTION ----
while [[ -n $1 ]]; do
    case "$1" in
    -n | --name) BACKUP_FILE_NAME=$2 shift ;;
    esac
    shift
done

mkdir -p $BACKUP_FILE_NAME

for element in $(ls); do
    [[ "$element" = "google-drive-backup.sh" ]] && continue
    [[ "$element" = "$BACKUP_FILE_NAME" ]] && continue

    cp -r $element $BACKUP_FILE_NAME
done

zip -rq $BACKUP_FILE_NAME.zip $BACKUP_FILE_NAME
rm -rf $BACKUP_FILE_NAME

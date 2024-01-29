#!/bin/bash -e
# Where the saves live
SAVE_DIRECTORY="/home/kat/Steam/steamapps/common/PalServer/Pal/Saved/"

# Where to store backups
BACKUP_DIRECTORY="/home/kat/backups"

# Number of backups to keep
BACKUP_COUNT=50


# Create a new backup
tar -cz -C "${SAVE_DIRECTORY}" -f "${BACKUP_DIRECTORY}/pal-backup-$(date +'%Y-%m-%dT%H-%M').tgz" SaveGames/

# Delete all but the last 10 backups
find "${BACKUP_DIRECTORY}" -name "pal-backup-*.tgz" | sort | head -n "-${BACKUP_COUNT}" | xargs --no-run-if-empty -d "\n" rm

#!/bin/bash -e

MAX_MEMORY=20401094656

MEMORY_USAGE=$(systemd-cgtop -br | grep -i palworld | awk '{print $4}')
USAGE_PERCENT=$(awk -v MAX="$MAX_MEMORY" -v USAGE="$MEMORY_USAGE" 'BEGIN{ print int(USAGE / MAX * 100) }')

echo "Memory: $MEMORY_USAGE / $MAX_MEMORY -- ${USAGE_PERCENT}%"

if [[ $MEMORY_USAGE -gt $MAX_MEMORY ]]; then
	/home/kat/tools/broadcast.sh Memory pressure high, reboot needed
	/home/kat/tools/broadcast.sh "(TT_TT)"
	/home/kat/tools/graceful-restart.sh
fi

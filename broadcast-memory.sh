#!/bin/bash -e

RCON_PATH=/home/kat/tools/rcon/rcon
RCON_CONFIG=/home/kat/tools/rcon/rcon.yaml

MEMORY_USAGE=$(systemd-cgtop -b | grep -i palworld | awk '{print $4}')

MAX_MEMORY_BYTES=20401094656
MEMORY_USAGE_BYTES=$(systemd-cgtop -br | grep -i palworld | awk '{print $4}')
USAGE_PERCENT=$(awk -v MAX="$MAX_MEMORY_BYTES" -v USAGE="$MEMORY_USAGE_BYTES" 'BEGIN{ print int(USAGE / MAX * 100) }')

"${RCON_PATH}" --config "${RCON_CONFIG}" "Broadcast MEM_${MEMORY_USAGE}_(${USAGE_PERCENT}%)__(o_o)b"


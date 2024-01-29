#!/bin/bash -e

RCON_PATH=/home/kat/tools/rcon/rcon
RCON_CONFIG=/home/kat/tools/rcon/rcon.yaml

MESSAGE=$(echo "$@" | sed 's/ /_/g')

"${RCON_PATH}" --config "${RCON_CONFIG}" "Broadcast ${MESSAGE}"


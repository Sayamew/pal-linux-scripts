#!/bin/bash -e

RCON_PATH=/home/kat/tools/rcon/rcon
RCON_CONFIG=/home/kat/tools/rcon/rcon.yaml
SHUTDOWN_GRACE_PERIOD=180
SHUTDOWN_MESSAGE=Server_maintenance_reboot_in_180_seconds
SHUTDOWN_REMINDER_MESSAGE=Server_maintenance_reboot_in_90_seconds

MEMORY_USAGE=$(systemd-cgtop -b | grep -i palworld | awk '{print $4}')

"${RCON_PATH}" --config "${RCON_CONFIG}" "Save"
"${RCON_PATH}" --config "${RCON_CONFIG}" "Shutdown ${SHUTDOWN_GRACE_PERIOD} ${SHUTDOWN_MESSAGE}"
sleep 90
"${RCON_PATH}" --config "${RCON_CONFIG}" "Broadcast ${SHUTDOWN_REMINDER_MESSAGE}"

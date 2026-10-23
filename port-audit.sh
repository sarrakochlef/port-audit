#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="$SCRIPT_DIR/logs"
LOG_FILE="$LOG_DIR/port-audit.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

mkdir -p "$LOG_DIR" || exit 1

{
    echo "========================================"
    echo "Network Port Audit: $TIMESTAMP"
    echo "Hostname: $(hostname)"
    echo "========================================"

    echo
    echo "[ Listening TCP and UDP Ports ]"
    ss -tulnp

    echo
    echo "[ Active Network Connections ]"
    ss -tunap

    echo
    echo "[ Listening Ports Summary ]"
    ss -H -lntu

    echo
    echo "Audit completed: $TIMESTAMP"
    echo
} | tee -a "$LOG_FILE"

echo "Audit saved to: $LOG_FILE"

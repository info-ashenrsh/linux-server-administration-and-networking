#!/usr/bin/env bash
set -euo pipefail

echo "===== SERVER INFORMATION ====="
echo "Hostname: $(hostname)"
echo "Current user: $(whoami)"
echo "Kernel: $(uname -r)"
echo "Uptime:"
uptime
echo
echo "IP addresses:"
hostname -I
echo
echo "Disk usage:"
df -h
echo
echo "Memory:"
free -h
echo
echo "Failed systemd units:"
systemctl --failed --no-pager || true

#!/usr/bin/env bash
set -euo pipefail

echo "Refreshing package lists..."
sudo apt update

echo "Applying available package upgrades..."
sudo apt upgrade

echo "Update completed."

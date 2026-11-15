#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y nginx
sudo systemctl enable --now nginx
sudo nginx -t
sudo systemctl status nginx --no-pager

echo "Nginx is installed and running."

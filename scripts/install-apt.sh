#!/usr/bin/env bash
set -euo pipefail

sudo apt update

xargs -a apt-packages.txt sudo apt install -y

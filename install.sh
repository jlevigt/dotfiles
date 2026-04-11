#!/usr/bin/env bash
set -euo pipefail

# 1. OS Boundary Check
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
  echo "❌ This script is intended for Linux systems only."
  exit 1
fi

# 2. Authenticate Upfront
echo "🔑 Please authenticate for sudo access:"
sudo -v
# Keep sudo alive in the background
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "[1/5] Installing APT packages..."
bash scripts/install-apt.sh

echo "[2/5] Installing Oh My Zsh..."
bash scripts/install-ohmyzsh.sh

echo "[3/5] Installing Zsh plugins..."
bash scripts/install-plugins.sh

echo "[4/5] Setting up symlinks..."
bash scripts/setup-symlinks.sh

echo "[5/5] Installing mise runtimes..."
curl https://mise.run | sh
~/.local/bin/mise install

echo "✅ Done. Restart your shell."
echo "💡 You can run 'bash scripts/doctor.sh' to verify your installation."

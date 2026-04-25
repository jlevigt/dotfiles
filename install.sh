#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/scripts/utils.sh"

# 1. OS Boundary Check
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
  log_error "This script is intended for Linux systems only."
  exit 1
fi

# 2. Pre-flight Checks
if ! command -v curl >/dev/null 2>&1; then
  log_error "curl is required but not installed. Please install it manually first."
  exit 1
fi

if ! command -v git >/dev/null 2>&1; then
  log_error "git is required but not installed. Please install it manually first."
  exit 1
fi

# 3. Authenticate Upfront
log_info "Please authenticate for sudo access:"
sudo -v
# Keep sudo alive in the background
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

log_info "[1/5] Installing APT packages..."
bash scripts/install-apt.sh

log_info "[2/5] Installing Oh My Zsh..."
bash scripts/install-ohmyzsh.sh

log_info "[3/5] Installing Zsh plugins..."
bash scripts/install-plugins.sh

log_info "[4/5] Setting up symlinks..."
bash scripts/setup-symlinks.sh

log_info "[5/5] Installing mise runtimes..."
if ! command -v mise >/dev/null 2>&1; then
  curl https://mise.run | sh
fi
~/.local/bin/mise install

log_success "Done. Restart your shell."
log_info "You can run 'bash scripts/doctor.sh' to verify your installation."

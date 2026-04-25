#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/utils.sh"

PACKAGES=(
  build-essential
  curl
  wget
  git
  unzip
  zip
  ca-certificates
  gnupg
  lsb-release
  software-properties-common
  pkg-config
  zsh
  flatpak
  htop
  btop
  tree
  jq
  ripgrep
  fd-find
  bat
  fzf
  strace
  ltrace
  net-tools
  iproute2
  dnsutils
  openssh-client
  httpie
  antigravity
)

log_info "Updating APT repositories..."
sudo apt update -yqq

MISSING_PACKAGES=()
for pkg in "${PACKAGES[@]}"; do
  if ! dpkg -s "$pkg" >/dev/null 2>&1; then
    MISSING_PACKAGES+=("$pkg")
  fi
done

if [ ${#MISSING_PACKAGES[@]} -eq 0 ]; then
  log_success "All APT packages are already installed."
else
  log_info "Installing missing APT packages: ${MISSING_PACKAGES[*]}"
  sudo apt install -yqq "${MISSING_PACKAGES[@]}"
  log_success "APT packages installed successfully."
fi

#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zsh/env.zsh" "$HOME/.env"
ln -sf "$DOTFILES_DIR/zsh/aliases.zsh" "$HOME/.aliases"
ln -sf "$DOTFILES_DIR/zsh/functions.zsh" "$HOME/.functions"
ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

mkdir -p "$HOME/.ssh"
ln -sf "$DOTFILES_DIR/ssh/config" "$HOME/.ssh/config"

# Create local bin symlinks for Debian-specific tool names
mkdir -p "$HOME/.local/bin"
if command -v batcat >/dev/null 2>&1 && ! command -v bat >/dev/null 2>&1; then
  ln -sf "$(command -v batcat)" "$HOME/.local/bin/bat"
fi
if command -v fdfind >/dev/null 2>&1 && ! command -v fd >/dev/null 2>&1; then
  ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
fi

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

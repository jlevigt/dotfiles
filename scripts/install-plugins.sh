#!/usr/bin/env bash
set -euo pipefail

ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# Helper function to clone a git repo if it doesn't exist
clone_or_skip() {
  local repo_url=$1
  local dest_path=$2
  if [ ! -d "$dest_path" ]; then
    git clone --depth=1 "$repo_url" "$dest_path"
  else
    echo "Skipping $repo_url, already exists at $dest_path"
  fi
}

clone_or_skip https://github.com/zsh-users/zsh-autosuggestions \
  "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

clone_or_skip https://github.com/zsh-users/zsh-syntax-highlighting \
  "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

clone_or_skip https://github.com/ajeetdsouza/zoxide \
  "$ZSH_CUSTOM/plugins/zoxide"

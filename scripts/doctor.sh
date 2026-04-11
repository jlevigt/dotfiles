#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Running environment health check..."

# Check shell
if [[ "$SHELL" != *"zsh"* ]]; then
  echo "❌ Zsh is not your default shell (currently $SHELL)."
else
  echo "✅ Zsh is the default shell."
fi

# Check mise
if command -v mise >/dev/null 2>&1; then
  echo "✅ mise is installed."
else
  echo "❌ mise is not in your PATH."
fi

# Check Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "✅ Oh My Zsh is installed."
else
  echo "❌ Oh My Zsh directory not found."
fi

# Check Plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
plugins=("zsh-autosuggestions" "zsh-syntax-highlighting" "zoxide")

for plugin in "${plugins[@]}"; do
  if [ -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
    echo "✅ Plugin $plugin is installed."
  else
    echo "❌ Plugin $plugin is missing."
  fi
done

echo "Done."

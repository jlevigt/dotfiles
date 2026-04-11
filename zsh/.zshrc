export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git docker fzf zoxide zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Environment, Aliases, Functions
source ~/.env 2>/dev/null || true
source ~/.aliases 2>/dev/null || true
source ~/.functions 2>/dev/null || true

# Mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

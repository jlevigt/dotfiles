# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git
alias g='git'
alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit --amend'

# Tools
alias l='ls -lah'

# Handle bat/batcat (Debian/Ubuntu)
if command -v batcat >/dev/null 2>&1; then
  alias bat='batcat'
  alias cat='batcat'
elif command -v bat >/dev/null 2>&1; then
  alias cat='bat'
fi

alias grep='rg'

# Handle fd/fdfind (Debian/Ubuntu)
if command -v fdfind >/dev/null 2>&1; then
  alias fd='fdfind'
  alias find='fdfind'
elif command -v fd >/dev/null 2>&1; then
  alias find='fd'
fi

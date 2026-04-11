# Custom Shell Functions

# Create a new directory and enter it
mkd() {
  mkdir -p "$1" && cd "$1"
}

# Quick look at public IP
myip() {
  curl -s https://ifconfig.me
  echo ""
}

# Reload zsh configuration
reload() {
  source ~/.zshrc
}

# --- Homebrew Configuration ---
# This looks for Homebrew in the standard Linux location
if [[ -d /home/linuxbrew/.linuxbrew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# This looks for Homebrew in the standard Mac location
elif [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# --- Mise Configuration ---
# This activates mise and puts your managed runtimes (Node, etc.) into your PATH
eval "$(mise activate zsh)"

# --- Theme & Plugins (Oh My Zsh) ---
# Ensure these are near the top of your file, usually where Oh My Zsh is initialized
plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting zoxide)
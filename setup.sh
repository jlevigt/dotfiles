#!/bin/bash

# 1. Update System & Install Foundational Tools (Apt)
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git build-essential zsh flatpak
# Add Flathub repository for Flatpaks
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# 2. Install Homebrew (For CLI Dev Tools)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Add Homebrew to PATH for this session
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# 3. Install CLI Tools (via Homebrew)
brew install mise zellij

# 4. Install Apps (via Flatpak - Best for Ubuntu Desktop)
flatpak install -y flathub com.google.Chrome
flatpak install -y flathub com.usebruno.Bruno
flatpak install -y flathub io.dbeaver.DBeaverCommunity
flatpak install -y flathub com.visualstudio.code

# Note: Cursor and Antigravity are often distributed as AppImages on Linux.
# For Cursor, it is recommended to download the .AppImage from their site.

# 5. Setup Docker (Official Engine)
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# 6. Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# 7. Final Instructions
echo "-------------------------------------------------------"
echo "Installation complete! Please do the following:"
echo "1. Change shell: 'chsh -s $(which zsh)'"
echo "2. Download Cursor AppImage manually from cursor.com"
echo "3. Restart your computer to apply Docker group changes."
echo "-------------------------------------------------------"
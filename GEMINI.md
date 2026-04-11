# Project Overview: Dotfiles & Reproducible Dev Environment

This project is a production-grade, idempotent system for bootstrapping and managing a Linux development environment. It focuses on automation, version pinning, and separation of concerns to ensure a deterministic setup across different machines.

## Core Technologies
- **Shell:** Zsh with Oh My Zsh.
- **Package Management:** APT (system), Homebrew (CLI tools), and `mise` (language runtimes).
- **Environment Management:** `mise` for managing versions of Node.js, Python, Go, etc.
- **Configuration:** Declarative configurations for Git, SSH, and Zsh.

## Directory Structure
- `install.sh`: The main entry point script that orchestrates the entire setup.
- `apt-packages.txt`: A declarative list of system packages to be installed via APT.
- `mise.toml`: Defines specific versions for language runtimes (Node, Python, Bun, etc.).
- `Brewfile`: Lists CLI tools to be managed via Homebrew.
- `scripts/`: Modular Bash scripts for specific installation tasks:
    - `install-apt.sh`: Idempotent system package installer.
    - `install-ohmyzsh.sh`: Controlled Oh My Zsh installation.
    - `install-plugins.sh`: Installs Zsh plugins (autosuggestions, syntax highlighting, zoxide).
    - `setup-symlinks.sh`: Manages symlinks for configuration files.
- `zsh/`, `git/`, `ssh/`: Contain the source configuration files (dotfiles) for their respective tools.
- `archive/`: Contains legacy setup scripts for reference.

## Usage & Execution
To bootstrap the environment, run the following command from the root of the repository:

```bash
./install.sh
```

**Note:** The script requires `sudo` privileges for APT installations. If running in a non-interactive environment, ensure `sudo` is configured accordingly or be prepared to enter a password.

## Development Conventions
1. **Idempotency:** All scripts must be safe to run multiple times. Check for existing directories or configurations before performing destructive actions.
2. **Modularity:** Keep installation logic within the `scripts/` directory, separated by concern.
3. **Declarative Bias:** Prefer updating `apt-packages.txt`, `mise.toml`, or `Brewfile` over adding manual `apt install` or `curl | sh` commands to scripts.
4. **Symlinking:** Use the `setup-symlinks.sh` script to link files from the repository to the `$HOME` directory to ensure the repository remains the source of truth.

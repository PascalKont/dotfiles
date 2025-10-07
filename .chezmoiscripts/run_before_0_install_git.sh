#!/usr/bin/env bash
set -euo pipefail

# Check if Git is already installed
if command -v git &>/dev/null; then
  #echo "Git is already installed."
  exit 0
fi

# Detect OS
OS=$(uname | tr '[:upper:]' '[:lower:]')
echo "Detected OS: $OS"

install_git() {
  if command -v dnf &>/dev/null; then
    echo "Installing Git via dnf..."
    sudo dnf install -y git
  else
    echo "No supported package manager found. Please install Git manually."
    exit 1
  fi
}

# Run the installation
install_git

# Verify installation
if command -v git &>/dev/null; then
  echo "Git successfully installed."
else
  echo "Git installation failed."
  exit 1
fi

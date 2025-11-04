#!/bin/bash

# Make sure pipx is installed
if ! command -v pipx &> /dev/null; then
  if os-release | grep -qi 'ubuntu\|debian'; then
    sudo apt update
    sudo apt install -y python3-pip python3-venv
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
  elif os-release | grep -qi 'fedora\|centos\|rhel'; then
    sudo dnf install -y python3-pip python3-venv
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
  else
    echo "Unsupported OS. Please install pipx manually."
    exit 1
  fi
  export PATH="$HOME/.local/bin:$PATH"
fi

# Install Ansible using pipx
if ! pipx list | grep -q 'ansible'; then
  pipx install ansible --include-deps passlib


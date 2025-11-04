#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

LOGFILE="$HOME/install_ansible.log"
touch $LOGFILE

# Packages to install
PACKAGES=(
  nodejs
  fuse3
  pip
  pipx
)

# Function to log messages
log() {
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOGFILE"
}

# Check if running as root or not
if [[ "$EUID" -ne 0 ]]; then
  SUDO="sudo"
else
  SUDO=""
fi

if [[ ${#PACKAGES[@]} -eq 0 ]]; then
  echo "Usage: $0 package1 package2 ..."
  exit 1
fi

log "Updating apt cache"
if ! $SUDO apt-get update >>"$LOGFILE" 2>&1; then
  log "ERROR: Failed to update apt cache"
  exit 1
fi

log "Adding nodesource to apt sources"
if curl -fsSL https://deb.nodesource.com/setup_20.x | $SUDO -E bash - >>"$LOGFILE" 2>&1; then
  log "Successfully installed nodesource into apt sources"
else
  log "ERROR: Failed to add nodesource into apt sources"
  exit 1
fi

log "Starting installation of packages: ${PACKAGES[*]}"
if $SUDO apt-get install -y "${PACKAGES[@]}" >>"$LOGFILE" 2>&1; then
  log "Successfully installed packages: ${PACKAGES[*]}"
else
  log "ERROR: Failed to install packages: ${PACKAGES[*]}"
  exit 1
fi

PACKAGES=(ansible ansible-builder)

log "Starting installation of pipx environment: ${PACKAGES[*]}"
if pipx install --include-deps "${PACKAGES[@]}" >>"$LOGFILE" 2>&1; then
  log "Successfully installed pipx environment: ${PACKAGES[*]}"
else
  log "ERROR: Failed to install pipx environment: ${PACKAGES[*]}"
  exit 1
fi

PACKAGES=(passlib)

log "Starting injection of packages into ansible pipx environment: ${PACKAGES[*]}"
if pipx inject ansible "${PACKAGES[@]}" >>"$LOGFILE" 2>&1; then
  log "Successfully injected packages: ${PACKAGES[*]}"
else
  log "ERROR: Failed to inject packages: ${PACKAGES[*]}"
  exit 1
fi

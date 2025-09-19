#!/usr/bin/env bash
# Created by Jacob Hrbek github.com in 2019

# A local temporary variable
declare _omb_tmp_sudo

# Switch for the use of "sudo"
_omb_tmp_sudo=
if [[ ${OMB_ALIAS_PACKAGE_MANAGER_SUDO+set} ]]; then
  _omb_tmp_sudo=${OMB_ALIAS_PACKAGE_MANAGER_SUDO:+$OMB_ALIAS_PACKAGE_MANAGER_SUDO }
elif [[ ${OMB_USE_SUDO-true} == true ]]; then
  if ((EUID != 0)) && _omb_util_binary_exists sudo; then
    _omb_tmp_sudo='sudo '
  fi
fi

# Snap Package manager - Snap
if _omb_util_binary_exists snap; then
  alias snap="${_omb_tmp_sudo}snap"
  alias snapfu="${_omb_tmp_sudo}snap refresh" # Update all installed snaps
  alias snapi="${_omb_tmp_sudo}snap install" # Installs the named snaps
  alias snaps="${_omb_tmp_sudo}snap find" # Queries the store for available packages
  alias snapr="${_omb_tmp_sudo}snap remove --terminate --purge" # Performs a full, clean and data remove
  alias snapli="${_omb_tmp_sudo}snap list --all" # List all installed snaps and revisions in the current system
fi

# Advanced Packaging Tool - APT
if _omb_util_binary_exists apt; then
  alias apt="${_omb_tmp_sudo}apt" # Advanced Packaging Tool
  alias aptfu="${_omb_tmp_sudo}apt update -y && ${_omb_tmp_sudo}apt upgrade -y && ${_omb_tmp_sudo}apt dist-upgrade -y && ${_omb_tmp_sudo}apt autoremove -y"
  alias apti="${_omb_tmp_sudo}apt install -y" # Apt install
  alias apts="${_omb_tmp_sudo}apt-cache search" # Apt search
  alias aptr="${_omb_tmp_sudo}apt remove -y" # Apt remove
  alias aptar="${_omb_tmp_sudo}apt autoremove -y" # Apt Auto Remove
  alias aptli="${_omb_tmp_sudo}apt list --installed"
fi

# Debian PacKaGe - DPKG
if _omb_util_binary_exists dpkg; then
  alias dpkg="${_omb_tmp_sudo}dpkg"
fi

# Fedora Package - dnf
if _omb_util_binary_exists dnf; then
  alias dnf="${_omb_tmp_sudo}dnf" # DNF Packaging Tool
  alias dnfl="${_omb_tmp_sudo}dnf list" # List
  alias dnfli="${_omb_tmp_sudo}dnf list installed" # List Installed
  alias dnfgl="${_omb_tmp_sudo}dnf grouplist" # Group List
  alias dnfmc="${_omb_tmp_sudo}dnf makecache" # Make Cache
  alias dnfp="${_omb_tmp_sudo}dnf info" # Show Package Info
  alias dnfs="${_omb_tmp_sudo}dnf search" # Search

  alias dnfu="${_omb_tmp_sudo}dnf upgrade" # Update
  alias dnfi="${_omb_tmp_sudo}dnf install" # Install
  alias dnfgi="${_omb_tmp_sudo}dnf group install" # Group Install
  alias dnfr="${_omb_tmp_sudo}dnf remove" # Remove
  alias dnfgr="${_omb_tmp_sudo}dnf groupremove" # Group Remove
  alias dnfc="${_omb_tmp_sudo}dnf clean all" # Clean All
fi

unset -v _omb_tmp_sudo

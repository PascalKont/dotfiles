#!/bin/bash

packages=(
  1password
  1password-cli
  fzf
  htop
  lsd       # better ls
  hyprland  # the compositor
  hyprpaper # wallpaper
  hypridle  # idle detection and tooling
  hyprlock  # lock screen
  hyprshot  # screenshot taker
  satty     # screenshot editor
  cliphist  # clipboard history
)

sudo dnf copr enable solopasha/hyprland
sudo dnf install $packages

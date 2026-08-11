#!/bin/bash
if which hyprland 1>/dev/null 2>&1; then
  echo -n "true"
else echo -n "false"; fi

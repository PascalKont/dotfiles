#!/bin/bash
if /usr/bin/hyprland --version 1>/dev/null 2>&1; then
  /usr/bin/echo -n "true"
else /usr/bin/echo -n "false"; fi

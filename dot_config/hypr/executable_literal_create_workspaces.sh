#!/usr/bin/env bash

outputs=(
  $(hyprctl monitors | grep -Eo 'Monitor .* |at [[:digit:]]*x[[:digit:]]*' | paste - - | sort -n -k5 | cut -d' ' -f2)
)

workspace_level1='workspace = $j, monitor:${outputs[$i]}, default:1, persistent:1'
workspace_level2='workspace = $k, monitor:${outputs[$i]}, default:0, persistent:0'
tmp_file=/tmp/workspace.conf
conf_file=$HOME/.config/hypr/workspaces.conf

rm -f $tmp_file

for i in "${!outputs[@]}"; do
  j=$(($i + 1)) # hyprland starts at index 1

  # write level 1 workspaces, persistent
  workspace_eval=$(eval "echo $workspace_level1")
  echo $workspace_eval >>$tmp_file

  # write level 2 workspaces, non persistent
  k=$(($j + 3))
  workspace_eval=$(eval "echo $workspace_level2")
  echo $workspace_eval >>$tmp_file
done

mail_monitor=${outputs[0]}
if [[ "${outputs[2]}" == "eDP-1" ]]; then
  mail_monitor=${outputs[0]}
elif [[ "${outputs[0]}" == "eDP-1" ]]; then
  mail_monitor=${outputs[2]}
else
  #echo "eDP-1 not detected, using first monitor"
  mail_monitor=${outputs[0]}
fi

# write mail, teams and password workspaces, persistent
workspace_mail='workspace = $i, monitor:${mail_monitor}, default:0, persistent:1'
for i in 7 8 9; do
  workspace_eval=$(eval "echo $workspace_mail")
  echo $workspace_eval >>$tmp_file
done

#cat "${tmp_file}"
if [[ $(diff $tmp_file $conf_file) ]]; then
  mv $tmp_file $conf_file
else
  rm $tmp_file
fi

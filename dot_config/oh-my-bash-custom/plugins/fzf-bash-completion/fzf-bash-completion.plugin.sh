eval "$(fzf --bash)"
source $OSH-custom/plugins/fzf-bash-completion/fzf-bash-completion.sh
source $OSH-custom/plugins/fzf-bash-completion/fzf-theme.sh

#bind -x '"\t": fzf_bash_completion'
#bind -x '"\t": fzf-file-widget'

# Make sure you have fzf installed and key bindings loaded:
source /usr/share/fzf/shell/key-bindings.bash

# Bind Tab to this function
bind -x '"\t": __fzf_tab_complete_and_widget'

#__fzf_tab_complete_and_widget() {
#  # 1. Get the word under cursor (current path)
#  local cur="${READLINE_LINE##* }"
#
#  # 2. Use Bash completion to expand it
#  local expanded
#  expanded=$(compgen -f "$cur" | head -n1) # pick first match
#  if [[ -n "$expanded" ]]; then
#    # Replace the current word with expanded path
#    READLINE_LINE="${READLINE_LINE% *} $expanded"
#    READLINE_POINT=${#READLINE_LINE}
#  fi
#
#  # 3. If expanded is a directory, open fzf-file-widget there
#  if [[ -d "$expanded" ]]; then
#    # Temporarily switch to that dir and call fzf-file-widget
#    (cd "$expanded" && fzf-file-widget)
#  else
#    # If it’s a file, open fzf in its parent directory
#    local dir
#    dir=$(dirname "$expanded")
#    (cd "$dir" && fzf-file-widget)
#  fi
#}

__fzf_tab_complete_and_widget() {
  # 1. Get the word under the cursor (current path)
  local cur="${READLINE_LINE##* }"

  # 2. Use Bash completion to expand it
  local expanded
  expanded=$(compgen -f "$cur" | head -n1) # first match

  if [[ -n "$expanded" ]]; then
    # Replace the current word with expanded path
    READLINE_LINE="${READLINE_LINE% *} $expanded"
    READLINE_POINT=${#READLINE_LINE}
  fi

  # 3. Determine directory to open in fzf
  local dir
  if [[ -d "$expanded" ]]; then
    dir="$expanded"
  else
    dir=$(dirname "$expanded")
  fi

  # 4. Launch fzf-file-widget in that directory
  # Save current directory
  local orig_dir="$PWD"
  cd "$dir" || return

  # Pass the directory to fzf so it can display it
  # Using --preview to show full path info
  local result
  result=$(
    #find . -maxdepth 1 |
    ls --color=always -p |
      fzf \
        --ansi \
        --height 40% \
        --layout=reverse \
        --border \
        --prompt="$dir> " \
        --preview 'ls -la {}' \
        --bind "ctrl-r:reload(find . -type f -iname '*{q}*' 2>/dev/null || true)" \
        --bind "tab:accept"
    #--preview 'find . -type f -name "*{}*" 2>/dev/null | head -20' \
    #--bind "change:reload(find . -type f -iname '*{q}*' 2>/dev/null || true)"
  )
  result=$(echo "$result" | sed 's:/*$::')

  # 5. Insert the selected file into the command line
  if [[ -n "$result" ]]; then
    # Use relative path if inside the directory, else absolute
    local final_path
    if [[ "$dir" == "$orig_dir" ]]; then
      final_path="$result"
    else
      final_path="$dir/$result"
    fi
    READLINE_LINE="${READLINE_LINE% *} $final_path"
    READLINE_POINT=${#READLINE_LINE}
  fi

  # Return to original directory
  cd "$orig_dir" || return
}

#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#--bind f1:execute(less -f {})
#'

export FZF_COMPLETION_AUTO_COMMON_PREFIX=true
export FZF_COMPLETION_AUTO_COMMON_PREFIX_PART=true

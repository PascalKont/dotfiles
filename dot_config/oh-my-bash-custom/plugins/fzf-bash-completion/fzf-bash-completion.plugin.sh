source $OSH-custom/plugins/fzf-bash-completion/fzf-bash-completion.sh
source $OSH-custom/plugins/fzf-bash-completion/fzf-theme.sh

bind -x '"\t": fzf_bash_completion'

#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#--bind f1:execute(less -f {})
#'

export FZF_COMPLETION_AUTO_COMMON_PREFIX=true
export FZF_COMPLETION_AUTO_COMMON_PREFIX_PART=true

export TERM="xterm-256color"
export GITHUB_USERNAME="PascalKont"

alias setup_epel='sudo subscription-manager repos --enable codeready-builder-for-rhel-9-$(arch)-rpms && sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm'

alias l='ls'
alias la='ls -alh --color=auto'

alias vim=nvim
alias vi=vim
alias v=vi

alias aas='chezmoi apply; source ~/.bashrc'
alias aliasconf='chezmoi edit ~/.config/oh-my-bash-custom/aliases/custom.aliases.bash; aas'
alias swayconf='chezmoi edit ~/.config/sway/config; aas'
alias ohsconf='chezmoi edit ~/.config/oh-my-bash/; aas'
alias bashrc='chezmoi edit ~/.bashrc; chezmoi apply; aas'
alias hello='echo hi'

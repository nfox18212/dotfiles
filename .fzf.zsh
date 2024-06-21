# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nfox/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/nfox/.fzf/bin"
fi

eval "$(fzf --zsh)"

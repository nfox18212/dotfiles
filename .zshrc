# aliases are on line 262
# for penacony-specific aliases (sway), go to line 314

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="/usr/bin:$PATH"
export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=x11
export IVERILOG_DUMPER="lxt"

export DRI_PRIME=1

eval "$($HOME/.fzf/bin/fzf --zsh)"
# Starship prompt
eval "$(starship init zsh)"
function set_win_title(){
    echo -ne "\033]0; $USER@$HOST:${PWD/$HOME/~} \007"
}
precmd_functions+=(set_win_title)
# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
       https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

# UNUSED
#  modules/git \

# `znap source` automatically downloads and starts your plugins.
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-syntax-highlighting
znap source mafredri/zsh-async
#znap source zsh-colored-man-pages
znap source momo-lab/zsh-abbrev-alias
znap source unixorn/fzf-zsh-plugin
znap source sorin-ionescu/prezto
znap source prezto \
  modules/helper \
  modules/completion \
  modules/environment \
  modules/history \
  modules/directory \
  modules/history-substring-search \
  modules/utility \
  modules/autosuggestions \
  modules/tmux 

znap source prezto modules/python
znap source unixorn/fzf-zsh-plugin


setopt EXTENDED_GLOB
#for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#done

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

#
## Which plugins would you like to load?
## Standard plugins can be found in $ZSH/plugins/
## Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)


# Ripped from root zshrc
# Options Section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# Completion.
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'
#
## Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=10000

## Keys
# Use emacs key bindings
bindkey -e

# [PageUp] - Up a line of history
if [[ -n "${terminfo[kpp]}" ]]; then
  bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
  bindkey -M viins "${terminfo[kpp]}" up-line-or-history
  bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
fi
# [PageDown] - Down a line of history
if [[ -n "${terminfo[knp]}" ]]; then
  bindkey -M emacs "${terminfo[knp]}" down-line-or-history
  bindkey -M viins "${terminfo[knp]}" down-line-or-history
  bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
fi

# Start typing + [Up-Arrow] - fuzzy find history forward
if [[ -n "${terminfo[kcuu1]}" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# Start typing + [Down-Arrow] - fuzzy find history backward
if [[ -n "${terminfo[kcud1]}" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# [Home] - Go to beginning of line
if [[ -n "${terminfo[khome]}" ]]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
  bindkey -M viins "${terminfo[khome]}" beginning-of-line
  bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi
# [End] - Go to end of line
if [[ -n "${terminfo[kend]}" ]]; then
export PATH="$HOME/.cargo/bin:$PATH"
  bindkey -M emacs "${terminfo[kend]}"  end-of-line
  bindkey -M viins "${terminfo[kend]}"  end-of-line
  bindkey -M vicmd "${terminfo[kend]}"  end-of-line
fi

# [Shift-Tab] - move through the completion menu backwards
if [[ -n "${terminfo[kcbt]}" ]]; then
  bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi

# [Backspace] - delete backward
bindkey -M emacs '^?' backward-delete-char
bindkey -M viins '^?' backward-delete-char
bindkey -M vicmd '^?' backward-delete-char
# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey -M emacs "${terminfo[kdch1]}" delete-char
  bindkey -M viins "${terminfo[kdch1]}" delete-char
  bindkey -M vicmd "${terminfo[kdch1]}" delete-char
else
  bindkey -M emacs "^[[3~" delete-char
  bindkey -M viins "^[[3~" delete-char
  bindkey -M vicmd "^[[3~" delete-char

  bindkey -M emacs "^[3;5~" delete-char
  bindkey -M viins "^[3;5~" delete-char
  bindkey -M vicmd "^[3;5~" delete-char
fi

typeset -g -A key
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Control Left - go back a word
key[Control-Left]="${terminfo[kLFT5]}"
if [[ -n "${key[Control-Left]}"  ]]; then
	bindkey -M emacs "${key[Control-Left]}"  backward-word
	bindkey -M viins "${key[Control-Left]}"  backward-word
	bindkey -M vicmd "${key[Control-Left]}"  backward-word
fi

# Control Left - go forward a word
key[Control-Right]="${terminfo[kRIT5]}"
if [[ -n "${key[Control-Right]}" ]]; then
	bindkey -M emacs "${key[Control-Right]}" forward-word
	bindkey -M viins "${key[Control-Right]}" forward-word
	bindkey -M vicmd "${key[Control-Right]}" forward-word
fi

# Alt Left - go back a word
key[Alt-Left]="${terminfo[kLFT3]}"
if [[ -n "${key[Alt-Left]}"  ]]; then
	bindkey -M emacs "${key[Alt-Left]}"  backward-word
	bindkey -M viins "${key[Alt-Left]}"  backward-word
	bindkey -M vicmd "${key[Alt-Left]}"  backward-word
fi

# Control Right - go forward a word
key[Alt-Right]="${terminfo[kRIT3]}"
if [[ -n "${key[Alt-Right]}" ]]; then
	bindkey -M emacs "${key[Alt-Right]}" forward-word
	bindkey -M viins "${key[Alt-Right]}" forward-word
	bindkey -M vicmd "${key[Alt-Right]}" forward-word
fi



# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'


# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ALIAS-SECTION

# Aliases, lots of aliases
alias ping="ping -c 4"
alias sysinfo="fastfetch -l none > ff.log"
alias mcc="musl-gcc"
alias ls="eza -gab --group-directories-first -t=modified --time-style=long-iso --git -M --git-repos --classify=always"
alias la="eza -lghab --group-directories-first --header -t=modifed --time-style=long-iso --git"
alias lt="eza -lgTab --group-directories-first -t=modified --time-style=long-iso --git"
alias vi="nvim"
alias nv="nvim"
alias ripgrep="rg"
alias clc="clear"
alias pamcan="pacman"
alias sleep="sudo systemctl suspend"
#alias pacman="paru"
alias pip="pip3"
alias ova2qcow="sudo /bin/ova2qcow.sh"
#alias less="bat"
#alias more='bat'
#
# my additions
#prompt='%F{#0ab0ab}[%n@%M %2~]$%f '
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/root/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/bin/VitalBinaries:$PATH"
export PATH="$HOME/Documents/scripts:$PATH"
export PATH="/usr/local/ADS2023/bin:$PATH"
export PATH="$HOME/ti/ccs1260/ccs/tools/compiler:$PATH"
# LSPs from Mason
export PATH="$HOME/.local/share/data/mason/bin:$PATH"

alias pip="python3 -m pip"
alias venv="python3 -m venv"
alias nvzshrc="/usr/bin/nvim $HOME/.zshrc && source $HOME/.zshrc"
alias nvzhsrc="/usr/bin/nvim $HOME/.zshrc && source $HOME/.zshrc"
alias zshr="source $HOME/.zshrc"
alias zhsr="source $HOME/.zshrc"
alias nvprompt="nv $HOME/.config/starship.toml"
alias nfs-thinkpad="sudo mount -o,vers=3 192.168.1.5:/mnt/main-pool/thinkpad /mnt/share/nasdir"
alias nfs-omen="sudo mount -o,vers=3 192.168.1.5:/mnt/main-pool/omen-dataset /mnt/share/nasdir"
alias nfs-off="sudo umount /mnt/share/nasdir"
alias unmount="umount"
alias q="exit"
alias octave="cd $HOME/Documents/CodingProjects/Octave && octave && cd -"
alias ssh-ubuntusrv="ssh 192.168.122.194"
alias ascii="gwenview ~/Pictures/ASCII-Table.png"
alias eventpass="gwenview ~/Documents/ImportantStuff/UBEVentPass.png"
alias nvblacklist="sudo nvim /etc/modprobe.d/blacklist.conf"
alias emacs="emacs -nw"
alias gmacs="emacs"
alias gfcc="gfortran"
alias gpp="g++ -std=c++17"
alias rm="/bin/rm"
alias ff="fastfetch"
alias clpp="clang++"
alias cl="clang"
alias renv="source initenv.sh"
alias sshaws="ssh -i $HOME/.ssh/aws-rsa.pem admin@ec2-54-210-198-149.compute-1.amazonaws.com"

#alias nvconfig="nvim $HOME/.config/nvim/init.vim"
alias nvconfig="nvim $HOME/.config/nvim/init.lua"
alias nvplugins="nvim $HOME/.config/nvim/lua/plugins/init.lua"
alias nvsway="nvim $HOME/.config/sway/config"
alias nvtmux="nvim $HOME/.tmux.conf"
alias icat="kitty icat"
alias nvkitty="nvim $HOME/.config/kitty/kitty.conf"

# alias fpgal="openFPGALoader"




# ssh-stuff
alias ssh-fix="~/Documents/CodingProjects/ShellScripts/ssh-fix.sh"



#aliases from root
## Useful aliases
alias grubup="sudo update-grub"
alias tarnow='tar -acf '
alias mktar="tar -acf"
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB (expac must be installed)

alias helpme='cht.sh --shell'
alias tb='nc termbin.com 9999'
# alias start-pintos="docker start pintos; docker exec -it pintos /usr/bin/fish"
# alias pish="docker exec -it pintos /usr/bin/fish"
alias nvkernel="sudo nvim /etc/default/grub"
alias edit-grub="sudo nvim /boot/grub/grub.cfg"
alias flips="$HOME/Documents/CodingProjects/SNES-SMW/floating/flips-linux"
alias gst-inspect="gst-inspect-1.0"
# school
alias ssht="ssh njfox4@timberlake.cse.buffalo.edu"

#alias ls="/usr/bin/ls"
alias ahex="$HOME/Documents/School/Microprocessors/nfox18212.github.io/scripts/asciitohex.py"

# aws ssh
alias ssha="ssh -i \"~/.ssh/aws-rsa.pem\" admin@ec2-54-210-198-149.compute-1.amazonaws.com"
# F4PGA Stuff - may change
# export INSTALL_DIR="$HOME/Documents/CodingProjects/verilog/f4pga-examples/bin"
# export FPGA_FAM="xc7"

# arm stuff
alias gcca="arm-none-eabi-gcc"
# Wayland
# WAYLAND_DISPLAY=no

# X2Go - Careful, might crash
alias x2go="x2goclient --broker-url=ssh://lts-broker.sens.buffalo.edu/usr/bin/x2gobroker-ssh"
# vfio stuff
alias lgc="looking-glass-client -f /dev/kvmfr0"


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completio

eval "$(zoxide init --cmd cd zsh)"





[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Added by ProtonUp-Qt on 26-06-2024 21:43:20
if [ -d "/home/nfox/stl/prefix" ]; then export PATH="$PATH:/home/nfox/stl/prefix"; fi

alias wayshell="waydroid shell bash"

. "$HOME/.local/share/../bin/env"

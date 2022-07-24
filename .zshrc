# Luke's config for the Zoomer Shell
################################
#Autocomplete from history
################################
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
#bindkey '' history-beginning-search-menu

export EDITOR=nvim
export VISUAL=nvim
export CALCURSE_EDITOR=nvim

################################
# Enable colors and change prompt:
################################
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

################################
# History in cache directory:
################################
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

################################
# Basic auto/tab complete:
################################
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
#_comp_options+=(globdots)		# Include hidden files.

################################
# vi mode
################################
bindkey -v
export KEYTIMEOUT=1

###################################
# Use vim keys in tab complete menu:
###################################
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

##############################################
# Change cursor shape for different vi modes.
##############################################
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#####################################################
# Use lf to switch directories and bind it to ctrl-o
#####################################################
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

#####################################################
# Use ctrl-p to fzf on proyects
#####################################################
open_proyects () {cd "$(find ~/Projects -type d | fzf)"}
bindkey -s '^p' 'open_proyects\n'

###########################
#Some fzf search functions
###########################
open () {xdg-open "$(find -type f | fzf)"}
music () {mpv "$(find ~/Media/Music/ -type f | fzf --keep-right)"}
geserisk () {cd "$(find ~/Projects/geserisk/ -type d | fzf)"}
fcd () {cd "$(find -type d -not -path '*/\.*' | fzf)"}

####################################
# Edit line in vim with ctrl-e:
####################################
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

##############
#MAIN aliases
##############
alias mv='mv -i'
alias rm='rm -i'
alias vim='nvim'

#################################
#my aliases
#################################
alias record-screen='sh ~/.script/record-desktop.sh'
alias webcam='mpv av://v4l2:/dev/video0 &'
alias invert_color='xcalib -invert -alter'
alias revert_color='xcalib -clear'
alias mount_disk_a='sudo mount /dev/sda4 /mnt'
alias cdwm='cd ~/Programs/my_git/my_dwm/ && vim config.h'
alias search='surf duckduckgo.com'

#####################
#ssh aliases
#####################
alias connect_domecq='ssh domecq@domecq.academy -p 2230'
alias 42ansible='ssh root@ansiblecluster.42malaga.com -p 4222'
alias 42syslog='ssh root@syslog.42malaga.com -p 4222'
alias 42test='ssh root@dev-testing.42malaga.com -p 4222'

########################
#Add my scripts to path
########################
export PATH=/usr/bin/my_scripts/:$PATH

##################################################
# Load zsh-syntax-highlighting; should be last.
##################################################
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#!/bin/zsh

# colorredstderr
# https://erlangen-sheppy.medium.com/colour-linux-error-output-red-7923c0d7dd6e
LD_PRELOAD="/home/kathi/extCode/colorredstderr-mirror/src/.libs/libcoloredstderr.so"
COLORED_STDERR_FDS=2,
export LD_PRELOAD COLORED_STDERR_FDS

if [[ $FIRST_RUN == "FALSE" ]]; then
    ;
else
    FIRST_RUN="FALSE"
    export FIRST_RUN
    exec zsh
fi

## colors ##
autoload -U colors && colors
setopt promptsubst

USER_COLOR='yellow'
HOST_COLOR='red'
EMOJI_COLOR='yellow'
PATH_COLOR='cyan'
SEPARATOR_LINE_COLOR='yellow'
HOST_SEPARATOR_COLOR='white'
PATH_SEPARATOR_COLOR='magenta'
INPUT_COLOR='magenta'


## prompt ##
HOST_SEPARATOR='@'
SIMPLE_SEPARATOR=':'
INPUT='~~~> '

TIME="%F{$EMOJI_COLOR} %D{%T}"
SEPARATOR_LINE=%F{$SEPARATOR_LINE_COLOR}$'${(r:$COLUMNS-18::\u2500:)}'%f
EMOJI=%F{$EMOJI_COLOR}$'\xA0\xA0\x28\x5E\x95\x5E\x29\x2F\x22'%f
USER_NAME="%F{$USER_COLOR}%n%f"
USER_NAME_SEPARATOR="%F{$HOST_SEPARATOR_COLOR}${HOST_SEPARATOR}%f"
HOSTNAME="%F{$HOST_COLOR}%m%f"
MYPATH="%F{$PATH_SEPARATOR_COLOR}:%f%F{$PATH_COLOR}%~%f"
INPUT_SIGN=%F{$INPUT_COLOR}${INPUT}%f
PS1="${SEPARATOR_LINE}${TIME}${EMOJI}"$'\n'"${USER_NAME}${USER_NAME_SEPARATOR}${HOSTNAME}${MYPATH}"$'\n'"${INPUT_SIGN}"

# history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# SEARCH HISTORYFILE #
if ! [ -x "$(command -v peco)" ]; then
    bindkey '^R' history-incremental-pattern-search-backward
else
    ## bind peco to ctrl-R as a better reverse search than the buitin if it is availible
    reverse_search(){print -z "$(tac ${HISTFILE} | peco)"}
    zle -N rs_peco reverse_search
    bindkey ^R rs_peco
    PECO=/usr/bin/
fi

## colors for manpages ##
export LESS_TERMCAP_mb=$'\e[01;31m' # blinking mode - red
export LESS_TERMCAP_md=$'\e[01;35m' # syntax and keywords | enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$'\e[0m' # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$'\e[0m' # leave standout mode    
export LESS_TERMCAP_so=$'\e[01;33m' # tatusbar and searchhighlights | enter standout mode - yellow
export LESS_TERMCAP_ue=$'\e[0m' #background | leave underline mode
export LESS_TERMCAP_us=$'\e[04;36m' #variables | enter underline mode - cyan

## alias ##
alias ll='ls -lhs --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias lr='ls -latr --color=auto'
alias ls='ls --color=auto'
alias ..='cd ..'
alias ...='cd ../../'
#alias -g ...='../..'
#alias -g ....='../../..'
alias exit='disown -a && exit'
alias python='/usr/bin/python3.9'
alias v='vim'
##monitors ##
#first (and afterwards) 'herbstclient detect_monitors'
alias xrandr-new='xrandr --output HDMI-2 --right-of eDP-1 --mode 3840x2160 --fb 8192x4320 --pos 0x0'
alias xrandr-def='xrandr --output HDMI-2 --off'
alias scrsleep='xset dpms force off'
##backup
alias backup='restic -r sftp:pi@raspi3:/media/secure/backup/thinKpad --verbose backup ~/'
#git
#alias -g fixup="!function f() { TARGET=$(git rev-parse "$1"); git commit --fixup=$TARGET ${@:2} && EDITOR=true git rebase -i --autostash --autosquash $TARGET^; }; f()"
alias storage='sftp u294754@u294754.your-storagebox.de'

## whatever provides ##
whateverprovides(){
    apt-file search --regexp "bin/$1""$"
}
export whateverprovides

## where is string ##
wherestring(){
    grep -nr "$1" -e "$2"
}
export wherestring

# git bare repository for my dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


## path ##
PATH=~/extCode/pycharm-community-2022.1:/bin:/usr/bin:/usr/local/bin:~/.local/bin:${PATH}
export PATH


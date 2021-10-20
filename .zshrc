#!/bin/zsh

# colorredstderr
# https://erlangen-sheppy.medium.com/colour-linux-error-output-red-7923c0d7dd6e
LD_PRELOAD="/home/kathi/extCode/colorredstderr-mirror/src/.libs/libcoloredstderr.so"
COLORED_STDERR_FDS=2,
export LD_PRELOAD CLORED_STDERR_FDS

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

SEPARATOR_LINE=%F{$SEPARATOR_LINE_COLOR}$'${(r:$COLUMNS-10::\u2500:)}'%f
EMOJI=%F{$EMOJI_COLOR}$'\xA0\xA0\x28\x5E\x95\x5E\x29\x2F\x22'%f
USER_NAME="%F{$USER_COLOR}%n%f"
USER_NAME_SEPARATOR="%F{$HOST_SEPARATOR_COLOR}${HOST_SEPARATOR}%f"
HOSTNAME="%F{$HOST_COLOR}%m%f"
PATH="%F{$PATH_SEPARATOR_COLOR}:%f%F{$PATH_COLOR}%~%f"
INPUT_SIGN=%F{$INPUT_COLOR}${INPUT}%f
PS1="${SEPARATOR_LINE}${EMOJI}"$'\n'"${USER_NAME}${USER_NAME_SEPARATOR}${HOSTNAME}${PATH}"$'\n'"${INPUT_SIGN}"

## colors for manpages ##
export LESS_TERMCAP_mb=$'\e[01;31m' # blinking mode - red
export LESS_TERMCAP_md=$'\e[01;35m' # syntax and keywords | enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$'\e[0m' # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$'\e[0m' # leave standout mode    
export LESS_TERMCAP_so=$'\e[01;33m' # tatusbar and searchhighlights | enter standout mode - yellow
export LESS_TERMCAP_ue=$'\e[0m' #background | leave underline mode
export LESS_TERMCAP_us=$'\e[04;36m' #variables | enter underline mode - cyan

## alias ##
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias lr='ls -latr --color=auto'
alias ls='ls --color=auto'
alias ..='cd ..'
alias ...='cd ../../'
alias exit='disown -a && exit'

# git bare repository for my dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


## path ##
PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH


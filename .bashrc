# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\w\$ ' # \u@\h:\w\$ 
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

#kathis aliase:
alias "k:"="cd /mnt/daten/Kathi"
alias rip="cd /mnt/daten/Kathi/uni/rip"
alias kavpn="sudo /usr/sbin/openvpn --config /mnt/daten/linksysRouter/openvpn/kaFinal_1566674340.ovpn"
alias univpn="sudo /usr/sbin/openvpn --config /mnt/daten/Kathi/uni/vpn/FAU-Fulltunnel.ovpn"
alias pow='cat /sys/class/power_supply/AC/uevent | grep -E POWER_SUPPLY_ONLINE; cat /sys/class/power_supply/BAT0/uevent | grep -wE "POWER_SUPPLY_STATUS|POWER_SUPPLY_CAPACITY" '
alias pwdsimple='python /mnt/daten/pwdsimple.py'
alias pwdhard='python /mnt/daten/pwdhard.py'
alias telecom='/home/kathi/Downloads/tg/bin/telegram-cli -W -N -k tg-server.pub'
alias pip=pip3
alias python=python3
alias sshPi="ssh -X pi@192.168.1.121" #X to be able to open new terminal within session
alias bwarning="python3 /mnt/daten/spielewiese/batterywarning/BatteryWarning.py &"
alias bwextreme="python3 /mnt/daten/spielewiese/batterywarning/BatteryWarningExtreme.py &"
alias telegram="telegram &"
alias ff="firefox -private &"
alias tgphoto='/home/kathi/scripts/tg_photo.sh'
alias tgmsg="/home/kathi/scripts/tg_savemessage.sh"
alias "xrandr--home"="xrandr --auto --output eDP-1 --auto --right-of HDMI-1"
alias "xrandr--small"="xrandr --output HDMI-1 --off"
alias "xrandr--new"="xrandr --output HDMI-1 --scale 0.335x0.335  --mode 3840x2160 --fb 8192x4320 --pos 0x0"
alias speedtest="curl ftp://speedtest.tele2.net/1GB.zip -o /dev/null"
alias mountnas="sudo mount -t cifs //192.168.178.204/work /mnt/nas -o credentials=~/.testfile,sec=ntlm,vers=2.0"
alias ..="cd .."
alias exit="disown -a && exit"
alias nas="cd /mnt/nas"
alias brightness="xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' '"
alias sp="cd /mnt/daten/spielewiese"
alias uni="cd /mnt/daten/Kathi/uni"
alias druck="lpr -PMFCJ5730DW"
alias shutdown="sudo shutdown now"
alias iwconfig="sudo iwconfig"
alias linux="cd /mnt/daten/linux/"
alias iwgetid="sudo iwgetid"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias sman='~/scripts/searchMan.sh'
alias cman='~/scripts/randomManC.sh'
alias lman='~/scripts/randomManL.sh'
alias ccat="pygmentize -g -O style=colorful,linenos=1"

export PATH=$PATH:~/application/Telegram/Telegram:/usr/sbin/
export PATH=$PATH:~/scripts/
export LC_ALL=C
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
#color scheme for manpages:
export LESS_TERMCAP_mb=$'\e[;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

set -o vi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kathi/application/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kathi/application/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kathi/application/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kathi/application/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


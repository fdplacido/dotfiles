#!/bin/bash
iatest=$(expr index "$-" i)

#######################################################
# Load python virtualenv default installation
#######################################################

source ~/apps/venv/bin/activate
pip -V

#######################################################
# Load tmux on first terminal
#######################################################
# 1. check existance of tmux command
# 2. check for interactive shell (PS1)
# 3. Avoid tmux (and screen) running within itself
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # with exec command, on exiting tmux the terminal is closed
  # also with exec, on opening second window no duplicate session is catched	
  # on this config, new window can be run from the terminal `st -t "name"`
  # exec tmux new -s PL

  # alternatively just run tmux (but duplicate session detected)
  tmux new -s PL

  # tmux a -t PL || exec tmux new -s PL && exit;
fi

#######################################################
# SOURCED ALIAS'S AND SCRIPTS
#######################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
	 . /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Source fzf variables
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

#######################################################
# EXPORTS
#######################################################

# if command -v subl > /dev/null; then
#     export EDITOR="subl -w";
# else
#     export EDITOR="nano -lm";
# fi

export EDITOR=/usr/bin/vim
export BROWSER=/usr/bin/firefox

export NNN_TRASH=1

# for nnn file manager to do cd on exit
export NNN_TMPFILE="/tmp/nnn"
n()
{
    export NNN_TMPFILE=${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd

    nnn "$@" -d

    if [ -f $NNN_TMPFILE ]; then
            . $NNN_TMPFILE
            rm -f $NNN_TMPFILE > /dev/null
    fi
}

# #############################
# # Ranger file manager stuff
# #############################
# export RANGER_LOAD_DEFAULT_RC=FALSE
# # https://github.com/ranger/ranger/blob/master/examples/bash_automatic_cd.sh
# function ranger-cd {
#     tempfile="$(mktemp -t tmp.XXXXXX)"
#     ~/apps/venv/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
#     test -f "$tempfile" &&
#         if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
#             cd -- "$(cat "$tempfile")"
#         fi
#     rm -f -- "$tempfile"
# }
# # https://wiki.archlinux.org/index.php/Ranger#Shell_tips
# rg() {
#     if [ -z "$RANGER_LEVEL" ]
#     then
#         ranger-cd
#     else
#         exit
#     fi
# }

# # Disable the bell
# if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Allow ctrl-S for history navigation (with ctrl-R)
# stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
# export GREP_OPTIONS='--color=auto'

#######################################################
# APPLICATION ALIAS'S
#######################################################

# alias jp=jupyter-notebook
# alias subl=subl3
# alias gtt="gnome-terminal --title"
# alias alt="alacritty -t"
# alias stt="st -t"

# Check https://github.com/chubin/cheat.sh

#######################################################
# COMMANDS ALIAS'S
#######################################################

# alias ncdu="-rr --exclude .git"

#######################################################
# GENERAL ALIAS'S
#######################################################
# To temporarily bypass an alias, we preceed the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls

# fzf search with preview
alias preview="fzf --preview 'bat --color \"always\" {}'"

# This is GOLD for finding out what is taking so much space on your drives!
# use ncdu 
# alias diskspace="du -S | sort -n -r |more"

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Alias's to modified commands
# alias cp='cp -i'
# alias mv='mv -i'
# alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'

# Remove a directory and all files
# alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
alias la='ls -AghF --color=always --group-directories-first' # show hidden files
# alias ls='ls -Fh --color=always' # add colors and file type extensions
# alias lx='ls -lXBh' # sort by extension
# alias lk='ls -lSrh' # sort by size
# alias lc='ls -lcrh' # sort by change time
# alias lu='ls -lurh' # sort by access time
# alias lr='ls -lRh' # recursive ls
# alias lt='ls -ltrh' # sort by date
# alias lm='ls -alh |more' # pipe through 'more'
# alias lw='ls -xAh' # wide listing format
# alias ll='ls -Fls' # long listing format
# alias labc='ls -lap' #alphabetical sort
# alias lf="ls -l | egrep -v '^d'" # files only
# alias ldir="ls -l | egrep '^d'" # directories only

# Alias for exa
alias exa='exa -hla --git'

# # alias chmod commands
# alias mx='chmod a+x'
# alias 000='chmod -R 000'
# alias 644='chmod -R 644'
# alias 666='chmod -R 666'
# alias 755='chmod -R 755'
# alias 777='chmod -R 777'

# # Search command line history
# alias h="history | grep "

# # Search running processes
# alias p="ps aux | grep "
# alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# # Search files in the current folder
# alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# # To see if a command is aliased, a file, or a built-in command
# alias checkcommand="type -t"

# # Alias's for safe and forced reboots
# alias rebootsafe='sudo shutdown -r now'
# alias rebootforce='sudo shutdown -r -n now'

# # Alias's to show disk space and space used in a folder
# alias diskspace="du -S | sort -n -r |more"
# alias folders='du -h --max-depth=1'
# alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
# alias tree='tree -CAhF --dirsfirst'
# alias treed='tree -CAFd'
# alias mountedinfo='df -hT'

# # Alias's for archives
# alias mktar='tar -cvf'
# alias mkbz2='tar -cvjf'
# alias mkgz='tar -cvzf'
# alias untar='tar -xvf'
# alias unbz2='tar -xvjf'
# alias ungz='tar -xvzf'

#######################################################
# SPECIAL FUNCTIONS
#######################################################

# Force unzip to extract to a folder
unzip_d () {
    zipfile="$1"
    zipdir=${1%.zip}
    unzip -d "$zipdir" "$zipfile"
}

# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip_d $archive     ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# Searches for text in all files in the current folder
ftext ()
{
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

# Goes up a specified number of directories  (i.e. up 4)
# up ()
# {
# 	local d=""
# 	limit=$1
# 	for ((i=1 ; i <= limit ; i++))
# 		do
# 			d=$d/..
# 		done
# 	d=$(echo $d | sed 's/^\///')
# 	if [ -z "$d" ]; then
# 		d=..
# 	fi
# 	cd $d
# }

# Simplified version of up. Prints current directory
up() 
{ 
	cd $(eval printf '../'%.0s {1..$1}) && pwd; 
}

#######################################################
# Set PS1 colors
#######################################################

function __setprompt
{
	PS1=""

	# Define colors
	local LIGHTGRAY="\033[0;37m"
	local WHITE="\033[1;37m"
	local BLACK="\033[0;30m"
	local DARKGRAY="\033[1;30m"
	local RED="\033[0;31m"
	local LIGHTRED="\033[1;31m"
	local GREEN="\033[0;32m"
	local LIGHTGREEN="\033[1;32m"
	local BROWN="\033[0;33m"
	local YELLOW="\033[1;33m"
	local BLUE="\033[0;34m"
	local LIGHTBLUE="\033[1;34m"
	local MAGENTA="\033[0;35m"
	local LIGHTMAGENTA="\033[1;35m"
	local CYAN="\033[0;36m"
	local LIGHTCYAN="\033[1;36m"
	local NOCOLOR="\e[0m"


	# \e and \033 are equivalent
	# See https://misc.flogisoft.com/bash/tip_colors_and_formatting

	# \033[01;38;5;220m
	# \033 to scape the command
	# [00 or [01 for normal or bold
	# ;38;5 is to use the 256 colors
	# ;220m for the actual color
	local CUSTOMGREEN="\e[00;38;5;29m"
    local CUSTOMGREEN2="\e[00;38;5;10m"
    local CUSTOMGREENBOLD="\e[01;38;5;29m"
	local CUSTOMYELLOW="\e[00;38;5;220m"
    local CUSTOMYELLOW2="\e[00;38;5;4m"

	git_branch() {
    	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
	}

	# User
	# PS1+="\[${CUSTOMGREEN}\] α⁺ \u@\h"
	PS1+="\[${CUSTOMGREEN2}\]\u@\h"
	# Current directory
	PS1+="\[${DARKGRAY}\]:\[${CUSTOMYELLOW2}\]\w"
	# Separation
	PS1+="\[${CUSTOMGREEN2}\] \$(git_branch)⟩\[${NOCOLOR}\] " # Normal user
}
PROMPT_COMMAND='__setprompt'

# PS1='\u \w $ '

# Expand the history size
export HISTFILE=~/.bash_history
export HISTFILESIZE=500000
export HISTSIZE=500000
# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=ignoredups:erasedups
# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
# run this after every command (save and reload history) -n: append new line, -w: write history, -c: clear the history list, -r: reload the current history file
# unset PROMPT_COMMAND
export PROMPT_COMMAND="history -n;history -w;history -c;history -r;$PROMPT_COMMAND"

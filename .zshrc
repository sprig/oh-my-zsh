# -*- mode: sh -*-
################################################
################ Terminal setup ################
################################################

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crcandy"
#ZSH_THEME="agnoster"


## If we are on a real tty, start fbterm
# [[ $(tty) == /dev/tty[2-5] ]] && which fbterm && exec fbterm

# # Disable customizations if the terminal is "dumb".
# # It probably is a program typing automated commands (like Emacs's TRAMP mode).
# if [ "$TERM" = "dumb" ]; then
# 	unsetopt zle # Disable the Zsh Line Editor.

# 	# Sh-like prompt.
# 	if [ $EUID -ne 0 ]; then
# 		PS1="$ "
# 	else
# 		PS1="# "
# 	fi

# 	emulate -R sh # Reset options and variables to emulate sh.

# 	export DISABLE_CUSTOMIZATIONS=1
# fi

case "$TERM" in
    ## Make the term colorful.
    xterm*)
	export TERM="xterm-256color"
	;;
    ## If we got here, we are in fbterm or similar.
    linux*)
	case $(tty) in
	    /dev/pts/[1-9]*)
		export TERM=fbterm
		exec screen -c ~/.clearscreenrc
		;;
	    /dev/tty[3-5])
		which fbterm && exec fbterm || ZSH_THEME="blinks"
		;;
	    *)
		ZSH_THEME="blinks"
		;;
	esac
	;;
    ## Currently, do nothing but later start a screen session.
    fbterm*)
	;;
    ## Make sure screen reports all colors.
    screen*)
	export TERM=screen-256color
	;;
    ## No theme for dumb term.
    dumb)
	export ZSH_THEME=""
	;;
esac

## Disable the start/stop sequences
stty stop ''
stty start ''

## Language

LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

## Allow comment in interactive prompt.
set -k

###########################################
###########################################

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ruby git git-extras git-remote-branch dircycle lein per-directory-history pip redis-cli sprunge supervisor svn vagrant pass virtualenvwrapper safe-paste zsh-syntax-highlighting)

# Customize to your needs...
export EDITOR="vim"

includes=(
    "$HOME/.aliases"
    "$HOME/.path"
    "$HOME/.private"
    "$HOME/.display"
    "$HOME/.dbus-reconnect"
    "$HOME/.local/bin/virtualenvwrapper.sh"
    "$HOME/.rvm/scripts/rvm"
    "$HOME/.system-cust"
)

## Source all the includes
for include in ${includes[*]}; do
    [ -f $include ] && . "$include"
done

source $ZSH/oh-my-zsh.sh

if which mr 1> /dev/null; then
  if MROUT="$(chdir $HOME; mr -m s 2>/dev/null)"; then
      echo $MROUT;
  else
      echo "$(chdir $HOME; mr s)";
  fi
fi

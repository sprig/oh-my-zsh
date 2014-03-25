################################################
################ Terminal setup ################
################################################

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="blinks"
ZSH_THEME="agnoster"

## If we are on a real tty, start fbterm
[[ $(tty) == /dev/tty[1-5] ]] && exec fbterm


case "$TERM" in
    ## Make the term colorful.
    xterm*)
	export TERM="xterm-256color"
	;;
    ## If we got here, we are in fbterm.
    linux*)
	case $(tty) in
	    /dev/tty[1-5])
		export TERM=fbterm
		exec screen -c ~/.clearscreenrc
		;;
	    /dev/tty6)
		ZSH_THEME="blinks"
	esac
	;;
    ## Currently, do nothing but later start a screen session.
    fbterm*)
	;;
    ## Make sure screen reports all colors.
    screen*)
	export TERM=screen-256color
	;;
esac

## Disable the start/stop sequences
stty stop ''
stty start ''

###########################################
###########################################

## Make sure the terminal language is set correctly!
LANG=en_US.utf8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

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
plugins=(git git-extras git-remote-branch debian dircycle lein per-directory-history pip redis-cli sprunge sublime supervisor svn tmux vagrant pass virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

includes=(
    "$HOME/.bash_aliases"
    "$HOME/.path"
    "$HOME/.private"
    "$HOME/.display"
    "$HOME/.dbus-reconnect"
    "$HOME/.local/bin/virtualenvwrapper.sh"
)

## Source all the includes
for include in ${includes[*]}; do
    [ -f $include ] && . "$include"
done

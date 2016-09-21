# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amber"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git svn vi-mode autojump tmux pip cp)
plugins=(git svn autojump tmux pip cp systemd)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
  #export EDITOR='vim'
#else
  #export EDITOR='mvim'
#fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# File association
# autoload -U zsh-mime-setup
# zsh-mime-setup
# alias -s _postfix=_program

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PATH=$PATH:$HOME/code/shell
PATH=$PATH:$HOME/code/python

# for powerline
#PATH=$PATH:$HOME/.local/bin
#if [[ -r ~/.local/lib/python3.4/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
	#source ~/.local/lib/python3.4/site-packages/powerline/bindings/zsh/powerline.zsh
#fi

source $HOME/.alias
source $HOME/.function

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

#for cheat
export CHEATCOLORS=true

# GREP_OPTIONS is deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# change default behaviour of vi-mode plugin
function vi_mode_prompt_info() {
  if [[ "${KEYMAP}x" == "vicmdx" ]]; then
    echo "$fg[yellow]n$reset_color "
  elif [[ "${KEYMAP}x" == "mainx" ]]; then
    echo "$fg[yellow]i$reset_color "
  fi
}

export TERM=xterm-256color

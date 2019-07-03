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
plugins=(git-prompt autojump tmux pip cp systemd jump)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# alias
alias enablegitproxy='git config --global core.gitProxy gitproxy.sh'
alias disenablegitproxy='git config --global --unset core.gitProxy'
alias showgitproxy='git config --global core.gitProxy'

alias zrc='vim ~/.zshrc'
alias vrc='vim ~/.vimrc'

alias cls='echo -en "\ec"'

alias t2x='tmux show-buffer | xclip -selection clipboard'
alias x2t='tmux set-buffer "$(xclip -o)"'

if [ "$shellx" = "zshx" ]; then
	alias -s c=vim
	alias -s h=vim
	alias -s cpp=vim
	alias -s hpp=vim
	alias -s md=vim
	alias -s sh=vim
	alias -s py=vim

	alias -s conf=vim
fi

alias gtag='ctags -R; cscope-indexer -r'
alias dtag='rm tags cscope.files cscope.out'

alias cl='clear'

# function
function enableproxy()
{
    if [ $# -gt 0 ]; then
        export http_proxy=http://127.0.0.1:$1
    elif [ x = x"$PROXY_PORT" ]; then
        export http_proxy=http://127.0.0.1:1080
    else
        export http_proxy=http://127.0.0.1:$PROXY_PORT
    fi
	export https_proxy=$http_proxy
	export HTTP_PROXY=$http_proxy
	export HTTPS_PROXY=$HTTP_PROXY
}

function disableproxy()
{
	unset http_proxy
	unset https_proxy
	unset HTTP_PROXY
	unset HTTPS_PROXY
}

# plugin
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/doc/pkgfile/command-not-found.zsh

#for cheat
export CHEATCOLORS=true

# superman: show man in vim
vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}
compdef vman="man"

# GREP_OPTIONS is deprecated
if [[ -n "$GREP_OPTIONS" ]]; then
    alias grep="`which grep` $GREP_OPTIONS"
    unset GREP_OPTIONS
fi

# change default behaviour of vi-mode plugin
function vi_mode_prompt_info() {
  if [[ "${KEYMAP}x" == "vicmdx" ]]; then
    echo "$fg[yellow]n$reset_color "
  elif [[ "${KEYMAP}x" == "mainx" ]]; then
    echo "$fg[yellow]i$reset_color "
  fi
}

export TERM=xterm-256color

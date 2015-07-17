local PROMPT_L1='${_date_time}$(_user_host)$(_vi_status)${_current_dir}$(git_prompt_info)$(_git_time_since_commit)$(git_prompt_status)$(git_prompt_ahead)$(_ruby_version)'
#local PROMPT_L2='${_return_code}▶ '
local PROMPT_L2='${_return_code2}${_color_prompt} '

PROMPT="${PROMPT_L1}
${PROMPT_L2}"

RPROMPT=''

PROMPT2='%{$fg[grey]%}◀%{$reset_color%} '

local _color_prompt="%{$fg[${CARETCOLOR}]%}%(?..%{$fg[red]%})>%{$reset_color%}"
local _current_dir="%{$fg[blue]%}%3~%{$reset_color%} "
local _return_status="%{$fg[red]%}%(?..⍉ )%{$reset_color%}"
local _return_code="%{$fg[red]%}%(?..%? ↵)%{$reset_color%}"
local _return_code2="%{$fg[red]%}%(?..%?)%{$reset_color%}"
local _return_code3="%{$fg[red]%}%? %{$reset_color%}"
local _hist_no="%{$fg[grey]%}%h%{$reset_color%} "
local _date_time="%{$fg[magenta]%}%T%{$reset_color%} "

function _user_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[cyan]%}$me%{$reset_color%}:"
  fi
}

function _vi_status() {
  if {echo $fpath | grep -q "plugins/vi-mode"}; then
    echo "$(vi_mode_prompt_info)"
  fi
}

function _ruby_version() {
  if {echo $fpath | grep -q "plugins/rvm"}; then
    echo "%{$fg[grey]%}$(rvm_prompt_info)%{$reset_color%} "
  fi
}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function _git_time_since_commit() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    # Only proceed if there is actually a commit.
    if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
      # Get the last commit.
      last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
      now=$(date +%s)
      seconds_since_last_commit=$((now-last_commit))

      # Totals
      minutes=$((seconds_since_last_commit / 60))
      hours=$((seconds_since_last_commit/3600))

      # Sub-hours and sub-minutes
      days=$((seconds_since_last_commit / 86400))
      sub_hours=$((hours % 24))
      sub_minutes=$((minutes % 60))

      if [ $hours -gt 24 ]; then
          commit_age="${days}d"
      elif [ $minutes -gt 60 ]; then
          commit_age="${sub_hours}h${sub_minutes}m"
      else
          commit_age="${minutes}m"
      fi

      color=$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL
      echo "$color$commit_age%{$reset_color%} "
    fi
  fi
}

if [[ $USER == "root" ]]; then
  CARETCOLOR="yellow"
else
  CARETCOLOR="white"
fi

MODE_INDICATOR="%{$fg[yellow]%}Esc%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔ "
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}◒%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[red]%}!%{$reset_color%} "

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[grey]%}"

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'


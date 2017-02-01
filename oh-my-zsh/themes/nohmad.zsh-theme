# Throw this under ~/.oh-my-zsh/themes/

function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX(${ref#refs/heads/})$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT='%{$fg_bold[green]%}%p%{$fg[cyan]%}%c%{$fg_bold[blue]%}$(git_current_branch)%{$fg_bold[blue]%} \$ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# If you come from bash you might have to change your $PATH.
export LS_OPTIONS="--color=auto"
export CLICOLOR="Yes"
export LSCOLOR=""
export PATH=$HOME/.local/bin:$HOME/.rbenv/shims:/usr/local/bin:$PATH

alias dnsflush='dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias netports='lsof -i4 -i6 -s TCP:LISTEN -P'

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="nohmad"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

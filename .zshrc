#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Activate vim zsh vim bindings
bindkey -v

# Allow comments
set -k

# Re-bind ctrl+r to search (but with pattern)
bindkey '^R' history-incremental-pattern-search-backward

[ -n "$PS1" ] && source ~/.bash_profile


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

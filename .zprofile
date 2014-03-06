# Activate vim zsh vim bindings
bindkey -v

# Re-bind ctrl+r to search (but with pattern)
bindkey '^R' history-incremental-pattern-search-backward

[ -n "$PS1" ] && source ~/.bash_profile

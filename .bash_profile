# includes
[ -n "$PS1" ] && source ~/.paths
[ -n "$PS1" ] && source ~/.exports
[ -n "$PS1" ] && source ~/.aliases
[ -n "$PS1" ] && source ~/.functions

if [ -f ~/.extra ]; then
    [ -n "$PS1" ] && source ~/.extra
fi

#!/usr/bin/env bash

# Make RVM play ball
[[ -s "$HOME/.rvm/src/rvm/scripts/rvm" ]] && source "$HOME/.rvm/src/rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [[ -s $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm;
fi

#!/usr/bin/env bash

# general
ln -sf ~/dotfiles/.paths ~/.paths
ln -sf ~/dotfiles/.aliases ~/.aliases
ln -sf ~/dotfiles/.exports ~/.exports
ln -sf ~/dotfiles/.functions ~/.functions
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile

ln -sf ~/dotfiles/bin ~/bin

# ssh
ln -sf ~/dotfiles/ssh/config ~/.ssh/config

# screen
ln -sf ~/dotfiles/.screenrc ~/.screenrc

# tmux
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# zsh
ln -sf ~/dotfiles/.zprofile ~/.zprofile

# psql
ln -sf ~/dotfiles/.psqlrc ~/.psqlrc

# git
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/.gitignore ~/.gitignore

# vim + janus
ln -sf ~/dotfiles/vim/.vimrc.before ~/.vimrc.before
ln -sf ~/dotfiles/vim/.vimrc.after ~/.vimrc.after
ln -sf ~/dotfiles/vim/.janus ~/.janus

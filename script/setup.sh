#!/usr/bin/env bash
set -e

# general
ln -sf ~/dotfiles/.paths ~/.paths
ln -sf ~/dotfiles/.aliases ~/.aliases
ln -sf ~/dotfiles/.exports ~/.exports
ln -sf ~/dotfiles/.functions ~/.functions
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc

# zsh / prezto
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/.zprofile ~/.zprofile

# -n so an existing ~/bin directory is replaced rather than linked into
ln -sfn ~/dotfiles/bin ~/bin

# ssh
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ln -sf ~/dotfiles/ssh/config ~/.ssh/config

# tmux
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tmux-macos ~/.tmux-macos
ln -sf ~/dotfiles/.tmux-linux ~/.tmux-linux

# nvm
mkdir -p ~/.nvm

# psql
ln -sf ~/dotfiles/.psqlrc ~/.psqlrc

# git
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/.gitignore ~/.gitignore

# neovim
# The whole directory is linked so lua/ and the vim.pack lockfile stay in the repo.
mkdir -p ~/.config
ln -sfn ~/dotfiles/vim ~/.config/nvim


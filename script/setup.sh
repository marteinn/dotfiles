#!/usr/bin/env bash 
# general
ln -sf ~/dotfiles/.paths ~/.paths
ln -sf ~/dotfiles/.aliases ~/.aliases
ln -sf ~/dotfiles/.exports ~/.exports
ln -sf ~/dotfiles/.functions ~/.functions
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile

# zsh / zepto
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zpreztorc ~/.zpreztorc

ln -sf ~/dotfiles/bin ~/bin

# ssh
ln -sf ~/dotfiles/ssh/config ~/.ssh/config

# tmux
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tmux-macos ~/.tmux-macos
ln -sf ~/dotfiles/.tmux-linux ~/.tmux-linux

# zsh
ln -sf ~/dotfiles/.zprofile ~/.zprofile

# psql
ln -sf ~/dotfiles/.psqlrc ~/.psqlrc

# git
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/.gitignore ~/.gitignore

# vim
ln -sf ~/dotfiles/vim/.nvimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/.nvimrc ~/.config/nvim/init.vim

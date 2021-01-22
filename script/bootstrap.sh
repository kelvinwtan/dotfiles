#!/bin/bash

brew_add() { if brew ls --versions "$1"; then HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade "$1"; else HOMEBREW_NO_AUTO_UPDATE=1 brew install "$1"; fi }

brew_add coreutils
brew_add git
brew_add golang
brew_add grep
brew_add vim
brew_add wget
brew_add zsh
brew_add yarn

brew tap homebrew/cask

CASKS=(
  font-roboto-mono-nerd-font
  starship
  visual-studio-code
)

brew cask install ${CASKS[@]}

brew cleanup

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"

ln -sf $DOTFILES/zsh/.zshrc $HOME/.zshrc
ln -s $DOTFILES/.vimrc $HOME/.vimrc
ln -sf $DOTFILES/git/.gitconfig $HOME/.gitconfig
ln -sf $DOTFILES/git/.gitattributes $HOME/.gitattributes
ln -sf $DOTFILES/tmux/.tmux.conf.local $HOME/.tmux.conf.local

ln -s $DOTFILES/starship/starship.toml $CONFIG/starship.toml
ln -s $DOTFILES/lf $CONFIG/lf
ln -sf $DOTFILES/nvim $CONFIG/nvim
ln -s $DOTFILES/alacritty $CONFIG/alacritty
ln -s $DOTFILES/i3 $CONFIG/i3
ln -s $DOTFILES/nix $CONFIG/nix

ln -sf $DOTFILES/.ssh $HOME/.ssh

sublime-text
#ln -sf $DOTFILES/sublime_text/themes/sublime_dark.tmTheme $CONFIG/sublime-text/Packages/sublime_dark.tmTheme
#ln -sf $DOTFILES/sublime_text/Packages/User/pref.sublime-settings $CONFIG/sublime-text/Packages/User/Preferences.sublime-settings
#ln -sf $DOTFILES/sublime_text/Packages/User/keybindings.sublime-keymap $CONFIG/sublime-text/Packages/User/keybindings.sublime-keymap
#ln -s $DOTFILES/sublime_text/Packages/User/adaptive.sublime-theme $CONFIG/sublime-text/Packages/User/Adaptive.sublime-theme

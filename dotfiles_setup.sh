#!/bin/bash


ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/git/.gitattributes ~/.gitattributes
ln -sf ~/.dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local

ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/.dotfiles/lf ~/.config/lf
ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/alacritty ~/.config/alacritty
ln -s ~/.dotfiles/i3 ~/.config/i3

ln -sf ~/.dotfiles/.ssh ~/.ssh

# sublime-text
ln -sf ~/.dotfiles/sublime_text/themes/sublime_dark.tmTheme ~/.config/sublime-text/Packages/sublime_dark.tmTheme
ln -sf ~/.dotfiles/sublime_text/Packages/User/pref.sublime-settings ~/.config/sublime-text/Packages/User/Preferences.sublime-settings
ln -sf ~/.dotfiles/sublime_text/Packages/User/keybindings.sublime-keymap ~/.config/sublime-text/Packages/User/keybindings.sublime-keymap
ln -s ~/.dotfiles/sublime_text/Packages/User/adaptive.sublime-theme ~/.config/sublime-text/Packages/User/Adaptive.sublime-theme


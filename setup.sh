#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"

rm $HOME/.zshrc; ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc
ln -s $DOTFILES/.vimrc $HOME/.vimrc
ln -s $DOTFILES/git/.gitconfig $HOME/.gitconfig
ln -s $DOTFILES/git/.gitattributes $HOME/.gitattributes
#rm $HOME/.tmux.conf.local; ln -s $DOTFILES/tmux/.tmux.conf.local $HOME/.tmux.conf.local

rm $HOME/starship.toml; ln -s $DOTFILES/starship/starship.toml $CONFIG/starship.toml
ln -s $DOTFILES/lf $CONFIG/lf
ln -s $DOTFILES/alacritty $CONFIG/alacritty
ln -s $DOTFILES/dust $CONFIG/dust
ln -s $DOTFILES/tmux $CONFIG/tmux
rm -rf $CONFIG/nvim; ln -s $DOTFILES/nvim $CONFIG/nvim


# --- sublime-text ---
ln -s $DOTFILES/sublime_text/themes/sublime_dark.tmTheme $CONFIG/sublime-text/Packages/sublime_dark.tmTheme
rm $CONFIG/sublime-text/Packages/User/Preferences.sublime-settings; ln -s $DOTFILES/sublime_text/preferences.sublime-settings $CONFIG/sublime-text/Packages/User/Preferences.sublime-settings
rm "$CONFIG/sublime-text/Packages/User/Default (Linux).sublime-keymap"; ln -s $DOTFILES/sublime_text/keybindings.sublime-keymap "$CONFIG/sublime-text/Packages/User/Default (Linux).sublime-keymap"
rm $CONFIG/sublime-text/Packages/User/Adaptive.sublime-theme; ln -s $DOTFILES/sublime_text/adaptive.sublime-theme $CONFIG/sublime-text/Packages/User/Adaptive.sublime-theme

# ln -sf $DOTFILES/.ssh $HOME/.ssh
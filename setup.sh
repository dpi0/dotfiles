#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"

rm -rf $CONFIG/alacritty; ln -s $DOTFILES/alacritty $CONFIG/alacritty
rm -rf $CONFIG/dunst; ln -s $DOTFILES/dunst $CONFIG/dunst
rm -rf $CONFIG/dust; ln -s $DOTFILES/dust $CONFIG/dust
rm -f $HOME/.gitconfig; ln -s $DOTFILES/git/.gitconfig $HOME/.gitconfig
rm -f $HOME/.gitattributes; ln -s $DOTFILES/git/.gitattributes $HOME/.gitattributes
rm -f /etc/greetd/config.toml; ln -s /home/dpi0/.dotfiles/greetd/config.toml /etc/greetd/config.toml
rm -rf $CONFIG/hypr; ln -s $DOTFILES/hypr $CONFIG/hypr
rm -rf $CONFIG/lf; ln -s $DOTFILES/lf $CONFIG/lf
rm -f $CONFIG/libinput-gestures.conf; ln -s $DOTFILES/libinput-gestures/libinput-gestures.conf $CONFIG/libinput-gestures.conf
rm -f /etc/systemd/logind.conf; ln -s /home/dpi0/.dotfiles/systemd/logind.conf /etc/systemd/logind.conf
rm -rf $CONFIG/nvim; ln -s $DOTFILES/nvim $CONFIG/nvim
rm -rf $CONFIG/rofi; ln -s $DOTFILES/rofi $CONFIG/rofi
rm -f $CONFIG/starship.toml; ln -s $DOTFILES/starship/starship.toml $CONFIG/starship.toml
rm -rf $CONFIG/swayidle; ln -s $DOTFILES/swayidle $CONFIG/swayidle
rm -rf $CONFIG/swaylock; ln -s $DOTFILES/swaylock $CONFIG/swaylock
rm -rf $CONFIG/tmux; ln -s $DOTFILES/tmux $CONFIG/tmux
md $DOTFILES/tmux/plugins
git clone https://github.com/tmux-plugins/tpm $DOTFILES/tmux/
rm -rf $CONFIG/waybar; ln -s $DOTFILES/waybar $CONFIG/waybar
rm -f $HOME/.zshrc; ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc

rm -f $CONFIG/sublime-text/Packages/sublime_dark.tmTheme; ln -s $DOTFILES/sublime_text/themes/sublime_dark.tmTheme $CONFIG/sublime-text/Packages/sublime_dark.tmTheme
rm -f $CONFIG/sublime-text/Packages/User/Preferences.sublime-settings; ln -s $DOTFILES/sublime_text/preferences.sublime-settings $CONFIG/sublime-text/Packages/User/Preferences.sublime-settings
rm -f "$CONFIG/sublime-text/Packages/User/Default (Linux).sublime-keymap"; ln -s $DOTFILES/sublime_text/keybindings.sublime-keymap "$CONFIG/sublime-text/Packages/User/Default (Linux).sublime-keymap"
rm -f $CONFIG/sublime-text/Packages/User/Adaptive.sublime-theme; ln -s $DOTFILES/sublime_text/adaptive.sublime-theme $CONFIG/sublime-text/Packages/User/Adaptive.sublime-theme

# ln -sf $DOTFILES/.ssh $HOME/.ssh
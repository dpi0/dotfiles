#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"

link_config() {
    rm -rf "$CONFIG/$1"
    ln -s "$DOTFILES/$1" "$CONFIG/$1"
}

config_files=(
    alacritty
    dunst
    dust
    hypr
    lf
    nvim
    rofi
    swayidle
    swaylock
    tmux
    easyeffects/output/
    waybar
    wlogout
    swappy
    spotifyd
)

for file in "${config_files[@]}"; do
    link_config "$file"
done

rm -f $CONFIG/starship.toml; ln -s $DOTFILES/starship/starship.toml $CONFIG/starship.toml
rm -f $HOME/.zshrc; ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc
rm -f $HOME/.gitconfig; ln -s $DOTFILES/git/.gitconfig $HOME/.gitconfig
rm -f $HOME/.gitattributes; ln -s $DOTFILES/git/.gitattributes $HOME/.gitattributes

# rm -f $CONFIG/libinput-gestures.conf; ln -s $DOTFILES/libinput-gestures/libinput-gestures.conf $CONFIG/libinput-gestures.conf
# greetd config.toml
# logind.conf
# .ssh

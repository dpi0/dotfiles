#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"

link_config() {
    rm -rf "$CONFIG/$1"
    ln -s "$DOTFILES/$1" "$CONFIG/"
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
    lazygit
    btop
    broot
    glow
    zellij
    zathura
    qalculate
)

for file in "${config_files[@]}"; do
    link_config "$file"
done

rm -f $CONFIG/starship.toml; ln -s $DOTFILES/starship/starship.toml $CONFIG/
rm -f $HOME/.zshrc; ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc
rm -f $HOME/.gitconfig; ln -s $DOTFILES/git/.gitconfig $HOME/.gitconfig
rm -f $HOME/.gitattributes; ln -s $DOTFILES/git/.gitattributes $HOME/.gitattributes

md $HOME/.local/bin
ln -s /data/scripts/bash/timer.sh $HOME/.local/bin/timer
ln -s /data/scripts/bash/doo.sh $HOME/.local/bin/doo

#ln -s $DOTFILES/aria2/ $HOME/

# rm -f $CONFIG/libinput-gestures.conf; ln -s $DOTFILES/libinput-gestures/libinput-gestures.conf $CONFIG/libinput-gestures.conf
# greetd config.toml
# logind.conf
# .ssh

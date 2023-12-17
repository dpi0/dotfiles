#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"
DATA="/mnt/data"

rm -rf $CONFIG/alacritty; ln -s $DOTFILES/alacritty $CONFIG/alacritty
rm -rf $CONFIG/dunst; ln -s $DOTFILES/dunst $CONFIG/dunst
rm -rf $CONFIG/dust; ln -s $DOTFILES/dust $CONFIG/dust
rm -f $HOME/.gitconfig; ln -s $DOTFILES/git/.gitconfig $HOME/.gitconfig
rm -f $HOME/.gitattributes; ln -s $DOTFILES/git/.gitattributes $HOME/.gitattributes
rm -f /etc/greetd/config.toml; ln -s /home/dpi0/.dotfiles/greetd/config.toml /etc/greetd/config.toml
rm -rf $CONFIG/hypr; ln -s $DOTFILES/hypr $CONFIG/hypr
rm -rf $CONFIG/lf; ln -s $DOTFILES/lf $CONFIG/lf
rm -f $CONFIG/libinput-gestures.conf; ln -s $DOTFILES/libinput-gestures/libinput-gestures.conf $CONFIG/libinput-gestures.conf
# logind.conf
rm -rf $CONFIG/nvim; ln -s $DOTFILES/nvim $CONFIG/nvim
rm -rf $CONFIG/rofi; ln -s $DOTFILES/rofi $CONFIG/rofi
rm -f $CONFIG/starship.toml; ln -s $DOTFILES/starship/starship.toml $CONFIG/starship.toml
rm -rf $CONFIG/swayidle; ln -s $DOTFILES/swayidle $CONFIG/swayidle
rm -rf $CONFIG/swaylock; ln -s $DOTFILES/swaylock $CONFIG/swaylock
rm -rf $CONFIG/tmux; ln -s $DOTFILES/tmux $CONFIG/tmux
md $DOTFILES/tmux/plugins
git clone https://github.com/tmux-plugins/tpm $DOTFILES/tmux/plugins
rm -rf $CONFIG/waybar; ln -s $DOTFILES/waybar $CONFIG/waybar
ln -s $DOTFILES/wlogout $CONFIG/wlogout
ln -s $DOTFILES/swappy $CONFIG/swappy
rm -f $HOME/.zshrc; ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc


ln -s ~/.dotfiles/dunst/scripts/brightness-notify.sh  ~/.local/bin/brightnotify
ln -s ~/.dotfiles/dunst/scripts/volume-notify.sh  ~/.local/bin/volnotify
ln -s ~/.dotfiles/dunst/scripts/battery-notify.sh  ~/.local/bin/batnotify
ln -s ~/.dotfiles/dunst/scripts/time-notify.sh  ~/.local/bin/timenotify
ln -s ~/.dotfiles/dunst/scripts/nightlight-notify.sh  ~/.local/bin/nightnotify
ln -s ~/.dotfiles/dunst/scripts/mic-notify.sh  ~/.local/bin/micnotify

# ln -sf $DOTFILES/.ssh $HOME/.ssh

# Function to ask the user for permission
function ask_user() {
    read -p "Do you want to install this package? (yes/no): " response
    if [ "$response" != "yes" ]; then
        echo "Skipping installation for this section."
        return 1
    fi
    return 0
}

# ask
echo "Installing paru..."
if ask_user; then
	git clone https://github.com/dpi0/scripts
fi
